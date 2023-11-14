within ModelicaSeminar.Seminar06.EVThermal.Controllers.Components;
block LimPIDInputMinMaxReset
  "P, PI, PD, and PID controller with limited output, anti-windup compensation and setpoint weighting with reset"
  extends .Modelon.Icons.Block;

  .Modelica.Blocks.Interfaces.RealInput u_ff if use_feedforward_in    "Feed forward signal" annotation (Dialog(tab="Advanced", group="Input assignments (set only if the input is not connected)"),
      Placement(transformation(
        origin={-120,60},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  .Modelica.Blocks.Interfaces.RealInput u_s "Connector of setpoint input signal"    annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
          rotation=0)));
  .Modelica.Blocks.Interfaces.RealInput u_m    "Connector of measurement input signal" annotation (Placement(
        transformation(
        origin={-120,-50},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  .Modelica.Blocks.Interfaces.RealOutput y "Connector of actuator output signal"    annotation (Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));

  output Real controlError=u_s - u_m "Control error (set point - measurement)";

  parameter .Modelica.Blocks.Types.SimpleController controllerType=.Modelica.Blocks.Types.SimpleController.PID    "Type of controller";
  input Real k(unit="1") = 1 "Gain of controller" annotation(Dialog);
  parameter .Modelica.Units.SI.Time Ti(min=.Modelica.Constants.small) = 0.5    "Time constant of Integrator block" annotation (Dialog(enable=
          controllerType == .Modelica.Blocks.Types.SimpleController.PI or
          controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter .Modelica.Units.SI.Time Td(min=0) = 0.1    "Time constant of Derivative block" annotation (Dialog(enable=
          controllerType == .Modelica.Blocks.Types.SimpleController.PD or
          controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  //parameter Real yMax(start=1) "Upper limit of output";
  //parameter Real yMin=-yMax "Lower limit of output";
  parameter Real wp(min=0) = 1 "Set-point weight for Proportional block (0..1)";
  parameter Real wd(min=0) = 0 "Set-point weight for Derivative block (0..1)"    annotation (Dialog(enable=controllerType == .Modelica.Blocks.Types.SimpleController.PD
           or controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Real Ni(min=100*.Modelica.Constants.eps) = 0.9    "Ni*Ti is time constant of anti-windup compensation" annotation (Dialog(
        enable=controllerType == .Modelica.Blocks.Types.SimpleController.PI or
          controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Real Nd(min=100*.Modelica.Constants.eps) = 10    "The higher Nd, the more ideal the derivative block" annotation (Dialog(
        enable=controllerType == .Modelica.Blocks.Types.SimpleController.PD or
          controllerType == .Modelica.Blocks.Types.SimpleController.PID));

  parameter Boolean use_feedforward_in=false "Enable the feedforward input"    annotation (choices(checkBox=true));
  parameter Real u_ff_const=0 "Constant feedforward if not use_feedforward_in"    annotation (Dialog(enable=not use_feedforward_in));

  parameter Boolean use_limits_in=false "Enable the min/max limits inputs"    annotation (choices(checkBox=true));
  parameter Real y_max=1 "Constant maximum output if not use_limits_in"    annotation (Dialog(enable=not use_limits_in));
  parameter Real y_min=-y_max "Constant minimum output if not use_limits_in"    annotation (Dialog(enable=not use_limits_in));

  parameter .Modelica.Blocks.Types.Init initType=.Modelica.Blocks.Types.Init.InitialState
    "Type of initialization (1: no init, 2: steady state, 3: initial state, 4: initial output)"    annotation (Evaluate=true, Dialog(group="Initialization"));
  parameter Boolean limitsAtInit=true    "= false, if limits are ignored during initialization"    annotation (Evaluate=true, Dialog(group="Initialization"));
  parameter Real xi_start=0    "Initial or guess value value for integrator output (= integrator state)"    annotation (Dialog(group="Initialization", enable=controllerType == .Modelica.Blocks.Types.SimpleController.PI
           or controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Real xd_start=0    "Initial or guess value for state of derivative block" annotation (Dialog(
        group="Initialization", enable=controllerType == .Modelica.Blocks.Types.SimpleController.PD
           or controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Real y_start=0 "Initial value of output" annotation (Dialog(enable=initType
           == .Modelica.Blocks.Types.Init.InitialOutput,            group="Initialization"));
  parameter Boolean strict=false "= true, if strict limits with noEvent(..)"    annotation (
    Evaluate=true,
    choices(checkBox=true),
    Dialog(tab="Advanced"));
  constant .Modelica.Units.SI.Time unitTime=1 annotation (HideResult=true);
  .Modelica.Blocks.Math.Add addP(k1=wp, k2=-1)    annotation (Placement(transformation(extent={{-80,30},{-60,50}})));
  .Modelica.Blocks.Math.Add addD(k1=wd, k2=-1) if with_D    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  .Modelica.Blocks.Continuous.Integrator I(
    k=unitTime/Ti,
    use_reset=true,
    use_set=true,
    y_start=xi_start,
    initType=if initType == .Modelica.Blocks.Types.Init.SteadyState then .Modelica.Blocks.Types.Init.SteadyState else if
        initType == .Modelica.Blocks.Types.Init.InitialState or initType == .Modelica.Blocks.Types.Init.InitialState
         then .Modelica.Blocks.Types.Init.InitialState else .Modelica.Blocks.Types.Init.NoInit) if with_I
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  .Modelica.Blocks.Continuous.Derivative D(
    k=Td/unitTime,
    T=max([Td/Nd,1.e-14]),
    x_start=xd_start,
    initType=if initType ==.Modelica.Blocks.Types.Init.SteadyState  or initType ==.Modelica.Blocks.Types.Init.InitialOutput
         then .Modelica.Blocks.Types.Init.SteadyState else if initType ==.Modelica.Blocks.Types.Init.InitialState  then
        .Modelica.Blocks.Types.Init.InitialState else .Modelica.Blocks.Types.Init.NoInit) if with_D
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  .Modelica.Blocks.Math.Add3 addI(k2=-1) if with_I    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
  .Modelica.Blocks.Math.Add addSat(k1=+1, k2=-1) if with_I annotation (Placement(
        transformation(
        origin={80,-50},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Gain gainTrack(k=1/(k*Ni))                      if with_I    annotation (Placement(transformation(extent={{40,-80},{20,-60}})));
  .Modelica.Blocks.Nonlinear.VariableLimiter limiter(strict=strict)    annotation (Placement(transformation(extent={{70,-10},{90,10}})));

  .Modelica.Blocks.Interfaces.RealInput yMax if use_limits_in    "Maximum output signal" annotation (Dialog(tab="Advanced", group="Input assignments (set only if the input is not connected)"),
      Placement(transformation(
        origin={50,120},
        extent={{-20,-20},{20,20}},
        rotation=270)));
  .Modelica.Blocks.Interfaces.RealInput yMin if use_limits_in    "Minimum output signal" annotation (Dialog(tab="Advanced", group="Input assignments (set only if the input is not connected)"),
      Placement(transformation(
        origin={50,-120},
        extent={{-20,-20},{20,20}},
        rotation=90)));
  discrete Integer reset_count "counter for number of times that reset signal has been applied";
  .Modelica.Blocks.Interfaces.RealInput y_reset "value at reset condition" annotation(Dialog);
  .Modelica.Blocks.Interfaces.BooleanInput reset "reset signal" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-20,-110})));
protected
  parameter Boolean with_I=controllerType == .Modelica.Blocks.Types.SimpleController.PI or
      controllerType == .Modelica.Blocks.Types.SimpleController.PID
    annotation (Evaluate=true, HideResult=true);
  parameter Boolean with_D=controllerType == .Modelica.Blocks.Types.SimpleController.PD or
      controllerType == .Modelica.Blocks.Types.SimpleController.PID
    annotation (Evaluate=true, HideResult=true);
public
  .Modelica.Blocks.Sources.Constant Dzero(k=0) if not with_D
    annotation (Placement(transformation(extent={{-28,14},{-16,26}})));
  .Modelica.Blocks.Sources.Constant Izero(k=0) if not with_I
    annotation (Placement(transformation(extent={{-20,-35},{-10,-25}})));
  .Modelica.Blocks.Math.MultiSum addPID(nu=4)
    annotation (Placement(transformation(extent={{34,-6},{46,6}})));
  Gain kP(k=k)
    annotation (Placement(transformation(extent={{0,30},{20,50}}, rotation=0)));
  Gain kD(k=k) annotation (Placement(transformation(extent={{0,-10},{20,10}},
          rotation=0)));
  Gain kI(k=k) annotation (Placement(transformation(extent={{0,-60},{20,-40}},
          rotation=0)));
  .Modelica.Blocks.Sources.Constant const_y_max(k=y_max) if not use_limits_in
    annotation (Placement(transformation(extent={{100,80},{80,100}})));
  .Modelica.Blocks.Sources.Constant const_y_min(k=y_min) if not use_limits_in
    annotation (Placement(transformation(extent={{100,-100},{80,-80}})));
  .Modelica.Blocks.Sources.Constant const_u_ff(k=u_ff_const) if not
    use_feedforward_in
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  .Modelica.Blocks.Sources.RealExpression reset_I(y=reset_I_val)
                      "integrator reset value"
    annotation (Placement(transformation(extent={{-56,-40},{-36,-20}})));
protected
  .Modelica.Blocks.Interfaces.RealOutput u_ff_
    annotation (Placement(transformation(extent={{-64,50},{-44,70}})));
protected
  .Modelica.Blocks.Interfaces.RealOutput yMax_ annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,84})));
protected
  .Modelica.Blocks.Interfaces.RealOutput yMin_ annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={60,-84})));
  Real reset_I_val "reset value for integrator";
initial equation
  if initType ==.Modelica.Blocks.Types.Init.InitialOutput then
    addPID.y = y_start;
  end if;
equation
  if initType ==.Modelica.Blocks.Types.Init.InitialOutput  and (y_start < yMin_ or y_start > yMax_) then
    .Modelica.Utilities.Streams.error("LimPID: Start value y_start (=" + String(
      y_start) + ") is outside of the limits of yMin (=" + String(yMin_) + ") and yMax (="
       + String(yMax_) + ")");
  end if;

  // Unable to reset integrator set in D block.  Assert if using PID and not just PI?
  when reset then
//    reinit(D.x,pre(D.u));
//    reinit(I.y, 1/k*(pre(y_reset)- u_ff_ - kP.y - kD.y));
    reset_I_val =1/k*(pre(y_reset)- u_ff_ - kP.y - kD.y);
    reset_count = pre(reset_count)+1;
  end when;

  connect(u_s, addP.u1) annotation (Line(points={{-120,0},{-96,0},{-96,46},{-82,
          46}}, color={0,0,127}));
  connect(u_s, addD.u1) annotation (Line(points={{-120,0},{-96,0},{-96,6},{-82,6}},
        color={0,0,127}));
  connect(u_s, addI.u1) annotation (Line(points={{-120,0},{-96,0},{-96,-42},{-82,
          -42}}, color={0,0,127}));
  connect(addD.y, D.u)
    annotation (Line(points={{-59,0},{-42,0}}, color={0,0,127}));
  connect(addI.y, I.u)
    annotation (Line(points={{-59,-50},{-42,-50}}, color={0,0,127}));
  connect(limiter.y, addSat.u1) annotation (Line(points={{91,0},{94,0},{94,-20},
          {86,-20},{86,-38}}, color={0,0,127}));
  connect(limiter.y, y)
    annotation (Line(points={{91,0},{110,0}}, color={0,0,127}));
  connect(addSat.y, gainTrack.u)
    annotation (Line(points={{80,-61},{80,-70},{42,-70}}, color={0,0,127}));
  connect(gainTrack.y, addI.u3) annotation (Line(points={{19,-70},{-88,-70},{-88,
          -58},{-82,-58}}, color={0,0,127}));
  connect(u_m, addP.u2) annotation (Line(points={{-120,-50},{-120,-50},{-92,-50},
          {-92,34},{-82,34}}, color={0,0,127}));
  connect(u_m, addD.u2) annotation (Line(points={{-120,-50},{-120,-50},{-92,-50},
          {-92,-6},{-82,-6}}, color={0,0,127}));
  connect(u_m, addI.u2) annotation (Line(points={{-120,-50},{-120,-50},{-96,-50},
          {-82,-50}}, color={0,0,127}));
  connect(addP.y, kP.u)
    annotation (Line(points={{-59,40},{-30,40},{-2,40}}, color={0,0,127}));
  connect(Dzero.y, kD.u) annotation (Line(points={{-15.4,20},{-8,20},{-8,0},{-2,
          0}}, color={0,0,127}));
  connect(D.y, kD.u)
    annotation (Line(points={{-19,0},{-10,0},{-2,0}}, color={0,0,127}));
  connect(Izero.y, kI.u) annotation (Line(points={{-9.5,-30},{-8,-30},{-8,-50},{
          -2,-50}},  color={0,0,127}));
  connect(I.y, kI.u) annotation (Line(points={{-19,-50},{-10.5,-50},{-2,-50}},
        color={0,0,127}));
  connect(u_ff_, addPID.u[1]) annotation (Line(points={{-54,60},{28,60},{28,-1.575},
          {34,-1.575}},
                      color={0,0,127}));
  connect(kP.y, addPID.u[2]) annotation (Line(points={{21,40},{24,40},{24,-0.525},
          {34,-0.525}},
                      color={0,0,127}));
  connect(kD.y, addPID.u[3])
    annotation (Line(points={{21,0},{34,0},{34,0.525}}, color={0,0,127}));
  connect(kI.y, addPID.u[4]) annotation (Line(points={{21,-50},{24,-50},{24,1.575},
          {34,1.575}}, color={0,0,127}));
  connect(addPID.y, limiter.u)
    annotation (Line(points={{47.02,0},{68,0}}, color={0,0,127}));
  connect(addSat.u2, addPID.y) annotation (Line(points={{74,-38},{74,-20},{52,-20},
          {52,0},{47.02,0}}, color={0,0,127}));
  connect(u_ff, u_ff_)
    annotation (Line(points={{-120,60},{-54,60}}, color={0,0,127}));
  connect(const_u_ff.y, u_ff_) annotation (Line(points={{-79,90},{-60,90},{-60,60},
          {-54,60}}, color={0,0,127}));
  connect(yMin, yMin_) annotation (Line(points={{50,-120},{50,-90},{60,-90},{60,
          -84}}, color={0,0,127}));
  connect(const_y_min.y, yMin_)
    annotation (Line(points={{79,-90},{60,-90},{60,-84}}, color={0,0,127}));
  connect(yMin_, limiter.limit2)
    annotation (Line(points={{60,-84},{60,-8},{68,-8}}, color={0,0,127}));
  connect(const_y_max.y, yMax_)
    annotation (Line(points={{79,90},{60,90},{60,84}}, color={0,0,127}));
  connect(yMax, yMax_) annotation (Line(points={{50,120},{50,90},{60,90},{60,84}},
        color={0,0,127}));
  connect(yMax_, limiter.limit1)
    annotation (Line(points={{60,84},{60,8},{68,8}}, color={0,0,127}));
  connect(reset, I.reset) annotation (Line(points={{-20,-110},{-20,-86},{-24,-86},
          {-24,-62}}, color={255,0,255}));
  connect(reset_I.y, I.set)
    annotation (Line(points={{-35,-30},{-24,-30},{-24,-38}}, color={0,0,127}));
  annotation (
    defaultComponentName="PID",
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
        graphics={
        Line(points={{-80,78},{-80,-90}}, color={192,192,192}),
        Polygon(
          points={{-80,90},{-88,68},{-72,68},{-80,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,-80},{82,-80}}, color={192,192,192}),
        Polygon(
          points={{90,-80},{68,-72},{68,-88},{90,-80}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,-80},{-80,-20},{30,60},{80,60}}, color={0,0,127}),
        Text(
          extent={{-20,-20},{80,-60}},
          lineColor={192,192,192},
          textString="%controllerType"),
        Line(
          visible=strict,
          points={{30,60},{81,60}},
          color={255,0,0})}),
    Documentation(info="<html>
</html>", revisions="<html>
<p><ul>
<li>2013-08-05: Copied from <a href=\"modelica://Modelica.Blocks.Continuous.LimPID\">Modelica.Blocks.Continuous.LimPID</a> and modified to allow variable limits.</li>
</ul></p>
<p><!--COPYRIGHT--></p>
</html>"));
end LimPIDInputMinMaxReset;

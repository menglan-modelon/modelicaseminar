within ModelicaSeminar.Seminar06.EVThermal.Controllers.RefrigerantSystem;

model SpeedControl "speed control from temperature and head pressure"
  extends .Modelica.Blocks.Interfaces.SO;
  .Modelica.Blocks.Sources.RealExpression expHystP_high(y=p_head_max_bar)
    annotation (Placement(transformation(extent={{-100,-74},{-80,-58}})));
  .Modelica.Blocks.Logical.And andT
    annotation (Placement(transformation(extent={{-20,66},{-8,54}})));
  .Modelica.Blocks.Logical.Not notCtrlP annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=90,
        origin={-28,0})));
  .Modelica.Blocks.Logical.Switch switchT
    annotation (Placement(transformation(extent={{8,70},{28,50}})));
  .Modelica.Blocks.Continuous.LimPID controlT(
    controllerType=.Modelica.Blocks.Types.SimpleController.PI,
    k=k,
    Ti=Ti,
    yMax=yMax,
    yMin=yMin,
    initType=.Modelica.Blocks.Types.Init.InitialOutput,
    y_start=yInit)
               annotation (Placement(transformation(extent={{38,70},{58,50}})));
  .Modelica.Blocks.Interfaces.BooleanInput control "true for active control"
    annotation (Placement(transformation(extent={{20,20},{-20,-20}},
        rotation=180,
        origin={-100,0})));
  .Modelica.Blocks.Interfaces.RealInput T_sensed_C "sensed temperature"
    annotation (Placement(transformation(extent={{-120,60},{-80,100}})));
  .Modelica.Blocks.Interfaces.RealInput T_desired_C "desired temperature in C"
    annotation (Placement(transformation(extent={{-120,20},{-80,60}})));
  parameter Real k=-0.5 "Gain of PI block for temperature control";
  parameter .Modelica.Units.SI.Time Ti=1
    "Time constant of Integrator block for temperature control";
  parameter Real k_p=0.5 "Gain of PI block for pressure control";
  parameter .Modelica.Units.SI.Time Ti_p=1
    "Time constant of Integrator block for pressure control";
  parameter Real yInit=0 "Initial control signal";
  parameter Real yMax=145 "Upper limit of output"
    annotation (Dialog(group="Parameters"));
  parameter Real yMin=1e-6 "Lower limit of output"
    annotation (Dialog(group="Parameters"));
  parameter Real p_head_max_bar=28 "max head pressure in bar" annotation (
      Dialog(group="Parameters"));
  parameter Real p_head_delta_bar=0.5
    "delta head pressure for hysteresis in bar";
  Boolean temperature_control "true if temperature control is active";
  Boolean pressure_control "true if pressure control is active";
  .Modelica.Blocks.Continuous.LimPID controlP(
    controllerType=.Modelica.Blocks.Types.SimpleController.PI,
    k=k,
    Ti=Ti,
    yMax=yMax,
    yMin=yMin,
    initType=.Modelica.Blocks.Types.Init.InitialOutput,
    y_start=yInit)
    annotation (Placement(transformation(extent={{38,-50},{58,-70}})));
  .Modelica.Blocks.Logical.Switch switchOut annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=0,
        origin={62,0})));
  .Modelica.Blocks.Interfaces.RealInput p_sensed_bar
    "sensed head pressure in bar" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-100,-40})));
  .Modelica.Blocks.Logical.Switch switchP
    annotation (Placement(transformation(extent={{8,-50},{28,-70}})));
  .Modelon.Blocks.Logical.HysteresisVariable hysteresis annotation (Placement(
        transformation(
        extent={{-8,-8},{8,8}},
        rotation=0,
        origin={-42,-78})));
  .Modelica.Blocks.Sources.RealExpression expHystP_low(y=p_head_max_bar -
        p_head_delta_bar)
    annotation (Placement(transformation(extent={{-100,-98},{-80,-82}})));
  .Modelica.Blocks.Logical.And andP
    annotation (Placement(transformation(extent={{-20,-54},{-8,-66}})));
  .Modelica.Blocks.Continuous.FirstOrder outputFilter(T=T_filt) annotation (
      Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=180,
        origin={86,0})));
  parameter .Modelica.Units.SI.Time T_filt=0.1 "Output filter time Constant";
equation
  connect(notCtrlP.y, andT.u1) annotation (Line(points={{-28,6.6},{-28,60},{
          -21.2,60}}, color={255,0,255}));
  connect(andT.u2, control) annotation (Line(points={{-21.2,64.8},{-50,64.8},{
          -50,0},{-100,0}}, color={255,0,255}));
  connect(andP.u2, control) annotation (Line(points={{-21.2,-55.2},{-50,-55.2},
          {-50,0},{-100,0}}, color={255,0,255}));
  connect(p_sensed_bar, controlP.u_m)
    annotation (Line(points={{-100,-40},{48,-40},{48,-48}}, color={0,0,127}));
  connect(andT.y, switchOut.u2) annotation (Line(points={{-7.4,60},{0,60},{0,0},
          {52.4,0}}, color={255,0,255}));
  connect(switchT.u2, andT.y)
    annotation (Line(points={{6,60},{-7.4,60}}, color={255,0,255}));
  connect(notCtrlP.u, hysteresis.y) annotation (Line(points={{-28,-7.2},{-28,
          -78},{-33.2,-78}}, color={255,0,255}));
  temperature_control = control and not pressure_control;
  pressure_control = hysteresis.y;
  connect(switchT.y, controlT.u_s)
    annotation (Line(points={{29,60},{36,60}}, color={0,0,127}));
  connect(switchT.u3, T_sensed_C) annotation (Line(points={{6,68},{0,68},{0,80},
          {-100,80}}, color={0,0,127}));
  connect(controlT.u_m, T_sensed_C)
    annotation (Line(points={{48,72},{48,80},{-100,80}}, color={0,0,127}));
  connect(controlT.y, switchOut.u1) annotation (Line(points={{59,60},{64,60},{
          64,20},{46,20},{46,6.4},{52.4,6.4}}, color={0,0,127}));
  connect(controlP.y, switchOut.u3) annotation (Line(points={{59,-60},{64,-60},
          {64,-18},{46,-18},{46,-6.4},{52.4,-6.4}}, color={0,0,127}));
  connect(switchP.y, controlP.u_s)
    annotation (Line(points={{29,-60},{36,-60}}, color={0,0,127}));
  connect(p_sensed_bar,switchP. u3) annotation (Line(points={{-100,-40},{-4,-40},
          {-4,-52},{6,-52}},         color={0,0,127}));
  connect(andP.y,switchP. u2)
    annotation (Line(points={{-7.4,-60},{6,-60}},    color={255,0,255}));
  connect(hysteresis.y,andP. u1)
    annotation (Line(points={{-33.2,-78},{-28,-78},{-28,-60},{-21.2,-60}},
                                                       color={255,0,255}));
  connect(hysteresis.uHigh, expHystP_high.y) annotation (Line(points={{-51.6,
          -73.2},{-70,-73.2},{-70,-66},{-79,-66}}, color={0,0,127}));
  connect(expHystP_low.y, hysteresis.uLow) annotation (Line(points={{-79,-90},{
          -70,-90},{-70,-82.8},{-51.6,-82.8}}, color={0,0,127}));
  connect(expHystP_low.y, switchP.u1) annotation (Line(points={{-79,-90},{-4,
          -90},{-4,-68},{6,-68}}, color={0,0,127}));
  connect(switchT.u1, T_desired_C) annotation (Line(points={{6,52},{-4,52},{-4,
          40},{-100,40}}, color={0,0,127}));
  connect(hysteresis.u, p_sensed_bar) annotation (Line(points={{-51.6,-78},{-60,
          -78},{-60,-40},{-100,-40}}, color={0,0,127}));
  connect(switchOut.y, outputFilter.u) annotation (Line(points={{70.8,0},{72.7,
          0},{72.7,1.11022e-15},{76.4,1.11022e-15}}, color={0,0,127}));
  connect(outputFilter.y, y) annotation (Line(points={{94.8,-1.22125e-15},{
          102.4,-1.22125e-15},{102.4,0},{110,0}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info=
          "<html><p>This controller provides compressor speed as output based on the difference between sensed and desired state.</p></html>",
        revisions="<html>
Copyright &copy; 2004-2023, MODELON AB <br /> The use of this software component is regulated by the licensing conditions for Modelon Libraries. <br />This copyright notice must, unaltered, accompany all components that are derived from, copied from, <br />or by other means have their origin from any Modelon Library.
</html>"));
end SpeedControl;

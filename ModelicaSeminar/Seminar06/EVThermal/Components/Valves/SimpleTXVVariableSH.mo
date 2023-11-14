within ModelicaSeminar.Seminar06.EVThermal.Components.Valves;
model SimpleTXVVariableSH
  "Simplified model of a TXV, based on compressible flow valve in DIN EN 60534-1"
  extends .AirConditioning.ThermoFluidPro.Icons.NewIcons.Valves.RefrigValve;

  output .AirConditioning.SubComponents.ComponentSummaries.TXVSummary summary(
    final SuperHeatSetPoint=target_superHeat,
    final mdot=valve.mdot,
    final p_in=valve.p1,
    final p_out=valve.p2,
    final M_ref=volume.M[1],
    final V_ref=volume.V[1],
    final Vdot=valve.mdot/max(1e-3, valve.d)) annotation (Placement(
        transformation(extent={{-60,60},{-40,80}}, rotation=0)));

  input Real k=-0.002 "Gain of PI behaviour of TXV"
    annotation (Dialog(group="Control behaviour"));
  input Boolean change_k=false "Boolean when gain changes"
    annotation (Dialog(group="Control behaviour"));
  parameter Boolean paraOption=false "Parameterization option"
    annotation (Dialog(group="Flow characteristics"));
  parameter Real yMax(unit="m3/h")=0.12   "Kv at maximum opening of TXV valve"
    annotation (Dialog(enable=not paraOption, group="Flow characteristics"));
  parameter Real yMin(unit="m3/h")=0.0001
    "Kv at minimum opening of TXV valve"
    annotation (Dialog(enable=not paraOption, group="Flow characteristics"));
  parameter .Modelica.Units.SI.MassFlowRate mdot0
    "Guess for initial flow rate of valve"
    annotation (Dialog(tab="General", group="Initial values"));
  //   parameter Modelica.SIunits.TemperatureDifference SuperHeatSetPoint=5
  //     "Set point for evaporator superheat"
  //     annotation (Dialog(tab="General", group="Control behaviour"));
  parameter .Modelica.Units.SI.Time Ti=10
    "Time constant of bulb expansion behaviour"
    annotation (Dialog(tab="General", group="Control behaviour"));
  parameter Boolean steadySuperheat=true
    "Initialize controller to set superheat"
    annotation (Dialog(tab="General", group="Control behaviour"));
  parameter .AirConditioning.ThermoFluidPro.InitConditions.LumpedInit init(
    initType=.AirConditioning.ThermoFluidPro.Types.Init.Initial_ph,
    h0=270e3,
    p0=23.9e5) "Upstream volume initial values" annotation (
    editButton=true,
    editText=false,
    Dialog(tab="General", group="Initial values"),
    Placement(transformation(extent={{-10,60},{10,80}}, rotation=0)));
  .AirConditioning.SubComponents.FlowResistance.VarFlowValve valve(
    redeclare package Medium = Medium,
    mdot(start=mdot0, fixed=false),
    dp_small=dp_small,
    use_yd0=use_yd0,
    yd0=yd0,
    checkValve=checkValve,
    backFlowFraction=backFlowFraction) annotation (Placement(transformation(
          extent={{5,-35},{-65,35}}, rotation=0)));
  replaceable package Medium = .AirConditioning.ThermoFluidPro.Media.Technical.R134a
    constrainedby .AirConditioning.ThermoFluidPro.Media.Templates.PartialHelmholtz
    "Choice of refrigerant" annotation (choicesAllMatching);
  .AirConditioning.ThermoFluidPro.ControlVolumes.Volume2PortS_ph volume(
    V={geo.V},
    redeclare package Medium = Medium,
    geo(
      A=geo.A,
      L=geo.L,
      C=.Modelica.Constants.pi*geo.D),
    init=init) annotation (Placement(transformation(
        origin={40,0},
        extent={{-20,-20},{20,20}},
        rotation=180)));
  .AirConditioning.ThermoFluidPro.Interfaces.Static.FlowA a(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{80,-20},{120,20}}, rotation=0),
        iconTransformation(extent={{90,-10},{110,10}})));
  .AirConditioning.ThermoFluidPro.Interfaces.Static.FlowB b(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}}, rotation=
           0), iconTransformation(extent={{-110,-10},{-90,10}})));
  .Modelica.Blocks.Interfaces.RealInput DeltaT_SH annotation (Placement(
        transformation(
        origin={79.5,-179.5},
        extent={{-19.5,-19.5},{19.5,19.5}},
        rotation=90), iconTransformation(
        extent={{-19.5,-19.5},{19.5,19.5}},
        rotation=90,
        origin={-59.5,-100.5})));
  parameter .AirConditioning.ThermoFluidPro.Components.Data.Pipes.BaseGeometry geo(
    D=0.01,
    A=0.0001,
    L=0.03) annotation (Dialog(tab="Advanced", group="equivalent geometry"),
      Placement(transformation(extent={{30,60},{50,80}}, rotation=0)));
  .ModelicaSeminar.Seminar06.EVThermal.Controllers.Components.LimPIDInputMinMaxReset LimitedPI(
    controllerType=.Modelica.Blocks.Types.SimpleController.PI,
    k=k,
    Ti=Ti,
    use_limits_in=paraOption,
    y_max=yMax,
    y_min=yMin,
    initType=.Modelica.Blocks.Types.Init.InitialOutput,
    y_start=yInit,
    yMax=yMax,
    yMin=yMin,
    y(nominal=0.5*(yMin + yMax),
      start=0.8*yMax,
      fixed=false),
    y_reset=switch2.y)     annotation (Placement(transformation(extent={{-68,
            -130},{-48,-110}},
                         rotation=0)));
  parameter Real yInit(unit="m3/h")=0.8*yMax
    "Initial control signal, if steadySuperheat=false"
    annotation (Dialog(group="Control behaviour"));
  parameter .Modelica.Units.SI.Pressure dp_small=100
    "Small pressure difference for regularization of zero flow"
    annotation (Dialog(tab="Advanced", group="Regularization"));
  parameter Boolean use_yd0=false "True, if yd0 shall be used"
    annotation (Dialog(tab="Advanced", group="Regularization"));
  parameter Real yd0(min=0) = 1 "Desired derivative at dp=0: dy/dp = yd0"
    annotation (Dialog(
      enable=use_yd0,
      tab="Advanced",
      group="Regularization"));
  parameter Boolean checkValve=false
    "if true, then backflow only up to backFlowFraction possible"
    annotation (Evaluate=true, Dialog(group="Flow characteristics"));
  parameter Real backFlowFraction=0.1
    "Fraction of nominal flow allowed under back-pressure leakage conditions"
    annotation (Dialog(group="Flow characteristics", enable=checkValve));
  .Modelica.Blocks.Interfaces.RealInput target_superHeat
    "Connector of setpoint input signal" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-80,-180}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={60,-100})));
  .Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{-20,-150},{-40,-130}})));
  .Modelica.Blocks.Interfaces.BooleanInput controlled annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-180})));
  .Modelica.Blocks.Logical.Switch switch2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,-84})));
  .Modelica.Blocks.Sources.Constant const(k=Kv_branchOff)
    annotation (Placement(transformation(extent={{10,-110},{-10,-90}})));
  .Modelica.Blocks.Continuous.FirstOrder firstOrder(
    T=0.1,
    initType=.Modelica.Blocks.Types.Init.InitialOutput,
    y_start=yInit) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,-54})));
  parameter Real Kv_branchOff=1e-03 "Constant output value";
  .Modelica.Blocks.Interfaces.RealInput y_max if paraOption
    "Connector of Real input signal" annotation (Placement(transformation(
        extent={{20,-20},{-20,20}},
        rotation=90,
        origin={70,100})));
  .Modelica.Blocks.Interfaces.RealInput y_min if paraOption
    "Connector of Real input signal" annotation (Placement(transformation(
        extent={{20,-20},{-20,20}},
        rotation=90,
        origin={-70,100})));

  .Modelica.Blocks.Logical.Or or1
    annotation (Placement(transformation(extent={{20,-162},{8,-150}})));
  .Modelica.Blocks.MathBoolean.ChangingEdge changing2
    annotation (Placement(transformation(extent={{34,-174},{26,-166}})));
  .Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=change_k)
    annotation (Placement(transformation(extent={{60,-180},{40,-160}})));
  .Modelica.Blocks.Sources.BooleanExpression changing1(y=change(controlled))
    annotation (Placement(transformation(extent={{50,-158},{30,-138}})));
equation
  connect(volume.a, a) annotation (Line(points={{60,-2.44929e-015},{74,-2.44929e-015},
          {74,0},{100,0}}));
  connect(valve.b, b)
    annotation (Line(points={{-65,0},{-100,0}}, color={0,255,0}));
  connect(valve.a, volume.b) annotation (Line(points={{5,0},{12.5,0},{12.5,2.44929e-015},
          {20,2.44929e-015}}, color={0,255,0}));
  connect(LimitedPI.u_s, target_superHeat) annotation (Line(points={{-70,-120},
          {-80,-120},{-80,-180}},color={0,0,127}));
  connect(switch1.y, LimitedPI.u_m) annotation (Line(points={{-41,-140},{-78,-140},
          {-78,-126},{-70,-126},{-70,-125}},
                       color={0,0,127}));
  connect(DeltaT_SH, switch1.u1) annotation (Line(points={{79.5,-179.5},{79.5,-132},
          {-18,-132}}, color={0,0,127}));
  connect(switch1.u3, target_superHeat) annotation (Line(points={{-18,-148},{-11.5,
          -148},{-11.5,-154},{-80,-154},{-80,-180}}, color={0,0,127}));
  connect(switch1.u2, controlled) annotation (Line(points={{-18,-140},{0,-140},{
          0,-180}}, color={255,0,255}));
  connect(LimitedPI.y, switch2.u1) annotation (Line(points={{-47,-120},{-38,
          -120},{-38,-96}},
                      color={0,0,127}));
  connect(controlled, switch2.u2) annotation (Line(points={{0,-180},{0,-120},{-30,
          -120},{-30,-96}}, color={255,0,255}));
  connect(const.y, switch2.u3) annotation (Line(points={{-11,-100},{-22,-100},{-22,
          -96}}, color={0,0,127}));
  connect(switch2.y, firstOrder.u)
    annotation (Line(points={{-30,-73},{-30,-66}}, color={0,0,127}));
  connect(valve.Kv_in, firstOrder.y)
    annotation (Line(points={{-30,-33.25},{-30,-43}}, color={0,0,127}));
  connect(LimitedPI.yMax, y_max) annotation (Line(points={{-53,-108},{-53,-104},
          {66,-104},{66,-2},{70,-2},{70,100}}, color={0,0,127}));
  connect(LimitedPI.yMin, y_min) annotation (Line(points={{-53,-132},{-52,-132},
          {-52,-138},{-70,-138},{-70,100}},
                                color={0,0,127}));
  connect(or1.y, LimitedPI.reset) annotation (Line(points={{7.4,-156},{-76,-156},
          {-76,-136},{-60,-136},{-60,-131}}, color={255,0,255}));
  connect(booleanExpression.y, changing2.u)
    annotation (Line(points={{39,-170},{35.6,-170}}, color={255,0,255}));
  connect(changing2.y, or1.u2) annotation (Line(points={{25.2,-170},{24,-170},{24,
          -160.8},{21.2,-160.8}}, color={255,0,255}));
  connect(changing1.y, or1.u1) annotation (Line(points={{29,-148},{26,-148},{26,
          -156},{21.2,-156}}, color={255,0,255}));
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-180},{100,100}},
        grid={2,2}), graphics={
        Text(
          extent={{-36,-28},{34,-70}},
          lineColor={95,95,95},
          pattern=LinePattern.None,
          textString="DT_SH"),
        Polygon(
          points={{-26,60},{-26,40},{-46,50},{-26,60}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-26,50},{44,50}},
          color={95,95,95},
          thickness=0.5)}),
    Window(
      x=0.45,
      y=0.01,
      width=0.39,
      height=0.58),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-180},{100,100}},
        grid={2,2})),
    Documentation(info="<html>
<h1>SimpleTXV</h1>
<p>The flow model <a href=\"AirConditioning.SubComponents.FlowResistance.DINValveFlow\">
DINValveFlow</a> for a compressible flow valve according to DIN EN 60543-2-1 is used
as base class in this simplified model for a thermostatic expansion valve.
It consists of a flow model with a variable flow coefficient <code>Kv</code> and a small
volume. The <code>Kv</code>-value is controlled via a limited PI-controller which represents
the behaviour of mechanical components in the TXV and their reaction to an experienced
superheating of the refrigerant at evaporator outlet. The valve requires minimum and
maximum <code>Kv</code>-values (<code>yMin</code>, <code>yMax</code>) as parameter input as well as the
<code>SuperHeatSetPoint</code>. A time constant <code>Ti</code> specifies the integrating behaviour
of the bulb expansion (recommended value is 30-60 s). The measured superheat temperature
is required as input signal at port <a href=\"Modelica.Blocks.Interfaces.RealInput\">DeltaT_SH</a>.
</p>
<h4>Initialization</h4>
<p>The volume before the valve is initialized using pressure and enthalpy in either
fixed or steady-state depending on the parameters in the <a href=\"ThermoFluidPro.InitConditions.LumpedInit\">init</a> record. The
PI-controller can also be initialized to a fixed superheat setpoint using the
<code>steadySuperheat</code> flag. Note that for this setting to work also the evaporator has
to be initialized in steady-state. Otherwise, the valve is initialized to a fixed
<code>Kv</code>-setting, <code>yInit</code>.
</p>
</html>", revisions="<html>
Copyright &copy; 2004-2023, MODELON AB <br /> The use of this software component is regulated by the licensing conditions for Modelon Libraries. <br />This copyright notice must, unaltered, accompany all components that are derived from, copied from, <br />or by other means have their origin from any Modelon Library.
</html>"));
end SimpleTXVVariableSH;

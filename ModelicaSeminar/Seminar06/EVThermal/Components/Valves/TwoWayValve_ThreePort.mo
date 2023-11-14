within ModelicaSeminar.Seminar06.EVThermal.Components.Valves;
model TwoWayValve_ThreePort
  "Model to split a liquid flow via opening command in 3 branches"

  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort port1(
      redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  replaceable package Medium =
      .LiquidCooling.Media.Water.IncompressibleWater                   constrainedby
    .Modelon.Media.Templates.CompressibleLiquid         annotation(choicesAllMatching);

  parameter .Modelica.Units.SI.Volume V=1e-5 "Internal Volume";
  parameter .Modelon.Media.Units.Temperature T_start=288.15
    "Initial guess of upstream temperature";
  parameter .Modelica.Units.SI.Pressure dp_smooth=10 "Pressure drop smoothing region around zero"
    annotation (Dialog(tab="Advanced"));
  parameter .Modelica.Units.SI.MassFlowRate mflow_smooth=0.001 "Massflow smoothing region around"
    annotation (Dialog(tab="Advanced"));
  parameter Real minOpening_visualization=1e-3 "min opening for visualization" annotation(Dialog(tab="Visualization"));

  extends .LiquidCooling.Utilities.Visualizers.VisualizedComponentBase;
  outer .LiquidCooling.Utilities.Records.SystemInitOptions systemInitOptions;
  output Real[2] flowFractions(unit="1") "Flow fractions = port flows / total flow";
  .LiquidCooling.Valves.Generic.ValveIncompressible
                                     valve2(redeclare package Medium = Medium,
      Kv=20,
    mflow_smooth=mflow_smooth,
    dp_smooth=dp_smooth)
    annotation (Placement(transformation(extent={{-30,30},{-10,50}})));
  .LiquidCooling.Valves.Generic.ValveIncompressible
                                     valve3(redeclare package Medium = Medium,
      Kv=20,
    mflow_smooth=mflow_smooth,
    dp_smooth=dp_smooth)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-20,-70})));
  .Modelica.Blocks.Interfaces.RealInput opening[2]
    "Relative opening in the range 0-1,  indices correspond to {valve2, valve3}"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,100})));

  .LiquidCooling.SplitsAndJoins.Generic.Join join(redeclare package Medium =
        Medium,
    V=V,
    T_start=T_start)
    annotation (Placement(transformation(extent={{50,-10},{30,10}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort port3(
      redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-80,-80},{-60,-60}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort port2(
      redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
    .ModelicaSeminar.Seminar06.EVThermal.Utilities.Records.Summaries.TwoWayValve_3PortSummary summary(
    m_flow_out=port1.m_flow,
    u_valve = opening,
    T_outlet = join.multiDisplaySensor.T,
    dp_21 = valve2.summary.dp,
    dp_31 = valve3.summary.dp,
    T_2 = valve2.summary.T_in,
    T_3 = valve3.summary.T_in,
    m_flow_in_2 = valve2.summary.m_flow,
    m_flow_in_3 = valve3.summary.m_flow) annotation(Placement(transformation(extent = {{40.0,60.0},{60.0,80.0}},origin = {0.0,0.0},rotation = 0.0)));
                                       //if not join.settings_TF.usePbS then join.join.summary.d_out
               //else join.staticJoin.summary.d_out,
    .Modelon.ThermoFluid.Sensors.DensitySensor densitySensor annotation(Placement(transformation(extent = {{56,-24},{76,-4}},origin = {0,0},rotation = 0)));
equation
  flowFractions[:] = {valve2.summary.m_flow,valve3.summary.m_flow}./max(1e-9,abs(port1.m_flow));

   /* Visualization */
  if visualization_option == .LiquidCooling.Utilities.Choices.VisualizationOption.PressureVisualization then
    visualization_variable_inlet =join.multiDisplaySensor.portA.p;
    visualization_variable_outlet = join.multiDisplaySensor.portA.p;
  else
    visualization_variable_inlet = join.multiDisplaySensor.T;
    visualization_variable_outlet = join.multiDisplaySensor.T;
  end if;
  connect(valve2.portB, join.portB)    annotation (Line(points={{-10,40},{40.1752,40},{40.1752,10.4555}},
                                                        color={0,0,255}));
  connect(valve3.portB, join.portA) annotation (Line(points={{-10,-70},{20,-70},
          {20,0},{29.9775,0}},
                          color={0,0,255}));
  connect(opening[1], valve2.opening) annotation (Line(points={{0,95},{0,60},{
          -20,60},{-20,50}}, color={0,0,127}));
  connect(opening[2], valve3.opening) annotation (Line(points={{0,105},{0,-50},
          {-20,-50},{-20,-60}}, color={0,0,127}));
    connect(valve2.portA,port2) annotation(Line(points = {{-30,40},{-70,40},{-70,70}},color = {0,0,255}));
    connect(valve3.portA,port3) annotation(Line(points = {{-30,-70},{-70,-70}},color = {0,0,255}));
    connect(join.portC,port1) annotation(Line(points = {{50,0},{100,0}},color = {0,0,255}));
    connect(join.portC,densitySensor.port) annotation(Line(points = {{50,0},{53,0},{53,-14},{56,-14}},color = {0,0,255}));
  annotation (                   Icon(graphics={Ellipse(extent={{100,100},{-100,-100}},lineColor={0,0,255},fillPattern=FillPattern.Solid,fillColor={255,255,255}),Line(points={{-70,70},{100,0}},color={0,0,255},thickness=0.5),Line(points={{-66,62},{-2,-100}},color={0,0,255},origin={0,2},rotation=90,thickness=0.5,pattern=LinePattern.Dash),Polygon(points={{92,4},{80,16},{74,2},{92,4}},lineColor={0,0,255},fillPattern=FillPattern.HorizontalCylinder,fillColor={0,0,255}),Polygon(points={{92,-4},{76,-2},{82,-16},{92,-4}},lineColor={0,0,255},fillPattern=FillPattern.HorizontalCylinder,fillColor={0,0,255}),Text(extent={{-10,10},{10,-10}},textColor={0,0,255},textString="3",origin={-38,-70},rotation=90),Text(extent={{-10,10},{10,-10}},textColor={0,0,255},origin={-40,74},rotation=90,textString="2"),Text(extent={{-10,10},{10,-10}},textColor={0,0,255},origin={80,-26},rotation=90,textString="1"),Line(points={{-62,66},{78,10}},color={255,0,0},thickness=5,visible=false),Line(points={{-62,-64},{80,-8}},color={0,140,72},thickness=5,pattern=LinePattern.Dash,visible=false),Text(textString="%name",origin={-34,0},extent={{-53.81942172595565,22.477677101958747},{53,-22}})}),
    Documentation(info="<html>
<h4>Split</h4>
<p>The split component is used to divide a flow into two paths. The component includes a friction model for each path.</p>
<p>This component should be used for incompressible fluid models where one state for mass flow rate per path is required. This component introduce dynamics for the split ratio, determined by the time constant <code>T_mflow</code>.</p>
</html>", revisions="<html>
<hr><p><font color=\"#E72614\"><b>Copyright &copy; 2004-2022, MODELON AB</b></font> <font color=\"#AFAFAF\"><br /><br /> The use of this software component is regulated by the licensing conditions for Modelon Libraries. <br /> This copyright notice must, unaltered, accompany all components that are derived from, copied from, <br /> or by other means have their origin from any Modelon Library. </font></p>
</html>"));
end TwoWayValve_ThreePort;

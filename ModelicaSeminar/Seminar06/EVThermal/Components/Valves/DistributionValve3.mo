within ModelicaSeminar.Seminar06.EVThermal.Components.Valves;
model DistributionValve3
  "Model to split a liquid flow via opening command in 3 branches"

  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidVolumePort port1(
      redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort port3(
      redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort port2(
      redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  replaceable package Medium =
      .LiquidCooling.Media.Water.IncompressibleWater                   constrainedby
    .Modelon.Media.Templates.CompressibleLiquid         annotation(choicesAllMatching);





  parameter Real T_mflow=1e-2 "Time constant for flow dynamics";

  parameter .Modelica.Units.SI.Pressure dp_smooth=10 "Pressure drop smoothing region around zero"
    annotation (Dialog(tab="Advanced"));
  parameter .Modelica.Units.SI.MassFlowRate mflow_smooth=0.001 "Massflow smoothing region around"
    annotation (Dialog(tab="Advanced"));

  parameter Real flowFractions_max(max=1) = 1
    "Maximum flow fraction into one branch";
  parameter Real flowFractions_min(min=0) = 0
    "Minimum flow fraction into branches";

  parameter Real flowFractions_start[2](min=0, max=1) = {0.333, 0.333}
    "Initial flow fractions (portB flow / total flow)"  annotation(Dialog(group="Initialization"));
  parameter Boolean steady_flow = systemInitOptions.steady_flow
    "Initialize flow distribution in steady-state" annotation (Dialog(group="Initialization"));
  parameter Real minOpening_visualization=1e-3 "min opening for visualization" annotation(Dialog(tab="Visualization"));

  //extends .LiquidCooling.Utilities.Visualizers.VisualizedComponentBase;
  outer .LiquidCooling.Utilities.Records.SystemInitOptions systemInitOptions;
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort port4(
      redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  .LiquidCooling.SplitsAndJoins.Generic.SplitMultiple
                                       split(redeclare package Medium = Medium,
    T_mflow=T_mflow,
    flowFractions_max=flowFractions_max,
    flowFractions_min=flowFractions_min,
    flowFractions_start=flowFractions_start,
    steady_flow=steady_flow,
      N=3,T_start = 298.15)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  .LiquidCooling.Valves.Generic.ValveIncompressible valve3(redeclare package
      Medium = Medium, Kv=20,
    mflow_smooth=mflow_smooth,
    dp_smooth=dp_smooth)      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,50})));
  .LiquidCooling.Valves.Generic.ValveIncompressible
                                     valve2(redeclare package Medium = Medium,
      Kv=20,
    mflow_smooth=mflow_smooth,
    dp_smooth=dp_smooth)
    annotation (Placement(transformation(extent={{42,-10},{62,10}})));
  .LiquidCooling.Valves.Generic.ValveIncompressible
                                     valve1(redeclare package Medium = Medium,
      Kv=20,
    mflow_smooth=mflow_smooth,
    dp_smooth=dp_smooth)
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=270,
        origin={0,-50})));
  .Modelica.Blocks.Interfaces.RealInput opening[3]
    "Relative opening in the range 0-1, indices correspond to {valve1, valve2, valve3}"
    annotation (Placement(transformation(extent={{-120,30},{-80,70}})));
  parameter .Modelon.Media.Units.Temperature T_start=288.15
    "Initial guess of upstream temperature";
    .EVThermal.Utilities.Records.Summaries.DistributionValve3Summary summary(
    u_valve_2 = opening[1],
    u_valve_3 = opening[2],
    m_flow_in=port1.m_flow,
    m_flow_2=-port2.m_flow,
    m_flow_3=-port3.m_flow,
    T_intern = split.T_in,
    u_valve_4 = opening[3],
    m_flow_4=-port4.m_flow,
    dp_12 = valve1.summary.dp,
    dp_13 = valve2.summary.dp,
    dp_14 = valve3.summary.dp) annotation(Placement(transformation(extent = {{60.0,62.0},{80.0,82.0}},origin = {0.0,0.0},rotation = 0.0)));
equation
   /* Visualization */
  /*if visualization_option == .LiquidCooling.Utilities.Choices.VisualizationOption.PressureVisualization then
    visualization_variable_inlet = summary.p;
    visualization_variable_outlet = summary.p;
  else
    visualization_variable_inlet = summary.state_inflow.T;
    visualization_variable_outlet = summary.state_inflow.T;
  end if;*/
  connect(split.portB[1],valve1. portA) annotation (Line(points={{-60,-0.333333},
          {1.77636e-15,-0.333333},{1.77636e-15,-40}}, color={0,0,255}));
  connect(valve2.portA, split.portB[2])
    annotation (Line(points={{42,0},{-60,0}}, color={0,0,255}));
  connect(valve3.portA, split.portB[3]) annotation (Line(points={{0,40},{0,0.333333},
          {-60,0.333333}}, color={0,0,255}));
  connect(opening[1], valve1.opening) annotation (Line(points={{-100,43.3333},{
          -40,43.3333},{-40,-50},{-10,-50}},
                                         color={0,0,127}));
  connect(opening[2], valve2.opening) annotation (Line(points={{-100,50},{-36,50},
          {-36,20},{52,20},{52,10}}, color={0,0,127}));
  connect(opening[3], valve3.opening) annotation (Line(points={{-100,56.6667},{
          -20,56.6667},{-20,50},{-10,50}},
                                       color={0,0,127}));
    connect(valve3.portB,port4) annotation(Line(points = {{5.55112e-16,60},{5.55112e-16,80},{0,80},{0,100}},color = {0,0,255}));
    connect(valve2.portB,port3) annotation(Line(points = {{62,0},{100,0}},color = {0,0,255}));
    connect(valve1.portB,port2) annotation(Line(points = {{-1.83187e-15,-60},{-1.83187e-15,-80},{0,-80},{0,-100}},color = {0,0,255}));
    connect(split.portA,port1) annotation(Line(points = {{-80,0},{-100,0}},color = {0,0,255}));
  annotation (                   Icon(graphics={Ellipse(extent={{100,98},{-100,-102}},lineColor={0,0,255},fillPattern=FillPattern.Solid,fillColor={255,255,255}),Line(points={{-84,0},{64,0}},color={0,0,255},thickness=0.5),Polygon(points={{86,0},{50,12},{50,-12},{86,0}},lineColor={0,0,255},fillPattern=FillPattern.HorizontalCylinder,fillColor={0,0,255}),Line(points={{-60,0},{-2,-2.28851e-17}},color={0,0,255},origin={0,2},rotation=90,thickness=0.5),Polygon(points={{18,0},{-18,12},{-18,-12},{18,0}},lineColor={0,0,255},fillPattern=FillPattern.Solid,fillColor={0,0,255},origin={0,-64},rotation=270),Line(points={{-60,0},{-2,-2.28851e-17}},color={0,0,255},origin={0,60},rotation=90,thickness=0.5),Polygon(points={{-56,-1.45059e-14},{-18,12},{-18,-12},{-56,-1.45059e-14}},lineColor={0,0,255},fillPattern=FillPattern.Solid,fillColor={0,0,255},origin={0,26},rotation=270),Text(extent={{-10,10},{10,-10}},textColor={0,0,255},textString="4",origin={-18,84},rotation=270),Text(extent={{-10,10},{10,-10}},textColor={0,0,255},textString="2",origin={-16,-84},rotation=270),Text(extent={{-10,10},{10,-10}},textColor={0,0,255},textString="3",origin={80,-14},rotation=270),Line(points={{-84,0},{50,0}},color={255,0,0},thickness=5,visible=false),Line(points={{-84,8},{0,8},{0,44}},color={255,0,255},thickness=5,visible=false),Line(points={{-84,-8},{0,-8},{0,-46}},color={0,127,0},thickness=5,visible=false),Text(extent={{10,10},{-10,-10}},textColor={0,0,255},origin={-82,-12},rotation=270,textString="1")}),
    Documentation(info="<html>
<h4>Distribution valve</h4>
<p>The distribution valve component is used to divide a flow into three paths. The component includes a friction model for each path.</p>
<p>This component should be used for incompressible fluid models where one state for mass flow rate per path is required. This component introduce dynamics for the split ratio, determined by the time constant <code>T_mflow</code>.</p>
<p>The opening for each branch is controlled with the real vector input <code>opening</code>.</p>
</html>", revisions="<html>
<hr><p><font color=\"#E72614\"><b>Copyright &copy; 2004-2023, MODELON AB</b></font> <font color=\"#AFAFAF\"><br /><br /> The use of this software component is regulated by the licensing conditions for Modelon Libraries. <br /> This copyright notice must, unaltered, accompany all components that are derived from, copied from, <br /> or by other means have their origin from any Modelon Library. </font></p>
</html>"));
end DistributionValve3;

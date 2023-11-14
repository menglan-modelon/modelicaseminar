within ModelicaSeminar.Seminar06.EVThermal.Components.Valves;
model ThreeWayValve_FourPort
  "Model to collect liquid flows via opening command in 3 incoming branches"

  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidVolumePort port1(
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

  //extends .LiquidCooling.Utilities.Visualizers.VisualizedComponentBase;
  outer .LiquidCooling.Utilities.Records.SystemInitOptions systemInitOptions;
  output Real[3] flowFractions(unit="1") "Flow fractions = port flows / total flow";
  .LiquidCooling.Valves.Generic.ValveIncompressible
                                     valve2(redeclare package Medium = Medium,
      Kv=20,
    mflow_smooth=mflow_smooth,
    dp_smooth=dp_smooth)
    annotation (Placement(transformation(extent={{20,30},{40,50}})));
  .LiquidCooling.Valves.Generic.ValveIncompressible
                                     valve3(redeclare package Medium = Medium,
      Kv=20,
    mflow_smooth=mflow_smooth,
    dp_smooth=dp_smooth)
    annotation (Placement(transformation(extent={{20,-10},{40,10}},
        rotation=0)));
  .Modelica.Blocks.Interfaces.RealInput opening[3]
    "Relative opening in the range 0-1,  indices correspond to {valve2, valve3, valve4}"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-60,100})));

  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort port4(
      redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort port2(
      redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort port3(
      redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  .LiquidCooling.Valves.Generic.ValveIncompressible
                                     valve4(
    redeclare package Medium = Medium,
    Kv=20,
    mflow_smooth=mflow_smooth,
    dp_smooth=dp_smooth)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={30,-40})));
  .LiquidCooling.Volumes.LiquidMultiPort volume(
    redeclare package Medium = Medium,
    V=V,
    T_start=T_start,
    N=4) annotation (Placement(transformation(extent={{70,-10},{90,10}})));
    .ModelicaSeminar.Seminar06.EVThermal.Utilities.Records.Summaries.ThreeWayValve_4PortSummary summary(
    redeclare package Medium = Medium,
    state_A=volume.summary.state,
    u_valve_2 = opening[1],
    u_valve_3 = opening[2],
    u_valve_4 = opening[3],
    m_flow_2 = port2.m_flow,
    m_flow_3 = port3.m_flow,
    m_flow_4 = port4.m_flow,
    m_flow_out = port1.m_flow,
    dp_21 = valve2.summary.dp,
    dp_31 = valve3.summary.dp,
    dp_41 = valve4.summary.dp,
    T_2 = valve2.summary.T_in,
    T_3 = valve3.summary.T_in,
    T_4 = valve4.summary.T_in) annotation(Placement(transformation(extent = {{60.0,62.0},{80.0,82.0}},origin = {0.0,0.0},rotation = 0.0)));
equation
  flowFractions[:] = {valve2.summary.m_flow,valve3.summary.m_flow,valve4.summary.m_flow}./max(1e-9,abs(port1.m_flow));

   /* Visualization */
  /*if visualization_option == .LiquidCooling.Utilities.Choices.VisualizationOption.PressureVisualization then
    visualization_variable_inlet =volume.summary.p;
    visualization_variable_outlet = volume.summary.p;
  else
    visualization_variable_inlet = volume.summary.T;
    visualization_variable_outlet = volume.summary.T;
  end if;*/

  connect(valve2.portA, port2)
    annotation (Line(points={{20,40},{0,40},{0,100}},
                                                 color={0,0,255}));
  connect(opening[1], valve2.opening) annotation (Line(points={{-60,93.3333},{
          -60,60},{30,60},{30,50}},
                              color={0,0,127}));
  connect(opening[2], valve3.opening) annotation (Line(points={{-60,100},{-60,16},
          {30,16},{30,10}},
                         color={0,0,127}));
  connect(opening[3], valve4.opening) annotation (Line(points={{-60,106.667},{
          -60,-20},{30,-20},{30,-30}},
                                color={0,0,127}));
  connect(valve4.portA, port4)
    annotation (Line(points={{20,-40},{0,-40},{0,-100}}, color={0,0,255}));
  connect(valve3.portA, port3)
    annotation (Line(points={{20,0},{-100,0}},  color={0,0,255}));
  connect(valve2.portB, volume.port[1]) annotation (Line(points={{40,40},{60,40},
          {60,-0.375},{80,-0.375}}, color={0,0,255}));
  connect(valve3.portB, volume.port[2]) annotation (Line(points={{40,0},{60,0},{
          60,-0.125},{80,-0.125}}, color={0,0,255}));
  connect(valve4.portB, volume.port[3]) annotation (Line(points={{40,-40},{60,-40},
          {60,0.125},{80,0.125}}, color={0,0,255}));
  connect(volume.port[4], port1) annotation (Line(points={{80,0.375},{90,0.375},
          {90,0},{100,0}}, color={0,0,255}));
  annotation (                   Icon(graphics={
        Ellipse(
          extent={{100,100},{-100,-100}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          fillColor={255,255,255}),
        Line(
          points={{-86,0},{84,0}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Polygon(
          points={{0,0},{-36,12},{-36,-12},{0,0}},
          lineColor={0,0,255},
          fillPattern=FillPattern.HorizontalCylinder,
          smooth=Smooth.None,
          fillColor={0,0,255}),
        Polygon(
          points={{3.30655e-15,-18},{-12,18},{12,18},{3.30655e-15,-18}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.None,
          fillColor={0,0,255},
          origin={0,-18},
          rotation=180),
        Line(
          points={{-86,-5.2047e-15},{-2,-2.28851e-17}},
          color={0,0,255},
          smooth=Smooth.None,
          rotation=90,
          thickness=0.5,
          origin={0,2}),
        Line(
          points={{-60,0},{26,-1.37499e-15}},
          color={0,0,255},
          smooth=Smooth.None,
          origin={0,60},
          rotation=90,
          thickness=0.5),
        Polygon(
          points={{-56,-1.45059e-14},{-18,12},{-18,-12},{-56,-1.45059e-14}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.None,
          fillColor={0,0,255},
          origin={0,56},
          rotation=90),
        Text(
          extent={{-10,10},{10,-10}},
          textColor={0,0,255},
          textString="3",
          origin={-76,-14},
          rotation=90),
        Text(
          extent={{10,10},{-10,-10}},
          textColor={0,0,255},
          origin={80,-18},
          rotation=90,
          textString="1"),
        Text(
          extent={{-10,10},{10,-10}},
          textColor={0,0,255},
          origin={18,80},
          rotation=90,
          textString="2"),
        Text(
          extent={{-10,10},{10,-10}},
          textColor={0,0,255},
          origin={18,-80},
          rotation=90,
          textString="4"),
        Line(
          points={{-86,0},{84,0}},
          color={255,0,0},
          thickness=5,
          visible=DynamicSelect(false, if opening[2]>minOpening_visualization then true else false)),
        Line(
          points={{84,6},{0,6},{0,86}},
          color={255,0,255},
          thickness=5,
          visible=DynamicSelect(false, if opening[1]>minOpening_visualization then true else false)),
        Line(
          points={{84,-6},{0,-6},{0,-86}},
          color={0,127,0},
          thickness=5,
          visible=DynamicSelect(false, if opening[3]>minOpening_visualization then true else false))}),
    Documentation(info="<html>
<h4>Three way collector valve</h4>
<p>The collector valve component is used to merge the incoming three flows into one flow. The component includes a friction model for each incoming path.</p>
<p>This component should be used for incompressible fluid models where one state for mass flow rate per path is required.</p>
<p>The incoming flow branch openings are controlled with the real vector input <code>opening</code>.</p>
</html>", revisions="<html>
<hr><p><font color=\"#E72614\"><b>Copyright &copy; 2004-2023, MODELON AB</b></font> <font color=\"#AFAFAF\"><br /><br /> The use of this software component is regulated by the licensing conditions for Modelon Libraries. <br /> This copyright notice must, unaltered, accompany all components that are derived from, copied from, <br /> or by other means have their origin from any Modelon Library. </font></p>
</html>"));
end ThreeWayValve_FourPort;

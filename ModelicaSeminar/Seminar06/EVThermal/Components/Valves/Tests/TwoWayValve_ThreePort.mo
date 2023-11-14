within ModelicaSeminar.Seminar06.EVThermal.Components.Valves.Tests;
model TwoWayValve_ThreePort "Split flow by downstream pressures"
  extends .Modelon.Icons.Experiment;
  extends .LiquidCooling.Experiments.Templates.ExperimentBase;
  .LiquidCooling.Sources.LiquidFlowSource flowSource(
    redeclare package Medium = Liquid,
    use_flow_in=false,
    m_flow=1) annotation (Placement(transformation(extent={{-92,10},{-72,30}})));
  .LiquidCooling.Sources.LiquidPressureSource pressureSource(redeclare package
      Medium = Liquid, use_p_in=false)
    annotation (Placement(transformation(extent={{60,-10},{40,10}})));
  .LiquidCooling.SplitsAndJoins.Generic.Split split(redeclare package Medium =
        Liquid)
    annotation (Placement(transformation(extent={{-60,10},{-40,30}})));
  ModelicaSeminar.Seminar06.EVThermal.Components.Valves.TwoWayValve_ThreePort twoWayValve_ThreePort(redeclare
      package Medium =
               Liquid)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  .Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(table=[0.0,0.4,0.6; 3,
        0.4,0.6; 5,0.6,0.4; 10,0.6,0.4; 12,0.9,0.1; 15,0.9,0.1; 20,0.25,0.75;
        25,0.25,0.75])
    annotation (Placement(transformation(extent={{-58,56},{-38,76}})));
  .Modelica.Blocks.Sources.RealExpression flowFractions[2](y=
        twoWayValve_ThreePort.flowFractions)
    annotation (Placement(transformation(extent={{-58,34},{-38,54}})));
  .ModelicaSeminar.Seminar06.EVThermal.Controllers.Components.ValveControllerFlowFraction2
    valveControllerFlowFraction2_1
    annotation (Placement(transformation(extent={{-28,52},{-8,72}})));
equation
  connect(flowSource.port, split.portA)
    annotation (Line(points={{-72,20},{-60,20}}, color={0,0,255}));
  connect(split.portB, twoWayValve_ThreePort.port2)
    annotation (Line(points={{-40,20},{-14,20},{-14,14}}, color={0,0,255}));
  connect(split.portC, twoWayValve_ThreePort.port3)
    annotation (Line(points={{-50,10},{-50,-14},{-14,-14}}, color={0,0,255}));
  connect(twoWayValve_ThreePort.port1, pressureSource.port)
    annotation (Line(points={{20,0},{40,0}}, color={0,0,255}));
  connect(valveControllerFlowFraction2_1.opening, twoWayValve_ThreePort.opening)
    annotation (Line(points={{-6,62},{0,62},{0,20}}, color={0,0,127}));
  connect(combiTimeTable.y, valveControllerFlowFraction2_1.flow_fractions_SP)
    annotation (Line(points={{-37,66},{-29,66}}, color={0,0,127}));
  connect(flowFractions.y, valveControllerFlowFraction2_1.flow_fractions)
    annotation (Line(points={{-37,44},{-34,44},{-34,58},{-29,58}}, color={0,0,
          127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    experiment(StopTime=25, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p><h4>Split_Physical</h4></p>
<p>This experiment illustrates a physical split of flow into multiple flow branches. The experiment is identical to <a href=\"modelica://LiquidCooling.Experiments.FlowRouting.Split_Unphysical\">Split_Unphysical</a> except that the split is done using the <a href=\"modelica://LiquidCooling.SplitsAndJoins.Generic.SplitMultiple\">SplitMultiple</a> component. The inlet flow is split up to the different branches according to flow fractions that adapts dynamically to the downstream pressures. In this example every branch is identical, first an orifice, then a valve and then a fixed pressure sink (the same pressure is used for every branch).</p>
<p>The plot of the results below show that each branch initially gets 1/3 of the total inlet flow of 1 kg/s. At t = 1 valve 2 begins to close, which results in increased pressure drop and decreased flow through that valve. The other valves also gets increased flow rates as a consequence of mass balance, and hence increased pressure drop. Also the upstream pressure in the mass flow source is increased due to the closing valve.</p>
<p><img src=\"modelica://LiquidCooling/Resources/Images/Experiments/Split_Physical/MassFlow.PNG\"/></p>
<p><img src=\"modelica://LiquidCooling/Resources/Images/Experiments/Split_Physical/ValveDp.PNG\"/></p>
<p><img src=\"modelica://LiquidCooling/Resources/Images/Experiments/Split_Physical/UpstreamP.PNG\"/></p>
</html>",
        revisions="<html>
<hr><p><font color=\"#E72614\"><b>Copyright &copy; 2004-2022, MODELON AB</b></font> <font color=\"#AFAFAF\"><br /><br /> The use of this software component is regulated by the licensing conditions for Modelon Libraries. <br /> This copyright notice must, unaltered, accompany all components that are derived from, copied from, <br /> or by other means have their origin from any Modelon Library. </font></p>
</html>"));
end TwoWayValve_ThreePort;

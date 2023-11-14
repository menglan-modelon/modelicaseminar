within ModelicaSeminar.Seminar06.EVThermal.Components.Valves.Tests;
model DistributionValve3 "Split flow by downstream pressures"
  extends .Modelon.Icons.Experiment;
  extends .LiquidCooling.Experiments.Templates.ExperimentBase;
  .LiquidCooling.Sources.LiquidFlowSource flowSource(
    redeclare package Medium = Liquid,
    use_flow_in=false,
    m_flow=1)
    annotation (Placement(transformation(extent={{-92,-10},{-72,10}})));
  .LiquidCooling.Sources.LiquidPressureSource pressureSource(redeclare package
      Medium = Liquid)
    annotation (Placement(transformation(extent={{100,18},{80,38}})));
  .LiquidCooling.Sources.LiquidPressureSource pressureSource1(redeclare package
      Medium = Liquid, use_p_in=false)
    annotation (Placement(transformation(extent={{100,-10},{80,10}})));
  .LiquidCooling.Sources.LiquidPressureSource pressureSource2(redeclare package
      Medium = Liquid)
    annotation (Placement(transformation(extent={{100,-40},{80,-20}})));
  Components.Valves.DistributionValve3 distributionValve3(redeclare package
      Medium =
        Liquid,opening(start = fill(0,3),fixed = false))
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  .ModelicaSeminar.Seminar06.EVThermal.Controllers.Components.ValveControllerFlowFraction3
    valveControllerFlowFraction3_1
    annotation (Placement(transformation(extent={{-66,34},{-46,54}})));
  .Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(table=[0,2,2,3;3,2,2,3;5,0,0.5,0.5;10,0,0.5,0.5;12,0,0.5,0.5;15,0,0.5,0.5;20,0,0.5,0.5;25,0,0.5,0.5])
    annotation (Placement(transformation(extent={{-100.0,38.0},{-80.0,58.0}},rotation = 0.0,origin = {0.0,0.0})));
  .Modelica.Blocks.Sources.RealExpression flowFractions[3](y=distributionValve3.split.flowFractions)
    annotation (Placement(transformation(extent={{-100,16},{-80,36}})));
equation
  connect(flowSource.port, distributionValve3.port1)
    annotation (Line(points={{-72,0},{-20,0}}, color={0,0,255}));
  connect(distributionValve3.port2, pressureSource2.port)
    annotation (Line(points={{0,-20},{0,-30},{80,-30}}, color={0,0,255}));
  connect(distributionValve3.port3, pressureSource1.port)
    annotation (Line(points={{20,0},{80,0}}, color={0,0,255}));
  connect(distributionValve3.port4, pressureSource.port)
    annotation (Line(points={{0,20},{0,28},{80,28}}, color={0,0,255}));
  connect(combiTimeTable.y, valveControllerFlowFraction3_1.flow_fractions_SP)
    annotation (Line(points={{-79,48},{-67,48}}, color={0,0,127}));
  connect(flowFractions.y, valveControllerFlowFraction3_1.flow_fractions)
    annotation (Line(points={{-79,26},{-74,26},{-74,40},{-67,40}}, color={0,0,
          127}));
    connect(valveControllerFlowFraction3_1.opening,distributionValve3.opening) annotation(Line(points = {{-44,44},{-32,44},{-32,10},{-20,10}},color = {0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    experiment(StopTime=25, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
</html>",
        revisions="<html>
<hr><p><font color=\"#E72614\"><b>Copyright &copy; 2004-2022, MODELON AB</b></font> <font color=\"#AFAFAF\"><br /><br /> The use of this software component is regulated by the licensing conditions for Modelon Libraries. <br /> This copyright notice must, unaltered, accompany all components that are derived from, copied from, <br /> or by other means have their origin from any Modelon Library. </font></p>
</html>"),    Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DistributionValve3;

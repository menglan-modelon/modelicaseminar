within ModelicaSeminar.Seminar06.EVThermal.Components.Valves.Tests;
model ThreeWayValve_FourPort "Split flow by downstream pressures"
  extends .Modelon.Icons.Experiment;
  extends .LiquidCooling.Experiments.Templates.ExperimentBase;
  .LiquidCooling.Sources.LiquidFlowSource flowSource(
    redeclare package Medium = Liquid,
    use_flow_in=false,
    m_flow=1)
    annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
  .LiquidCooling.Sources.LiquidPressureSource pressureSource(redeclare package
      Medium = Liquid, use_p_in=false)
    annotation (Placement(transformation(extent={{60,-10},{40,10}})));
  .LiquidCooling.SplitsAndJoins.Generic.Split split(redeclare package Medium =
        Liquid)
    annotation (Placement(transformation(extent={{-70,20},{-50,40}})));
  ModelicaSeminar.Seminar06.EVThermal.Components.Valves.ThreeWayValve_FourPort threeWayValve_FourPort(redeclare
      package Medium =
               Liquid)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  .LiquidCooling.SplitsAndJoins.Generic.Split split1(redeclare package Medium =
        Liquid)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  .Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(table=[0,0.5,0.5,0;3,0.4,0.6,0;5,0.7,0.3,0;10,0.2,0.8,0.0;12,0.9,0.05,0.05;15,0.9,0.05,0.05;20,0.333,0.333,0.334;25,0.333,0.333,0.334])
    annotation (Placement(transformation(extent={{-82,64},{-62,84}})));
  .Modelica.Blocks.Sources.RealExpression flowFractions[3](y=
        threeWayValve_FourPort.flowFractions)
    annotation (Placement(transformation(extent={{-82,42},{-62,62}})));
  .ModelicaSeminar.Seminar06.EVThermal.Controllers.Components.ValveControllerFlowFraction3
    valveControllerFlowFraction3_1
    annotation (Placement(transformation(extent={{-48,60},{-28,80}})));
equation
  connect(flowSource.port, split.portA)
    annotation (Line(points={{-80,30},{-70,30}}, color={0,0,255}));
  connect(threeWayValve_FourPort.port1, pressureSource.port)
    annotation (Line(points={{20,0},{40,0}}, color={0,0,255}));
  connect(split.portB, threeWayValve_FourPort.port2)
    annotation (Line(points={{-50,30},{0,30},{0,20}}, color={0,0,255}));
  connect(split1.portB, threeWayValve_FourPort.port3)
    annotation (Line(points={{-30,0},{-20,0}}, color={0,0,255}));
  connect(split1.portC, threeWayValve_FourPort.port4) annotation (Line(points={{-40,-10},{-40,-30},{0,-30},{0,-20}}, color={0,0,255}));
  connect(split.portC, split1.portA)
    annotation (Line(points={{-60,20},{-60,0},{-50,0}}, color={0,0,255}));
  connect(combiTimeTable.y, valveControllerFlowFraction3_1.flow_fractions_SP)
    annotation (Line(points={{-61,74},{-49,74}}, color={0,0,127}));
  connect(flowFractions.y, valveControllerFlowFraction3_1.flow_fractions)
    annotation (Line(points={{-61,52},{-56,52},{-56,66},{-49,66}}, color={0,0,
          127}));
  connect(valveControllerFlowFraction3_1.opening, threeWayValve_FourPort.opening)
    annotation (Line(points={{-26,70},{-12,70},{-12,20}}, color={0,0,127}));
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
end ThreeWayValve_FourPort;

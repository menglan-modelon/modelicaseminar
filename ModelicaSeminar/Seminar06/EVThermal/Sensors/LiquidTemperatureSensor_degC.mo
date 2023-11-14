within ModelicaSeminar.Seminar06.EVThermal.Sensors;
model LiquidTemperatureSensor_degC "Temperature sensor in degC"

  replaceable package Medium =
    .LiquidCooling.Media.Water.IncompressibleWater
    constrainedby .LiquidCooling.Media.Templates.Coolant annotation (
      choicesAllMatching);
  extends .LiquidCooling.Utilities.Visualizers.VisualizedComponentBase;

  .Modelon.ThermoFluid.Sensors.TemperatureSensor temperatureSensor(redeclare
      package Medium = Medium)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidSensorPort port(
      redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  .Modelica.Blocks.Interfaces.RealOutput y "Temperature [degC]" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,100})));

  .Modelica.Blocks.Math.Add add(k2=-1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,70})));
  .Modelica.Blocks.Sources.Constant const(k=273.15) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,30})));
equation

  /* Visualization */
  if visualization_option == .LiquidCooling.Utilities.Choices.VisualizationOption.PressureVisualization then
    visualization_variable_inlet = port.p;
    visualization_variable_outlet = port.p;
  else
    visualization_variable_inlet = temperatureSensor.state.T;
    visualization_variable_outlet = temperatureSensor.state.T;
  end if;
  connect(temperatureSensor.port, port) annotation (Line(
      points={{-20,0},{-100,0}},
      color={255,128,0},
      smooth=Smooth.None));

  connect(add.y, y) annotation (Line(points={{0,81},{0,100}}, color={0,0,127}));
  connect(temperatureSensor.y, add.u1) annotation (Line(points={{0,14.4},{0,30},
          {-6,30},{-6,58}}, color={0,0,127}));
  connect(const.y, add.u2)
    annotation (Line(points={{20,41},{20,48},{6,48},{6,58}}, color={0,0,127}));
  annotation (
    defaultComponentName="temperatureSensor",
    Documentation(info="<html>
<h4>LiquidTemperatureSensor</h4>
<p>Liquid temperature sensor. Sends the temperature [K] to a Real Output connector. Does not affect the fluid flow rate or properties.</p>
<p>Note: Use this component with caution, as connection of several stream connectors (more than one-to-one) may generate nonlinear systems.</p>
</html>", revisions="<html>
<hr><p><font color=\"#E72614\"><b>Copyright &copy; 2004-2022, MODELON AB</b></font> <font color=\"#AFAFAF\"><br /><br /> The use of this software component is regulated by the licensing conditions for Modelon Libraries. <br /> This copyright notice must, unaltered, accompany all components that are derived from, copied from, <br /> or by other means have their origin from any Modelon Library. </font></p>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={
        Ellipse(
          extent={{-74,74},{74,-74}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-42,38},{-54,50}}, color={0,0,0}),
        Line(points={{0,-56},{0,-74}}, color={0,0,0}),
        Line(points={{-40,-42},{-52,-54}}, color={0,0,0}),
        Polygon(
          points={{74,0},{74,6},{72,18},{69,27},{66,34},{62,41},{56,49},{51,54},
              {38,40},{44,32},{49,23},{53,14},{54,7},{54,0},{74,0}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(extent={{-74,74},{74,-74}}, lineColor={0,0,0}),
        Line(points={{34,36},{51,54}}, color={0,0,0}),
        Line(points={{50,0},{74,0}}, color={0,0,0}),
        Ellipse(
          extent={{-46,46},{46,-46}},
          lineColor=DynamicSelect({255,255,255}, if enable_visualization then
              inletColor else {255,255,255}),
          fillColor=DynamicSelect({255,255,255}, if enable_visualization then
              inletColor else {255,255,255}),
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-5,5},{5,-5}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Polygon(
          points={{-3,0},{0,0},{2,2},{-24,57},{-3,0}},
          lineColor={0,0,0},
          fillColor={35,35,35},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-20,-10},{20,-50}},
          lineColor=DynamicSelect({0,0,0}, if enable_visualization then
              inletTextColor else {0,0,0}),
          lineThickness=0.5,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          textString="T"),
        Line(points={{-74,0},{-50,0}}, color={0,0,0}),
        Line(points={{0,74},{0,56}}, color={0,0,0}),
        Text(
          extent={{14,-12},{54,-52}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          textString="degC")}));
end LiquidTemperatureSensor_degC;

within ModelicaSeminar.Seminar02.MiniCar.Components;
  model calcOCV
  .Modelica.Blocks.Interfaces.RealInput i annotation(
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-12, -12}, {12, 12}}, rotation = -90), iconTransformation(origin = {6, 94}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  .Modelica.Blocks.Interfaces.RealOutput Vocv annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  // Parameters
  parameter Real batteryPowerCapacity = 1 "Battery power capacity [Wh]";
  parameter .Modelica.Units.SI.Voltage Vb0 = 3 "Battery voltage";
  // Variables
  Real soc "Battery SOC";
  Real usedWh "Used power capacity";
  equation
  der(usedWh) = Vb0 * i / 3600;
  soc = if 1 - usedWh / batteryPowerCapacity >= 0 then 1 - usedWh / batteryPowerCapacity else 0;
  Vocv = -Vb0 * soc;
  annotation(
    Icon(coordinateSystem(initialScale = 0.1, extent = {{-100, -100}, {100, 100}}), graphics = {Text(origin = {-6, 0}, extent = {{-86, 28}, {86, -28}}, textString = "%name"), Rectangle(extent = {{-100, 100}, {100, -100}})}));
  
  end calcOCV;

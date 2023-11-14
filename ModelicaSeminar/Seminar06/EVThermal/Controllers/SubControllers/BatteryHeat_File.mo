within ModelicaSeminar.Seminar06.EVThermal.Controllers.SubControllers;
model BatteryHeat_File "motor oil controller, file-based"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.ComponentController;
  parameter String fileName=.Modelica.Utilities.Files.loadResource("modelica://ModelicaSeminar/Resources/Data/Rev26_Controls_Cooling1.txt") "file with controls inputs";
  .Modelica.Blocks.Routing.RealPassThrough Q_battery_set
    annotation (Placement(transformation(extent={{55.0,-11.0},{63.0,-3.0}},rotation = 0.0,origin = {0.0,0.0})));
  .Modelica.Blocks.Sources.CombiTimeTable Q_battery(
    tableOnFile=true,
    tableName="Q_battery",
    fileName=fileName)
    annotation (Placement(transformation(extent={{20,-20},{40,0}})));
equation
    connect(Q_battery_set.y,controlBus.Q_battery) annotation(Line(points = {{63.4,-7},{80,-7},{80,0},{100,0}},color = {0,0,127}));
    connect(Q_battery.y[1],Q_battery_set.u) annotation(Line(points = {{41,-10},{50,-10},{50,-7},{54.2,-7}},color = {0,0,127}));
end BatteryHeat_File;

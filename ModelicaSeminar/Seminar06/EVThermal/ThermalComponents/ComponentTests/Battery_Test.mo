within ModelicaSeminar.Seminar06.EVThermal.ThermalComponents.ComponentTests;

model Battery_Test
  extends .LiquidCooling.Experiments.Templates.ExperimentBase(redeclare package
      Liquid = .LiquidCooling.Media.AqueousSolutions.EthyleneGlycolWater50);
    .LiquidCooling.Sensors.LiquidTemperatureSensor temperatureSensor(redeclare
      package Medium =                                                                          Liquid) annotation(Placement(transformation(extent = {{4.84077639871542,-4.84077639871542},{-4.84077639871542,4.84077639871542}},origin = {26.29240381425279,-39.166493477026336},rotation = 90.0)));
    .LiquidCooling.Sources.LiquidFlowSource flowSource(m_flow = 0.1,p_start = 105000) annotation(Placement(transformation(extent = {{-74.0,-10.0},{-54.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .LiquidCooling.Sources.LiquidPressureSource pressureSource(isSource = false) annotation(Placement(transformation(extent = {{64.0,-10.0},{44.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .LiquidCooling.Sensors.LiquidTemperatureSensor temperatureSensor2(redeclare
      package Medium =                                                                           Liquid) annotation(Placement(transformation(extent = {{4.84077639871542,-4.84077639871542},{-4.84077639871542,4.84077639871542}},origin = {-44.0,-22.0},rotation = 90.0)));
    .ModelicaSeminar.Seminar06.EVThermal.ThermalComponents.BatteryWithHeatCapacity_File batteryWithHeatCapacity_File annotation(Placement(transformation(extent = {{-10.0,-9.599377390586657},{10.0,10.400622609413343}},origin = {0.0,0.0},rotation = 0.0)));
    .ModelicaSeminar.Seminar06.EVThermal.Controllers.SubControllers.BatteryHeat_File batteryHeat_File annotation(Placement(transformation(extent = {{-26.024974239876897,22.164410834883633},{-6.024974239876897,42.16441083488363}},origin = {0,0},rotation = 0)));
equation
    connect(flowSource.port,temperatureSensor2.port) annotation(Line(points = {{-54,0},{-44,0},{-44,-17.15922360128458}},color = {0,0,255}));
    connect(batteryWithHeatCapacity_File.portB,pressureSource.port) annotation(Line(points = {{10.200000000000001,0.40062260941334316},{27.1,0.40062260941334316},{27.1,0},{44,0}},color = {0,0,255}));
    connect(flowSource.port,batteryWithHeatCapacity_File.portA) annotation(Line(points = {{-54,0},{-32,0},{-32,0.40062260941334316},{-10,0.40062260941334316}},color = {0,0,255}));
    connect(batteryWithHeatCapacity_File.portB,temperatureSensor.port) annotation(Line(points = {{10.200000000000001,0.40062260941334316},{26.29240381425279,0.40062260941334316},{26.29240381425279,-34.325717078310916}},color = {0,0,255}));
    connect(batteryHeat_File.controlBus,batteryWithHeatCapacity_File.controlBus) annotation(Line(points = {{-6.024974239876897,32.16441083488363},{0,32.16441083488363},{0,6.400622609413343}},color = {255,204,51}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=100, __Dymola_Algorithm="Dassl"));
end Battery_Test;

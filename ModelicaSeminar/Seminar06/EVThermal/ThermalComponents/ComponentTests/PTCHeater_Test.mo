within ModelicaSeminar.Seminar06.EVThermal.ThermalComponents.ComponentTests;
model PTCHeater_Test
  extends .LiquidCooling.Experiments.Templates.ExperimentBase(redeclare package
      Liquid = .LiquidCooling.Media.AqueousSolutions.EthyleneGlycolWater50);
    .ModelicaSeminar.Seminar06.EVThermal.ThermalComponents.PTCHeater pTCHeater(Q_max=4000)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={0,0},
        rotation=0)));
    .Modelica.Blocks.Sources.BooleanPulse booleanPulse(startTime = 10,period = 100) annotation(Placement(transformation(extent = {{-82.0,32.0},{-62.0,52.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.RealExpression targetTempBat(y=70)    annotation(Placement(transformation(extent = {{-35.16211186171968,0.8378881382803129},{-24.83788813828032,11.162111861719687}},origin = {0.0,0.0},rotation = 0.0)));
    .LiquidCooling.Sensors.LiquidTemperatureSensor temperatureSensor(redeclare
      package Medium =                                                                          Liquid) annotation(Placement(transformation(extent = {{4.84077639871542,-4.84077639871542},{-4.84077639871542,4.84077639871542}},origin = {22.0,-24.0},rotation = 90.0)));
    .LiquidCooling.Sources.LiquidFlowSource flowSource(m_flow = 0.1,p_start = 105000) annotation(Placement(transformation(extent = {{-74.0,-10.0},{-54.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .LiquidCooling.Sources.LiquidPressureSource pressureSource(isSource = false) annotation(Placement(transformation(extent = {{64.0,-10.0},{44.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .LiquidCooling.Sensors.LiquidTemperatureSensor temperatureSensor2(redeclare
      package Medium =                                                                           Liquid) annotation(Placement(transformation(extent = {{4.84077639871542,-4.84077639871542},{-4.84077639871542,4.84077639871542}},origin = {-44.0,-22.0},rotation = 90.0)));
  .Modelica.Thermal.HeatTransfer.Celsius.FromKelvin fromKelvin    annotation (Placement(transformation(extent={{10,-34},{-10,-14}})));
equation
  connect(targetTempBat.y, pTCHeater.T_target_degC) annotation (Line(points={{-24.32167695210835,
          6},{-17.160838476054174,6},{-17.160838476054174,5},{-10,5}}, color={0,
          0,127}));
  connect(pTCHeater.portB, temperatureSensor.port) annotation (Line(points={{
          10.200000000000001,0},{22,0},{22,-19.15922360128458}}, color={0,0,255}));
  connect(flowSource.port, pTCHeater.portA)
    annotation (Line(points={{-54,0},{-10,0}}, color={0,0,255}));
  connect(pTCHeater.portB, pressureSource.port)
    annotation (Line(points={{10.200000000000001,0},{44,0}}, color={0,0,255}));
    connect(flowSource.port,temperatureSensor2.port) annotation(Line(points = {{-54,0},{-44,0},{-44,-17.15922360128458}},color = {0,0,255}));
  connect(booleanPulse.y, pTCHeater.control)
    annotation (Line(points={{-61,42},{-5,42},{-5,10}}, color={255,0,255}));
  connect(temperatureSensor.y, fromKelvin.Kelvin)
    annotation (Line(points={{17.1592,-24},{12,-24}}, color={0,0,127}));
  connect(fromKelvin.Celsius, pTCHeater.T_sensed_degC) annotation (Line(points=
          {{-11,-24},{-16,-24},{-16,-5},{-10,-5}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=100, __Dymola_Algorithm="Dassl"));
end PTCHeater_Test;

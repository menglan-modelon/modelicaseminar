within ModelicaSeminar.Seminar06.EVThermal.ThermalComponents.ComponentTests;
model OilCoolingMotor_Test
  extends .LiquidCooling.Experiments.Templates.ExperimentBase(redeclare package
      Liquid = .LiquidCooling.Media.AqueousSolutions.EthyleneGlycolWater50);
    .ModelicaSeminar.Seminar06.EVThermal.ThermalComponents.Motor_Oil_cooling motor_Oil_cooling annotation(Placement(transformation(extent = {{-10,-10},{10,10}},origin = {0,0},rotation = 0)));
    .LiquidCooling.Sources.LiquidFlowSource flowSource(m_flow = 0.01,T = 288.15) annotation(Placement(transformation(extent = {{-70,-10},{-50,10}},origin = {0,0},rotation = 0)));
    .ModelicaSeminar.Seminar06.EVThermal.Controllers.SubControllers.MotorOil motorOil(mdot_oil_motor=0.01,
                                             Q_motor = 100)                 annotation(Placement(transformation(extent = {{-20.0,14.0},{0.0,34.0}},origin = {0.0,0.0},rotation = 0.0)));
    .LiquidCooling.Sources.LiquidPressureSource pressureSource(isSource = false,T = 288.15) annotation(Placement(transformation(extent = {{70.0,-10.0},{50.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(motor_Oil_cooling.portA,flowSource.port) annotation(Line(points = {{-10,0},{-50,0}},color = {0,0,255}));
    connect(motorOil.controlBus,motor_Oil_cooling.controlBus) annotation(Line(points = {{0,24},{0,8}},color = {255,204,51}));
    connect(motor_Oil_cooling.portB,pressureSource.port) annotation(Line(points = {{10.200000000000001,0},{50,0}},color = {0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=100, __Dymola_Algorithm="Dassl"));
end OilCoolingMotor_Test;

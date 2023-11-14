within ModelicaSeminar.Seminar06.EVThermal.Experiments;
model Rev15System_File "test of Rev15 system with file based inputs"
  extends .LiquidCooling.Experiments.Templates.ExperimentBase(redeclare package
      Liquid = .LiquidCooling.Media.AqueousSolutions.EthyleneGlycolWater50);
  replaceable ModelicaSeminar.Seminar06.EVThermal.Subsystems.NinePort_TwoPump_350_100 flow_routing(T_start = T_start,flowResistance(T_start = T_start))
  constrainedby ModelicaSeminar.Seminar06.EVThermal.Interfaces.NinePort_4s_5r(redeclare package Medium =
        Liquid)
    annotation (Placement(transformation(extent={{-42,-110},{42,-60}})));
  .LiquidCooling.Sensors.MultiDisplaySensor multiDisplaySensor(redeclare package
      Medium = Liquid)
    annotation (Placement(transformation(extent={{10,46},{-10,66}})));
  .LiquidCooling.Sensors.MultiDisplaySensor multiDisplaySensor1(redeclare
      package Medium = Liquid)
    annotation (Placement(transformation(extent={{26,68},{6,88}})));
  .LiquidCooling.Sensors.MultiDisplaySensor multiDisplaySensor2(redeclare
      package Medium = Liquid)
    annotation (Placement(transformation(extent={{10,84},{-10,104}})));
  .LiquidCooling.SplitsAndJoins.Generic.Join join(redeclare package Medium =
        Liquid, T_start=T_start)
                annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-50,60})));
  .LiquidCooling.Sensors.MultiDisplaySensor multiDisplaySensor3(redeclare
      package Medium = Liquid)
    annotation (Placement(transformation(extent={{46,100},{26,120}})));
  .LiquidCooling.Sensors.MultiDisplaySensor multiDisplaySensor4(redeclare
      package Medium = Liquid) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-54,36})));
  replaceable ModelicaSeminar.Seminar06.EVThermal.Controllers.Controller_File controller(fileName = Modelica.Utilities.Files.loadResource("modelica://ModelicaSeminar/Resources/Data/Controls1_Scenario3.txt")) constrainedby
    ModelicaSeminar.Seminar06.EVThermal.Interfaces.Controller
    annotation (Placement(transformation(extent={{104.0,-100.0},{64.0,-60.0}},rotation = 0.0,origin = {0.0,0.0})));
  ModelicaSeminar.Seminar06.EVThermal.ThermalComponents.PTCHeater_File PTCBattery(redeclare package Medium = Liquid,
      T_start=T_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={10,-10})));
  ModelicaSeminar.Seminar06.EVThermal.Controllers.ScenarioController_File scenarioController_File(fileName = Modelica.Utilities.Files.loadResource("modelica://ModelicaSeminar/Resources/Data/Cooling1_Scenario3.txt"))
    annotation (Placement(transformation(extent={{100,-20},{80,0}})));
  parameter .Modelon.Media.Units.Temperature T_start = 298.15
    "Initial temperature";
  ModelicaSeminar.Seminar06.EVThermal.ThermalComponents.PTCHeater_File PTCCabin(
    redeclare package Medium = Liquid,
    T_start=T_start,
    batteryOrCabin=false) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={60,-24})));
  ModelicaSeminar.Seminar06.EVThermal.ThermalComponents.Cabin_File cabin(redeclare package Medium = Liquid, T_start=
       T_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={60,10})));
  .LiquidCooling.Sources.GasPressureSource
                              gasPressureBoundary(p=101300,T = T_start)
    annotation (Placement(transformation(extent={{-90,10},{-70,30}})));
  .LiquidCooling.Sources.GasFlowSource
                          gasFlowBoundary(
    flowDefinition=.Modelon.ThermoFluid.Choices.FlowDefinition.m_flow,
    temperatureUnit=.Modelon.ThermoFluid.Choices.RealTemperatureUnit.degC,
    use_flow_in=true,
    use_T_in=true,T = T_start)
    annotation (Placement(transformation(extent={{-90.0,4.0},{-70.0,-16.0}},rotation = 0.0,origin = {0.0,0.0})));
  .LiquidCooling.HeatExchangers.LiquidGas.StaticEffectivenessTable radiator(
      redeclare package Liquid = Liquid,
    init_liq(T_in=T_start),
    L_prim=0.42,
    Dhyd_prim=0.00312,
    L_sec=0.03,
    A_sec=0.12,
    Dhyd_sec=1.3e-3,
    redeclare model Friction_sec =
      .LiquidCooling.Pipes.SubComponents.PipeResistances.SinglePhase.QuadraticOperatingPointLoss
        (
        d0=1,
        dp0(displayUnit="kPa") = 600,
        m_flow0=1),
    redeclare model Friction =
        .LiquidCooling.Pipes.SubComponents.PipeResistances.SinglePhase.QuadraticOperatingPointLoss
        (
        dp0(displayUnit="kPa") = 30000,
        m_flow0=0.7,
        d0=1000),
    from_dp_sec=false,
    table=[0,1; 1,0.6],
    A_heat_sec=0.2,init_gas(T_in = T_start),A_prim = 0.001615) annotation (Placement(transformation(
        extent={{10.0,-10.0},{-10.0,10.0}},
        rotation=90.0,
        origin={-56.0,10.0})));
  ModelicaSeminar.Seminar06.EVThermal.ThermalComponents.Charger_File charger(redeclare package Medium = Liquid,
      T_start=T_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={30,-24})));
  ModelicaSeminar.Seminar06.EVThermal.ThermalComponents.DCDCconverter_File DCDC(redeclare package Medium = Liquid,
      T_start=T_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={30,4})));
  ModelicaSeminar.Seminar06.EVThermal.ThermalComponents.Inverter_File inverter(redeclare package Medium = Liquid,
      T_start=T_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={30,30})));
  ModelicaSeminar.Seminar06.EVThermal.ThermalComponents.Motor_File motor(redeclare package Medium = Liquid, T_start=
       T_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={30,56})));
  ModelicaSeminar.Seminar06.EVThermal.ThermalComponents.Chiller_File chiller(redeclare package Medium = Liquid,
      T_start=T_start) annotation (Placement(transformation(
        extent={{-10.0,10.0},{10.0,-10.0}},
        rotation=90.0,
        origin={10.0,-36.0})));
  ModelicaSeminar.Seminar06.EVThermal.ThermalComponents.Battery_File battery(redeclare package Medium = Liquid,
      T_start=T_start) annotation (Placement(transformation(
        extent={{-10.0,10.0},{10.0,-10.0}},
        rotation=90.0,
        origin={10.0,20.0})));
  .Modelica.Blocks.Sources.CombiTimeTable massflow_rad(
    tableOnFile=true,
    tableName="mdot_rad",
    fileName=scenarioController_File.fileName)
    annotation (Placement(transformation(extent={{-114,-40},{-94,-20}})));
  .Modelica.Blocks.Sources.CombiTimeTable T_rad_degC(
    tableOnFile=true,
    tableName="T_rad_degC",
    fileName=scenarioController_File.fileName)
    annotation (Placement(transformation(extent={{-114,-66},{-94,-46}})));
  .LiquidCooling.Sensors.MultiDisplaySensor multiDisplaySensor5(redeclare
      package Medium = Liquid) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-54,-20})));
equation
  connect(multiDisplaySensor.portB, flow_routing.port1) annotation (Line(points={{-5,52},
          {-9.33333,52},{-9.33333,-60}},       color={0,0,255}));
  connect(multiDisplaySensor1.portB, flow_routing.port2) annotation (Line(
        points={{11,74},{-16.3333,74},{-16.3333,-60}},
                                                    color={0,0,255}));
  connect(multiDisplaySensor2.portB, join.portA)
    annotation (Line(points={{-5,90},{-50,90},{-50,70}}, color={0,0,255}));
  connect(flow_routing.port3, join.portB) annotation (Line(points={{-23.3333,
          -60},{-24,-60},{-24,60},{-40,60}},
                                      color={0,0,255}));
  connect(join.portC, multiDisplaySensor4.portA)
    annotation (Line(points={{-50,50},{-50,41}}, color={0,0,255}));
  connect(multiDisplaySensor3.portB, flow_routing.port4) annotation (Line(
        points={{31,106},{-30.3333,106},{-30.3333,-60}},
                                                     color={0,0,255}));
  connect(controller.controlBus, flow_routing.controlBus) annotation (Line(
      points={{64,-80},{54,-80},{54,-52},{0,-52},{0,-60}},
      color={255,204,51},
      thickness=0.5));
  connect(scenarioController_File.controlBus, PTCBattery.controlBus)
    annotation (Line(
      points={{80,-10},{16,-10}},
      color={255,204,51},
      thickness=0.5));
  connect(flow_routing.portA, PTCCabin.portA) annotation (Line(points={{37.3333,
          -60},{37.3333,-48},{60,-48},{60,-34}}, color={0,0,255}));
  connect(PTCCabin.controlBus, scenarioController_File.controlBus) annotation (
      Line(
      points={{66,-24},{74,-24},{74,-10},{80,-10}},
      color={255,204,51},
      thickness=0.5));
  connect(PTCCabin.portB, cabin.portA)
    annotation (Line(points={{60,-13.8},{60,0}}, color={0,0,255}));
  connect(cabin.portB, multiDisplaySensor3.portA)
    annotation (Line(points={{60,20.2},{60,106},{41,106}},
                                                         color={0,0,255}));
  connect(scenarioController_File.controlBus, cabin.controlBus) annotation (
      Line(
      points={{80,-10},{74,-10},{74,10},{66,10}},
      color={255,204,51},
      thickness=0.5));
  connect(multiDisplaySensor4.portB, radiator.portA_prim) annotation (Line(
        points={{-50,31},{-50,20}},                  color={0,0,255}));
  connect(flow_routing.portB, multiDisplaySensor2.portA) annotation (Line(
        points={{28,-60},{28,-44},{48,-44},{48,90},{5,90}}, color={0,0,255}));
  connect(flow_routing.portC, charger.portA) annotation (Line(points={{18.6667,
          -60},{18.6667,-40},{30,-40},{30,-34}},
                                            color={0,0,255}));
  connect(charger.controlBus, scenarioController_File.controlBus) annotation (
      Line(
      points={{36,-24},{40,-24},{40,-10},{80,-10}},
      color={255,204,51},
      thickness=0.5));
  connect(charger.portB, DCDC.portA)
    annotation (Line(points={{30,-13.8},{30,-6}}, color={0,0,255}));
  connect(DCDC.controlBus, scenarioController_File.controlBus) annotation (Line(
      points={{36,4},{40,4},{40,-10},{80,-10}},
      color={255,204,51},
      thickness=0.5));
  connect(inverter.portA, DCDC.portB)
    annotation (Line(points={{30,20},{30,14.2}}, color={0,0,255}));
  connect(inverter.controlBus, scenarioController_File.controlBus) annotation (
      Line(
      points={{36,30},{40,30},{40,-10},{80,-10}},
      color={255,204,51},
      thickness=0.5));
  connect(inverter.portB, motor.portA)
    annotation (Line(points={{30,40.2},{30,46}}, color={0,0,255}));
  connect(motor.controlBus, scenarioController_File.controlBus) annotation (
      Line(
      points={{38,56},{40,56},{40,-10},{80,-10}},
      color={255,204,51},
      thickness=0.5));
  connect(motor.portB, multiDisplaySensor1.portA)
    annotation (Line(points={{30,66.2},{30,74},{21,74}}, color={0,0,255}));
  connect(chiller.portA, flow_routing.portD) annotation (Line(points={{9.999999999999998,-46},{9.999999999999998,-60},{9.33333,-60}}, color={0,0,255}));
  connect(PTCBattery.portA, chiller.portB)
    annotation (Line(points={{10,-20},{10,-25.799999999999997},{10.000000000000002,-25.799999999999997}}, color={0,0,255}));
  connect(chiller.controlBus, scenarioController_File.controlBus) annotation (
      Line(
      points={{16,-36},{20,-36},{20,-10},{80,-10}},
      color={255,204,51},
      thickness=0.5));
  connect(PTCBattery.portB, battery.portA)
    annotation (Line(points={{10,0.2},{10,10},{9.999999999999998,10}}, color={0,0,255}));
  connect(battery.portB, multiDisplaySensor.portA)
    annotation (Line(points={{10.000000000000002,30.200000000000003},{10.000000000000002,52},{5,52}}, color={0,0,255}));
  connect(battery.controlBus, scenarioController_File.controlBus) annotation (
      Line(
      points={{16,20},{20,20},{20,-10},{80,-10}},
      color={255,204,51},
      thickness=0.5));
  connect(gasPressureBoundary.port, radiator.portB_sec)
    annotation (Line(points={{-70,20},{-62,20}}, color={85,170,255}));
  connect(gasFlowBoundary.port, radiator.portA_sec)
    annotation (Line(points={{-70,-6},{-62,-6},{-62,1.7763568394002505e-15}}, color={85,170,255}));
  connect(massflow_rad.y[1], gasFlowBoundary.m_flow_in)
    annotation (Line(points={{-93,-30},{-86,-30},{-86,-16}}, color={0,0,127}));
  connect(T_rad_degC.y[1], gasFlowBoundary.T_in)
    annotation (Line(points={{-93,-56},{-80,-56},{-80,-16}}, color={0,0,127}));
  connect(radiator.portB_prim, multiDisplaySensor5.portA)
    annotation (Line(points={{-50,-1.7763568394002505e-15},{-50,-15}}, color={0,0,255}));
  connect(multiDisplaySensor5.portB, flow_routing.port5) annotation (Line(
        points={{-50,-25},{-50,-40},{-38,-40},{-38,-60},{-37.3333,-60}}, color={
          0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-120,-120},
            {120,120}})),                                        Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-120,-120},{120,120}})),
    experiment(StopTime=1000, __Dymola_Algorithm="Dassl"));
end Rev15System_File;

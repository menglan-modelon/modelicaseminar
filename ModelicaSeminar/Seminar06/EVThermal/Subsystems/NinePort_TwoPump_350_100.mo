within ModelicaSeminar.Seminar06.EVThermal.Subsystems;
model NinePort_TwoPump_350_100 "nine port subsystems with 350W and 100W pumps"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.NinePort_4s_5r;

  .LiquidCooling.Volumes.LiquidMultiPort return_manifold(redeclare package
      Medium = Medium,
    T_start=T_start,   N=5)
    annotation (Placement(transformation(extent={{-120.0,-50.0},{-100.0,-30.0}},rotation = 0.0,origin = {0.0,0.0})));
  .LiquidCooling.Volumes.LiquidMultiPort supply_manifold(redeclare package
      Medium = Medium,
    T_start=T_start,   N=5)
    annotation (Placement(transformation(extent={{90,-50},{110,-30}})));
  .LiquidCooling.Volumes.ExpansionVolume expansionVolume(redeclare package
      Medium = Medium,
    T_start=T_start,   N=2)
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  .LiquidCooling.FlowResistances.Generic.LiquidResistance flowResistance(
      redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-88,-50},{-68,-30}})));
  replaceable .ModelicaSeminar.Seminar06.EVThermal.Components.Pumps.Pump_350 pump
                                            constrainedby
    .LiquidCooling.Pumps.Pump(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));
  .LiquidCooling.Sensors.LiquidVolumeflowSensor liquidVolumeflowSensor(
      redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{16,-50},{36,-30}})));
  replaceable .ModelicaSeminar.Seminar06.EVThermal.Components.Pumps.Pump_100 pump1
    constrainedby .LiquidCooling.Pumps.Pump(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={150,-40})));
  .ModelicaSeminar.Seminar06.EVThermal.Sensors.LiquidTemperatureSensor_degC temperatureSensor_T2(redeclare package
      Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-20,60})));
  .ModelicaSeminar.Seminar06.EVThermal.Sensors.LiquidTemperatureSensor_degC temperatureSensor_T3(redeclare package
      Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-50,60})));
  .ModelicaSeminar.Seminar06.EVThermal.Sensors.LiquidTemperatureSensor_degC temperatureSensor_T4(redeclare package
      Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,60})));
  .ModelicaSeminar.Seminar06.EVThermal.Sensors.LiquidTemperatureSensor_degC temperatureSensor_T1(redeclare package
      Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-140,60})));
  .ModelicaSeminar.Seminar06.EVThermal.Components.Valves.DiverterValve DV4(redeclare package Medium = Medium, T_start=
        T_start)
    annotation (Placement(transformation(extent={{-70,20},{-90,40}})));
  .ModelicaSeminar.Seminar06.EVThermal.Components.Valves.DiverterValve DV3(redeclare package Medium = Medium, T_start=
        T_start)
    annotation (Placement(transformation(extent={{-114,20},{-134,40}})));
  .LiquidCooling.SplitsAndJoins.Generic.Join join(redeclare package Medium =
        Medium, T_start=T_start)
    annotation (Placement(transformation(extent={{-130,-70},{-150,-50}})));
  .ModelicaSeminar.Seminar06.EVThermal.Components.Valves.DiverterValve DV2(redeclare package Medium = Medium, T_start=
        T_start)
    annotation (Placement(transformation(extent={{-150,20},{-170,40}})));
  .LiquidCooling.Volumes.ExpansionVolume expansionVolume1(redeclare package
      Medium = Medium,
    T_start=T_start,   N=2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={118,-70})));
  .ModelicaSeminar.Seminar06.EVThermal.Components.Valves.DiverterValve DV1(redeclare package Medium = Medium, T_start=
        T_start)
    annotation (Placement(transformation(extent={{150,-10},{130,10}})));
  .LiquidCooling.SplitsAndJoins.Generic.Join join1(redeclare package Medium =
        Medium, T_start=T_start)                  annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={80,70})));
  .ModelicaSeminar.Seminar06.EVThermal.Sensors.LiquidTemperatureSensor_degC temperatureSensor_T5(redeclare package
      Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={170,0})));
  .ModelicaSeminar.Seminar06.EVThermal.Components.Valves.ProportionalValveA PV1(redeclare package Medium =
        Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,-10})));
  .ModelicaSeminar.Seminar06.EVThermal.Components.Valves.ProportionalValveA PV2(redeclare package Medium =
        Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,10})));
  .LiquidCooling.SplitsAndJoins.Generic.Join join2(redeclare package Medium =
        Medium, T_start=T_start)                  annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={160,70})));
  .ModelicaSeminar.Seminar06.EVThermal.Components.Valves.ProportionalValveA PV3(redeclare package Medium =
        Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={90,-10})));
  .ModelicaSeminar.Seminar06.EVThermal.Components.Valves.ProportionalValveA PV4(redeclare package Medium =
        Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={110,10})));
  .Modelica.Mechanics.Rotational.Sources.Speed speed annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-10})));
  .Modelica.Blocks.Math.Gain gain(k=.Modelica.Constants.pi/30)
                                                            annotation (
      Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={0,14})));
  .Modelica.Mechanics.Rotational.Sources.Speed speed1
                                                    annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={160,-70})));
  .Modelica.Blocks.Math.Gain gain1(k=.Modelica.Constants.pi/30)
                                                             annotation (
      Placement(transformation(
        extent={{4,-4},{-4,4}},
        rotation=0,
        origin={168,-90})));
  .Modelica.Blocks.Sources.RealExpression Vflow_pump_lpm(y=pump.summary.V_flow*60e3)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,66})));
  .Modelica.Blocks.Sources.RealExpression T1(y=supply_manifold.summary.T -
        273.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={34,66})));
equation
  connect(return_manifold.port[1], flowResistance.portA) annotation (Line(
        points={{-110,-40},{-86,-40}}, color={0,0,255}));
  connect(flowResistance.portB, expansionVolume.portA[1]) annotation (Line(
        points={{-70,-40},{-60,-40},{-60,-39.5},{-50,-39.5}}, color={0,0,255}));
  connect(expansionVolume.portA[2], pump.portA) annotation (Line(points={{-50,
          -38.5},{-36,-38.5},{-36,-40},{-10,-40}}, color={0,0,255}));
  connect(pump.portB, liquidVolumeflowSensor.portA)
    annotation (Line(points={{10.2,-40},{16,-40}}, color={0,0,255}));
  connect(liquidVolumeflowSensor.portB, supply_manifold.port[1]) annotation (
      Line(points={{36,-40},{68,-40},{68,-40.8},{100,-40.8}}, color={0,0,255}));
  connect(port1, return_manifold.port[2]) annotation (Line(points={{-40,100},{-40,0},{-124,0},{-124,-40},{-110,-40}}, color={0,0,255}));
  connect(port1, temperatureSensor_T2.port)
    annotation (Line(points={{-40,100},{-40,60},{-30,60}}, color={0,0,255}));
  connect(temperatureSensor_T2.y, controlBus.T2) annotation (Line(points={{-20,70},
          {-20,80},{0,80},{0,100}},     color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(temperatureSensor_T3.port, port2)
    annotation (Line(points={{-60,60},{-70,60},{-70,100}}, color={0,0,255}));
  connect(temperatureSensor_T3.y, controlBus.T3) annotation (Line(points={{-50,70},
          {-50,80},{0,80},{0,100}},     color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(temperatureSensor_T4.port, port4) annotation (Line(points={{-120,60},
          {-130,60},{-130,100}}, color={0,0,255}));
  connect(temperatureSensor_T4.y, controlBus.T4) annotation (Line(points={{-110,70},
          {-110,80},{0,80},{0,100}},     color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(temperatureSensor_T1.port, port5) annotation (Line(points={{-150,60},
          {-160,60},{-160,100}}, color={0,0,255}));
  connect(temperatureSensor_T1.y, controlBus.T5) annotation (Line(points={{-140,70},
          {-140,80},{0,80},{0,100}},     color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(DV4.u_main, controlBus.DV4_main) annotation (Line(points={{-80.1,40.1},
          {-80.1,50},{0,50},{0,100}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(DV3.u_main, controlBus.DV3_main) annotation (Line(points={{-124.1,40.1},
          {-124.1,50},{0,50},{0,100}},       color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(DV2.u_main, controlBus.DV2_main) annotation (Line(points={{-160.1,40.1},
          {-160.1,50},{0,50},{0,100}},       color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(join.portC, expansionVolume1.portA[1]) annotation (Line(points={{-130,
          -60},{118,-60},{118,-60.5}}, color={0,0,255}));
  connect(expansionVolume1.portA[2], pump1.portA) annotation (Line(points={{118,
          -61.5},{118,-60},{150,-60},{150,-50}}, color={0,0,255}));
  connect(join1.portC, portC)
    annotation (Line(points={{80,80},{80,100}}, color={0,0,255}));
  connect(DV1.u_main, controlBus.DV1_main) annotation (Line(points={{139.9,10.1},
          {139.9,50},{0,50},{0,100}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(temperatureSensor_T5.port, pump1.portB)
    annotation (Line(points={{160,0},{160,-29.8},{150,-29.8}}, color={0,0,255}));
  connect(temperatureSensor_T5.y, controlBus.T6) annotation (Line(points={{170,10},
          {170,50},{0,50},{0,100}},     color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(PV1.portB, portD)
    annotation (Line(points={{40,0},{40,100}}, color={0,0,255}));
  connect(PV1.portA, supply_manifold.port[2]) annotation (Line(points={{40,-20},{40,-30},{110,-30},{110,-40.4},{100,-40.4}}, color={0,0,255}));
  connect(PV1.opening, controlBus.PV1_opening) annotation (Line(points={{30,-10},
          {20,-10},{20,50},{0,50},{0,100}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(PV2.portB, join1.portA) annotation (Line(points={{60,20},{60,56},{80,
          56},{80,60}}, color={0,0,255}));
  connect(PV2.portA, supply_manifold.port[3]) annotation (Line(points={{60,0},{60,-24},{110,-24},{110,-40},{100,-40}}, color={0,0,255}));
  connect(PV2.opening, controlBus.PV2_opening) annotation (Line(points={{50,10},
          {46,10},{46,50},{0,50},{0,100}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(join2.portC, portA)
    annotation (Line(points={{160,80},{160,100}}, color={0,0,255}));
  connect(PV3.portB, portB) annotation (Line(points={{90,0},{90,32},{120,32},{
          120,100}}, color={0,0,255}));
  connect(PV3.portA, supply_manifold.port[4]) annotation (Line(points={{90,-20},{110,-20},{110,-39.6},{100,-39.6}}, color={0,0,255}));
  connect(PV3.opening, controlBus.PV3_opening) annotation (Line(points={{80,-10},
          {76,-10},{76,50},{0,50},{0,100}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(PV4.portA, supply_manifold.port[5]) annotation (Line(points={{110,0},
          {110,-39.2},{100,-39.2}}, color={0,0,255}));
  connect(PV4.portB, join2.portB) annotation (Line(points={{110,20},{110,64},{
          146,64},{146,70},{150,70}}, color={0,0,255}));
  connect(PV4.opening, controlBus.PV4_opening) annotation (Line(points={{100,10},
          {96,10},{96,50},{0,50},{0,100}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(speed.flange, pump.shaft) annotation (Line(points={{-1.77636e-15,-20},
          {-1.77636e-15,-24},{0,-24},{0,-31}}, color={0,0,0}));
  connect(speed1.flange, pump1.shaft) annotation (Line(points={{160,-60},{160,
          -50},{160,-40},{159,-40}}, color={0,0,0}));
  connect(gain1.y, speed1.w_ref) annotation (Line(points={{163.6,-90},{160,-90},
          {160,-82}}, color={0,0,127}));
  connect(gain1.u, controlBus.pump1_RPM) annotation (Line(points={{172.8,-90},{178,
          -90},{178,50},{0,50},{0,100}},     color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(gain.y, speed.w_ref)
    annotation (Line(points={{0,9.6},{0,2}}, color={0,0,127}));
  connect(Vflow_pump_lpm.y, controlBus.Vflow_pump_lpm) annotation (Line(points={
          {20,77},{20,80},{0,80},{0,100}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(T1.y, controlBus.T1) annotation (Line(points={{34,77},{34,80},{0,80},
          {0,100}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
    connect(gain.u,controlBus.pump_RPM) annotation(Line(points = {{1.0658141036401504e-15,18.8},{0,100}},color = {0,0,127}));
    connect(DV2.portC,join.portA) annotation(Line(points = {{-170,34},{-176,34},{-176,-60},{-150.0225186909131,-60}},color = {0,0,255}));
    connect(DV2.portA,port5) annotation(Line(points = {{-150,30},{-150,46},{-156,46},{-156,100},{-160,100}},color = {0,0,255}));
    connect(DV3.portC,join.portB) annotation(Line(points = {{-134,34},{-140,34},{-140,-43.54453209469949},{-139.8248200364229,-43.54453209469949},{-139.8248200364229,-49.54453209469949}},color = {0,0,255}));
    connect(DV3.portA,port4) annotation(Line(points = {{-114,30},{-114,46},{-130,46},{-130,100}},color = {0,0,255}));
    connect(DV4.portC,port3) annotation(Line(points = {{-90,34},{-100,34},{-100,100}},color = {0,0,255}));
    connect(DV4.portA,port2) annotation(Line(points = {{-70,30},{-70,100}},color = {0,0,255}));
    connect(DV2.portB,return_manifold.port[3]) annotation(Line(points = {{-170,26},{-170,-34},{-110,-34},{-110,-40}},color = {0,0,255}));
    connect(DV3.portB,return_manifold.port[4]) annotation(Line(points = {{-134,26},{-134,-34},{-110,-34},{-110,-40}},color = {0,0,255}));
    connect(DV4.portB,return_manifold.port[5]) annotation(Line(points = {{-90,26},{-90,10},{-128,10},{-128,-40},{-110,-40}},color = {0,0,255}));
    connect(DV1.portA,pump1.portB) annotation(Line(points = {{150,0},{150,-29.799999999999997}},color = {0,0,255}));
    connect(temperatureSensor_T5.port,DV1.portA) annotation(Line(points = {{160,0},{150,0}},color = {0,0,255}));
    connect(DV1.portC,join2.portA) annotation(Line(points = {{130,4},{130,34},{160,34},{160,59.97748130908691}},color = {0,0,255}));
    connect(DV1.portB,join1.portB) annotation(Line(points = {{130,-4},{126,-4},{126,70.17517996357712},{90.45546790530051,70.17517996357712}},color = {0,0,255}));
end NinePort_TwoPump_350_100;

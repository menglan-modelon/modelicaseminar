within ModelicaSeminar.Seminar06.EVThermal.Subsystems.UnitTests;

model NinePortSubsystem
  extends .LiquidCooling.Experiments.Templates.ExperimentBase(redeclare package
      Liquid = .LiquidCooling.Media.AqueousSolutions.EthyleneGlycolWater50);
  .EVThermal.Subsystems.NinePort_TwoPump_350_100 flow_routing(redeclare package Medium =
        Liquid)
    annotation (Placement(transformation(extent={{-38,-40},{38,0}})));
  .LiquidCooling.Sensors.MultiDisplaySensor multiDisplaySensor(redeclare package
      Medium = Liquid)
    annotation (Placement(transformation(extent={{10,14},{-10,34}})));
  .LiquidCooling.Sensors.MultiDisplaySensor multiDisplaySensor1(redeclare
      package Medium = Liquid)
    annotation (Placement(transformation(extent={{20,34},{0,54}})));
  .LiquidCooling.Sensors.MultiDisplaySensor multiDisplaySensor2(redeclare
      package Medium = Liquid)
    annotation (Placement(transformation(extent={{10,54},{-10,74}})));
  .LiquidCooling.SplitsAndJoins.Generic.Join join(redeclare package Medium =
        Liquid) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-46,40})));
  .LiquidCooling.Sensors.MultiDisplaySensor multiDisplaySensor3(redeclare
      package Medium = Liquid)
    annotation (Placement(transformation(extent={{30,74},{10,94}})));
  .LiquidCooling.Sensors.MultiDisplaySensor multiDisplaySensor4(redeclare
      package Medium = Liquid) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-50,18})));
  .EVThermal.Controllers.ParameterController controller
    annotation (Placement(transformation(extent={{96,-10},{56,30}})));
equation
  connect(flow_routing.portD, multiDisplaySensor.portA) annotation (Line(points=
         {{8.44444,0},{8.44444,20},{5,20}}, color={0,0,255}));
  connect(multiDisplaySensor.portB, flow_routing.port1) annotation (Line(points=
         {{-5,20},{-8.44444,20},{-8.44444,0}}, color={0,0,255}));
  connect(flow_routing.portC, multiDisplaySensor1.portA) annotation (Line(
        points={{16.8889,0},{16.8889,40},{15,40}}, color={0,0,255}));
  connect(multiDisplaySensor1.portB, flow_routing.port2) annotation (Line(
        points={{5,40},{-14.7778,40},{-14.7778,0}}, color={0,0,255}));
  connect(flow_routing.portB, multiDisplaySensor2.portA) annotation (Line(
        points={{25.3333,0},{25.3333,60},{5,60}}, color={0,0,255}));
  connect(multiDisplaySensor2.portB, join.portA)
    annotation (Line(points={{-5,60},{-46,60},{-46,50}}, color={0,0,255}));
  connect(flow_routing.port3, join.portB) annotation (Line(points={{-21.1111,0},
          {-20,0},{-20,40},{-36,40}}, color={0,0,255}));
  connect(flow_routing.portA, multiDisplaySensor3.portA) annotation (Line(
        points={{33.7778,0},{33.7778,80},{25,80}}, color={0,0,255}));
  connect(join.portC, multiDisplaySensor4.portA)
    annotation (Line(points={{-46,30},{-46,23}}, color={0,0,255}));
  connect(multiDisplaySensor4.portB, flow_routing.port5) annotation (Line(
        points={{-46,13},{-46,8},{-34,8},{-34,0},{-33.7778,0}}, color={0,0,255}));
  connect(multiDisplaySensor3.portB, flow_routing.port4) annotation (Line(
        points={{15,80},{-27.4444,80},{-27.4444,0}}, color={0,0,255}));
  connect(controller.controlBus, flow_routing.controlBus) annotation (Line(
      points={{56,10},{0,10},{0,0}},
      color={255,204,51},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end NinePortSubsystem;

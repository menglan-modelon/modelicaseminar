within ModelicaSeminar.Seminar06.EVThermal.Controllers;
model ScenarioController_File
  extends .Modelon.Icons.InitData;
  .ModelicaSeminar.Seminar06.EVThermal.Interfaces.ControlBus     controlBus annotation (Placement(transformation(extent={{-20,-20},
            {20,20}},
        rotation=270,
        origin={100,0}),
                    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={100,0})));
  .Modelica.Blocks.Sources.CombiTimeTable Q_PTC_battery(
    tableOnFile=true,
    tableName="Q_PTC_battery",
    fileName=fileName)
    annotation (Placement(transformation(extent={{40,70},{60,90}})));
  parameter String fileName=.Modelica.Utilities.Files.loadResource("modelica://ModelicaSeminar/Resources/Data/Cooling1.txt") "File where matrix is stored";
  .Modelica.Blocks.Sources.CombiTimeTable Q_PTC_cabin(
    tableOnFile=true,
    tableName="Q_PTC_cabin",
    fileName=fileName)
    annotation (Placement(transformation(extent={{40,40},{60,60}})));
  .Modelica.Blocks.Sources.CombiTimeTable Q_cabin(
    tableOnFile=true,
    tableName="Q_cabin",
    fileName=fileName)
    annotation (Placement(transformation(extent={{20,20},{40,40}})));
  .Modelica.Blocks.Sources.CombiTimeTable Q_charger(
    tableOnFile=true,
    tableName="Q_charger",
    fileName=fileName)
    annotation (Placement(transformation(extent={{40,-20},{60,0}})));
  .Modelica.Blocks.Sources.CombiTimeTable Q_DCDCconverter(
    tableOnFile=true,
    tableName="Q_DCDCconverter",
    fileName=fileName)
    annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
  .Modelica.Blocks.Sources.CombiTimeTable Q_inverter(
    tableOnFile=true,
    tableName="Q_inverter",
    fileName=fileName)
    annotation (Placement(transformation(extent={{40,-60},{60,-40}})));
  .Modelica.Blocks.Sources.CombiTimeTable Q_motor(
    tableOnFile=true,
    tableName="Q_motor",
    fileName=fileName)
    annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
  .Modelica.Blocks.Sources.CombiTimeTable Q_chiller(
    tableOnFile=true,
    tableName="Q_chiller",
    fileName=fileName)
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  .Modelica.Blocks.Sources.CombiTimeTable Q_battery(
    tableOnFile=true,
    tableName="Q_battery",
    fileName=fileName)
    annotation (Placement(transformation(extent={{40,-100},{60,-80}})));
equation
  connect(Q_PTC_battery.y[1], controlBus.Q_PTC_battery) annotation (Line(points={{61,80},
          {100,80},{100,0}},         color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(Q_PTC_cabin.y[1], controlBus.Q_PTC_cabin) annotation (Line(points={{61,
          50},{100,50},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(Q_cabin.y[1], controlBus.Q_cabin) annotation (Line(points={{41,30},{100,
          30},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(Q_charger.y[1], controlBus.Q_charger) annotation (Line(points={{61,-10},
          {100,-10},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(Q_DCDCconverter.y[1], controlBus.Q_DCDCconverter) annotation (Line(
        points={{41,-30},{100,-30},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(Q_inverter.y[1], controlBus.Q_inverter) annotation (Line(points={{61,-50},
          {100,-50},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(Q_motor.y[1], controlBus.Q_motor) annotation (Line(points={{41,-70},{100,
          -70},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(Q_chiller.y[1], controlBus.Q_chiller) annotation (Line(points={{-39,10},
          {100,10},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(Q_battery.y[1], controlBus.Q_battery) annotation (Line(points={{61,-90},
          {100,-90},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ScenarioController_File;

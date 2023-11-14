within ModelicaSeminar.Seminar06.EVThermal.Controllers;
model Controller_File "controller from file"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.Controller;
  parameter String fileName=.Modelica.Utilities.Files.loadResource("modelica://ModelicaSeminarResources/Data/Controls1.txt") "file with controls inputs";

  .Modelica.Blocks.Routing.RealPassThrough pump_RPM_set    annotation (Placement(transformation(extent={{60,86},{68,94}})));
  .Modelica.Blocks.Routing.RealPassThrough pump1_RPM_set    annotation (Placement(transformation(extent={{60,72},{68,80}})));
  .Modelica.Blocks.Routing.RealPassThrough DV1_set    annotation (Placement(transformation(extent={{60,56},{68,64}})));
  .Modelica.Blocks.Routing.RealPassThrough DV2_set    annotation (Placement(transformation(extent={{60,40},{68,48}})));
  .Modelica.Blocks.Routing.RealPassThrough DV3_set    annotation (Placement(transformation(extent={{60,26},{68,34}})));
  .Modelica.Blocks.Routing.RealPassThrough DV4_set    annotation (Placement(transformation(extent={{60,12},{68,20}})));
  .Modelica.Blocks.Routing.RealPassThrough PV1_set    annotation (Placement(transformation(extent={{60,-24},{68,-16}})));
  .Modelica.Blocks.Routing.RealPassThrough PV2_set    annotation (Placement(transformation(extent={{60,-40},{68,-32}})));
  .Modelica.Blocks.Routing.RealPassThrough PV3_set    annotation (Placement(transformation(extent={{60,-54},{68,-46}})));
  .Modelica.Blocks.Routing.RealPassThrough PV4_set    annotation (Placement(transformation(extent={{60,-68},{68,-60}})));
  .Modelica.Blocks.Sources.CombiTimeTable pump_RPM(
    tableOnFile=true,
    tableName="pump_RPM",
    fileName=fileName)    annotation (Placement(transformation(extent={{20,80},{40,100}})));
  .Modelica.Blocks.Sources.CombiTimeTable pump1_RPM(
    tableOnFile=true,
    tableName="pump1_RPM",
    fileName=fileName)    annotation (Placement(transformation(extent={{-6,66},{14,86}})));
  .Modelica.Blocks.Sources.CombiTimeTable DV1_main(
    tableOnFile=true,
    tableName="DV1_main",
    fileName=fileName)
    annotation (Placement(transformation(extent={{20,50},{40,70}})));
  .Modelica.Blocks.Sources.CombiTimeTable DV2_main(
    tableOnFile=true,
    tableName="DV2_main",
    fileName=fileName)
    annotation (Placement(transformation(extent={{-6,34},{14,54}})));
  .Modelica.Blocks.Sources.CombiTimeTable DV3_main(
    tableOnFile=true,
    tableName="DV3_main",
    fileName=fileName)
    annotation (Placement(transformation(extent={{20,20},{40,40}})));
  .Modelica.Blocks.Sources.CombiTimeTable DV4_main(
    tableOnFile=true,
    tableName="DV4_main",
    fileName=fileName)
    annotation (Placement(transformation(extent={{-6,6},{14,26}})));
  .Modelica.Blocks.Sources.CombiTimeTable PV1_opening(
    tableOnFile=true,
    tableName="PV1_opening",
    fileName=fileName)
    annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  .Modelica.Blocks.Sources.CombiTimeTable PV2_opening(
    tableOnFile=true,
    tableName="PV2_opening",
    fileName=fileName)
    annotation (Placement(transformation(extent={{-6,-46},{14,-26}})));
  .Modelica.Blocks.Sources.CombiTimeTable PV3_opening(
    tableOnFile=true,
    tableName="PV3_opening",
    fileName=fileName)
    annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  .Modelica.Blocks.Sources.CombiTimeTable PV4_opening(
    tableOnFile=true,
    tableName="PV4_opening",
    fileName=fileName)
    annotation (Placement(transformation(extent={{-6,-74},{14,-54}})));
equation
  connect(pump_RPM_set.y, controlBus.pump_RPM) annotation (Line(points={{68.4,90},
          {100,90},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(pump1_RPM_set.y, controlBus.pump1_RPM) annotation (Line(points={{68.4,
          76},{100,76},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(DV1_set.y, controlBus.DV1_main) annotation (Line(points={{68.4,60},{100,
          60},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(DV2_set.y, controlBus.DV2_main) annotation (Line(points={{68.4,44},{100,
          44},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(DV3_set.y, controlBus.DV3_main) annotation (Line(points={{68.4,30},{100,
          30},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(DV4_set.y, controlBus.DV4_main) annotation (Line(points={{68.4,16},{100,
          16},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PV1_set.y, controlBus.PV1_opening) annotation (Line(points={{68.4,-20},
          {100,-20},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PV2_set.y, controlBus.PV2_opening) annotation (Line(points={{68.4,-36},
          {100,-36},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PV3_set.y, controlBus.PV3_opening) annotation (Line(points={{68.4,-50},
          {100,-50},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PV4_set.y, controlBus.PV4_opening) annotation (Line(points={{68.4,-64},
          {100,-64},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(pump_RPM.y[1], pump_RPM_set.u)    annotation (Line(points={{41,90},{59.2,90}}, color={0,0,127}));
  connect(pump1_RPM.y[1], pump1_RPM_set.u)    annotation (Line(points={{15,76},{59.2,76}}, color={0,0,127}));
  connect(DV1_main.y[1], DV1_set.u)    annotation (Line(points={{41,60},{59.2,60}}, color={0,0,127}));
  connect(DV2_main.y[1], DV2_set.u) annotation (Line(points={{15,44},{36,44},{
          36,44},{59.2,44}}, color={0,0,127}));
  connect(DV3_main.y[1], DV3_set.u)    annotation (Line(points={{41,30},{59.2,30}}, color={0,0,127}));
  connect(DV4_main.y[1], DV4_set.u)    annotation (Line(points={{15,16},{59.2,16}}, color={0,0,127}));
  connect(PV1_opening.y[1], PV1_set.u)    annotation (Line(points={{41,-20},{59.2,-20}}, color={0,0,127}));
  connect(PV2_opening.y[1], PV2_set.u)    annotation (Line(points={{15,-36},{59.2,-36}}, color={0,0,127}));
  connect(PV3_opening.y[1], PV3_set.u)    annotation (Line(points={{41,-50},{59.2,-50}}, color={0,0,127}));
  connect(PV4_opening.y[1], PV4_set.u)    annotation (Line(points={{15,-64},{59.2,-64}}, color={0,0,127}));
end Controller_File;

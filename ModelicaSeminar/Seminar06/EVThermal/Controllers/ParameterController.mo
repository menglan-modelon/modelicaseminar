within ModelicaSeminar.Seminar06.EVThermal.Controllers;
model ParameterController
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.Controller;
  parameter .Modelica.Units.NonSI.AngularVelocity_rpm pump_RPM=3000 "pump speed in RPM";
  parameter .Modelica.Units.NonSI.AngularVelocity_rpm pump1_RPM=1000 "pump1 speed in RPM";
  parameter Real DV1_main=1 "DV1 main setting";
  parameter Real DV2_main=1 "DV2 main setting";
  parameter Real DV3_main=1 "DV3 main setting";
  parameter Real DV4_main=1 "DV4 main setting";
  parameter Real PV1=1                      "PV1 setting";
  parameter Real PV2=1 "PV2 setting";
  parameter Real PV3=1 "PV3 setting";
  parameter Real PV4=1 "PV4 setting";
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
  .Modelica.Blocks.Sources.RealExpression realExpression(y=pump_RPM)    annotation (Placement(transformation(extent={{20,80},{40,100}})));
  .Modelica.Blocks.Sources.RealExpression realExpression1(y=pump1_RPM)    annotation (Placement(transformation(extent={{20,66},{40,86}})));
  .Modelica.Blocks.Sources.RealExpression realExpression2(y=DV1_main)    annotation (Placement(transformation(extent={{20,50},{40,70}})));
  .Modelica.Blocks.Sources.RealExpression realExpression3(y=DV2_main)    annotation (Placement(transformation(extent={{20,34},{40,54}})));
  .Modelica.Blocks.Sources.RealExpression realExpression4(y=DV3_main)    annotation (Placement(transformation(extent={{20,20},{40,40}})));
  .Modelica.Blocks.Sources.RealExpression realExpression5(y=DV4_main)    annotation (Placement(transformation(extent={{20,6},{40,26}})));
  .Modelica.Blocks.Sources.RealExpression realExpression6(y=PV1)    annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  .Modelica.Blocks.Sources.RealExpression realExpression7(y=PV2)    annotation (Placement(transformation(extent={{20,-46},{40,-26}})));
  .Modelica.Blocks.Sources.RealExpression realExpression8(y=PV3)    annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  .Modelica.Blocks.Sources.RealExpression realExpression9(y=PV4)    annotation (Placement(transformation(extent={{20,-74},{40,-54}})));
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
  connect(realExpression.y, pump_RPM_set.u)    annotation (Line(points={{41,90},{59.2,90}}, color={0,0,127}));
  connect(realExpression1.y, pump1_RPM_set.u)    annotation (Line(points={{41,76},{59.2,76}}, color={0,0,127}));
  connect(realExpression2.y, DV1_set.u)    annotation (Line(points={{41,60},{59.2,60}}, color={0,0,127}));
  connect(realExpression3.y, DV2_set.u)    annotation (Line(points={{41,44},{59.2,44}}, color={0,0,127}));
  connect(realExpression4.y, DV3_set.u)    annotation (Line(points={{41,30},{59.2,30}}, color={0,0,127}));
  connect(realExpression5.y, DV4_set.u)    annotation (Line(points={{41,16},{59.2,16}}, color={0,0,127}));
  connect(realExpression6.y, PV1_set.u)    annotation (Line(points={{41,-20},{59.2,-20}}, color={0,0,127}));
  connect(realExpression7.y, PV2_set.u)    annotation (Line(points={{41,-36},{59.2,-36}}, color={0,0,127}));
  connect(realExpression8.y, PV3_set.u)    annotation (Line(points={{41,-50},{59.2,-50}}, color={0,0,127}));
  connect(realExpression9.y, PV4_set.u)    annotation (Line(points={{41,-64},{59.2,-64}}, color={0,0,127}));
end ParameterController;

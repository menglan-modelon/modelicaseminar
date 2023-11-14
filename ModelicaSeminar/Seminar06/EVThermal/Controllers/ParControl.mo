within ModelicaSeminar.Seminar06.EVThermal.Controllers;
model ParControl
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.Controller;
  parameter .Modelica.Units.NonSI.AngularVelocity_rpm pumpBat_RPM=3000 "pump speed in RPM";
  parameter .Modelica.Units.NonSI.AngularVelocity_rpm pumpCab_RPM=1000 "pump1 speed in RPM";
  parameter Real ValveA=1 "DV1 main setting";
  parameter Real ValveB=0.5 "DV2 main setting";
  parameter Real ValveC1=1 "DV3 main setting";
  parameter Real ValveC2=1 "DV4 main setting";
  parameter Real ValveC3=1                      "PV1 setting";

  .Modelica.Blocks.Routing.RealPassThrough pumpBat_RPM_set    annotation (Placement(transformation(extent={{60,86},{68,94}})));
  .Modelica.Blocks.Routing.RealPassThrough pumpCab_RPM_set    annotation (Placement(transformation(extent={{60.0,-8.0},{68.0,0.0}},rotation = 0.0,origin = {0.0,0.0})));
  .Modelica.Blocks.Routing.RealPassThrough ValveA_set    annotation (Placement(transformation(extent={{60,56},{68,64}})));
  .Modelica.Blocks.Routing.RealPassThrough ValveB1_set    annotation (Placement(transformation(extent={{60,-24},{68,-16}})));
  .Modelica.Blocks.Routing.RealPassThrough ValveC1_set    annotation (Placement(transformation(extent={{60,-40},{68,-32}})));
  .Modelica.Blocks.Routing.RealPassThrough ValveC2_set    annotation (Placement(transformation(extent={{60,-54},{68,-46}})));
  .Modelica.Blocks.Routing.RealPassThrough ValveC3_set    annotation (Placement(transformation(extent={{60,-68},{68,-60}})));

  .Modelica.Blocks.Sources.RealExpression realExpression(y=pumpBat_RPM)    annotation (Placement(transformation(extent={{20,80},{40,100}})));
  .Modelica.Blocks.Sources.RealExpression realExpression1(y=pumpCab_RPM)    annotation (Placement(transformation(extent={{20.0,-14.0},{40.0,6.0}},rotation = 0.0,origin = {0.0,0.0})));
  .Modelica.Blocks.Sources.RealExpression realExpression2(y=ValveA)    annotation (Placement(transformation(extent={{20,50},{40,70}})));
  .Modelica.Blocks.Sources.RealExpression realExpression6(y=ValveB)    annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  .Modelica.Blocks.Sources.RealExpression realExpression7(y=ValveC1)    annotation (Placement(transformation(extent={{20,-46},{40,-26}})));
  .Modelica.Blocks.Sources.RealExpression realExpression8(y=ValveC2)    annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  .Modelica.Blocks.Sources.RealExpression realExpression9(y=ValveC3)    annotation (Placement(transformation(extent={{20,-74},{40,-54}})));
equation
    connect(realExpression.y,pumpBat_RPM_set.u) annotation(Line(points = {{41,90},{59.2,90}},color = {0,0,127}));
    connect(pumpCab_RPM_set.y,controlBus.pumpCab_RPM) annotation(Line(points = {{68.4,-4},{100,-4},{100,0}},color = {0,0,127}));
    connect(realExpression1.y,pumpCab_RPM_set.u) annotation(Line(points = {{41,-4},{59.2,-4}},color = {0,0,127}));
    connect(ValveA_set.y,controlBus.ValveA) annotation(Line(points = {{68.4,60},{100,60},{100,0}},color = {0,0,127}));
    connect(realExpression2.y,ValveA_set.u) annotation(Line(points = {{41,60},{59.2,60}},color = {0,0,127}));
    connect(ValveB1_set.y,controlBus.ValveB) annotation(Line(points = {{68.4,-20},{100,-20},{100,0}},color = {0,0,127}));
    connect(realExpression6.y,ValveB1_set.u) annotation(Line(points = {{41,-20},{59.2,-20}},color = {0,0,127}));
    connect(ValveC1_set.y,controlBus.ValveC1) annotation(Line(points = {{68.4,-36},{100,-36},{100,0}},color = {0,0,127}));
    connect(realExpression7.y,ValveC1_set.u) annotation(Line(points = {{41,-36},{59.2,-36}},color = {0,0,127}));
    connect(ValveC2_set.y,controlBus.ValveC2) annotation(Line(points = {{68.4,-50},{100,-50},{100,0}},color = {0,0,127}));
    connect(realExpression8.y,ValveC2_set.u) annotation(Line(points = {{41,-50},{59.2,-50}},color = {0,0,127}));
    connect(ValveC3_set.y,controlBus.ValveC3) annotation(Line(points = {{68.4,-64},{100,-64},{100,0}},color = {0,0,127}));
    connect(realExpression9.y,ValveC3_set.u) annotation(Line(points = {{41,-64},{59.2,-64}},color = {0,0,127}));
    connect(pumpBat_RPM_set.y,controlBus.pumpBat_RPM) annotation(Line(points = {{68.4,90},{100,90},{100,0}},color = {0,0,127}));
end ParControl;

within ModelicaSeminar.Seminar03;
model Laudry1_CosineVar2
  import      Modelica.Units.SI;  // MSL 4.0.0
  parameter .Modelica.Units.SI.Mass m = 30;
  .Modelica.Mechanics.Translational.Components.Fixed fixed annotation (
    Placement(visible = true, transformation(origin = {60, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .Modelica.Mechanics.Translational.Components.SpringDamper springDamper4(c = 1e6, d = 1e4) annotation (
    Placement(visible = true, transformation(origin = {60, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  .Modelica.Mechanics.Translational.Components.SpringDamper springDamper3(c = 8000, d = 1000) annotation (
    Placement(visible = true, transformation(origin = {60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  .Modelica.Mechanics.Translational.Components.SpringDamper springDamper2(c = 4000, d = 3000) annotation (
    Placement(visible = true, transformation(origin = {40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  .Modelica.Mechanics.Translational.Components.Spring spring1(c = 3000) annotation (
    Placement(visible = true, transformation(origin = {78, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  .Modelica.Mechanics.Translational.Components.Fixed outerCase annotation (
    Placement(visible = true, transformation(origin = {60, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  .Modelica.Mechanics.Translational.Sources.Force force annotation (
    Placement(visible = true, transformation(origin = {32, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .ModelicaSeminar.Seminar03.Components.CosineVar2 cosineVar2 annotation (
    Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .ModelicaSeminar.Seminar03.Components.MassVar massVar(m0 = 0) annotation (
    Placement(visible = true, transformation(origin = {60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  .Modelica.Blocks.Sources.TimeTable timeMassTable(table = [0, 30; 200, 29; 260, 28; 300, 28]) annotation (
    Placement(visible = true, transformation(origin = {0.0,0.0}, extent = {{-100.0,80.0},{-80.0,100.0}}, rotation = 0.0)));
  .Modelica.Blocks.Sources.TimeTable timeFreqTable(table = [0, 0; 200, 1200; 260, 1200; 300, 0; 400, 0]) annotation (
    Placement(visible = true, transformation(origin = {0.0,0.0}, extent = {{-100.0,50.0},{-80.0,70.0}}, rotation = 0.0)));
  .Modelica.Blocks.Sources.TimeTable timeDMassTable(table = [0, 5; 200, 4; 260, 3; 300, 3]) annotation (
    Placement(visible = true, transformation(origin = {0.0,0.0}, extent = {{-100.0,20.0},{-80.0,40.0}}, rotation = 0.0)));
  .Modelica.Blocks.Math.Gain rpm2freq(k = 1 / 60) annotation (
    Placement(visible = true, transformation(origin = {0.0,0.0}, extent = {{-58.0,52.0},{-42.0,68.0}}, rotation = 0.0)));
equation
  connect(outerCase.flange, springDamper2.flange_b) annotation (
    Line(points = {{60, 80}, {60, 80}, {60, 72}, {40, 72}, {40, 62}, {40, 62}}, color = {0, 127, 0}));
  connect(spring1.flange_b, outerCase.flange) annotation (
    Line(points = {{78, 60}, {78, 72}, {60, 72}, {60, 78}}, color = {0, 127, 0}));
  connect(springDamper3.flange_a, springDamper4.flange_b) annotation (
    Line(points = {{60, -30}, {60, -40}}, color = {0, 127, 0}));
  connect(springDamper4.flange_a, fixed.flange) annotation (
    Line(points = {{60, -60}, {60, -60}, {60, -72}, {60, -72}}, color = {0, 127, 0}));
  connect(cosineVar2.y, force.f) annotation (
    Line(points = {{1, 0}, {20, 0}}, color = {0, 0, 127}));
  connect(massVar.flange_a, springDamper3.flange_b) annotation (
    Line(points = {{60, 0}, {60, -10}}, color = {0, 127, 0}));
  connect(springDamper2.flange_a, massVar.flange_b) annotation (
    Line(points = {{40, 40}, {38, 40}, {38, 32}, {60, 32}, {60, 24}}, color = {0, 127, 0}));
  connect(massVar.flange_b, spring1.flange_a) annotation (
    Line(points = {{60, 20}, {60, 32}, {78, 32}, {78, 40}}, color = {0, 127, 0}));
  connect(force.flange, massVar.flange_a) annotation (
    Line(points = {{42, 0}, {62, 0}}, color = {0, 127, 0}));
  connect(timeMassTable.y, massVar.mass) annotation (
    Line(points = {{-79,90},{20,90},{20,10},{51,10}}, color = {0, 0, 127}));
  connect(timeFreqTable.y, rpm2freq.u) annotation (
    Line(points = {{-79,60},{-61,60}}, color = {0, 0, 127}));
  connect(rpm2freq.y, cosineVar2.freq) annotation (
    Line(points = {{-41.2,60},{-4,60},{-4,10}}, color = {0, 0, 127}));
  connect(timeDMassTable.y, cosineVar2.amp) annotation (
    Line(points = {{-79,30},{-14,30},{-14,10}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(initialScale = 1)),
    uses(Modelica(version = "3.2.3")),
    experiment(StartTime = 0, StopTime = 300, Tolerance = 1e-06, Interval = 0.001));
end Laudry1_CosineVar2;

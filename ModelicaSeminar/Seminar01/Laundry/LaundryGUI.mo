within ModelicaSeminar.Seminar01.Laundry;

model LaundryGUI
    extends Modelica.Icons.Example;
  .Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(visible = true, transformation(origin = {0, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .Modelica.Mechanics.Translational.Components.SpringDamper springDamper4(c = 1e6, d = 1e4) annotation(
    Placement(visible = true, transformation(origin = {0, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  .Modelica.Mechanics.Translational.Components.SpringDamper springDamper3(c = 8000, d = 1000) annotation(
    Placement(visible = true, transformation(origin = {0, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  .Modelica.Mechanics.Translational.Components.Mass mass(m = 30) annotation(
    Placement(visible = true, transformation(origin = {0, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  .Modelica.Mechanics.Translational.Components.SpringDamper springDamper2(c = 4000, d = 3000) annotation(
    Placement(visible = true, transformation(origin = {-20, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  .Modelica.Mechanics.Translational.Components.Spring spring1(c = 3000) annotation(
    Placement(visible = true, transformation(origin = {20, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  .Modelica.Mechanics.Translational.Components.Fixed outerCase annotation(
    Placement(visible = true, transformation(origin = {0, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  .Modelica.Mechanics.Translational.Sources.Force force annotation(
    Placement(visible = true, transformation(origin = {-28, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .Modelica.Blocks.Sources.Cosine cosine(amplitude = 5,f = 20) annotation(
    Placement(visible = true, transformation(origin = {-68, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(outerCase.flange, springDamper2.flange_b) annotation(
    Line(points = {{0, 82}, {0, 82}, {0, 74}, {-20, 74}, {-20, 64}, {-20, 64}}, color = {0, 127, 0}));
  connect(spring1.flange_b, outerCase.flange) annotation(
    Line(points = {{20, 64}, {18, 64}, {18, 74}, {0, 74}, {0, 82}, {0, 82}}, color = {0, 127, 0}));
  connect(springDamper2.flange_a, mass.flange_b) annotation(
    Line(points = {{-20, 44}, {-20, 38}, {0, 38}, {0, 28}}, color = {0, 127, 0}));
  connect(mass.flange_b, spring1.flange_a) annotation(
    Line(points = {{0, 28}, {0, 38}, {20, 38}, {20, 44}}, color = {0, 127, 0}));
  connect(mass.flange_a, springDamper3.flange_b) annotation(
    Line(points = {{0, 8}, {0, -2}}, color = {0, 127, 0}));
  connect(springDamper3.flange_a, springDamper4.flange_b) annotation(
    Line(points = {{0, -22}, {0, -32}}, color = {0, 127, 0}));
  connect(springDamper4.flange_a, fixed.flange) annotation(
    Line(points = {{0, -52}, {0, -52}, {0, -64}, {0, -64}}, color = {0, 127, 0}));
  connect(force.flange, mass.flange_a) annotation(
    Line(points = {{-18, 8}, {0, 8}}, color = {0, 127, 0}));
  connect(cosine.y, force.f) annotation(
    Line(points = {{-56, 8}, {-40, 8}, {-40, 8}, {-40, 8}}, color = {0, 0, 127}));

    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end LaundryGUI;

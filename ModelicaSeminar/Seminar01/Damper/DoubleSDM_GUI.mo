within ModelicaSeminar.Seminar01.Damper;

model DoubleSDM_GUI
    extends Modelica.Icons.Example;
  .Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(visible = true, transformation(origin = {-88, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .Modelica.Mechanics.Translational.Components.SpringDamper springDamper1(c = 1, d = 0, s_rel(fixed = false, start = 1)) annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .Modelica.Mechanics.Translational.Components.SpringDamper springDamper2(c = 1, d = 0, s_rel(fixed = false, start = 0)) annotation(
    Placement(visible = true, transformation(origin = {32, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .Modelica.Mechanics.Translational.Components.Mass mass2(m = 1, s(fixed = true, start = 1)) annotation(
    Placement(visible = true, transformation(origin = {74, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .Modelica.Mechanics.Translational.Components.Mass mass1(m = 1, s(fixed = true, start = 1)) annotation(
    Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(fixed.flange, springDamper1.flange_a) annotation(
    Line(points = {{-88, 0}, {-60, 0}}, color = {0, 127, 0}));
  connect(springDamper1.flange_b, mass1.flange_a) annotation(
    Line(points = {{-40, 0}, {-20, 0}}, color = {0, 127, 0}));
  connect(mass1.flange_b, springDamper2.flange_a) annotation(
    Line(points = {{0, 0}, {22, 0}}, color = {0, 127, 0}));
  connect(springDamper2.flange_b, mass2.flange_a) annotation(
    Line(points = {{42, 0}, {64, 0}}, color = {0, 127, 0}));

    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end DoubleSDM_GUI;

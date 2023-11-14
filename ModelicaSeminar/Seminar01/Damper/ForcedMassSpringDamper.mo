within ModelicaSeminar.Seminar01.Damper;

model ForcedMassSpringDamper
    extends Modelica.Icons.Example;
  .Modelica.Mechanics.Translational.Components.SpringDamper springDamper1(c = 10000, d = 1,  s_rel(fixed = true, start = 0), stateSelect = StateSelect.prefer) annotation(
    Placement(visible = true, transformation(origin = {2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .Modelica.Mechanics.Translational.Components.Mass mass1(m = 1, s(start = 0)) annotation(
    Placement(visible = true, transformation(origin = {54, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .Modelica.Mechanics.Translational.Sources.Force force annotation(
    Placement(visible = true, transformation(origin = {-36, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .Modelica.Blocks.Sources.Cosine cosine(amplitude = 100000, f = 30 / 2 / .Modelica.Constants.pi) annotation(
    Placement(visible = true, transformation(origin = {-76, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(springDamper1.flange_b, mass1.flange_a) annotation(
    Line(points = {{12, 0}, {44, 0}}, color = {0, 127, 0}));
  connect(cosine.y, force.f) annotation(
    Line(points = {{-65, 50}, {-48, 50}}, color = {0, 0, 127}));
  connect(fixed.flange, springDamper1.flange_a) annotation(
    Line(points = {{-40, 0}, {-8, 0}, {-8, 0}, {-8, 0}}, color = {0, 127, 0}));
  connect(force.flange, mass1.flange_a) annotation(
    Line(points = {{-26, 50}, {30, 50}, {30, 0}, {44, 0}, {44, 0}}, color = {0, 127, 0}));
annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end ForcedMassSpringDamper;
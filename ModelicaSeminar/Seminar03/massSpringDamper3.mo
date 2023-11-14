within ModelicaSeminar.Seminar03;
model massSpringDamper3
  .Modelica.Mechanics.Translational.Components.Fixed fixed1 annotation (
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .Modelica.Mechanics.Translational.Components.Mass mass1(m = 1.0) annotation (
    Placement(visible = true, transformation(origin = {64, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .ModelicaSeminar.Seminar03.Components.NonlinearSpringDamper3 nonlinearSpringDamper3(b = 5, c = 1.0, d = 0.1, s_rel(fixed = true, start = 10.0)) annotation (
    Placement(visible = true, transformation(origin = {-1, -1}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
equation
  connect(nonlinearSpringDamper3.flange_b, mass1.flange_a) annotation (
    Line(points = {{14, -1}, {54, -1}, {54, 0}}, color = {0, 127, 0}));
  connect(fixed1.flange, nonlinearSpringDamper3.flange_a) annotation (
    Line(points = {{-60, 0}, {-16, 0}, {-16, -1}}, color = {0, 127, 0}));
  annotation (
    Icon(coordinateSystem(grid = {2, 4})));
end massSpringDamper3;

within ModelicaSeminar.Seminar03;
model massSpringDamperMap
  .Modelica.Mechanics.Translational.Components.Fixed fixed1 annotation (
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .Modelica.Mechanics.Translational.Components.Mass mass1(m = 1.0) annotation (
    Placement(visible = true, transformation(origin = {64, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .ModelicaSeminar.Seminar03.Components.NonlinearSpringDamperMap nonlinearSpringDamperMap1(d = 0.1, s_rel(fixed = true, start = 1.0)) annotation (
    Placement(visible = true, transformation(origin = {-8.88178e-16, 2.22045e-16}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
equation
  connect(nonlinearSpringDamperMap1.flange_b, mass1.flange_a) annotation (
    Line(points = {{16, 0}, {54, 0}}, color = {0, 127, 0}));
  connect(fixed1.flange, nonlinearSpringDamperMap1.flange_a) annotation (
    Line(points = {{-60, 0}, {-18, 0}, {-16, 0}}, color = {0, 127, 0}));
  annotation (
    Icon(coordinateSystem(grid = {2, 4})));
end massSpringDamperMap;

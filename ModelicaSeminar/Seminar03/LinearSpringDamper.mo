within ModelicaSeminar.Seminar03;
model LinearSpringDamper
  .Modelica.Mechanics.Translational.Components.Fixed fixed1 annotation (
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .Modelica.Mechanics.Translational.Components.SpringDamper springDamper1(c = 1.0, d = 0.1, s_rel(fixed = true, start = 1.0)) annotation (
    Placement(visible = true, transformation(origin = {2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .Modelica.Mechanics.Translational.Components.Mass mass1 annotation (
    Placement(visible = true, transformation(origin = {64, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(springDamper1.flange_b, mass1.flange_a) annotation (
    Line(points = {{12, 0}, {54, 0}, {54, 0}, {54, 0}}, color = {0, 127, 0}));
  connect(fixed1.flange, springDamper1.flange_a) annotation (
    Line(points = {{-60, 0}, {-8, 0}, {-8, 0}, {-8, 0}}, color = {0, 127, 0}));
  annotation (
    Icon(coordinateSystem(grid = {2, 4})),
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-6, Interval = 0.04));
end LinearSpringDamper;

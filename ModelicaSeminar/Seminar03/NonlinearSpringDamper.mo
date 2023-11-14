within ModelicaSeminar.Seminar03;
model NonlinearSpringDamper
  import      Modelica.Units.SI;  // MSL 4.0.0
  // Parameters
  parameter .Modelica.Units.SI.Mass m = 1.0 "Mass";
  parameter .Modelica.Units.SI.TranslationalSpringConstant k = 1.0 "Spring constant";
  parameter .Modelica.Units.SI.TranslationalDampingConstant c = 0.1 "Damping constant";
     parameter .Modelica.Units.SI.TranslationalDampingConstant d = 0.1 "Damping constant";
  parameter Real b = 0.5 "Spring constant for x^3";
  // Variables
  .Modelica.Units.SI.Length x(start = 10.0);
  .Modelica.Units.SI.Velocity v(start = 0.0);
  .Modelica.Units.SI.Acceleration a;
  .Modelica.Units.SI.Force f;
equation
  v = der(x);
  a = der(v);
  m * a + c * v + k * x + b * x ^ 3 = 0;
  f = (-c * v) - k * x - b * x ^ 3;
  annotation (
    Icon(graphics={  Ellipse(lineColor = {75, 138, 73}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, -100}, {100, 100}}), Polygon(lineColor = {0, 0, 255}, fillColor = {75, 138, 73}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-36, 60}, {64, 0}, {-36, -60}, {-36, 60}})}),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-6, Interval = 0.1));
end NonlinearSpringDamper;

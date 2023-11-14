within ModelicaSeminar.Seminar01.Damper.Components;

model LinearSpringDamperConnector
// Parameters
  parameter .Modelica.Units.SI.Mass m = 1.0 "Mass";
  parameter .Modelica.Units.SI.TranslationalSpringConstant k = 1.0 "Spring constant";
  parameter .Modelica.Units.SI.TranslationalDampingConstant c = 0.1 "Damping constant";
// Variables
  .Modelica.Units.SI.Length x(start = 1.0);
  .Modelica.Units.SI.Velocity v(start = 0.0);
  .Modelica.Units.SI.Acceleration a;
  .Modelica.Units.SI.Force f;
    .Modelica.Blocks.Interfaces.RealInput f_ext annotation(Placement(transformation(extent = {{-127.98410516993499,-19.984105169935003},{-88.01589483006501,19.984105169935003}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Interfaces.RealOutput f_out annotation(Placement(transformation(extent = {{100.0,-10.0},{120.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
equation
  v = der(x);
  a = der(v);
  f = -c*v - k*x;
  m * a + c * v + k * x = f_ext;
  f_out = f;
annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end LinearSpringDamperConnector;

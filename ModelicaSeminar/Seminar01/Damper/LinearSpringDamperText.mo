within ModelicaSeminar.Seminar01.Damper;
model LinearSpringDamperText
extends ModelicaSeminar.Icons.TextExample;
    // Parameters
  parameter .Modelica.Units.SI.Mass m = 1.0 "Mass";
  parameter .Modelica.Units.SI.TranslationalSpringConstant k = 1.0 "Spring constant";
  parameter .Modelica.Units.SI.TranslationalDampingConstant c = 0.1 "Damping constant";
// Variables
  .Modelica.Units.SI.Length x(start = 1.0);
  .Modelica.Units.SI.Velocity v(start = 0.0);
  .Modelica.Units.SI.Acceleration a;
  .Modelica.Units.SI.Force f;
equation
  v = der(x);
  a = der(v);
  f = -c*v - k*x;
  m*a = f;
annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end LinearSpringDamperText;

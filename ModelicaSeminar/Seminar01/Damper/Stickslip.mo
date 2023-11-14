within ModelicaSeminar.Seminar01.Damper;

model Stickslip
extends ModelicaSeminar.Icons.TextExample;
// Parameters
  parameter .Modelica.Units.SI.Mass m = 1.0 "Mass";
  parameter .Modelica.Units.SI.TranslationalSpringConstant k = 1.0 "Spring constant";
  parameter .Modelica.Units.SI.TranslationalDampingConstant c = 9.81 "Damping constant";
  parameter .Modelica.Units.SI.TranslationalDampingConstant b = 1.0 "Stick slip damping constant";
  parameter .Modelica.Units.SI.CoefficientOfFriction myu0 = 0.8;
  parameter .Modelica.Units.SI.Velocity v0 = 1.0;
// Variables
  .Modelica.Units.SI.Length x(start = 1.0);
  .Modelica.Units.SI.Velocity v(start = 0.0);
  .Modelica.Units.SI.Acceleration a;
  .Modelica.Units.SI.Force f;
  .Modelica.Units.SI.Frequency fRes "Resonance Frequency";
  Real stabilityIndex;
equation
  v = der(x);
  a = der(v);
  f = (-k * x) - c * v - m * .Modelica.Constants.g_n * (myu0 - b * (v - v0));
  m * a = f;
  stabilityIndex = c - m * .Modelica.Constants.g_n * b;
  fRes = if k / m - (stabilityIndex / 2 / m) ^ 2 > 0 then sqrt(k / m - (stabilityIndex / 2 / m) ^ 2) / 2 / .Modelica.Constants.pi else 0;
    
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end Stickslip;

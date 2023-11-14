within ModelicaSeminar.Seminar01.Damper;

model DoubleSpringDamper "Only Modelica notation"
    extends ModelicaSeminar.Icons.TextExample;
  parameter .Modelica.Units.SI.Mass m1 = 1.0 "Mass";
  parameter .Modelica.Units.SI.TranslationalSpringConstant k1 = 1.0 "Spring constant";
  parameter .Modelica.Units.SI.TranslationalDampingConstant c1 = 0 "Damping constant";
  parameter .Modelica.Units.SI.Mass m2 = 1.0 "Mass";
  parameter .Modelica.Units.SI.TranslationalSpringConstant k2 = 1.0 "Spring constant";
  parameter .Modelica.Units.SI.TranslationalDampingConstant c2 = 0 "Damping constant";
  parameter .Modelica.Units.SI.Length x1Start = 1 "Start value of x1";
  parameter .Modelica.Units.SI.Length x2Start = 1 "Start value of x1";
  // Variables
  .Modelica.Units.SI.Length x1(start = x1Start);
  .Modelica.Units.SI.Velocity v1(start = 0.0);
  .Modelica.Units.SI.Acceleration a1;
  .Modelica.Units.SI.Force f1;
  .Modelica.Units.SI.Length x2(start = x2Start);
  .Modelica.Units.SI.Velocity v2(start = 0.0);
  .Modelica.Units.SI.Acceleration a2;
  .Modelica.Units.SI.Force f2;
  //Damping coefficient
  Real gamma1;
  Real gamma2;
  //Resonance frequency
  .Modelica.Units.SI.Frequency freq1;
  .Modelica.Units.SI.Frequency freq2;
equation
  v1 = der(x1);
  a1 = der(v1);
  f1 = (-c1 * v1) - k1 * x1;
  v2 = der(x2);
  a2 = der(v2);
  f2 = (-c2 * (v2 - v1)) - k2 * (x2 - x1);
  m2 * a2 = f2;
  m1 * a1 = f1 - f2;
  gamma1 = c1 / 2 / m1;
  freq1 = sqrt(k1 / m1) / 2 / .Modelica.Constants.pi;
  gamma2 = c2 / 2 / m2;
  freq2 = sqrt(k2 / m2) / 2 / .Modelica.Constants.pi;
    
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end DoubleSpringDamper;

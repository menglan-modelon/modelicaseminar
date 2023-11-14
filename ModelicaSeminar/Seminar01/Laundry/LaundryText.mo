within ModelicaSeminar.Seminar01.Laundry;

model LaundryText
    extends ModelicaSeminar.Icons.TextExample;
  parameter Real amplitude = 1 "Amplitude of cosine wave";
  parameter .Modelica.Units.SI.Frequency freqHz = 20 "Frequency of cosine wave";
  parameter .Modelica.Units.SI.Mass m = 30 "Mass of the sliding mass";
  parameter .Modelica.Units.SI.Mass mp = 0.1 "Mass of the sliding mass";
  parameter .Modelica.Units.SI.TranslationalSpringConstant k1 = 3000 "Spring constant";
  parameter .Modelica.Units.SI.TranslationalSpringConstant k2 = 4000 "Spring constant";
  parameter .Modelica.Units.SI.TranslationalDampingConstant c2 = 3000 "Damping constant";
  parameter .Modelica.Units.SI.TranslationalSpringConstant k3 = 8000 "Spring constant";
  parameter .Modelica.Units.SI.TranslationalDampingConstant c3 = 1000 "Damping constant";
  parameter .Modelica.Units.SI.TranslationalSpringConstant k4 = 1e6 "Spring constant";
  parameter .Modelica.Units.SI.TranslationalDampingConstant c4 = 1e4 "Damping constant";
  .Modelica.Units.SI.Position xm(start = 0) "Absolute posision of mass";
  .Modelica.Units.SI.Velocity vm(start = 0) "Absolute velocity of mass";
  .Modelica.Units.SI.Acceleration am(start = 0) "Absolute acceleration of mass";
  .Modelica.Units.SI.Position xp(start = 0) "Absolute posision of middle point";
  .Modelica.Units.SI.Velocity vp(start = 0) "Absolute velocity of middle point";
  .Modelica.Units.SI.Acceleration ap(start = 0) "Absolute acceleration of middle point";
  .Modelica.Units.SI.Force f1 "Spring 1 force";
  .Modelica.Units.SI.Force f2 "Spring damper 2 force";
  .Modelica.Units.SI.Force f3 "Spring damper 3 force";
  .Modelica.Units.SI.Force f4 "Spring damper 4 force";
  .Modelica.Units.SI.Force fcos "External cosine force";
  .Modelica.Units.SI.Force fm "Total force on mass";
equation
  vm = der(xm);
  am = der(vm);
  vp = der(xp);
  ap = der(vp);
  fcos = amplitude * .Modelica.Math.cos(2 * .Modelica.Constants.pi * freqHz * time);
  f4 = (-k4 * xp) - c4 * vp;
  f3 = (-k3 * (xm - xp)) - c3 * (vm - vp);
  f2 = (-k2 * xm) - c2 * vm;
  f1 = (-k1 * xm);
  fm = f1 + f2 + f3 + fcos;
  m * am = f1 + f2 +f3 + fcos;
  f3 - f4 = 0;
 // mp*ap =f4 - f3;

    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end LaundryText;

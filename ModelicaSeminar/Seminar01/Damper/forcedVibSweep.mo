within ModelicaSeminar.Seminar01.Damper;

model forcedVibSweep
  extends .ModelicaSeminar.Icons.TextExample;
// Variables
 .Modelica.Units.SI.Position x(start=0.0, fixed=true);
 .Modelica.Units.SI.Velocity v(start=0.0);
 .Modelica.Units.SI.Acceleration ac;
 .Modelica.Units.SI.Frequency force_freq;
 .Modelica.Units.SI.Frequency resonance_freq;
 .Modelica.Units.SI.Force force;
// Parameters
 parameter .Modelica.Units.SI.Mass m=1.0;
 parameter .Modelica.Units.SI.TranslationalDampingConstant c=1.0;
 parameter .Modelica.Units.SI.TranslationalSpringConstant k=10000.0;
 parameter Real d=100000.0;
 parameter Real CF=1.0;

equation
v=der(x);
 ac=der(v);
 m*ac + c*v + k*x = force;
 force = d*cos(2*.Modelica.Constants.pi * (1/2)*CF*time*time);
 force_freq = CF*time;
 resonance_freq = 1/2/.Modelica.Constants.pi*sqrt(k/m);
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end forcedVibSweep;

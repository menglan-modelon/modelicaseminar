within ModelicaSeminar.Seminar01.Damper;

model forcedVib
  extends .ModelicaSeminar.Icons.TextExample;
// Variables
 .Modelica.Units.SI.Position x(start=0.0, fixed=true);
 .Modelica.Units.SI.Velocity v(start=0.0);
 .Modelica.Units.SI.Acceleration a;
 .Modelica.Units.SI.Frequency force_freq;
 .Modelica.Units.SI.Frequency resonance_freq;
 .Modelica.Units.SI.Force force;
//Parameters
 parameter .Modelica.Units.SI.Mass m=1.0;
 parameter .Modelica.Units.SI.TranslationalDampingConstant c=1.0;
 parameter .Modelica.Units.SI.TranslationalSpringConstant k=10000.0;
 parameter Real d=100000.0;
 parameter .Modelica.Units.SI.AngularFrequency omg=30.0;
equation
 v=der(x);
 a=der(v);
 m*a + c*v + k*x = force;
 force = d*cos(omg*time);
 force_freq = omg/2/.Modelica.Constants.pi;
 resonance_freq = 1/2/.Modelica.Constants.pi*sqrt(k/m);


    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end forcedVib;

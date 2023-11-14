within ModelicaSeminar.Seminar01.Pendulum;

model ExcitedPendulum "1D Matthew-type self-excited pendulum"
    extends ModelicaSeminar.Icons.TextExample;
// Parameters
  parameter .Modelica.Units.SI.Mass m = 50 "Mass of pendulum";
  parameter .Modelica.Units.SI.Length l0 = 2 "Center length of pendulum";
  parameter .Modelica.Units.SI.Length l_del = 0.1 "Delta length of pendulum";
  parameter .Modelica.Units.SI.Angle theta0 = 1 * .Modelica.Constants.D2R "Initial angle of pendulum";
 // Variables
  .Modelica.Units.SI.Angle theta(start = theta0, fixed = true);
  .Modelica.Units.SI.AngularVelocity w(start = 0, fixed = true);
  .Modelica.Units.SI.AngularAcceleration a;
  .Modelica.Units.SI.Length l "Length of pendulum";
  .Modelica.Units.SI.AngularVelocity omg0 "Resonance angular velocity";
  .Modelica.Units.SI.Frequency freq "Resonance frequency" ;
  .Modelica.Units.SI.Force stringTension;
equation
  der(theta) = w;
  der(w) = a;
  l = l0 + l_del * cos(2*omg0*time);
  a + .Modelica.Constants.g_n / l0 *(1 - l_del/l0*cos(2*omg0*time))*theta = 0;
  omg0 = sqrt(.Modelica.Constants.g_n / l0);
  freq = 1 / 2 / .Modelica.Constants.pi * omg0;
  stringTension * cos(theta) = -m * .Modelica.Constants.g_n;
    
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end ExcitedPendulum;

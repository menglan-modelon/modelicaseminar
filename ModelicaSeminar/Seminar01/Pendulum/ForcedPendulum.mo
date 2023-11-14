within ModelicaSeminar.Seminar01.Pendulum;

model ForcedPendulum
    extends ModelicaSeminar.Icons.TextExample;
// Parameters
  parameter .Modelica.Units.SI.Mass m = 1 "Mass of pendulum";
  parameter .Modelica.Units.SI.Length l = 0.3 "Length of pendulum";
  parameter .Modelica.Units.SI.Angle theta0 = 0*.Modelica.Constants.D2R "Initial angle of pendulum";
  parameter .Modelica.Units.SI.Force force = 1 "External force";
  parameter .Modelica.Units.SI.AngularVelocity omg = 0.91*2*.Modelica.Constants.pi "Frequency of external force";
// Variables
  .Modelica.Units.SI.Angle theta(start = theta0, fixed = true);
  .Modelica.Units.SI.AngularVelocity w(start = 0, fixed = true);
  .Modelica.Units.SI.AngularAcceleration a;
  .Modelica.Units.SI.Frequency freq "Resonance frequency of pendulum" ;
  .Modelica.Units.SI.Frequency freqOmg "Frequency of external force" ;
  .Modelica.Units.SI.Force stringTension;
equation
  der(theta) = w;
  der(w) = a;
  m*l*a + m*.Modelica.Constants.g_n*sin(theta) = force*sin(omg*time);
  freq = sqrt(.Modelica.Constants.g_n / l) / 2 / .Modelica.Constants.pi;
  freqOmg = omg / 2 / .Modelica.Constants.pi;
  stringTension * cos(theta) = -m * .Modelica.Constants.g_n;
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end ForcedPendulum;

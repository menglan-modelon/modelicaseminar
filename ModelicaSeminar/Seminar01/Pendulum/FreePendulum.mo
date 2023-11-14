within ModelicaSeminar.Seminar01.Pendulum;

model FreePendulum
    extends ModelicaSeminar.Icons.TextExample;
// Parameters
  parameter .Modelica.Units.SI.Mass m = 1 "Mass of pendulum";
  parameter .Modelica.Units.SI.Length l = 0.3 "Length of pendulum";
  parameter .Modelica.Units.SI.Angle theta0 = 45*.Modelica.Constants.D2R "Initial angle of pendulum";
// Variables
  .Modelica.Units.SI.Angle theta(start = theta0, fixed = true);
  .Modelica.Units.SI.AngularVelocity w(start = 0, fixed = true);
  .Modelica.Units.SI.AngularAcceleration a;
  .Modelica.Units.SI.Force stringTension;
equation
  der(theta) = w;
  der(w) = a;
  a + .Modelica.Constants.g_n/l*sin(theta) = 0;
 stringTension * cos(theta) = -m * .Modelica.Constants.g_n;
   
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end FreePendulum;

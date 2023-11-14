within ModelicaSeminar.Seminar04.AirLib.Components;

    model AirPump "Partial model of air pump with energy balance"
      extends .ModelicaSeminar.Seminar04.AirLib.Interfaces.PartialAirPump;
      Real omega_rel "Relative shaft angular velocity";
      Real q_rel "Relative air flow volume";
      parameter .Modelica.Units.SI.AngularVelocity omega_n "Normal shaft angular velocity [rad/s]";
      parameter .Modelica.Units.SI.VolumeFlowRate q_n "Normal air flow volume [m^3/s]";
      parameter .Modelica.Units.SI.Pressure p_n "Normal air pressure [Pa]";
      parameter Real a = 1 "Coefficient for (omega_rel)^2";
      parameter Real b = 1 "Coefficient for (omega_rel)*(q_rel)";
      parameter Real c = 1 "Coefficient for (q_rel)^2";
      parameter Real d = 1 "Coefficient for (omega_rel)^3/(q_rel)";
    equation
      omega_rel = omega / omega_n;
      q_rel = q / q_n;
      -dp = (a * omega_rel^ 2 + b * omega_rel * q_rel + c * q_rel ^ 2 + d * q_rel ^ 3 / omega_rel) * p_n;
      annotation(
        Icon(graphics = {Rectangle(extent = {{-10, 100}, {10, 78}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.VerticalCylinder, fillColor = {95, 95, 95}), Ellipse(extent = {{-80, 80}, {80, -80}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Sphere, fillColor = {0, 255, 255}), Rectangle(extent = {{-100, 46}, {100, -46}}, lineColor = {0, 0, 0}, fillColor = {0, 255, 255}, fillPattern = FillPattern.HorizontalCylinder), Polygon(points = {{-28, 30}, {-28, -30}, {50, -2}, {-28, 30}}, lineColor = {0, 0, 0}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, fillColor = {255, 255, 255}), Polygon(points = {{-48, -60}, {-72, -100}, {72, -100}, {48, -60}, {-48, -60}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {0, 128, 255}, fillPattern = FillPattern.VerticalCylinder)}));
    end AirPump;

within ModelicaSeminar.Seminar04.AirLib;

  package Interfaces "Interfaces model of dryer"
    extends Modelica.Icons.InterfacesPackage;
    connector AirPort "Connecter class of air flow model"
      .Modelica.Units.SI.Pressure p;
      flow .Modelica.Units.SI.VolumeFlowRate q;
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end AirPort;

    connector AirPort_a "Air connector at design inlet"
      extends .ModelicaSeminar.Seminar04.AirLib.Interfaces.AirPort;
      annotation(
        defaultComponentName = "port_a",
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-150, 110}, {150, 50}}, textString = "%name")}),
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid)}));
    end AirPort_a;

    connector AirPort_b "Air connector at design outlet"
      extends .ModelicaSeminar.Seminar04.AirLib.Interfaces.AirPort;
      annotation(
        defaultComponentName = "port_b",
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-30, 30}, {30, -30}}, lineColor = {0, 127, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-150, 110}, {150, 50}}, textString = "%name")}),
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-80, 80}, {80, -80}}, lineColor = {0, 127, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}));
    end AirPort_b;

    partial model PartialTwoAirPorts "Partial model of components with two air ports"
      AirPort_a port_a annotation(
        Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
      AirPort_b port_b annotation(
        Placement(transformation(extent = {{90, -10}, {110, 10}})));
      parameter .Modelica.Units.SI.Pressure dp_start = 0.0 "Guess value of dp = port_a.p - port_b.p" annotation(
        Dialog(tab = "Advanced"));
      .Modelica.Units.SI.Pressure dp(start = dp_start) "Pressure difference between port_a and port_b (= port_a.p - port_b.p)";
      .Modelica.Units.SI.VolumeFlowRate q;
    equation
// Pressure drop in design flow direction
      dp = port_a.p - port_b.p;
// Volume flow balance (no storage)
      port_a.q + port_b.q = 0;
      q = port_a.q;
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false), graphics = {Text(extent = {{-110, 25}, {-90, 45}}, lineColor = {160, 160, 164}, textString = "q"), Polygon(points = {{-95, 23}, {-85, 20}, {-95, 17}, {-95, 23}}, lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid), Line(points = {{-110, 20}, {-85, 20}}, color = {160, 160, 164}), Text(extent = {{90, 45}, {110, 25}}, lineColor = {160, 160, 164}, textString = "q"), Line(points = {{90, 20}, {115, 20}}, color = {160, 160, 164}), Polygon(points = {{105, 23}, {115, 20}, {105, 17}, {105, 23}}, lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid), Text(extent = {{-58, -50}, {62, -22}}, lineColor = {160, 160, 164}, textString = "dp = port_a.p - port_b.p"), Polygon(points = {{-69, -45}, {-79, -48}, {-69, -51}, {-69, -45}}, lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid), Line(points = {{-78, -48}, {80, -48}}, color = {160, 160, 164})}));
    end PartialTwoAirPorts;

    partial model PartialAirPumpInp "Partial model of air pump"
      extends Interfaces.PartialTwoAirPorts;
      .Modelica.Units.SI.AngularVelocity omega "Shaft angular velocity";
      .Modelica.Blocks.Interfaces.RealInput w annotation(
        Placement(visible = true, transformation(origin = {0, 98}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 98}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
    equation
      omega = w;
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end PartialAirPumpInp;

    partial model PartialAirPump "Partial model of air pump with energy balance"
      extends Interfaces.PartialTwoAirPorts;
      .Modelica.Units.SI.Angle phi "Shaft angle";
      .Modelica.Units.SI.AngularVelocity omega "Shaft angular velocity";
      .Modelica.Units.SI.AngularAcceleration alpha "Shaft angular acceleration";
      .Modelica.Mechanics.Rotational.Interfaces.Flange_a shaft annotation(
        Placement(visible = true, transformation(extent = {{-10, 90}, {10, 110}}, rotation = 0), iconTransformation(extent = {{-10, 90}, {10, 110}}, rotation = 0)));
      parameter Real efficiency = 1.0 "Energy efficiency";
      .Modelica.Units.SI.Power inputPw "Input power [W]";
      .Modelica.Units.SI.Power outputPw "Output power [W]";
    equation
      phi = shaft.phi;
      omega = der(phi);
      alpha = der(omega);
      inputPw = omega * shaft.tau;
      outputPw = -dp * q;
      efficiency * inputPw = outputPw;
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end PartialAirPump;
  end Interfaces;

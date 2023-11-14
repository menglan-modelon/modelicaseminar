within ModelicaSeminar.Seminar02.Dryer.Experiments;
  
  model MotorMechanical
    extends .Modelica.Icons.Example;
    // Parameters
    parameter .Modelica.Units.SI.Voltage Vocv = 100 "Battery open circuit voltage";
    parameter .Modelica.Units.SI.Resistance Rm = 6.26 "Motor inner resistance";
    parameter .Modelica.Units.SI.Inductance Lm = 2.15e-3 "Motor inner inductance";
    parameter .Modelica.Units.SI.MomentOfInertia Jm = 9.6e-7 "Motor innertia";
    parameter .Modelica.Units.SI.RotationalDampingConstant Dm = 7.7e-7 "Motor rotaional damping constant";
    parameter .Modelica.Units.SI.Torque tauM = 1.3e-4 "Motor rotational friction torque";
    parameter Real Kt = 0.014 "Motor torque coefficient (Kt = Kemf)";
    .Modelica.Electrical.Analog.Basic.Ground ground annotation(
      Placement(visible = true, transformation(origin = {-14, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Electrical.Analog.Sources.SignalVoltage batteryOCV annotation(
      Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
    .Modelica.Electrical.Analog.Basic.Resistor motorResistance(R = Rm) annotation(
      Placement(visible = true, transformation(origin = {-14, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    .Modelica.Electrical.Analog.Basic.RotationalEMF motor(k = Kt) annotation(
      Placement(visible = true, transformation(origin = {-14, -10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    .Modelica.Mechanics.Rotational.Components.Inertia motorInertia(J = Jm) annotation(
      Placement(visible = true, transformation(origin = {78, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Electrical.Analog.Basic.Inductor motorInductor(L = Lm) annotation(
      Placement(visible = true, transformation(origin = {-14, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    .Modelica.Mechanics.Rotational.Components.Damper dampingFriction(d = Dm, phi_rel(displayUnit = "rad")) annotation(
      Placement(visible = true, transformation(origin = {20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Mechanics.Rotational.Components.BearingFriction bearingFriction(tau_pos = [0,1.3e-4]) annotation(
      Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Blocks.Sources.Trapezoid trapezoid(amplitude = -Vocv, falling = 0.5, period = 2, rising = 0.5, startTime = 1, width = 0.5) annotation(
      Placement(visible = true, transformation(origin = {-108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(motorResistance.p, motor.n) annotation(
      Line(points = {{-14, 12}, {-14, 0}}, color = {0, 0, 255}));
    connect(motor.p, batteryOCV.n) annotation(
      Line(points = {{-14,-20},{-14,-26},{-70,-26},{-70,-10}}, color = {0, 0, 255}));
    connect(motorInductor.p, motorResistance.n) annotation(
      Line(points = {{-14, 50}, {-14, 32}}, color = {0, 0, 255}));
    connect(ground.p, motor.p) annotation(
      Line(points = {{-14, -34}, {-14, -20}}, color = {0, 0, 255}));
    connect(batteryOCV.p, motorInductor.n) annotation(
      Line(points = {{-70, 10}, {-70, 80}, {-14, 80}, {-14, 70}}, color = {0, 0, 255}));
    connect(trapezoid.y, batteryOCV.v) annotation(
      Line(points = {{-97, 0}, {-82, 0}}, color = {0, 0, 127}));
    connect(motor.flange, dampingFriction.flange_a) annotation(
      Line(points = {{-4, -10}, {10, -10}}));
    connect(dampingFriction.flange_b, bearingFriction.flange_a) annotation(
      Line(points = {{30, -10}, {40, -10}}));
    connect(bearingFriction.flange_b, motorInertia.flange_a) annotation(
      Line(points = {{60, -10}, {68, -10}}));
    annotation(
      Icon(coordinateSystem(initialScale = 1)),
      uses(Modelica(version = "4.0.0")),
      experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.01));
  end MotorMechanical;

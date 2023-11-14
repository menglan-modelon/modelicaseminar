within ModelicaSeminar.Seminar02.MiniCar;
  
  model Mini4WDMSL_SOC
    extends .Modelica.Icons.Example;
    // Parameters
    parameter .Modelica.Units.SI.Voltage V_OCV = 3 "Battery open circuit voltage";
    parameter .Modelica.Units.SI.Resistance Rb = 0.8 "Battery inner resistance";
    parameter .Modelica.Units.SI.Resistance Rm = 1 "Motor inner resistance";
    parameter .Modelica.Units.SI.Inductance Lm = 1e-6 "Motor inner inductance";
    parameter .Modelica.Units.SI.MomentOfInertia Jm = 1.8e-3 * 0.005 * 0.005 "Motor innertia";
    parameter .Modelica.Units.SI.MomentOfInertia Jt = 5e-3 * 0.01 * 0.01 "Tire innertia";
    parameter Real Kt = 1.2e-3 "Motor torque coefficient";
    parameter Real Ke = 1.2e-3 "Motor rotational voltage coefficient";
    parameter Real Kg = 5 "Gear ratio";
    parameter .Modelica.Units.SI.Efficiency Eg = 1 "Gear efficiency";
    parameter .Modelica.Units.SI.Mass m = 0.1 "Vehicle mass";
    parameter .Modelica.Units.SI.Radius r = 0.015 "Tyre radius";
    parameter .Modelica.Units.SI.CoefficientOfFriction myu = 0.1 "Tyre rotating friction coefficient";
    parameter Real Cd = 0.3 "Air drag coefficiency";
    parameter .Modelica.Units.SI.Area area = 0.004 "Vehicle frontal area";
    parameter .Modelica.Units.SI.Density rho = 1.205 "Air density";
    .Modelica.Electrical.Analog.Basic.Ground ground annotation(
      Placement(visible = true, transformation(origin = {-76, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Electrical.Analog.Basic.Resistor batteryResistance(R = Rb) annotation(
      Placement(visible = true, transformation(origin = {-76, 28}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    .Modelica.Electrical.Analog.Sources.SignalVoltage batteryOCV annotation(
      Placement(visible = true, transformation(origin = {-76, -6}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
    .Modelica.Electrical.Analog.Basic.Resistor motorResistance(R = Rm) annotation(
      Placement(visible = true, transformation(origin = {-44, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    .Modelica.Electrical.Analog.Basic.RotationalEMF motor(k = Kt) annotation(
      Placement(visible = true, transformation(origin = {-44, -16}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    .Modelica.Mechanics.Rotational.Components.Inertia motorInertia(J = Jm) annotation(
      Placement(visible = true, transformation(origin = {-16, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Mechanics.Rotational.Components.LossyGear lossyGear(ratio = Kg, startForward(fixed = true, start = true)) annotation(
      Placement(visible = true, transformation(origin = {12, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Electrical.Analog.Basic.Inductor motorInductor(L = Lm) annotation(
      Placement(visible = true, transformation(origin = {-44, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    .Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation(
      Placement(visible = true, transformation(origin = {-60, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    .ModelicaSeminar.Seminar02.MiniCar.Components.calcOCV calcOCV(Vb0 = V_OCV) annotation(
      Placement(visible = true, transformation(origin = {-114, -6}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
    .Modelica.Mechanics.Translational.Components.Vehicle vehicle(A = area, Cd = Cd, CrConstant = myu, J = Jt, R = r, m = m, rho = rho, s(displayUnit = "m"), v(displayUnit = "m/s")) annotation(
      Placement(visible = true, transformation(origin = {50, -16}, extent = {{-14, -16}, {14, 16}}, rotation = 0)));
  equation
    connect(ground.p, batteryOCV.n) annotation(
      Line(points = {{-76, -46}, {-76, -16}}, color = {0, 0, 255}));
    connect(batteryOCV.p, batteryResistance.n) annotation(
      Line(points = {{-76, 4}, {-76, 18}}, color = {0, 0, 255}));
    connect(motorResistance.p, motor.n) annotation(
      Line(points = {{-44, 6}, {-44, -6}}, color = {0, 0, 255}));
    connect(motor.p, batteryOCV.n) annotation(
      Line(points = {{-44, -26}, {-43, -26}, {-43, -34}, {-76, -34}, {-76, -16}}, color = {0, 0, 255}));
    connect(motorInductor.p, motorResistance.n) annotation(
      Line(points = {{-44, 34}, {-44, 26}}, color = {0, 0, 255}));
    connect(motor.flange, motorInertia.flange_a) annotation(
      Line(points = {{-34, -16}, {-26, -16}}));
    connect(motorInertia.flange_b, lossyGear.flange_a) annotation(
      Line(points = {{-6, -16}, {2, -16}}));
    connect(currentSensor.i, calcOCV.i) annotation(
      Line(points = {{-60, 83}, {-113, 83}, {-113, 7}}, color = {0, 0, 127}));
    connect(calcOCV.Vocv, batteryOCV.v) annotation(
      Line(points = {{-102, -6}, {-88, -6}}, color = {0, 0, 127}));
    connect(batteryResistance.p, currentSensor.n) annotation(
      Line(points = {{-76, 38}, {-76, 71.5}, {-70, 71.5}, {-70, 72}}, color = {0, 0, 255}));
    connect(currentSensor.p, motorInductor.n) annotation(
      Line(points = {{-50, 72}, {-44, 72}, {-44, 54}}, color = {0, 0, 255}));
    connect(lossyGear.flange_b, vehicle.flangeR) annotation(
      Line(points = {{22, -16}, {36, -16}}));
    annotation(
      Icon(coordinateSystem(initialScale = 1)),
      uses(Modelica(version = "4.0.0")),
      experiment(StartTime = 0, StopTime = 4000, Tolerance = 1e-06, Interval = 1));
  end Mini4WDMSL_SOC;

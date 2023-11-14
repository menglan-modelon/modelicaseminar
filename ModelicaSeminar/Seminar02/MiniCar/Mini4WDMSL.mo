within ModelicaSeminar.Seminar02.MiniCar;
  
  model Mini4WDMSL
    extends .Modelica.Icons.Example;
  
    parameter Real V_OCV = 3;
    parameter Real Rb = 0.8;
    parameter Real Rm = 1;
    parameter Real Lm = 1e-6;
    parameter Real Jm = 1.8e-3*0.005*0.005;
    parameter Real Jt = 5e-3*0.01*0.01;
    parameter Real Kt = 1.2e-3;
    parameter Real Ke = 1.2e-3;
    parameter Real Kg = 5;
    parameter Real Eg = 1;
    parameter Real m = 0.1;
    parameter Real r = 0.015;
    parameter Real myu = 0.1;
    parameter Real Cd = 0.3;
    parameter Real area = 0.004;
    parameter Real rho = 1.205;
    
    .Modelica.Electrical.Analog.Basic.Ground ground annotation(
      Placement(visible = true, transformation(origin = {-80, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation(
      Placement(visible = true, transformation(origin = {-80, -22}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
    .Modelica.Electrical.Analog.Basic.Resistor resistor(R = Rb) annotation(
      Placement(visible = true, transformation(origin = {-80, 16}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    .Modelica.Electrical.Analog.Basic.Inductor inductor(L = Lm) annotation(
      Placement(visible = true, transformation(origin = {-40, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    .Modelica.Electrical.Analog.Basic.Resistor resistor1(R = Rm) annotation(
      Placement(visible = true, transformation(origin = {-40, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    .Modelica.Electrical.Analog.Basic.RotationalEMF emf(k = Kt) annotation(
      Placement(visible = true, transformation(origin = {-40, -24}, extent = {{10, -10}, {-10, 10}}, rotation = -180)));
    .Modelica.Blocks.Sources.Constant const(k = -V_OCV) annotation(
      Placement(visible = true, transformation(origin = {-118, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Blocks.Sources.Constant constant1(k = -V_OCV) annotation(
      Placement(visible = true, transformation(origin = {-118, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Mechanics.Rotational.Components.Inertia inertia(J = Jm) annotation(
      Placement(visible = true, transformation(origin = {0, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Mechanics.Rotational.Components.LossyGear lossyGear(ratio = Kg) annotation(
      Placement(visible = true, transformation(origin = {36, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Mechanics.Translational.Components.Vehicle vehicle(A = area, Cd = Cd, CrConstant = myu, J = Jt, R = r, m = m, rho = rho, s(displayUnit = "m"), v(displayUnit = "m/s")) annotation(
      Placement(visible = true, transformation(origin = {74, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(signalVoltage.n, ground.p) annotation(
      Line(points = {{-80, -32}, {-80, -54}}, color = {0, 0, 255}));
    connect(resistor.n, signalVoltage.p) annotation(
      Line(points = {{-80, 6}, {-80, -12}}, color = {0, 0, 255}));
    connect(resistor.p, inductor.n) annotation(
      Line(points = {{-80, 26}, {-80, 80}, {-40, 80}, {-40, 54}}, color = {0, 0, 255}));
    connect(inductor.p, resistor1.n) annotation(
      Line(points = {{-40, 34}, {-40, 22}}, color = {0, 0, 255}));
    connect(resistor1.p, emf.n) annotation(
      Line(points = {{-40, 2}, {-40, -14}}, color = {0, 0, 255}));
    connect(emf.p, signalVoltage.n) annotation(
      Line(points = {{-40, -34}, {-40, -44}, {-80, -44}, {-80, -32}}, color = {0, 0, 255}));
    connect(const.y, signalVoltage.v) annotation(
      Line(points = {{-107, -22}, {-92, -22}}, color = {0, 0, 127}));
    connect(emf.flange, inertia.flange_a) annotation(
      Line(points = {{-30, -24}, {-10, -24}}));
    connect(inertia.flange_b, lossyGear.flange_a) annotation(
      Line(points = {{10, -24}, {26, -24}}));
    connect(lossyGear.flange_b, vehicle.flangeR) annotation(
      Line(points = {{46, -24}, {64, -24}}));
  end Mini4WDMSL;

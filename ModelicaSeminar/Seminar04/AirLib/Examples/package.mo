within ModelicaSeminar.Seminar04.AirLib;

  package Examples "Examples of air dryer model"
    extends .Modelica.Icons.ExamplesPackage;
    model Dryer1
    extends .Modelica.Icons.Example;
      .ModelicaSeminar.Seminar04.AirLib.Sources.AirInlet airInlet(p_atmosphire = 100000000) annotation(
        Placement(transformation(extent = {{-102, -10}, {-82, 10}})));
      .ModelicaSeminar.Seminar04.AirLib.Sources.AirOutlet airOutlet(p_atmosphire = 100000000) annotation(
        Placement(transformation(extent = {{84, -10}, {104, 10}})));
      .ModelicaSeminar.Seminar04.AirLib.Components.AirPump airPump2_1(omega_n = 1, q_n = 1, a = 1000, b = 100, p_n = 100000000, c = 1000, d = 2000) annotation(
        Placement(transformation(extent = {{-10, -10}, {10, 10}})));
      .Modelica.Blocks.Sources.Ramp ramp(height = 1000, duration = 100, offset = 100) annotation(
        Placement(visible = true, transformation(extent = {{-90, 32}, {-70, 52}}, rotation = 0)));
      .Modelica.Mechanics.Rotational.Sources.Speed speed(exact = true) annotation(
        Placement(transformation(extent = {{-40, 32}, {-20, 52}})));
   
equation

      connect(airInlet.port_b, airPump2_1.port_a) annotation(
        Line(points = {{-82, 0}, {-46, 0}, {-10, 0}}, color = {0, 127, 255}));
      connect(airPump2_1.port_b, airOutlet.port_a) annotation(
        Line(points = {{10, 0}, {48, 0}, {84, 0}}, color = {0, 127, 255}));
      connect(ramp.y, speed.w_ref) annotation(
        Line(points = {{-69, 42}, {-56, 42}, {-42, 42}}, color = {0, 0, 127}));
      connect(speed.flange, airPump2_1.shaft) annotation(
        Line(points = {{-20, 42}, {-10, 42}, {0, 42}, {0, 10}}, color = {0, 0, 0}));
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end Dryer1;

    model Dryer2
    extends .Modelica.Icons.Example;
      .ModelicaSeminar.Seminar04.AirLib.Sources.AirInlet airInlet(p_atmosphire = 100000000) annotation(
        Placement(transformation(extent = {{-102, -10}, {-82, 10}})));
      .ModelicaSeminar.Seminar04.AirLib.Sources.AirOutlet airOutlet(p_atmosphire = 100000000) annotation(
        Placement(transformation(extent = {{84, -10}, {104, 10}})));
      .ModelicaSeminar.Seminar04.AirLib.Components.AirPump airPump2_1(a = 1.32, b = -0.88, c = 1.45, d = -0.89, omega_n = 143, p_n = 3.34e+10, q_n = 1.88) annotation(
        Placement(transformation(extent = {{-10, -10}, {10, 10}})));
      .Modelica.Mechanics.Rotational.Sources.Speed speed(exact = true) annotation(
        Placement(transformation(extent = {{-38, 30}, {-18, 50}})));
      .Modelica.Blocks.Sources.Ramp ramp(duration = 100, height = 1, offset = 100) annotation(
        Placement(transformation(extent = {{-88, 30}, {-68, 50}})));
      .ModelicaSeminar.Seminar04.AirLib.Components.StaticAirPipe staticAirPipe2_1(R = 50000) annotation(
        Placement(transformation(extent = {{-56, -10}, {-36, 10}})));
      .ModelicaSeminar.Seminar04.AirLib.Components.StaticAirPipe staticAirPipe(R = 44500) annotation(
        Placement(transformation(extent = {{40, -10}, {60, 10}})));
    
    equation
      connect(speed.flange, airPump2_1.shaft) annotation(
        Line(points = {{-18, 40}, {-10, 40}, {0, 40}, {0, 10}}, color = {0, 0, 0}));
      connect(ramp.y, speed.w_ref) annotation(
        Line(points = {{-67, 40}, {-54, 40}, {-40, 40}}, color = {0, 0, 127}));
      connect(airInlet.port_b, staticAirPipe2_1.port_a) annotation(
        Line(points = {{-82, 0}, {-56, 0}}, color = {0, 127, 255}));
      connect(staticAirPipe2_1.port_b, airPump2_1.port_a) annotation(
        Line(points = {{-36, 0}, {-10, 0}}, color = {0, 127, 255}));
      connect(airPump2_1.port_b, staticAirPipe.port_a) annotation(
        Line(points = {{10, 0}, {40, 0}}, color = {0, 127, 255}));
      connect(staticAirPipe.port_b, airOutlet.port_a) annotation(
        Line(points = {{60, 0}, {84, 0}}, color = {0, 127, 255}));
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end Dryer2;

    model Dryer1Inp
    extends .Modelica.Icons.Example;
      .ModelicaSeminar.Seminar04.AirLib.Sources.AirInlet airInlet(p_atmosphire = 100000000) annotation(
        Placement(transformation(extent = {{-102, -10}, {-82, 10}})));
      .ModelicaSeminar.Seminar04.AirLib.Sources.AirOutlet airOutlet(p_atmosphire = 100000000) annotation(
        Placement(transformation(extent = {{84, -10}, {104, 10}})));
      .ModelicaSeminar.Seminar04.AirLib.Components.AirPumpInp airPump2_1(omega_n = 1, q_n = 1, a = 1000, b = 100, p_n = 100000000, c = 1000, d = 2000) annotation(
        Placement(transformation(extent = {{-10, -10}, {10, 10}})));
      .Modelica.Blocks.Sources.Ramp ramp(height = 1000, duration = 100, offset = 100) annotation(
        Placement(visible = true, transformation(extent = {{-90, 32}, {-70, 52}}, rotation = 0)));
    equation
      connect(ramp.y, airPump2_1.w) annotation(
        Line(points = {{-69, 42}, {0, 42}, {0, 9.8}, {0, 9.8}}, color = {0, 0, 127}));
      connect(airInlet.port_b, airPump2_1.port_a) annotation(
        Line(points = {{-82, 0}, {-46, 0}, {-10, 0}}, color = {0, 127, 255}));
      connect(airPump2_1.port_b, airOutlet.port_a) annotation(
        Line(points = {{10, 0}, {48, 0}, {84, 0}}, color = {0, 127, 255}));
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end Dryer1Inp;

    model Dryer2Inp
    extends .Modelica.Icons.Example;
      .ModelicaSeminar.Seminar04.AirLib.Sources.AirInlet airInlet(p_atmosphire = 100000000) annotation(
        Placement(transformation(extent = {{-102, -10}, {-82, 10}})));
      .ModelicaSeminar.Seminar04.AirLib.Sources.AirOutlet airOutlet(p_atmosphire = 100000000) annotation(
        Placement(transformation(extent = {{84, -10}, {104, 10}})));
      .ModelicaSeminar.Seminar04.AirLib.Components.AirPumpInp airPump2_1(omega_n = 1, q_n = 1, a = 1000, b = 100, c = 1000, d = 2000, p_n = 100000000) annotation(
        Placement(transformation(extent = {{-10, -10}, {10, 10}})));
      .Modelica.Blocks.Sources.Ramp ramp(height = 1000, duration = 100, offset = 100) annotation(
        Placement(transformation(extent = {{-88, 30}, {-68, 50}})));
      .ModelicaSeminar.Seminar04.AirLib.Components.StaticAirPipe staticAirPipe2_1(R = 100) annotation(
        Placement(transformation(extent = {{-56, -10}, {-36, 10}})));
      .ModelicaSeminar.Seminar04.AirLib.Components.StaticAirPipe staticAirPipe(R = 300) annotation(
        Placement(transformation(extent = {{40, -10}, {60, 10}})));
    equation
      connect(ramp.y, airPump2_1.w) annotation(
        Line(points = {{-67, 40}, {0, 40}, {0, 9.8}, {0, 9.8}}, color = {0, 0, 127}));
      connect(airInlet.port_b, staticAirPipe2_1.port_a) annotation(
        Line(points = {{-82, 0}, {-56, 0}}, color = {0, 127, 255}));
      connect(staticAirPipe2_1.port_b, airPump2_1.port_a) annotation(
        Line(points = {{-36, 0}, {-10, 0}}, color = {0, 127, 255}));
      connect(airPump2_1.port_b, staticAirPipe.port_a) annotation(
        Line(points = {{10, 0}, {40, 0}}, color = {0, 127, 255}));
      connect(staticAirPipe.port_b, airOutlet.port_a) annotation(
        Line(points = {{60, 0}, {84, 0}}, color = {0, 127, 255}));
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end Dryer2Inp;

    model TestParallel
    extends .Modelica.Icons.Example;
      .ModelicaSeminar.Seminar04.AirLib.Components.AirPumpInp P1(omega_n(displayUnit = "rpm") = 142.94246573834, q_n = 1.88, p_n = 34.1 * 9.807, a = 1.32079, b = -0.88021, c = 1.44878, d = -0.88936) annotation(
        Placement(transformation(extent = {{-10, 40}, {10, 60}})));
      .ModelicaSeminar.Seminar04.AirLib.Components.StaticAirPipe R11(R = 1.3) annotation(
        Placement(transformation(extent = {{-56, 40}, {-36, 60}})));
      .ModelicaSeminar.Seminar04.AirLib.Components.StaticAirPipe R12(R = 2.018) annotation(
        Placement(transformation(extent = {{40, 40}, {60, 60}})));
      .Modelica.Blocks.Sources.Constant revInput1(k = 1365 / 60 * 2 * 3.1416) annotation(
        Placement(transformation(extent = {{-26, 68}, {-12, 82}})));
      .ModelicaSeminar.Seminar04.AirLib.Components.AirPumpInp P2(omega_n(displayUnit = "rpm") = 142.94246573834, q_n = 1.88, p_n = 34.1 * 9.807, a = 1.32079, b = -0.88021, c = 1.44878, d = -0.88936) annotation(
        Placement(transformation(extent = {{-10, -12}, {10, 8}})));
      .ModelicaSeminar.Seminar04.AirLib.Components.StaticAirPipe R21(R = 1.3) annotation(
        Placement(transformation(extent = {{-56, -12}, {-36, 8}})));
      .ModelicaSeminar.Seminar04.AirLib.Components.StaticAirPipe R22(R = 2.018) annotation(
        Placement(transformation(extent = {{40, -12}, {60, 8}})));
      .Modelica.Blocks.Sources.Constant revInput2(k = 1365 / 60 * 2 * 3.1416) annotation(
        Placement(transformation(extent = {{-26, 16}, {-12, 30}})));
      .ModelicaSeminar.Seminar04.AirLib.Components.StaticAirPipe R3(R = 0.079) annotation(
        Placement(transformation(extent = {{8, -56}, {-12, -36}})));
    equation
      connect(R11.port_b, P1.port_a) annotation(
        Line(points = {{-36, 50}, {-10, 50}}, color = {0, 127, 255}));
      connect(P1.port_b, R12.port_a) annotation(
        Line(points = {{10, 50}, {40, 50}}, color = {0, 127, 255}));
      connect(revInput1.y, P1.w) annotation(
        Line(points = {{-11.3, 75}, {0, 75}, {0, 59.8}}, color = {0, 0, 127}));
      connect(R21.port_b, P2.port_a) annotation(
        Line(points = {{-36, -2}, {-10, -2}}, color = {0, 127, 255}));
      connect(P2.port_b, R22.port_a) annotation(
        Line(points = {{10, -2}, {40, -2}}, color = {0, 127, 255}));
      connect(revInput2.y, P2.w) annotation(
        Line(points = {{-11.3, 23}, {0, 23}, {0, 7.8}}, color = {0, 0, 127}));
      connect(R12.port_b, R22.port_b) annotation(
        Line(points = {{60, 50}, {74, 50}, {74, -2}, {60, -2}}, color = {0, 127, 255}));
      connect(R21.port_a, R11.port_a) annotation(
        Line(points = {{-56, -2}, {-62, -2}, {-70, -2}, {-70, 50}, {-56, 50}}, color = {0, 127, 255}));
      connect(R3.port_b, R11.port_a) annotation(
        Line(points = {{-12, -46}, {-80, -46}, {-80, 24}, {-70, 24}, {-70, 50}, {-56, 50}}, color = {0, 127, 255}));
      connect(R3.port_a, R22.port_b) annotation(
        Line(points = {{8, -46}, {86, -46}, {86, 24}, {74, 24}, {74, -2}, {60, -2}}, color = {0, 127, 255}));
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end TestParallel;

    model TestParallel2
    extends .Modelica.Icons.Example;
      .ModelicaSeminar.Seminar04.AirLib.Components.AirPumpInp P1(omega_n(displayUnit = "rpm") = 142.94246573834, q_n = 1.88, p_n = 34.1 * 9.807, a = 1.32079, b = -0.88021, c = 1.44878, d = -0.88936) annotation(
        Placement(transformation(extent = {{-10, 40}, {10, 60}})));
      .ModelicaSeminar.Seminar04.AirLib.Components.StaticAirPipe R11(R = 1.3) annotation(
        Placement(transformation(extent = {{-56, 40}, {-36, 60}})));
      .ModelicaSeminar.Seminar04.AirLib.Components.StaticAirPipe R12(R = 2.018) annotation(
        Placement(transformation(extent = {{40, 40}, {60, 60}})));
      .Modelica.Blocks.Sources.Constant revInput1(k = 1365 / 60 * 2 * 3.1416) annotation(
        Placement(transformation(extent = {{-26, 68}, {-12, 82}})));
      .ModelicaSeminar.Seminar04.AirLib.Components.AirPumpInp P2(omega_n(displayUnit = "rpm") = 142.94246573834, q_n = 1.88, p_n = 34.1 * 9.807, a = 1.32079, b = -0.88021, c = 1.44878, d = -0.88936) annotation(
        Placement(transformation(extent = {{-10, -12}, {10, 8}})));
      .ModelicaSeminar.Seminar04.AirLib.Components.StaticAirPipe R21(R = 1.3) annotation(
        Placement(transformation(extent = {{-56, -12}, {-36, 8}})));
      .ModelicaSeminar.Seminar04.AirLib.Components.StaticAirPipe R22(R = 2.018) annotation(
        Placement(transformation(extent = {{40, -12}, {60, 8}})));
      .Modelica.Blocks.Sources.Constant revInput2(k = 1365 / 60 * 2 * 3.1416) annotation(
        Placement(transformation(extent = {{-26, 16}, {-12, 30}})));
      .ModelicaSeminar.Seminar04.AirLib.Components.StaticAirPipe R3(R = 0.079) annotation(
        Placement(transformation(extent = {{8, -56}, {-12, -36}})));
  .ModelicaSeminar.Seminar04.AirLib.Sources.AirInlet airInlet1(p_atmosphire(displayUnit = "Pa") = 1e5)  annotation(
        Placement(visible = true, transformation(origin = {-54, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(airInlet1.port_b, R3.port_b) annotation(
        Line(points = {{-44, -70}, {-28, -70}, {-28, -46}, {-12, -46}, {-12, -46}}, color = {0, 127, 255}));
      connect(R11.port_b, P1.port_a) annotation(
        Line(points = {{-36, 50}, {-10, 50}}, color = {0, 127, 255}));
      connect(P1.port_b, R12.port_a) annotation(
        Line(points = {{10, 50}, {40, 50}}, color = {0, 127, 255}));
      connect(revInput1.y, P1.w) annotation(
        Line(points = {{-11.3, 75}, {0, 75}, {0, 59.8}}, color = {0, 0, 127}));
      connect(R21.port_b, P2.port_a) annotation(
        Line(points = {{-36, -2}, {-10, -2}}, color = {0, 127, 255}));
      connect(P2.port_b, R22.port_a) annotation(
        Line(points = {{10, -2}, {40, -2}}, color = {0, 127, 255}));
      connect(revInput2.y, P2.w) annotation(
        Line(points = {{-11.3, 23}, {0, 23}, {0, 7.8}}, color = {0, 0, 127}));
      connect(R12.port_b, R22.port_b) annotation(
        Line(points = {{60, 50}, {74, 50}, {74, -2}, {60, -2}}, color = {0, 127, 255}));
      connect(R21.port_a, R11.port_a) annotation(
        Line(points = {{-56, -2}, {-62, -2}, {-70, -2}, {-70, 50}, {-56, 50}}, color = {0, 127, 255}));
      connect(R3.port_b, R11.port_a) annotation(
        Line(points = {{-12, -46}, {-80, -46}, {-80, 24}, {-70, 24}, {-70, 50}, {-56, 50}}, color = {0, 127, 255}));
      connect(R3.port_a, R22.port_b) annotation(
        Line(points = {{8, -46}, {86, -46}, {86, 24}, {74, 24}, {74, -2}, {60, -2}}, color = {0, 127, 255}));
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end TestParallel2;
  end Examples;

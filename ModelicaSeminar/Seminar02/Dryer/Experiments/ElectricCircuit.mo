within ModelicaSeminar.Seminar02.Dryer.Experiments;
  
  model ElectricCircuit
    extends .Modelica.Icons.Example;
  
    .Modelica.Electrical.Analog.Basic.Ground ground annotation(
      Placement(visible = true, transformation(origin = {-100, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V = 100, f = 50) annotation(
      Placement(visible = true, transformation(origin = {-20, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Electrical.Analog.Basic.Capacitor capacitor(C = 1e-6) annotation(
      Placement(visible = true, transformation(origin = {-22, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Electrical.Analog.Basic.Resistor resistor(R = 150) annotation(
      Placement(visible = true, transformation(origin = {-78, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = 1e-6) annotation(
      Placement(visible = true, transformation(origin = {-78, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 43, useHeatPort = true) annotation(
      Placement(visible = true, transformation(origin = {44, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Electrical.Analog.Basic.Resistor resistor11(R = 43, useHeatPort = true) annotation(
      Placement(visible = true, transformation(origin = {44, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Electrical.Analog.Ideal.IdealDiode diode annotation(
      Placement(visible = true, transformation(origin = {-84, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Electrical.Analog.Ideal.IdealDiode diode1 annotation(
      Placement(visible = true, transformation(origin = {-38, 84}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    .Modelica.Electrical.Analog.Ideal.IdealDiode diode2 annotation(
      Placement(visible = true, transformation(origin = {-84, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    .Modelica.Electrical.Analog.Ideal.IdealDiode diode3 annotation(
      Placement(visible = true, transformation(origin = {-38, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Electrical.Analog.Basic.Resistor resistor2(R = 6.26) annotation(
      Placement(visible = true, transformation(origin = {114, 74}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    .Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 293.15) annotation(
      Placement(visible = true, transformation(origin = {134, -6}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  equation
    connect(ground.p, resistor.p) annotation(
      Line(points = {{-100,-84},{-100,10},{-88,10}}, color = {0, 0, 255}));
    connect(resistor.n, resistor1.p) annotation(
      Line(points = {{-68, 10}, {34, 10}}, color = {0, 0, 255}));
    connect(resistor1.n, sineVoltage.n) annotation(
      Line(points = {{54, 10}, {82, 10}, {82, -68}, {-10, -68}, {-10, -70}}, color = {0, 0, 255}));
    connect(sineVoltage.p, ground.p) annotation(
      Line(points = {{-30,-70},{-100,-70},{-100,-84}}, color = {0, 0, 255}));
    connect(capacitor.p, sineVoltage.p) annotation(
      Line(points = {{-32, -48}, {-46, -48}, {-46, -70}, {-30, -70}}, color = {0, 0, 255}));
    connect(capacitor.n, sineVoltage.n) annotation(
      Line(points = {{-12, -48}, {2, -48}, {2, -68}, {-10, -68}, {-10, -70}}, color = {0, 0, 255}));
    connect(resistor11.p, ground.p) annotation(
      Line(points = {{34,-22},{-100,-22},{-100,-84}}, color = {0, 0, 255}));
    connect(resistor11.n, sineVoltage.n) annotation(
      Line(points = {{54, -22}, {82, -22}, {82, -68}, {-10, -68}, {-10, -70}}, color = {0, 0, 255}));
    connect(capacitor1.p, resistor.p) annotation(
      Line(points = {{-88, 36}, {-100, 36}, {-100, 10}, {-88, 10}}, color = {0, 0, 255}));
    connect(capacitor1.n, resistor.n) annotation(
      Line(points = {{-68, 36}, {-44, 36}, {-44, 10}, {-68, 10}}, color = {0, 0, 255}));
    connect(diode2.n, capacitor1.p) annotation(
      Line(points = {{-94, 60}, {-100, 60}, {-100, 36}, {-88, 36}}, color = {0, 0, 255}));
    connect(diode2.p, diode3.p) annotation(
      Line(points = {{-74, 60}, {-48, 60}}, color = {0, 0, 255}));
    connect(diode.p, diode2.n) annotation(
      Line(points = {{-94, 84}, {-100, 84}, {-100, 60}, {-94, 60}}, color = {0, 0, 255}));
    connect(diode.n, diode1.n) annotation(
      Line(points = {{-74, 84}, {-48, 84}}, color = {0, 0, 255}));
    connect(diode1.p, diode3.n) annotation(
      Line(points = {{-28, 84}, {-16, 84}, {-16, 60}, {-28, 60}}, color = {0, 0, 255}));
    connect(diode3.n, resistor.n) annotation(
      Line(points = {{-28, 60}, {-16, 60}, {-16, 10}, {-68, 10}}, color = {0, 0, 255}));
    connect(resistor2.p, diode.n) annotation(
      Line(points = {{114, 84}, {114, 102}, {-60, 102}, {-60, 84}, {-74, 84}}, color = {0, 0, 255}));
    connect(resistor2.n, diode2.p) annotation(
      Line(points = {{114, 64}, {114, 48}, {-60, 48}, {-60, 60}, {-74, 60}}, color = {0, 0, 255}));
    connect(fixedTemperature.port, resistor1.heatPort) annotation(
      Line(points = {{124, -6}, {44, -6}, {44, 0}}, color = {191, 0, 0}));
    connect(resistor11.heatPort, fixedTemperature.port) annotation(
      Line(points = {{44, -32}, {44, -40}, {112, -40}, {112, -6}, {124, -6}}, color = {191, 0, 0}));
  annotation(
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
end ElectricCircuit;

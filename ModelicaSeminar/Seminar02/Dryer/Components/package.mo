within ModelicaSeminar.Seminar02.Dryer;
  
  package Components
    
    model ElectricCircuitCompo
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
      .Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(
        Placement(visible = true, transformation(origin = {0.0,0.0}, extent = {{90.0,90.0},{110.0,110.0}}, rotation = 0.0), iconTransformation(origin = {100, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      .Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(
        Placement(visible = true, transformation(origin = {100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      .Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a annotation(
        Placement(visible = true, transformation(origin = {0.0,0.0}, extent = {{90.0,-90.0},{110.0,-70.0}}, rotation = 0.0), iconTransformation(origin = {102, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
      connect(pin_p, diode.n) annotation(
        Line(points = {{100,100},{-60,100},{-60,84},{-74,84}}, color = {0, 0, 255}));
      connect(pin_n, diode2.p) annotation(
        Line(points = {{100, 50}, {-60, 50}, {-60, 60}, {-74, 60}}, color = {0, 0, 255}));
      connect(port_a, resistor1.heatPort) annotation(
        Line(points = {{100,-80},{88,-80},{88,-10},{44,-10},{44,0}}, color = {191, 0, 0}));
      connect(port_a, resistor11.heatPort) annotation(
        Line(points = {{100,-80},{44,-80},{44,-32}}, color = {191, 0, 0}));
      annotation(
        Icon(graphics = {Bitmap(fileName="modelica://ModelicaSeminar/Resources/electric.png",origin={6,0},extent={{-103,-104},{103,104}}),Rectangle(extent={{-100,100},{100,-100}}),Text(origin={2,122},extent={{-86,28},{86,-28}},textString="%name")}, coordinateSystem(extent = {{-100, -100}, {100, 100}})));
    end ElectricCircuitCompo;
    
    model MotorMechanicalCompo
      .Modelica.Electrical.Analog.Basic.RotationalEMF emf(k = 0.014) annotation(
        Placement(visible = true, transformation(origin = {-40.0,-20.0}, extent = {{10.0,-10.0},{-10.0,10.0}}, rotation = -180.0)));
      .Modelica.Electrical.Analog.Basic.Inductor inductor(L = 2.15e-3) annotation(
        Placement(visible = true, transformation(origin = {-40, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      .Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 6.26) annotation(
        Placement(visible = true, transformation(origin = {-40, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      .Modelica.Mechanics.Rotational.Components.Damper damper(d = 7.7e-7) annotation(
        Placement(visible = true, transformation(origin = {0.0,0.0}, extent = {{-20.0,-30.0},{0.0,-10.0}}, rotation = 0.0)));
      .Modelica.Mechanics.Rotational.Components.BearingFriction bearingFriction(tau_pos = [0, 1.3e-4]) annotation(
        Placement(visible = true, transformation(origin = {0.0,0.0}, extent = {{9.999999999999998,-30.0},{30.0,-10.0}}, rotation = 0.0)));
      .Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 9.6e-7) annotation(
        Placement(visible = true, transformation(origin = {0.0,0.0}, extent = {{50.0,-30.0},{70.0,-10.0}}, rotation = 0.0)));
      .Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(
        Placement(visible = true, transformation(origin = {0.0,0.0}, extent = {{-110.0,50.0},{-90.0,70.0}}, rotation = 0.0), iconTransformation(origin = {-98, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      .Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(
        Placement(visible = true, transformation(origin = {0.0,0.0}, extent = {{-110.0,-50.0},{-90.0,-30.0}}, rotation = 0.0), iconTransformation(origin = {-102, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      .Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(
        Placement(visible = true, transformation(origin = {0.0,0.0}, extent = {{90.0,-30.0},{110.0,-10.0}}, rotation = 0.0), iconTransformation(origin = {100, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(inductor.p, resistor1.n) annotation(
        Line(points = {{-40, 34}, {-40, 22}}, color = {0, 0, 255}));
      connect(resistor1.p, emf.n) annotation(
        Line(points = {{-40,2},{-40,-10}}, color = {0, 0, 255}));
      connect(emf.flange, damper.flange_a) annotation(
        Line(points = {{-30,-20},{-20,-20}}));
      connect(damper.flange_b, bearingFriction.flange_a) annotation(
        Line(points = {{0,-20},{10,-20}}));
      connect(bearingFriction.flange_b, inertia.flange_a) annotation(
        Line(points = {{30,-20},{50,-20}}));
      connect(pin_p, inductor.n) annotation(
        Line(points = {{-100,60},{-40,60},{-40,54}}, color = {0, 0, 255}));
      connect(emf.p, pin_n) annotation(
        Line(points = {{-40,-30},{-40,-40},{-100,-40}}, color = {0, 0, 255}));
      connect(flange_a, inertia.flange_b) annotation(
        Line(points = {{100,-20},{70,-20}}));
      annotation(
        Icon(graphics = {Rectangle(extent={{-100,100},{100,-100}}),Bitmap(fileName="modelica://ModelicaSeminar/Resources/motor.png",origin={0,12},extent={{-99,-95},{99,95}}),Text(origin={-4,-132},extent={{-86,28},{86,-28}},textString="%name")}, coordinateSystem(extent = {{-100, -100}, {100, 100}})));
    end MotorMechanicalCompo;
    
    model HeatPipeCompo "Cooling circuit with pump and valve"
      parameter .Modelica.Thermal.FluidHeatFlow.Media.Medium medium = .Modelica.Thermal.FluidHeatFlow.Media.Air_30degC() "Cooling medium" annotation(
        choicesAllMatching = true);
      parameter .Modelica.Units.SI.Temperature TAmb(displayUnit = "degC") = 293.15 "Ambient temperature";
      parameter .Modelica.Units.SI.Pressure dp0 = 30 "Max. pressure increase @ V_flow=0" annotation(
        Dialog(group = "Pump characteristic"));
      parameter .Modelica.Units.SI.VolumeFlowRate V_flow0 = 1.5 "Max. volume flow rate @ dp=0" annotation(
        Dialog(group = "Pump characteristic"));
      parameter .Modelica.Units.SI.ThermalConductance G = 0.167 "Thermal conductance of heater line to air" annotation(
        Dialog(group = "Heater characteristic"));
      parameter .Modelica.Units.SI.SpecificHeatCapacity cp = 0.46 "Specific heat capacity of heater line" annotation(
        Dialog(group = "Heater characteristic"));
      parameter .Modelica.Units.SI.Density rho = 7.35 "Dencity of heater line" annotation(
        Dialog(group = "Heater characteristic"));
      parameter .Modelica.Units.SI.Length d = 0.35e-3 "Diameter of heater line" annotation(
        Dialog(group = "Heater characteristic"));
      parameter .Modelica.Units.SI.Length L = 3.36 "Diameter of heater line" annotation(
        Dialog(group = "Heater characteristic"));
      parameter .Modelica.Units.SI.Volume V = 1.26e-4 "Volume of air in pipe";
      .Modelica.Units.SI.Mass m = V*medium.rho "Mass of air in pipe";
      .Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient1(constantAmbientPressure(displayUnit = "Pa") = 0, constantAmbientTemperature = TAmb, medium = .Modelica.Thermal.FluidHeatFlow.Media.Air_30degC()) annotation(
        Placement(transformation(extent = {{-80.0,0.0},{-100.0,20.0}},rotation = 0.0,origin = {0.0,0.0})));
      .Modelica.Thermal.FluidHeatFlow.Sources.IdealPump idealPump(T0 = TAmb, V_flow0 = V_flow0, dp0(displayUnit = "Pa") = dp0, m = V*medium.rho, medium = .Modelica.Thermal.FluidHeatFlow.Media.Air_30degC(), wNominal(displayUnit = "rad/s") = 1) annotation(
        Placement(transformation(extent = {{-60.0,20.0},{-40.0,0.0}},rotation = 0.0,origin = {0.0,0.0})));
      .Modelica.Thermal.FluidHeatFlow.Components.Pipe pipe(T0 = TAmb, T0fixed = true, V_flowLaminar = 0.1, V_flowNominal = 1, dpLaminar(displayUnit = "Pa") = 0.09999999999999999, dpNominal(displayUnit = "Pa") = 1, h_g = 0, m = V*medium.rho, medium = .Modelica.Thermal.FluidHeatFlow.Media.Air_30degC(), useHeatPort = true) annotation(
        Placement(transformation(extent = {{0.0,0.0},{20.0,20.0}},rotation = 0.0,origin = {0.0,0.0})));
      .Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient2(constantAmbientTemperature = TAmb, medium = .Modelica.Thermal.FluidHeatFlow.Media.Air_30degC(), constantAmbientPressure = 0) annotation(
        Placement(transformation(extent = {{50.0,0.0},{70.0,20.0}},rotation = 0.0,origin = {0.0,0.0})));
      .Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C = cp*rho*.Modelica.Constants.pi*(d/2)^2*L, T(fixed = true, start = TAmb)) annotation(
        Placement(transformation(origin = {60.0,-60.0}, extent = {{-10.0,10.0},{10.0,-10.0}}, rotation = 90.0)));
      .Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
        Placement(transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      .Modelica.Blocks.Sources.Constant thermalConductance(k = G) annotation(
        Placement(transformation(extent = {{-40.0,-40.0},{-20.0,-20.0}},rotation = 0.0,origin = {0.0,0.0})));
      .Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b annotation(
        Placement(visible = true, transformation(origin = {0.0,0.0}, extent = {{-110.0,-70.0},{-90.0,-50.0}}, rotation = 0.0), iconTransformation(origin = {-98, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      .Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(
        Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(pipe.flowPort_b, ambient2.flowPort) annotation(
        Line(points = {{20,10},{50,10}}, color = {255, 0, 0}));
      connect(convection.solid, heatCapacitor.port) annotation(
        Line(points = {{10,-40},{10,-60},{50,-60}}, color = {191, 0, 0}));
      connect(pipe.heatPort, convection.fluid) annotation(
        Line(points = {{10,0},{10,-20}}, color = {191, 0, 0}));
      connect(thermalConductance.y, convection.Gc) annotation(
        Line(points = {{-19,-30},{0,-30}}, color = {0, 0, 127}));
      connect(ambient1.flowPort, idealPump.flowPort_a) annotation(
        Line(points = {{-80,10},{-60,10}}, color = {255, 0, 0}));
      connect(idealPump.flowPort_b, pipe.flowPort_a) annotation(
        Line(points = {{-40,10},{0,10}}, color = {255, 0, 0}));
      connect(port_b, heatCapacitor.port) annotation(
        Line(points = {{-100,-60},{50,-60}}, color = {191, 0, 0}));
      connect(flange_b, idealPump.flange_a) annotation(
        Line(points = {{-100,60},{-50,60},{-50,20}}));
      annotation(
        Documentation(info = "<html>
          <p>
          4th test example: PumpAndValve
          </p>
          The pump is running with half speed for 0.4 s,
          afterwards with full speed (using a ramp of 0.1 s).<br>
          The valve is half open for 0.9 s, afterwards full open (using a ramp of 0.1 s).<br>
          You may try to:
          <ul>
          <li>drive the pump with variable speed and let the valve full open
          to regulate the volume flow rate of coolant</li>
          <li>drive the pump with constant speed and throttle the valve
          to regulate the volume flow rate of coolant</li>
          </ul>
          </html>"),
        experiment(StopTime = 2.0, Interval = 0.001),
        Icon(graphics = {Bitmap(fileName="modelica://ModelicaSeminar/Resources/heat.png",origin={-2,2},extent={{-97,-96},{97,96}}),Rectangle(extent={{-100,100},{100,-100}}),Text(origin={-6,118},extent={{-86,28},{86,-28}},textString="%name")}, coordinateSystem(extent = {{-100, -100}, {100, 100}})));
    end HeatPipeCompo;
    annotation(
      Icon(coordinateSystem(initialScale = 1)));
  end Components;

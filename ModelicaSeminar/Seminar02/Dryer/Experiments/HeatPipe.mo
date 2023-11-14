within ModelicaSeminar.Seminar02.Dryer.Experiments;
  
  model HeatPipe
    extends .Modelica.Icons.Example;
  // Parameters
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
  // Variables
    .Modelica.Units.SI.Mass m = V * medium.rho "Mass of air in pipe";
    output .Modelica.Units.SI.TemperatureDifference dTSource = prescribedHeatFlow.port.T - TAmb "Source over Ambient";
    output .Modelica.Units.SI.TemperatureDifference dTtoPipe = prescribedHeatFlow.port.T - pipe.T_q "Source over Coolant";
    output .Modelica.Units.SI.TemperatureDifference dTCoolant = pipe.dT "Coolant's temperature increase";
    .Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient1(constantAmbientPressure(displayUnit = "Pa") = 0, constantAmbientTemperature = TAmb, medium = .Modelica.Thermal.FluidHeatFlow.Media.Air_30degC()) annotation(
      Placement(transformation(extent = {{-70, -10}, {-90, 10}})));
    .Modelica.Thermal.FluidHeatFlow.Sources.IdealPump idealPump(T0 = TAmb, V_flow0 = V_flow0, dp0(displayUnit = "Pa") = dp0, m = V * medium.rho, medium = .Modelica.Thermal.FluidHeatFlow.Media.Air_30degC(), wNominal(displayUnit = "rad/s") = 1) annotation(
      Placement(transformation(extent = {{-60, 10}, {-40, -10}})));
    .Modelica.Thermal.FluidHeatFlow.Components.Pipe pipe(T0 = TAmb, T0fixed = true, V_flowLaminar = 0.1, V_flowNominal = 1, dpLaminar(displayUnit = "Pa") = 0.1, dpNominal(displayUnit = "Pa") = 1, h_g = 0, m = V * medium.rho, medium = .Modelica.Thermal.FluidHeatFlow.Media.Air_30degC(), useHeatPort = true) annotation(
      Placement(transformation(extent = {{0, -10}, {20, 10}})));
    .Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient2(constantAmbientTemperature = TAmb, medium = .Modelica.Thermal.FluidHeatFlow.Media.Air_30degC(), constantAmbientPressure = 0) annotation(
      Placement(transformation(extent = {{40, -10}, {60, 10}})));
    .Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C = cp * rho * .Modelica.Constants.pi * (d / 2) ^ 2 * L, T(fixed = true, start = TAmb)) annotation(
      Placement(transformation(origin = {40, -50}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
    .Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
      Placement(transformation(extent = {{-30, -40}, {-10, -60}})));
    .Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
      Placement(transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    .Modelica.Blocks.Sources.Constant thermalConductance(k = G) annotation(
      Placement(transformation(extent = {{-30, -40}, {-10, -20}})));
    .Modelica.Mechanics.Rotational.Sources.Speed speed(exact = true, useSupport = false) annotation(
      Placement(visible = true, transformation(origin = {-50, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
    .Modelica.Blocks.Sources.Ramp speedRamp(height = 0.5, offset = 0.5, duration = 0.1, startTime = 0.4) annotation(
      Placement(visible = true, transformation(extent = {{-120, 62}, {-100, 82}}, rotation = 0)));
    .Modelica.Blocks.Sources.Step step(height = 1e4, startTime = 1) annotation(
      Placement(visible = true, transformation(origin = {-110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(pipe.flowPort_b, ambient2.flowPort) annotation(
      Line(points = {{20, 0}, {40, 0}}, color = {255, 0, 0}));
    connect(convection.solid, prescribedHeatFlow.port) annotation(
      Line(points = {{10, -40}, {10, -50}, {-10, -50}}, color = {191, 0, 0}));
    connect(convection.solid, heatCapacitor.port) annotation(
      Line(points = {{10, -40}, {10, -50}, {30, -50}}, color = {191, 0, 0}));
    connect(pipe.heatPort, convection.fluid) annotation(
      Line(points = {{10, -10}, {10, -20}}, color = {191, 0, 0}));
    connect(thermalConductance.y, convection.Gc) annotation(
      Line(points = {{-9, -30}, {0, -30}}, color = {0, 0, 127}));
    connect(ambient1.flowPort, idealPump.flowPort_a) annotation(
      Line(points = {{-70, 0}, {-60, 0}}, color = {255, 0, 0}));
    connect(speedRamp.y, speed.w_ref) annotation(
      Line(points = {{-99, 72}, {-50, 72}, {-50, 68}}, color = {0, 0, 127}));
    connect(speed.flange, idealPump.flange_a) annotation(
      Line(points = {{-50, 46}, {-50, 10}}));
    connect(idealPump.flowPort_b, pipe.flowPort_a) annotation(
      Line(points = {{-40, 0}, {0, 0}}, color = {255, 0, 0}));
    connect(step.y, prescribedHeatFlow.Q_flow) annotation(
      Line(points = {{-99, -50}, {-30, -50}}, color = {0, 0, 127}));
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
      experiment(StopTime = 2, Interval = 0.001, StartTime = 0, Tolerance = 1e-06));
  end HeatPipe;

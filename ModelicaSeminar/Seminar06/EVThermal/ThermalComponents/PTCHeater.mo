within ModelicaSeminar.Seminar06.EVThermal.ThermalComponents;
model PTCHeater "controlled PTC with inputs"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.TwoPort;

  .LiquidCooling.Volumes.LiquidVolume volume(redeclare package Medium = Medium,   T_start=T_start)    annotation (Placement(transformation(extent={{54.0,-10.0},{74.0,10.0}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelon.ThermoFluid.Sources.Environment_Q environment_Q(N=1,    paraOption_Qflow = true) annotation(Placement(transformation(extent = {{10.0,-10.0},{-10.0,10.0}},origin={64,50},      rotation = 180.0)));
    .Modelica.Blocks.Logical.Switch switch annotation(Placement(transformation(extent={{-12,-68},
            {8,-48}},                                                                                             origin={-48,108},  rotation = 0.0)));
    .ModelicaSeminar.Seminar06.EVThermal.Controllers.Components.LimPIDInputMinMaxReset     PID(
    y_max=Q_max,
    y_min=0,
    initType=.Modelica.Blocks.Types.Init.InitialOutput,
    y_start=Q_start,                      
    yMax = Q_max,yMin = 0,k = PID_gain,Ti = PID_Integral,
    controllerType=controllerType,                                                                                                                        
    Td = PID_derivative,
    y_reset=Q_reset.y)         annotation(Placement(transformation(extent={{-103.88,
            65.71},{-83.8798,85.71}},                                                                                                                                                                                                        origin={103.88,
            -25.71},                                                                                                                                                                                                        rotation = 0.0)));
    parameter .Modelica.Units.SI.HeatFlowRate Q_max = 250 "Maximum heat flow rate of PTC";
    parameter .Modelica.Blocks.Types.SimpleController controllerType=.Modelica.Blocks.Types.SimpleController.PI    "Type of controller";
    parameter Real PID_gain = 50 "Linear gain parameter in PID" annotation(Dialog(group = "PID"));
    parameter Real PID_Integral = 0.5 "Integral time constant for PID" annotation(Dialog(group = "PID"));
    parameter Real PID_derivative = 0.1 "Derivative time constant for PID" annotation(Dialog(group = "PID"));
    parameter .Modelica.Units.SI.HeatFlowRate Q_start=0    "Initial value of PTC heating output";
    parameter .Modelon.Media.Units.Temperature T_start=298.15 "Initial temperature";
  .Modelica.Blocks.Interfaces.RealInput T_target_degC annotation(Placement(transformation(extent = {{-120.0,30.0},{-80.0,70.0}},origin = {0.0,0.0},rotation = 0.0)));
  .Modelica.Blocks.Interfaces.RealInput T_sensed_degC annotation(Placement(transformation(extent = {{-120,-70},{-80,-30}},origin = {0,0},rotation = 0)));
  .Modelica.Blocks.Interfaces.BooleanInput control annotation(Placement(transformation(extent = {{-20.0,-20.0},{20.0,20.0}},origin = {-50.0,100.0},rotation = -90.0)));
  .Modelica.Blocks.Logical.Not not1    annotation (Placement(transformation(extent={{-40,66},{-28,78}})));
  .Modelica.Blocks.Sources.Constant Q_reset(k=0)    annotation (Placement(transformation(extent={{-6,76},{6,88}})));

equation
  connect(volume.portA, portA)    annotation (Line(points={{55,0},{-100,0}}, color={0,0,255}));
  connect(volume.portB, portB)    annotation (Line(points={{73,0},{102,0}}, color={0,0,255}));
    connect(environment_Q.port[1],volume.q) annotation(Line(points={{64,40},{64,
          8}},                                                                        color = {191,0,0}));
  connect(control, switch.u2) annotation (Line(points={{-50,100},{-50,72},{-70,72},
          {-70,50},{-62,50}}, color={255,0,255}));
  connect(T_target_degC, switch.u1) annotation (Line(points={{-100,50},{-76,50},
          {-76,58},{-62,58}}, color={0,0,127}));
  connect(T_sensed_degC, switch.u3) annotation (Line(points={{-100,-50},{-68,-50},
          {-68,42},{-62,42}}, color={0,0,127}));
  connect(switch.y, PID.u_s) annotation (Line(points={{-39,50},{-20.5,50},{-20.5,
          50},{-2.00002,50}}, color={0,0,127}));
  connect(T_sensed_degC, PID.u_m) annotation (Line(points={{-100,-50},{-10,-50},
          {-10,45},{-2.00002,45}}, color={0,0,127}));
  connect(control, not1.u) annotation (Line(points={{-50,100},{-50,72},{-41.2,72}},
        color={255,0,255}));
  connect(not1.y, PID.reset) annotation (Line(points={{-27.4,72},{8.00008,72},{8.00008,
          39}}, color={255,0,255}));
  connect(PID.y, environment_Q.Qflow_in) annotation (Line(points={{21.0002,50},{
          37.5001,50},{37.5001,50},{54,50}}, color={0,0,127}));
  annotation (Icon(graphics={
        Rectangle(extent={{-72,60},{88,-60}}, lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-72,20},{-52,-20},{-32,20},{-12,-20},{8,20},{28,-20},{48,20},
              {68,-20},{88,20}}, color={238,46,47})}));
end PTCHeater;

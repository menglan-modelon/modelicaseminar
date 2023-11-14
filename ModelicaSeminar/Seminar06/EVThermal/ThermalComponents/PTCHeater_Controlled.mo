within ModelicaSeminar.Seminar06.EVThermal.ThermalComponents;
model PTCHeater_Controlled "controlled PTC heater"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.PTCHeater;
  parameter Boolean batteryOrCabin=true "if true, battery PTC otherwise cabin PTC";
    parameter .Modelica.Units.SI.HeatFlowRate Q_max = 250 "Maximum heat flow rate of PTC";
    parameter .Modelica.Blocks.Types.SimpleController controllerType=.Modelica.Blocks.Types.SimpleController.PI
    "Type of controller";
    parameter Real PID_gain = 50 "Linear gain parameter in PID" annotation(Dialog(group = "PID"));
    parameter Real PID_Integral = 0.5 "Integral time constant for PID" annotation(Dialog(group = "PID"));
    parameter Real PID_derivative = 0.1 "Derivative time constant for PID" annotation(Dialog(group = "PID"));
    parameter .Modelica.Units.SI.HeatFlowRate Q_start=0
    "Initial value of PTC heating output";
    parameter Real efficiency=1 "PTC electrical efficiency";


  PTCHeater pTCHeater(
    redeclare package Medium = Medium,
    Q_max=Q_max,
    controllerType=controllerType,
    PID_gain=PID_gain,
    PID_Integral=PID_Integral,
    PID_derivative=PID_derivative,
    Q_start=Q_start,
    T_start=T_start)
    annotation (Placement(transformation(extent={{-30,-30},{30,30}})));
  .Modelica.Blocks.Routing.RealPassThrough realPassThroughBattery if batteryOrCabin     annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-74,74})));
  .Modelica.Blocks.Routing.RealPassThrough realPassThroughCabin if not    batteryOrCabin                                             annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-54,74})));
  .Modelica.Blocks.Routing.RealPassThrough realPassThroughBattery1 if batteryOrCabin                                               annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-28,54})));
  .Modelica.Blocks.Routing.RealPassThrough realPassThroughCabin1           if not    batteryOrCabin                                             annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-8,54})));
  .Modelica.Blocks.Routing.BooleanPassThrough booleanPassThroughBattery if batteryOrCabin                               annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={20,54})));
  .Modelica.Blocks.Routing.BooleanPassThrough booleanPassThroughCabin  if not    batteryOrCabin                                             annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={40,54})));
  .Modelica.Blocks.Routing.RealPassThrough realPassThroughBattery2 if batteryOrCabin                                               annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={60,74})));
  .Modelica.Blocks.Routing.RealPassThrough realPassThroughCabin2     if not    batteryOrCabin                                             annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={80,74})));
  .Modelica.Blocks.Sources.RealExpression T_coolant_out_degC(y=  .Modelica.Units.Conversions.to_degC(pTCHeater.volume.summary.T))
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,42})));
  .Modelica.Blocks.Sources.RealExpression P_PTC(y=pTCHeater.environment_Q.Qflow_in  /efficiency)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={92,42})));
  .Modelica.Blocks.Routing.RealPassThrough realPassThroughBattery3 if batteryOrCabin                                               annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={98,74})));
  .Modelica.Blocks.Routing.RealPassThrough realPassThroughCabin3       if notbatteryOrCabin                                             annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={118,74})));
equation
  connect(pTCHeater.portA, portA)
    annotation (Line(points={{-30,0},{-100,0}}, color={0,0,255}));
  connect(pTCHeater.portB, portB)
    annotation (Line(points={{30.6,0},{102,0}}, color={0,0,255}));
  connect(realPassThroughBattery.u, controlBus.T_PTC_target_battery)
    annotation (Line(points={{-74,81.2},{-74,86},{0,86},{0,98}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(realPassThroughCabin.u, controlBus.T_PTC_target_cabin) annotation (
      Line(points={{-54,81.2},{-54,86},{0,86},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(realPassThroughCabin.y, pTCHeater.T_target_degC)
    annotation (Line(points={{-54,67.4},{-54,15},{-30,15}}, color={0,0,127}));
  connect(realPassThroughBattery.y, pTCHeater.T_target_degC)
    annotation (Line(points={{-74,67.4},{-74,15},{-30,15}}, color={0,0,127}));
  connect(realPassThroughBattery1.u, controlBus.T_PTC_sensed_battery)
    annotation (Line(points={{-28,61.2},{-28,80},{0,80},{0,98}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(realPassThroughCabin1.u, controlBus.T_PTC_sensed_cabin) annotation (
      Line(points={{-8,61.2},{-8,80},{0,80},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(realPassThroughBattery1.y, pTCHeater.T_sensed_degC) annotation (Line(
        points={{-28,47.4},{-28,42},{-44,42},{-44,-15},{-30,-15}}, color={0,0,127}));
  connect(realPassThroughCabin1.y, pTCHeater.T_sensed_degC) annotation (Line(
        points={{-8,47.4},{-8,42},{-44,42},{-44,-15},{-30,-15}}, color={0,0,127}));
  connect(booleanPassThroughBattery.u, controlBus.PTC_enable_battery)
    annotation (Line(points={{20,61.2},{20,80},{0,80},{0,98}}, color={255,0,255}),
      Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(booleanPassThroughCabin.u, controlBus.PTC_enable_cabin) annotation (
      Line(points={{40,61.2},{40,80},{0,80},{0,98}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(booleanPassThroughBattery.y, pTCHeater.control) annotation (Line(
        points={{20,47.4},{20,40},{-15,40},{-15,30}}, color={255,0,255}));
  connect(booleanPassThroughCabin.y, pTCHeater.control) annotation (Line(points=
         {{40,47.4},{40,40},{-15,40},{-15,30}}, color={255,0,255}));
  connect(T_coolant_out_degC.y, realPassThroughBattery2.u) annotation (Line(
        points={{70,53},{70,60},{60,60},{60,66.8}}, color={0,0,127}));
  connect(T_coolant_out_degC.y, realPassThroughCabin2.u) annotation (Line(
        points={{70,53},{70,60},{80,60},{80,66.8}}, color={0,0,127}));
  connect(realPassThroughBattery2.y, controlBus.T_PTC_coolant_battery_degC)
    annotation (Line(points={{60,80.6},{60,86},{0,86},{0,98}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(realPassThroughCabin2.y, controlBus.T_PTC_coolant_cabin_degC)
    annotation (Line(points={{80,80.6},{80,86},{0,86},{0,98}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(P_PTC.y, realPassThroughBattery3.u) annotation (Line(points={{92,53},{
          92,60},{98,60},{98,66.8}}, color={0,0,127}));
  connect(P_PTC.y, realPassThroughCabin3.u) annotation (Line(points={{92,53},{92,
          60},{118,60},{118,66.8}}, color={0,0,127}));
  connect(realPassThroughBattery3.y, controlBus.P_PTC_battery) annotation (Line(
        points={{98,80.6},{98,86},{0,86},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(realPassThroughCabin3.y, controlBus.P_PTC_cabin) annotation (Line(
        points={{118,80.6},{118,86},{0,86},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
end PTCHeater_Controlled;

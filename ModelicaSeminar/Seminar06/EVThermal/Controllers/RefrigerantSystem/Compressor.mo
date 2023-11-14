within ModelicaSeminar.Seminar06.EVThermal.Controllers.RefrigerantSystem;

model Compressor "Compressor controller for CVTMS"
  .ModelicaSeminar.Seminar06.EVThermal.Controllers.RefrigerantSystem.SpeedControl
    speedControl(
    k=k,
    Ti=Ti,
    k_p=k_p,
    Ti_p=Ti_p,
    yInit=yInit,
    yMax=yMax,
    yMin=yMin,
    p_head_max_bar=p_head_max_bar,
    p_head_delta_bar=p_head_delta_bar)
    annotation (Placement(transformation(extent={{44,80},{72,52}})));
  //   parameter Boolean ctrlOrFile = true "if true, controller will be used, otherwise file data is used";
  parameter Boolean pumpControl=true
    "Constant compressor or controlled speed using PID";
  parameter Real k=-0.5 "Gain of PI block for temperature control";
  parameter .Modelica.Units.SI.Time Ti=20
    "Time constant of Integrator block for temperature control";
  parameter Real k_p=0.5 "Gain of PI block for pressure control";
  parameter .Modelica.Units.SI.Time Ti_p=1
    "Time constant of Integrator block for pressure control";
  parameter Real yInit=0 "Initial compressor speed (control signal)";
  parameter Real yMax=145 "Upper limit of output"
    annotation (Dialog(group="Parameters"));
  parameter Real yMin=1e-3 "Lower limit of output"
    annotation (Dialog(group="Parameters"));
  parameter Real p_head_max_bar=28 "max head pressure in bar" annotation (
      Dialog(group="Parameters", enable=not use_headpressure_limit_in));
  parameter Real p_head_delta_bar=0.5
    "delta head pressure for hysteresis in bar";

  .ModelicaSeminar.Seminar06.EVThermal.Interfaces.ControlBus
    controlBus annotation (Placement(transformation(extent={{-20,80},{20,120}}),
        iconTransformation(extent={{-10,90},{10,110}})));

  .Modelica.Blocks.Math.Add deltaTempBattery(k2=-1)
    annotation (Placement(transformation(extent={{-84,-24},{-68,-8}})));
  .Modelica.Blocks.Math.Add deltaTempCabin(k2=-1)
    annotation (Placement(transformation(extent={{-84,8},{-68,24}})));
  .Modelica.Blocks.Math.Add deltaTempBlended(k1=+0.5, k2=+0.5)
    annotation (Placement(transformation(extent={{-52,-8},{-36,8}})));
  .Modelica.Blocks.Sources.Constant zero(k=0)
    annotation (Placement(transformation(extent={{8,34},{20,46}})));
  .Modelica.Blocks.Sources.BooleanExpression enablePumpControl(y=pumpControl)
    annotation (Placement(transformation(extent={{-40,56},{-20,76}})));
  .Modelica.Blocks.Routing.BooleanPassThrough frontEvapValve
    annotation (Placement(transformation(extent={{-84,-62},{-68,-46}})));
  parameter Real batterySetPointTable[:,2]=[0.0,30; 1e6,30]
    "Battery temp set point table";
  parameter Real EvapAirOutTSetPointTable[:,2]=[0.0,2.5; 1e6,2.5]
    "Eav air outlet temperature set point table";
  .Modelica.Blocks.Logical.And cabinOnly
    annotation (Placement(transformation(extent={{-24,-84},{-12,-72}})));
  .Modelica.Blocks.Logical.Nor batteryOnly
    annotation (Placement(transformation(extent={{-24,-60},{-12,-48}})));
  .Modelica.Blocks.Logical.Switch switchCabin
    annotation (Placement(transformation(extent={{58,-2},{78,18}})));
  .Modelica.Blocks.Logical.Switch switchBattery
    annotation (Placement(transformation(extent={{12,2},{32,-18}})));
  .Modelica.Blocks.Routing.BooleanPassThrough batteryValve
    annotation (Placement(transformation(extent={{-84,-86},{-68,-70}})));
  .Modelica.Blocks.Logical.Or either
    annotation (Placement(transformation(extent={{-24,-38},{-12,-26}})));
  .Modelica.Blocks.Logical.And enable
    annotation (Placement(transformation(extent={{8,60},{20,72}})));
  .Modelica.Blocks.Logical.Not batteryNot
    annotation (Placement(transformation(extent={{-54,-84},{-42,-72}})));
equation
  connect(either.y, enable.u2) annotation (Line(points={{-11.4,-32},{-6,-32},{-6,
          61.2},{6.8,61.2}},                     color={255,0,255}));
  connect(either.u1, batteryValve.y) annotation (Line(points={{-25.2,-32},{-60,-32},
          {-60,-78},{-67.2,-78}}, color={255,0,255}));
  connect(batteryValve.u, controlBus.battChillTXVOnOff) annotation (Line(points={{-85.6,
          -78},{-90,-78},{-90,100},{0,100}},        color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(switchBattery.u2, batteryOnly.y) annotation (Line(points={{10,-8},{0,-8},
          {0,-54},{-11.4,-54}},    color={255,0,255}));
  connect(deltaTempBlended.y, switchBattery.u3)
    annotation (Line(points={{-35.2,0},{10,0}},color={0,0,127}));
  connect(deltaTempBlended.u1, deltaTempCabin.y) annotation (Line(points={{-53.6,
          4.8},{-60,4.8},{-60,16},{-67.2,16}}, color={0,0,127}));
  connect(deltaTempCabin.u2, controlBus.EvapAirOutT_degC_setpoint) annotation (
      Line(points={{-85.6,11.2},{-90,11.2},{-90,100},{0,100}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(deltaTempCabin.u1, controlBus.evapAirOutT_degC) annotation (Line(
        points={{-85.6,20.8},{-90,20.8},{-90,100},{0,100}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(frontEvapValve.u, controlBus.frontEvapTXVOnOff) annotation (Line(
        points={{-85.6,-54},{-90,-54},{-90,100},{0,100}}, color={255,0,255}),
      Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(zero.y, speedControl.T_desired_C) annotation (Line(points={{20.6,40},{
          26,40},{26,60.4},{44,60.4}}, color={0,0,127}));
  connect(deltaTempBattery.u2, controlBus.BattTemp_degC_setpoint) annotation (
      Line(points={{-85.6,-20.8},{-90,-20.8},{-90,100},{0,100}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(deltaTempBattery.u1, controlBus.batteryTemp_degC) annotation (Line(points={{-85.6,
          -11.2},{-90,-11.2},{-90,100},{0,100}},        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(cabinOnly.u1, frontEvapValve.y) annotation (Line(points={{-25.2,-78},{
          -32,-78},{-32,-54},{-67.2,-54}}, color={255,0,255}));
  connect(batteryOnly.u1, frontEvapValve.y)
    annotation (Line(points={{-25.2,-54},{-67.2,-54}}, color={255,0,255}));
  connect(switchCabin.u2, cabinOnly.y) annotation (Line(points={{56,8},{46,8},{46,
          -78},{-11.4,-78}},color={255,0,255}));
  connect(switchBattery.y, switchCabin.u3)
    annotation (Line(points={{33,-8},{40,-8},{40,0},{56,0}}, color={0,0,127}));
  connect(deltaTempCabin.y, switchCabin.u1)
    annotation (Line(points={{-67.2,16},{56,16}}, color={0,0,127}));
  connect(deltaTempBattery.y, switchBattery.u1)
    annotation (Line(points={{-67.2,-16},{10,-16}}, color={0,0,127}));
  connect(deltaTempBlended.u2, deltaTempBattery.y) annotation (Line(points={{-53.6,
          -4.8},{-60,-4.8},{-60,-16},{-67.2,-16}}, color={0,0,127}));
  connect(switchCabin.y, speedControl.T_sensed_C) annotation (Line(points={{79,8},{
          90,8},{90,34},{30,34},{30,54.8},{44,54.8}}, color={0,0,127}));
  connect(batteryNot.u, batteryValve.y)
    annotation (Line(points={{-55.2,-78},{-67.2,-78}}, color={255,0,255}));
  connect(batteryNot.y, batteryOnly.u2) annotation (Line(points={{-41.4,-78},{-36,
          -78},{-36,-58.8},{-25.2,-58.8}}, color={255,0,255}));
  connect(batteryNot.y, cabinOnly.u2) annotation (Line(points={{-41.4,-78},{-36,
          -78},{-36,-82.8},{-25.2,-82.8}}, color={255,0,255}));
  connect(enable.y, speedControl.control)
    annotation (Line(points={{20.6,66},{44,66}},   color={255,0,255}));
  connect(enable.u1, enablePumpControl.y)
    annotation (Line(points={{6.8,66},{-19,66}},   color={255,0,255}));
  connect(either.u2, frontEvapValve.y) annotation (Line(points={{-25.2,-36.8},{-32,
          -36.8},{-32,-54},{-67.2,-54}}, color={255,0,255}));
  connect(controlBus.p_discharge_bar, speedControl.p_sensed_bar) annotation (
      Line(points={{0,100},{0,78},{30,78},{30,71.6},{44,71.6}},
                                                            color={0,0,127}),
      Text(
      string="%second",
      index=2,
      extent={{3,9},{3,9}},
      horizontalAlignment=TextAlignment.Left));
  connect(speedControl.y, controlBus.compSpeed) annotation (Line(points={{73.4,66},
          {90,66},{90,100},{0,100}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,-3},{6,-3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
                                Text(
          textString="%name",
          extent={{-76,42},{68,-34}},
          lineColor={0,0,255})}),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>The output from this model is compressor speed, which is provided using the <a href=\"modelica://IndustryExamples.Automotive.ThermalManagement.CabinAndBatteryRefrigerantCoolantSystem.Controls.SpeedControl\">SpeedControl</a> component.
This compressor speed is sent to the controlBus, to be passed to the refrigeration loop. 
The measured and desired temperatures, as well as the sensed and maximum head pressure in bar, are all inputs to this component.</p>
<p>Sensed temperature is the result of combining two different temperatures (battery temperature and evaporator air outlet temperature). 
It is calculated using the difference between the measured temperature and the setpoint temperature.</p></html>",
        revisions="<html>
Copyright &copy; 2004-2023, MODELON AB <br /> The use of this software component is regulated by the licensing conditions for Modelon Libraries. <br />This copyright notice must, unaltered, accompany all components that are derived from, copied from, <br />or by other means have their origin from any Modelon Library.
</html>"));
end Compressor;

within ModelicaSeminar.Seminar06.EVThermal.Controllers.RefrigerantSystem;
model System
  parameter String fileName=.Modelica.Utilities.Files.loadResource("modelica://ModelicaSeminar/Resources/Data/Rev26_Controls_Cooling1.txt") "file with controls inputs";

  .Modelica.Blocks.Sources.CombiTimeTable SHFrontEvap_SP(
    tableOnFile=true,
    tableName="SHFrontEvap_SP",
    fileName=fileName)
    annotation (Placement(transformation(extent={{-100.0,50.0},{-80.0,70.0}},rotation = 0.0,origin = {0.0,0.0})));
  .ModelicaSeminar.Seminar06.EVThermal.Controllers.RefrigerantSystem.Compressor
    compressor(
    pumpControl=pumpControl,
    k=k,
    Ti=Ti,
    k_p=k_p,
    Ti_p=Ti_p,
    yInit=yInit,
    yMax=yMax,
    yMin=yMin,
    p_head_max_bar=p_head_max_bar,
    p_head_delta_bar=p_head_delta_bar)
    annotation (Placement(transformation(extent={{12,28},{-20,60}})));
  .ModelicaSeminar.Seminar06.EVThermal.Controllers.RefrigerantSystem.Battery
    battery(
    dTbatt_hysteresis_high=dTbatt_hysteresis_high,
    dTbatt_hysteresis_low=dTbatt_hysteresis_low,
    id_battery=id_battery,
    mdot_coolant=mdot_coolant,
    mdot_coolant_min=mdot_coolant_min) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=0.0,
        origin={-6,-20})));
  .ModelicaSeminar.Seminar06.EVThermal.Interfaces.ControlBus
    controlBus annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={100,0}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={100,0})));
  .ModelicaSeminar.Seminar06.EVThermal.Controllers.RefrigerantSystem.Evaporator
    evaporator(dTEvap_hysteresis_high=dTEvap_hysteresis_high,
      dTEvap_hysteresis_low=dTEvap_hysteresis_low,
    SH_init=5)
    annotation (Placement(transformation(extent={{-20,-100},{10,-70}})));
  parameter Boolean pumpControl=true
    "Constant compressor or controlled speed using PID"
    annotation (Dialog(group="Compressor control parameters"));
  parameter Real k=-0.5 "Gain of PI block for temperature control"
    annotation (Dialog(group="Compressor control parameters"));
  parameter .Modelica.Units.SI.Time Ti=20
    "Time constant of Integrator block for temperature control"
    annotation (Dialog(group="Compressor control parameters"));
  parameter Real k_p=0.5 "Gain of PI block for pressure control"
    annotation (Dialog(group="Compressor control parameters"));
  parameter .Modelica.Units.SI.Time Ti_p=1
    "Time constant of Integrator block for pressure control"
    annotation (Dialog(group="Compressor control parameters"));
  parameter .Modelica.Units.SI.Frequency yInit=10 "Initial speed (control signal)"
    annotation (Dialog(group="Compressor control parameters"));
  parameter .Modelica.Units.SI.Frequency yMax=145 "Upper speed limit (control output)"
    annotation (Dialog(group="Compressor control parameters"));
  parameter .Modelica.Units.SI.Frequency yMin=1e-6 "Lower speed limit (control output)"
    annotation (Dialog(group="Compressor control parameters"));
  parameter Real p_head_max_bar=28 "max head pressure in bar"
    annotation (Dialog(group="Compressor control parameters"));
  parameter Real p_head_delta_bar=0.5
    "delta head pressure for hysteresis in bar"
    annotation (Dialog(group="Compressor control parameters"));

  parameter .Modelica.Units.SI.TemperatureDifference dTbatt_hysteresis_high=1
    "temperature delta for hysteresis, high limit"
    annotation (Dialog(group="Battery control parameters"));
  parameter .Modelica.Units.SI.TemperatureDifference dTbatt_hysteresis_low=1
    "temperature delta for hysteresis, low limit"
    annotation (Dialog(group="Battery control parameters"));

  parameter .Modelica.Units.SI.TemperatureDifference dTEvap_hysteresis_high=1
    "temperature delta for hysteresis, high limit"
    annotation (Dialog(group="Evaporator control parameters"));
  parameter .Modelica.Units.SI.TemperatureDifference dTEvap_hysteresis_low=1
    "temperature delta for hysteresis, low limit"
    annotation (Dialog(group="Evaporator control parameters"));
  parameter Integer id_battery=1 "Identifier of the battery controller"
    annotation (Dialog(group="Battery control parameters"));
  parameter .Modelica.Units.SI.MassFlowRate mdot_coolant=0.21
    "coolant mass flow rate" annotation (Dialog(group="Coolant flow control parameters"));
  parameter .Modelica.Units.SI.MassFlowRate mdot_coolant_min=0
    "min coolant mass flow rate when no cooling is required" annotation (Dialog(group="Coolant flow control parameters"));
    .Modelica.Blocks.Routing.RealPassThrough set_SHFrontEvap_SP annotation(Placement(transformation(extent = {{-72.0,56.0},{-64.0,64.0}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Blocks.Routing.RealPassThrough set_SHBattChiller_SP annotation(Placement(transformation(extent = {{-74.0,16.0},{-66.0,24.0}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Blocks.Sources.CombiTimeTable SHBattChiller_SP(fileName = fileName,tableName = "SHBattChiller_SP",tableOnFile = true) annotation(Placement(transformation(extent = {{-100.0,10.0},{-80.0,30.0}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Blocks.Sources.CombiTimeTable EvapAirOutT_degC_SP(fileName = fileName,tableName = "EvapAirOutT_degC_SP",tableOnFile = true) annotation(Placement(transformation(extent = {{-100.0,-30.0},{-80.0,-10.0}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Blocks.Routing.RealPassThrough set_BattTemp_degC_SP annotation(Placement(transformation(extent = {{-74.0,-64.0},{-66.0,-56.0}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Blocks.Sources.CombiTimeTable BattTemp_degC_SP(fileName = fileName,tableName = "BattTemp_degC_SP",tableOnFile = true) annotation(Placement(transformation(extent = {{-100.0,-70.0},{-80.0,-50.0}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Blocks.Routing.RealPassThrough set_EvapAirOutT_degC_SP annotation(Placement(transformation(extent = {{-74.0,-24.0},{-66.0,-16.0}},rotation = 0.0,origin = {0.0,0.0})));
  Condenser_File condenser(fileName=fileName)
    annotation (Placement(transformation(extent={{30,-76},{60,-46}})));
equation
  connect(evaporator.controlBus, controlBus) annotation (Line(
      points={{10,-85},{100,-85},{100,0}},
      color={255,204,51},
      thickness=0.5));
  connect(battery.controlBus, controlBus) annotation (Line(
      points={{10,-20},{100,-20},{100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
    connect(set_SHFrontEvap_SP.y, controlBus.SHFrontEvap_SP_in) annotation (Line(points={{-63.6,60},{-60,60},{-60,0},{100,0}},   color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
    connect(SHFrontEvap_SP.y[1],set_SHFrontEvap_SP.u) annotation(Line(points = {{-79,60},{-72.8,60}},color = {0,0,127}));
    connect(BattTemp_degC_SP.y[1],set_BattTemp_degC_SP.u) annotation(Line(points = {{-79,-60},{-74.8,-60}},color = {0,0,127}));
    connect(EvapAirOutT_degC_SP.y[1],set_EvapAirOutT_degC_SP.u) annotation(Line(points = {{-79,-20},{-74.8,-20}},color = {0,0,127}));
    connect(set_EvapAirOutT_degC_SP.y,controlBus.EvapAirOutT_degC_setpoint) annotation(Line(points = {{-65.6,-20},{-60,-20},{-60,0},{100,0}},color = {0,0,127}));
    connect(set_BattTemp_degC_SP.y,controlBus.BattTemp_degC_setpoint) annotation(Line(points = {{-65.6,-60},{-60,-60},{-60,0},{100,0}},color = {0,0,127}));
    connect(SHBattChiller_SP.y[1],set_SHBattChiller_SP.u) annotation(Line(points = {{-79,20},{-74.8,20}},color = {0,0,127}));
    connect(set_SHBattChiller_SP.y,controlBus.SHBattChiller_SP_in) annotation(Line(points = {{-65.6,20},{-60,20},{-60,0},{100,0}},color = {0,0,127}));
  connect(condenser.controlBus, controlBus) annotation (Line(
      points={{60,-61},{100,-61},{100,0}},
      color={255,204,51},
      thickness=0.5));
  connect(compressor.controlBus, controlBus) annotation (Line(
      points={{-4,60},{-4,64},{100,64},{100,0}},
      color={255,204,51},
      thickness=0.5));
  annotation (Icon(graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-70,-24},{-64,-20},{-64,2},{-72,-4},{-70,-24}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={135,135,135}),
        Polygon(
          points={{-76,0},{-68,4},{-52,0},{-60,-6},{-76,0}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={175,175,175}),
        Polygon(
          points={{-60,-8},{-60,-6},{-76,0},{-72,-24},{-70,-24},{-72,-4},{-60,-8}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={215,215,215}),
        Polygon(
          points={{-46,-8},{-40,-4},{-40,18},{-48,12},{-46,-8}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={135,135,135}),
        Polygon(
          points={{-52,16},{-44,20},{-28,16},{-36,10},{-52,16}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={175,175,175}),
        Polygon(
          points={{-36,8},{-36,10},{-52,16},{-48,-8},{-46,-8},{-48,12},{-36,8}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={215,215,215}),
        Polygon(
          points={{-20,6},{-14,10},{-14,32},{-22,26},{-20,6}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={135,135,135}),
        Polygon(
          points={{-26,30},{-18,34},{-2,30},{-10,24},{-26,30}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={175,175,175}),
        Polygon(
          points={{-10,22},{-10,24},{-26,30},{-22,6},{-20,6},{-22,26},{-10,22}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={215,215,215}),
        Polygon(
          points={{-70,-8},{-70,-24},{-4,-42},{-4,-26},{-70,-8}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={135,135,135}),
        Polygon(
          points={{-4,-42},{66,18},{66,32},{-4,-26},{-4,-42}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={48,48,48}),
        Polygon(
          points={{-70,-8},{-4,-26},{66,32},{4,42},{-70,-8}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={95,95,95}),
        Polygon(
          points={{4,-30},{4,-32},{16,-34},{12,-56},{14,-58},{20,-32},{4,-30}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={215,215,215}),
        Polygon(
          points={{4,-30},{12,-24},{28,-26},{20,-32},{4,-30}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={175,175,175}),
        Polygon(
          points={{14,-58},{20,-54},{28,-26},{20,-32},{14,-58}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={135,135,135}),
        Polygon(
          points={{28,-8},{28,-10},{40,-12},{36,-34},{38,-36},{44,-10},{28,-8}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={215,215,215}),
        Polygon(
          points={{38,-36},{44,-32},{52,-4},{44,-10},{38,-36}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={135,135,135}),
        Polygon(
          points={{28,-8},{36,-2},{52,-4},{44,-10},{28,-8}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={175,175,175}),
        Polygon(
          points={{52,12},{52,10},{64,8},{60,-14},{62,-16},{68,10},{52,12}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={215,215,215}),
        Polygon(
          points={{62,-16},{68,-12},{76,16},{68,10},{62,-16}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={135,135,135}),
        Polygon(
          points={{52,12},{60,18},{76,16},{68,10},{52,12}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={175,175,175}),
                              Text(
          extent={{-120,15},{120,-15}},
          lineColor={0,0,0},
          textString="%name",
          textStyle={TextStyle.Bold},
          origin={0,119},
          rotation=360)}),            Documentation(info="<html>
<p>This is the controller for the system in the <a href=\"modelica://IndustryExamples.Automotive.ThermalManagement.CabinAndBatteryRefrigerantCoolantSystem.Experiments.CabinAndBatteryRefrigerantCoolantSystem\">CabinAndBatteryRefrigerantCoolantSystem</a> experiment. 
The system controller is made up of sub-controllers that communicate via a common control bus.
These control compressor speed, evaporator outlet temperature, and battery temperature.</p>

<h4>Parameterization</h4></p>
<p><i>yMax </i>and <i>yMin
</i>- maximum and minimum compressor speed respectively</p>
<p><i>p_head_max_bar
-</i> maximum set point of head pressure in bar</p>
<p><i>p_head_delta_bar
- </i>maximum allowed deviation from max head pressure</p><p>All other control parameters are also available. For more information regarding component parametrization please see the documentation for individual components.</p></html>",
        revisions="<html>
Copyright &copy; 2004-2023, MODELON AB <br /> The use of this software component is regulated by the licensing conditions for Modelon Libraries. <br />This copyright notice must, unaltered, accompany all components that are derived from, copied from, <br />or by other means have their origin from any Modelon Library.
</html>"));
end System;

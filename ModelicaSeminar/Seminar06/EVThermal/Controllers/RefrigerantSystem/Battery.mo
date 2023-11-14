within ModelicaSeminar.Seminar06.EVThermal.Controllers.RefrigerantSystem;
model Battery
  .ModelicaSeminar.Seminar06.EVThermal.Interfaces.ControlBus    controlBus annotation (Placement(transformation(
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=270.0,
        origin={100.0,0.0}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={100,0})));
  parameter .Modelica.Units.SI.TemperatureDifference dTbatt_hysteresis_high=1    "temperature delta for hysteresis, high limit";
  parameter .Modelica.Units.SI.TemperatureDifference dTbatt_hysteresis_low=1    "temperature delta for hysteresis, low limit";
  .Modelica.Blocks.Math.BooleanToReal rate(realTrue=mdot_coolant, realFalse= mdot_coolant_min)    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  parameter Integer id_battery=1 "Identifier of the battery controller";
  parameter .Modelica.Units.SI.MassFlowRate mdot_coolant=0.21 "coolant mass flow rate";
  parameter .Modelica.Units.SI.MassFlowRate mdot_coolant_min=0 "min coolant mass flow rate when no cooling is required";
  .Modelon.Blocks.Logical.HysteresisVariable hysteresis annotation (Placement(
        transformation(
        extent={{-60.0,-10.0},{-40.0,10.0}},
        rotation=0.0,
        origin={60,0})));
  .Modelica.Blocks.Routing.RealPassThrough batteryTargetTemp    annotation (Placement(transformation(extent={{80,-100},{60,-80}})));
  .Electrification.Utilities.Blocks.RescaleGainOffset lowBound(offset=-dTbatt_hysteresis_low)    annotation (Placement(transformation(extent={{-48,-28},{-28,-8}})));
  .Electrification.Utilities.Blocks.RescaleGainOffset highBound(offset=dTbatt_hysteresis_high)    annotation (Placement(transformation(extent={{-48,6},{-28,26}})));
  .Modelica.Blocks.Routing.RealPassThrough SHBattChillerSP_in    annotation (Placement(transformation(extent={{80,-72},{60,-52}})));
    
equation
  connect(lowBound.y, hysteresis.uLow) annotation (Line(points={{-27,-18},{-20,
          -18},{-20,-6},{-2,-6}}, color={0,0,127}));
  connect(highBound.y, hysteresis.uHigh) annotation (Line(points={{-27,16},{-20,
          16},{-20,6},{-2,6}}, color={0,0,127}));
  connect(rate.y, controlBus.BatteryCoolantFlow) annotation (Line(points={{61,0},{
          100,0}},           color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(batteryTargetTemp.u, controlBus.BattTemp_degC_setpoint) annotation (
      Line(points={{82,-90},{100,-90},{100,0}},color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(hysteresis.y, rate.u)    annotation (Line(points={{21,0},{38,0}}, color={255,0,255}));
  connect(hysteresis.y, controlBus.battChillTXVOnOff) annotation (Line(points={{
          21,0},{30,0},{30,-22},{100,-22},{100,0}}, color={255,0,255}), Text(
      string="%second",
      index=3,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(batteryTargetTemp.y, lowBound.u) annotation (Line(points={{59,-90},{-56,-90},{
          -56,-18},{-50,-18}},           color={0,0,127}));
  connect(batteryTargetTemp.y, highBound.u) annotation (Line(points={{59,-90},{-56,-90},{
          -56,16},{-50,16}},           color={0,0,127}));
  connect(SHBattChillerSP_in.u, controlBus.SHBattChiller_SP_in) annotation (
      Line(points={{82,-62},{100,-62},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(SHBattChillerSP_in.y, controlBus.SHBattChiller_SP) annotation (Line(
        points={{59,-62},{20,-62},{20,-34},{100,-34},{100,0}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(hysteresis.u, controlBus.batteryTemp_degC) annotation (Line(points={{
          -2,0},{-10,0},{-10,30},{100,30},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
                                Text(
          textString="%name",
          origin={-4,4},
          extent={{-72,38},{72,-38}},
          lineColor={0,0,255})}),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html><p>This controller controls the battery temperature by closing the TXV available before the battery chiller in the refrigeration loop.</p>
<p>Hysteresis receives battery temperature from the control bus. Hysteresis upper and lower limits are defined with a small variation from the set point. Top-level parameters <em>dTbatt_hysteresis_high </em>and <em>dTbatt_hysteresis_low</em> give the deviations. Hysteresis determines the flow of coolant through the battery loop. There is flow if hysteresis.y is true.</p></html>",
        revisions="<html>
Copyright &copy; 2004-2023, MODELON AB <br /> The use of this software component is regulated by the licensing conditions for Modelon Libraries. <br />This copyright notice must, unaltered, accompany all components that are derived from, copied from, <br />or by other means have their origin from any Modelon Library.
</html>"));
end Battery;

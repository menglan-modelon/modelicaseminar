within ModelicaSeminar.Seminar06.EVThermal.Controllers.RefrigerantSystem;
model Evaporator
  .Modelon.Blocks.Logical.HysteresisVariable hysteresis annotation (Placement(
        transformation(
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0.0,
        origin={0.0,0.0})));
  .Modelica.Blocks.Sources.RealExpression realExpression1(y=
        EvapAirOutT_degC_setpoint.y - dTEvap_hysteresis_low)    annotation (Placement(transformation(extent={{-50,-30},{-30,-10}})));
  .Modelica.Blocks.Sources.RealExpression realExpression2(y=
        EvapAirOutT_degC_setpoint.y + dTEvap_hysteresis_high)    annotation (Placement(transformation(extent={{-50,10},{-30,30}})));
  .ModelicaSeminar.Seminar06.EVThermal.Interfaces.ControlBus controlBus annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={100,0}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={100,0})));
  .Modelica.Blocks.Routing.RealPassThrough EvapAirOutT_degC_setpoint
    annotation (Placement(transformation(extent={{10,-80},{-10,-60}})));

  parameter .Modelica.Units.SI.TemperatureDifference dTEvap_hysteresis_high=1
    "temperature delta for hysteresis, high limit";
  parameter .Modelica.Units.SI.TemperatureDifference dTEvap_hysteresis_low=1
    "temperature delta for hysteresis, low limit";
  parameter Real SH_init=3 "initial superheat value";

  .Modelica.Blocks.Sources.BooleanConstant booleanConstant    annotation (Placement(transformation(extent={{33,-7},{47,7}})));
  .Modelica.Blocks.Routing.RealPassThrough SHFrontEvapSP_in    annotation (Placement(transformation(extent={{80,-60},{60,-40}})));
  .ModelicaSeminar.Seminar06.EVThermal.Controllers.Components.LimPIDInputMinMaxReset
    limPIReset(
    controllerType=.Modelica.Blocks.Types.SimpleController.PI,
    Ti=20,
    use_limits_in=true,
    initType=.Modelica.Blocks.Types.Init.InitialOutput,
    y_start=SH_init,
    y_reset=0)
    annotation (Placement(transformation(extent={{-50,-60},{-30,-40}})));
  .Modelica.Blocks.Routing.RealPassThrough EvapAirOutT_degC    annotation (Placement(transformation(extent={{40,-100},{20,-80}})));
  .Modelica.Blocks.Sources.Constant SHmax(k=50)    annotation (Placement(transformation(extent={{20,-42},{0,-22}})));
  .Modelica.Blocks.Sources.BooleanConstant  booleanConstant1(k=false)    annotation (Placement(transformation(extent={{-81,-73},{-67,-59}})));
equation
  connect(realExpression2.y, hysteresis.uHigh) annotation (Line(points={{-29,20},
          {-18,20},{-18,6},{-12,6}}, color={0,0,127}));
  connect(realExpression1.y, hysteresis.uLow) annotation (Line(points={{-29,-20},
          {-20,-20},{-20,-6},{-12,-6}}, color={0,0,127}));
  connect(EvapAirOutT_degC_setpoint.u, controlBus.EvapAirOutT_degC_setpoint)    annotation (Line(points={{12,-70},{100,-70},{100,0}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(SHFrontEvapSP_in.u, controlBus.SHFrontEvap_SP_in) annotation (Line(
        points={{82,-50},{100,-50},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EvapAirOutT_degC_setpoint.y, limPIReset.u_s) annotation (Line(points={
          {-11,-70},{-60,-70},{-60,-50},{-52,-50}}, color={0,0,127}));
  connect(EvapAirOutT_degC.u, controlBus.evapAirOutT_degC) annotation (Line(
        points={{42,-90},{100,-90},{100,0}},                   color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EvapAirOutT_degC.y, limPIReset.u_m)    annotation (Line(points={{19,-90},{-52,-90},{-52,-55}}, color={0,0,127}));
  connect(EvapAirOutT_degC.y, hysteresis.u) annotation (Line(points={{19,-90},{-64,
          -90},{-64,0},{-12,0}}, color={0,0,127}));
  connect(SHFrontEvapSP_in.y, limPIReset.yMin) annotation (Line(points={{59,-50},
          {-12,-50},{-12,-68},{-35,-68},{-35,-62}}, color={0,0,127}));
  connect(SHmax.y, limPIReset.yMax)    annotation (Line(points={{-1,-32},{-35,-32},{-35,-38}}, color={0,0,127}));
  connect(limPIReset.y, controlBus.SHFrontEvap_SP) annotation (Line(points={{
          -29,-50},{-14,-50},{-14,-16},{100,-16},{100,0}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(booleanConstant.y, controlBus.frontEvapTXVOnOff) annotation (Line(
        points={{47.7,8.88178e-16},{48,8.88178e-16},{48,0},{100,0}},
                                                   color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(booleanConstant1.y, limPIReset.reset) annotation (Line(points={{-66.3,
          -66},{-42,-66},{-42,-61}}, color={255,0,255}));
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
    Documentation(info="<html><p>This controller controls the evaporator air outlet temperature by closing the TXV available before the front evaporator in the refrigeration loop.</p>
<p>Hysteresis receives evaporator air outlet temperature from the control bus. Hysteresis upper and lower limits are defined with a small variation from the set point. Top-level parameters <em>dTEvap_hysteresis_high </em>and <em>dTEvap_hysteresis_low</em> give the deviations. Set point for evaporator air outlet temperature signal is received via the control bus.</p></html>",
        revisions="<html>
Copyright &copy; 2004-2023, MODELON AB <br /> The use of this software component is regulated by the licensing conditions for Modelon Libraries. <br />This copyright notice must, unaltered, accompany all components that are derived from, copied from, <br />or by other means have their origin from any Modelon Library.
</html>"));
end Evaporator;

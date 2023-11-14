within ModelicaSeminar.Seminar06.EVThermal.ThermalComponents;
model Fan "fan air flow source"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.AirFlow;
  parameter Integer id=1 "component ID";
  parameter .Modelon.ThermoFluid.Choices.RealTemperatureUnit temperatureUnit=
      .Modelon.ThermoFluid.Choices.RealTemperatureUnit.K
    "Unit of temperature real input signal";
  .LiquidCooling.Sources.GasPressureSource gasPressureBoundary(
    p=101300,
    T=293.15,
    temperatureUnit=temperatureUnit,
    use_T_in=true)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  .LiquidCooling.Fans.Fan fan(
    Tau=0.5,
    redeclare replaceable model Characteristics =
        .Modelon.ThermoFluid.Fans.Characteristics.TableBasedDimensionless (
        DHub_nom=0.2,
        mapVflow=[-0.1,0.35; 0.3,0.06],
        mapPfan=[-0.1,0.017; 0.3,0.093]),
    mechanicalLoss=5,
    m_flow_start=1)
    annotation (Placement(transformation(extent={{-30,-30},{30,30}})));
  .Modelica.Mechanics.Rotational.Sources.Speed speed annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,50})));
  .Modelica.Blocks.Math.Gain rpm_to_radpers(k=.Modelica.Constants.pi/30)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={0,72})));
  .Modelica.Blocks.Sources.RealExpression fanPower(y=fan.summary.P)
    annotation (Placement(transformation(extent={{60,80},{40,100}})));
equation
  connect(gasPressureBoundary.T_in, controlBus.T_air[id]) annotation (Line(
        points={{-70,10},{-70,90},{0,90},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(speed.flange, fan.shaft) annotation (Line(points={{-1.77636e-15,40},{-1.77636e-15,
          39.7},{0,39.7},{0,29.4}}, color={0,0,0}));
  connect(rpm_to_radpers.y, speed.w_ref) annotation (Line(points={{-8.04912e-16,
          67.6},{-8.04912e-16,64.8},{2.22045e-15,64.8},{2.22045e-15,62}}, color=
         {0,0,127}));
  connect(rpm_to_radpers.u, controlBus.fanRPM[id]) annotation (Line(points={{8.88178e-16,
          76.8},{8.88178e-16,87.4},{0,87.4},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(fanPower.y, controlBus.P_fan[id]) annotation (Line(points={{39,90},{0,
          90},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(gasPressureBoundary.port, fan.portA)
    annotation (Line(points={{-60,0},{-30,0}}, color={85,170,255}));
  connect(fan.portB, port)
    annotation (Line(points={{30,0},{100,0}}, color={85,170,255}));
end Fan;

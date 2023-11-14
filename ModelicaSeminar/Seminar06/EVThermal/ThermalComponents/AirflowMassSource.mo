within ModelicaSeminar.Seminar06.EVThermal.ThermalComponents;
model AirflowMassSource "air mass flow source"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.AirFlow;
  parameter Integer id=1 "component ID";
    .LiquidCooling.Sources.GasFlowSource  flowSource(
    redeclare package Medium = Medium,
    temperatureUnit=temperatureUnit,
    use_flow_in=true,
    use_T_in=true)                                                           annotation(Placement(transformation(extent={{
            -287.143,455.42},{-226.927,515.637}},                                                                                                                                                          rotation = 0.0,origin={256.927,
            -485.637})));
  parameter .Modelon.ThermoFluid.Choices.RealTemperatureUnit temperatureUnit=
      .Modelon.ThermoFluid.Choices.RealTemperatureUnit.K
    "Unit of temperature real input signal";
equation
  connect(flowSource.port, port) annotation (Line(points={{30,-0.1085},{65,-0.1085},
          {65,0},{100,0}}, color={85,170,255}));
  connect(flowSource.m_flow_in, controlBus.mdot_air[id]) annotation (Line(points={{-18.1728,
          30},{-18.1728,80},{0,80},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(flowSource.T_in, controlBus.T_air[id]) annotation (Line(points={{-0.108,30},
          {-0.108,64},{0,64},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
end AirflowMassSource;

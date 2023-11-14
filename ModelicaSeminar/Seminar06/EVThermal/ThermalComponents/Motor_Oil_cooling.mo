within ModelicaSeminar.Seminar06.EVThermal.ThermalComponents;
model Motor_Oil_cooling "simple motor from file"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.Motor;
  replaceable package OilMedium =
         .LiquidCooling.Media.Oils.MotorOil15W40                          constrainedby
    .Modelon.Media.Templates.CompressibleLiquid
                                       annotation(choicesAllMatching);
  parameter .Modelica.Units.SI.Temperature T_start_oil = 295 "Initial oil temperature";
  parameter .Modelica.Units.SI.Volume V_oil=0.001 "Total oil circuit volume, including expansion volume";
  parameter Real fracOilVolume=0.5 "fraction of total oil circuit in volume downstream of pump";
  parameter Real fractionExpansionVolume=0.5 "initial volume fraction of oil in expansion volume";
  .LiquidCooling.Volumes.LiquidVolume volume(redeclare replaceable package
      Medium =
        .LiquidCooling.Media.Oils.MotorOil15W40,
    V=V_oil/2,
      T_start=T_start_oil,
    include_in_aggregate=false)
    annotation (Placement(transformation(extent={{-10.0,24.0},{10.0,44.0}},rotation = 0.0,origin = {0.0,0.0})));
  .Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow
    annotation (Placement(transformation(
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=-90.0,
        origin={0.0,62.0})));
    .LiquidCooling.Volumes.ExpansionVolume expansionVolume(
    V=V_expansion,
    V_gas_start=V_expansion - V_oil_expansion_start,
    include_in_aggregate=false,                            N = 2,T_start = T_start_oil,
    redeclare replaceable package Medium = OilMedium)           annotation(Placement(transformation(extent = {{-98.0,62.0},{-78.0,82.0}},origin = {0.0,0.0},rotation = 0.0)));
    .LiquidCooling.HeatExchangers.LiquidLiquid.StaticEffectivenessTable heatExchanger(
    table=[0,0,2; 0,0.6,0.6; 3,0.6,0.6],                                              init_sec(T_in = T_start_oil),
    init_prim(T_in=T_start),     redeclare
      replaceable package PrimaryLiquid =     Medium,
    redeclare replaceable package SecondaryLiquid = OilMedium,
    L_prim=0.2,
    Dhyd_prim=0.00312,
    A_prim=0.001615,
    A_heat_prim=0.1,
    L_sec=0.2,
    Dhyd_sec=0.00312,
    A_sec=0.001615,
    A_heat_sec=0.1)    annotation(Placement(transformation(extent = {{-8.0,-4.0},{12.0,16.0}},origin = {0.0,0.0},rotation = 0.0)));

    .LiquidCooling.FlowModifiers.SetLiquidFlowRate setFlowRate(use_flow_in = true,
      redeclare replaceable package Medium = OilMedium)     annotation(Placement(transformation(extent = {{-52.0,24.0},{-32.0,44.0}},origin = {0.0,0.0},rotation = 0.0)));
protected
  parameter .Modelica.Units.SI.Volume V_oil_expansion_start = (1-fracOilVolume)*V_oil "initial oil volume in expansion tank";
  parameter .Modelica.Units.SI.Volume V_expansion = V_oil_expansion_start/fractionExpansionVolume "total volume in expansion tank";
equation
    connect(prescribedHeatFlow.port,volume.q) annotation(Line(points = {{2.220446049250313e-15,52},{2.220446049250313e-15,42},{0,42}},color = {191,0,0}));
    connect(heatExchanger.portA_prim,portA) annotation(Line(points = {{-8,0},{-100,0}},color = {0,0,255}));
    connect(heatExchanger.portB_prim,portB) annotation(Line(points = {{12,0},{102,0}},color = {0,0,255}));
    connect(volume.portB,heatExchanger.portA_sec) annotation(Line(points = {{9,34},{18,34},{18,12},{12,12}},color = {0,0,255}));
    connect(heatExchanger.portB_sec,expansionVolume.portA[1]) annotation(Line(points={{-8,12},
          {-88,12},{-88,62.75}},                                                                                   color = {0,0,255}));
    connect(volume.portA,setFlowRate.portB) annotation(Line(points = {{-9,34},{-32,34}},color = {0,0,255}));
    connect(setFlowRate.portA,expansionVolume.portA[2]) annotation(Line(points={{-52,34},
          {-88,34},{-88,63.25}},                                                                              color = {0,0,255}));
  connect(setFlowRate.m_flow_in, controlBus.mdot_oil_motor) annotation (Line(
        points={{-41,40},{-41,86},{0,86},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(prescribedHeatFlow.Q_flow, controlBus.Q_motor) annotation (Line(
        points={{1.88738e-15,72},{1.88738e-15,85},{0,85},{0,98}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
end Motor_Oil_cooling;

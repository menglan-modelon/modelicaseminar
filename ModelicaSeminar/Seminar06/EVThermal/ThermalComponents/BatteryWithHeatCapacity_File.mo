within ModelicaSeminar.Seminar06.EVThermal.ThermalComponents;
model BatteryWithHeatCapacity_File "simple battery from file"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.Battery;
  .LiquidCooling.Volumes.LiquidVolume volume(redeclare package Medium = Medium,
      T_start=T_start,useThermalCapacity = true,internalHeatResistance = true,C = 400 * 1000,V = 0.005,A_h = 0.035,redeclare
      replaceable model                                                                                                                        HeatTransfer =
        .Modelon.ThermoFluid.Volumes.HeatTransfer.LumpedHT_DittusBoelter (                                                                                                                                                     A_flow = 1.3e-5,D_hyd = 0.0038,C1 = 0.015,C2 = 0.75,C3 = 0.33))
    annotation (Dialog, Placement(transformation(extent={{-10,-10},{10,10}})));
  .Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,30})));
    .LiquidCooling.FlowResistances.Generic.LiquidResistance flowResistance(redeclare
      package                                                                                Medium = Medium) annotation(Placement(transformation(extent = {{-65.96149934356244,-9.853800157017867},{-45.96149934356242,10.146199842982133}},origin = {0.0,0.0},rotation = 0.0)));
  .Modelica.Blocks.Sources.RealExpression batteryCoolant_outT_degC(y=.Modelica.Units.Conversions.to_degC(
        volume.summary.T))
    annotation (Placement(transformation(extent={{74,68},{40,92}})));
  .Modelica.Blocks.Sources.RealExpression batteryTemp_degC(y=.Modelica.Units.Conversions.to_degC(
        volume.q.T))
    annotation (Placement(transformation(extent={{74,48},{40,72}})));
equation
  connect(volume.portB, portB)
    annotation (Line(points={{9,0},{102,0}}, color={0,0,255}));
  connect(prescribedHeatFlow.port, volume.q)
    annotation (Line(points={{0,20},{0,8}}, color={191,0,0}));
  connect(prescribedHeatFlow.Q_flow, controlBus.Q_battery) annotation (
      Line(points={{0,40},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
    connect(flowResistance.portA,portA) annotation(Line(points = {{-63.96149934356244,0.14619984298213318},{-81.98074967178121,0.14619984298213318},{-81.98074967178121,0},{-100,0}},color = {0,0,255}));
    connect(flowResistance.portB,volume.portA) annotation(Line(points = {{-47.96149934356242,0.14619984298213318},{-28.48074967178121,0.14619984298213318},{-28.48074967178121,0},{-9,0}},color = {0,0,255}));
  connect(batteryTemp_degC.y, controlBus.batteryTemp_degC) annotation (Line(
        points={{38.3,60},{0,60},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(batteryCoolant_outT_degC.y, controlBus.batteryCoolantOutT_degC)
    annotation (Line(points={{38.3,80},{0,80},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
end BatteryWithHeatCapacity_File;

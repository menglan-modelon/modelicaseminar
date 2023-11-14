within ModelicaSeminar.Seminar06.EVThermal.ThermalComponents;
model Battery_File "simple battery from file"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.Battery;
  .LiquidCooling.Volumes.LiquidVolume volume(redeclare package Medium = Medium,
      T_start=T_start,useThermalCapacity = true,internalHeatResistance = true,C = 1000)    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  .Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,30})));
  .Modelica.Blocks.Sources.RealExpression batteryCoolant_outT_degC(y=.Modelica.Units.Conversions.to_degC( volume.summary.T))    annotation (Placement(transformation(extent={{88,68},{54,92}})));
equation
  connect(volume.portA, portA)    annotation (Line(points={{-9,0},{-100,0}}, color={0,0,255}));
  connect(volume.portB, portB)    annotation (Line(points={{9,0},{102,0}}, color={0,0,255}));
  connect(prescribedHeatFlow.port, volume.q)    annotation (Line(points={{0,20},{0,8}}, color={191,0,0}));
  connect(prescribedHeatFlow.Q_flow, controlBus.Q_battery) annotation (
      Line(points={{0,40},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(batteryCoolant_outT_degC.y, controlBus.batteryCoolantOutT_degC)    annotation (Line(points={{52.3,80},{0,80},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
end Battery_File;

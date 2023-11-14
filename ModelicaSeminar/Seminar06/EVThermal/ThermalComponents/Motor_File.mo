within ModelicaSeminar.Seminar06.EVThermal.ThermalComponents;
model Motor_File "simple motor from file"
  extends ModelicaSeminar.Seminar06.EVThermal.Interfaces.Motor;
  .LiquidCooling.Volumes.LiquidVolume volume(redeclare package Medium = Medium,
      T_start=T_start,useThermalCapacity = true)
    annotation (Dialog,Placement(transformation(extent={{-10,-10},{10,10}})));
  .Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,30})));
equation
  connect(volume.portA, portA)
    annotation (Line(points={{-9,0},{-100,0}}, color={0,0,255}));
  connect(volume.portB, portB)
    annotation (Line(points={{9,0},{102,0}}, color={0,0,255}));
  connect(prescribedHeatFlow.Q_flow, controlBus.Q_motor) annotation (
      Line(points={{0,40},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
    connect(prescribedHeatFlow.port,volume.q) annotation(Line(points = {{-2.220446049250313e-15,20},{0,8}},color = {191,0,0}));
end Motor_File;

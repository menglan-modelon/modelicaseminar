within ModelicaSeminar.Seminar06.EVThermal.ThermalComponents;
model Chiller_File "simple chiller from file"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.Chiller;
  .LiquidCooling.Volumes.LiquidVolume volume(redeclare package Medium = Medium,
      T_start=T_start)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  .Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,30})));
    .Modelica.Blocks.Math.Gain size_factor_chiller(k = 1) annotation(Dialog,Placement(transformation(extent = {{-5.401602530050589,-5.401602530050582},{5.401602530050589,5.401602530050582}},origin = {0.0,66.0},rotation = -90.0)));
equation
  connect(volume.portA, portA)
    annotation (Line(points={{-9,0},{-100,0}}, color={0,0,255}));
  connect(volume.portB, portB)
    annotation (Line(points={{9,0},{102,0}}, color={0,0,255}));
  connect(prescribedHeatFlow.port, volume.q)
    annotation (Line(points={{0,20},{0,8}}, color={191,0,0}));
    connect(prescribedHeatFlow.Q_flow,size_factor_chiller.y) annotation(Line(points = {{2.220446049250313e-15,40},{2.220446049250313e-15,60.05823721694435},{1.3193363697218458e-15,60.05823721694435}},color = {0,0,127}));
    connect(size_factor_chiller.u,controlBus.Q_chiller) annotation(Line(points = {{-1.439276039696559e-15,72.4819230360607},{0,98}},color = {0,0,127}));
end Chiller_File;

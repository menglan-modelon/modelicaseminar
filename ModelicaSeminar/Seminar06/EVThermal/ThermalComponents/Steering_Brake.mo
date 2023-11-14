within ModelicaSeminar.Seminar06.EVThermal.ThermalComponents;

model Steering_Brake "simple thermal model for steering/brake from file"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.BrakeSteering;
  .LiquidCooling.Volumes.LiquidVolume volume(redeclare package Medium = Medium,
      T_start=T_start)    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  .Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,30})));
equation
  connect(volume.portA, portA)    annotation (Line(points={{-9,0},{-100,0}}, color={0,0,255}));
  connect(volume.portB, portB)    annotation (Line(points={{9,0},{102,0}}, color={0,0,255}));
  connect(prescribedHeatFlow.port, volume.q)    annotation (Line(points={{0,20},{0,8}}, color={191,0,0}));
    connect(prescribedHeatFlow.Q_flow,controlBus.Q_steerBrake) annotation(Line(points = {{2.220446049250313e-15,40},{0,98}},color = {0,0,127}));
    annotation(Icon(graphics = {Text(textString="simple",origin={4,2},extent={{-51,63},{51,-63}},lineColor={155,155,155},rotation=315)}));
end Steering_Brake;

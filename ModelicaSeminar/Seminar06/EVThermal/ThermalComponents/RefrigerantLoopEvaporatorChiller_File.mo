within ModelicaSeminar.Seminar06.EVThermal.ThermalComponents;
model RefrigerantLoopEvaporatorChiller_File
  "simple refrigerant loop with evap and chiller heat from file"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.RefrigerantLoopEvaporatorChiller;
  parameter .Modelon.Media.Units.Temperature T_start_air=298.15 "air initial temperature";
  .LiquidCooling.Volumes.LiquidVolume volume(redeclare package Medium = Medium,  T_start=T_start)    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  .Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,30})));
  .AirConditioning.ThermoFluidPro.PipesAndVolumes.AirVolume airVolume(redeclare
      package Medium =  AirMedium, init(T0=T_start_air, p0=121000))    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}},
                                                                     rotation=
           0)));
  AirConditioning.AirHandling.FlowResistance.FrictionLoss  frictionLoss(redeclare package Medium = AirMedium,
      dp_nom=1000)           annotation (Placement(transformation(extent={{-30,-60},{-10,-40}},
          rotation=0)));
  .Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlowEvap    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,30})));
    .ModelicaSeminar.Seminar06.EVThermal.Sensors.LiquidTemperatureSensor_degC temperatureSensor(redeclare
      replaceable package Medium = Medium) annotation(Placement(transformation(extent = {{-78.0,4.0},{-58.0,24.0}},origin={-2,46},    rotation = 0.0)));
equation
  connect(volume.portA, portA)    annotation (Line(points={{-9,0},{-100,0}}, color={0,0,255}));
  connect(volume.portB, portB)    annotation (Line(points={{9,0},{102,0}}, color={0,0,255}));
  connect(prescribedHeatFlow.port, volume.q)    annotation (Line(points={{0,20},{0,8}}, color={191,0,0}));
  connect(prescribedHeatFlow.Q_flow, controlBus.Q_chiller) annotation (Line(
        points={{0,40},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(airVolume.a, evaporatorIn)    annotation (Line(points={{-60,-50},{-100,-50}}, color={85,170,255}));
  connect(airVolume.b, frictionLoss.a)    annotation (Line(points={{-40,-50},{-30,-50}}, color={85,170,255}));
  connect(frictionLoss.b, evaporatorOut)    annotation (Line(points={{-10,-50},{100,-50}}, color={85,170,255}));
  connect(prescribedHeatFlowEvap.port, airVolume.q)    annotation (Line(points={{-50,20},{-50,-41}}, color={191,0,0}));
  connect(prescribedHeatFlowEvap.Q_flow, controlBus.Q_evaporator) annotation (
      Line(points={{-50,40},{-50,80},{0,80},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(portA,temperatureSensor.port) annotation(Line(points={{-100,0},{-80,
          0},{-80,60}},                                                                                 color = {0,0,255}));
  connect(temperatureSensor.y, controlBus.ChillerTempIn_degC) annotation (Line(
        points={{-70,70},{-70,80},{0,80},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
        
    annotation(Icon(graphics={  Text(textString="Simple",origin={2,2},extent={{-77,61},{77,-61}},rotation=45,lineColor={155,155,155})}));
end RefrigerantLoopEvaporatorChiller_File;

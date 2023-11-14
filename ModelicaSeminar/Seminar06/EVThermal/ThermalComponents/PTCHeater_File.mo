within ModelicaSeminar.Seminar06.EVThermal.ThermalComponents;
model PTCHeater_File "simple PTC heater from file"
  extends ModelicaSeminar.Seminar06.EVThermal.Interfaces.PTCHeater;
  parameter Boolean batteryOrCabin=true "if true, battery PTC otherwise cabin PTC";
  .LiquidCooling.Volumes.LiquidVolume volume(redeclare package Medium = Medium,      T_start=T_start)    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  .Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,30})));
  .Modelica.Blocks.Routing.RealPassThrough realPassThroughBattery if batteryOrCabin                      annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-20,60})));
  .Modelica.Blocks.Routing.RealPassThrough realPassThroughCabin if not    batteryOrCabin                                             annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={20,60})));
    .Modelica.Blocks.Math.Gain size_factor_battery(k = 1) if batteryOrCabin annotation(Dialog, Placement(transformation(extent = {{-15.401602530050589,40.59839746994941},{-4.598397469949411,51.40160253005059}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Math.Gain size_factor_cabin(k = 1) if not   batteryOrCabin annotation(Dialog, Placement(transformation(extent = {{15.401602530050582,40.59839746994942},{4.598397469949418,51.40160253005058}},origin = {0.0,0.0},rotation = 0.0)));
equation
  connect(volume.portA, portA)    annotation (Line(points={{-9,0},{-100,0}}, color={0,0,255}));
  connect(volume.portB, portB)    annotation (Line(points={{9,0},{102,0}}, color={0,0,255}));
  connect(prescribedHeatFlow.port, volume.q)    annotation (Line(points={{0,20},{0,8}}, color={191,0,0}));
  connect(realPassThroughBattery.u, controlBus.Q_PTC_battery) annotation (Line(
        points={{-20,67.2},{-20,80},{0,80},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(realPassThroughCabin.u, controlBus.Q_PTC_cabin) annotation (Line(
        points={{20,67.2},{20,80},{0,80},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
    connect(realPassThroughBattery.y,size_factor_battery.u) annotation(Line(points = {{-20,53.4},{-20,46},{-16.481923036060707,46}},color = {0,0,127}));
    connect(size_factor_battery.y,prescribedHeatFlow.Q_flow) annotation(Line(points = {{-4.058237216944352,46},{2.220446049250313e-15,46},{2.220446049250313e-15,40}},color = {0,0,127}));
    connect(size_factor_cabin.u,realPassThroughCabin.y) annotation(Line(points = {{16.4819230360607,46},{20,46},{20,53.4}},color = {0,0,127}));
    connect(size_factor_cabin.y,prescribedHeatFlow.Q_flow) annotation(Line(points = {{4.05823721694436,46},{2.220446049250313e-15,46},{2.220446049250313e-15,40}},color = {0,0,127}));
end PTCHeater_File;

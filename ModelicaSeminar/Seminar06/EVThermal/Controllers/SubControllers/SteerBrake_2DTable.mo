within ModelicaSeminar.Seminar06.EVThermal.Controllers.SubControllers;
model SteerBrake_2DTable "Steering and brake thermal model using 2D table data"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.ComponentController;
  parameter String fileName=.Modelica.Utilities.Files.loadResource("modelica://ModelicaSeminar/Resources/Data/Rev26_Controls_Cooling1.txt") "file with controls inputs";
  parameter String fileNameSystemConfiguration=fileName "file with system configuration data";

    .Modelica.Blocks.Routing.RealPassThrough Q_steerBrake_set annotation(Placement(transformation(extent = {{56.84644069138628,-7.153559308613723},{71.15355930861372,7.153559308613723}},rotation = 0.0,origin={-6,0})));
    .Modelon.Blocks.Tables.ModelonTable2Ds Q_steerBrake(descriptor = "Steering heat rejection table",
    fileName=fileNameSystemConfiguration,                                                                                tableName = "Q_steeringBrake",tableOnFile = true) annotation(Placement(transformation(extent={{
            -21.6539,-9.94001},{-1.77376,9.94001}},                                                                                                                                                                                                        origin={1.77376,
            0.06},                                                                                                                                                                                                        rotation = 0.0)));
    .ModelicaSeminar.Seminar06.EVThermal.Controllers.Components.Gain gain(k = 1000) annotation(Placement(transformation(extent = {{22.0,-10.0},{42.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.CombiTimeTable SteeringPumpSpeed_RPM(fileName = fileName,tableName = "SteeringPumpSpeed_RPM",tableOnFile = true) annotation(Placement(transformation(extent = {{-79.95693107191293,4.043068928087052},{-64.04306892808707,19.956931071912948}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Blocks.Sources.CombiTimeTable SteeringPumpPressure_psi(tableOnFile = true,tableName = "SteeringPumpPressure_psi",fileName = fileName) annotation(Placement(transformation(extent = {{-79.95693107191293,-19.956931071912948},{-64.04306892808707,-4.043068928087052}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Blocks.Routing.RealPassThrough P_steerBrake_set annotation (
      Placement(transformation(
        extent={{56.84644069138628,-7.153559308613723},{71.15355930861372,
            7.153559308613723}},
        rotation=0.0,
        origin={-4,-50})));
    .Modelon.Blocks.Tables.ModelonTable2Ds P_steerBrake(
    descriptor="Steering electrical power table",
    fileName=fileNameSystemConfiguration,
    tableName="P_steeringBrake",
    tableOnFile=true) annotation (Placement(transformation(
        extent={{-21.6538,-9.94},{-1.77376,9.94}},
        origin={1.6538,-50.06},
        rotation=0.0)));
    Components.Gain                        gain1(k=1000)  annotation(Placement(transformation(extent = {{22.0,-10.0},{42.0,10.0}},origin={-2,-50},   rotation = 0.0)));
equation
    connect(Q_steerBrake.y,gain.u) annotation(Line(points={{0.994007,0.06},{
          10.497,0.06},{10.497,0},{20,0}},                                                   color = {0,0,127}));
    connect(gain.y,Q_steerBrake_set.u) annotation(Line(points={{43,0},{49.4157,
          0}},                                                                                  color = {0,0,127}));
    connect(SteeringPumpSpeed_RPM.y[1],Q_steerBrake.u1) annotation(Line(points={{
          -63.2474,12},{-28,12},{-28,6.02401},{-21.8682,6.02401}},                                                                                                                                               color = {0,0,127}));
    connect(SteeringPumpPressure_psi.y[1],Q_steerBrake.u2) annotation(Line(points={{
          -63.2474,-12},{-28,-12},{-28,-5.90401},{-21.8682,-5.90401}},                                                                                                                                                  color = {0,0,127}));
  connect(P_steerBrake.y, gain1.u) annotation (Line(points={{0.874043,-50.06},{
          12,-50.06},{12,-50},{18,-50}}, color={0,0,127}));
  connect(gain1.y, P_steerBrake_set.u)
    annotation (Line(points={{41,-50},{51.4157,-50}}, color={0,0,127}));
  connect(SteeringPumpSpeed_RPM.y[1], P_steerBrake.u1) annotation (Line(points=
          {{-63.2474,12},{-34,12},{-34,-44.096},{-21.988,-44.096}}, color={0,0,
          127}));
  connect(SteeringPumpPressure_psi.y[1], P_steerBrake.u2) annotation (Line(
        points={{-63.2474,-12},{-28,-12},{-28,-56.024},{-21.988,-56.024}},
        color={0,0,127}));
  connect(P_steerBrake_set.y, controlBus.P_steerBrake) annotation (Line(points=
          {{67.8689,-50},{100,-50},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(Q_steerBrake_set.y, controlBus.Q_steerBrake) annotation (Line(points=
          {{65.8689,8.88178e-16},{85.9345,8.88178e-16},{85.9345,0},{100,0}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
end SteerBrake_2DTable;

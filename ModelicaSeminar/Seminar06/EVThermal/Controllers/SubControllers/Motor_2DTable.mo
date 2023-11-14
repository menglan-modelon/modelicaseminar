within ModelicaSeminar.Seminar06.EVThermal.Controllers.SubControllers;
model Motor_2DTable "Steering and brake thermal model using 2D table data"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.ComponentController;
  parameter String fileName "file with controls inputs";
  parameter String fileNameSystemConfiguration=fileName "file with system configuration data";

    .Modelica.Blocks.Routing.RealPassThrough Q_motor_set annotation(Placement(transformation(extent = {{62.84644069138628,-7.153559308613723},{77.15355930861372,7.153559308613723}},rotation = 0.0,origin={-10,0})));
    .Modelon.Blocks.Tables.ModelonTable2Ds Q_motor(descriptor = "Motor power loss table",
    fileName=fileNameSystemConfiguration,                                                                    tableName = "Q_motor",tableOnFile = true) annotation(Placement(transformation(extent = {{-25.880048264549934,-11.880048264549934},{-2.1199517354500657,11.880048264549934}},origin={2,0},      rotation = 0.0)));
    .Modelica.Blocks.Sources.CombiTimeTable MotorSpeed_RPM(tableOnFile = true,tableName = "MotorSpeed_RPM",fileName = fileName) annotation(Placement(transformation(extent = {{-86.0,-30.0},{-66.0,-10.0}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Blocks.Sources.CombiTimeTable MotorTorque_Nm(tableOnFile = true,tableName = "MotorTorque_Nm",fileName = fileName) annotation(Placement(transformation(extent = {{-86.0,10.0},{-66.0,30.0}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Blocks.Math.Gain gain(k = 1000) annotation(Placement(transformation(extent = {{24.0,-10.0},{44.0,10.0}},origin={-4,0},     rotation = 0.0)));
    .Modelica.Blocks.Routing.RealPassThrough P_motor_set "motor output power"    annotation (Placement(transformation(
        extent={{62.84644069138628,-7.153559308613723},{77.15355930861372,
            7.153559308613723}},
        rotation=0.0,
        origin={2,28})));
  .Modelica.Blocks.Sources.RealExpression P_motor_source(y=MotorTorque_Nm.y[1]*
        .Modelica.Constants.pi/30*MotorSpeed_RPM.y[1])
    annotation (Placement(transformation(extent={{32,18},{52,38}})));
equation
    connect(MotorSpeed_RPM.y[1],Q_motor.u2) annotation(Line(points={{-65,-20},{
          -49.1739,-20},{-49.1739,-7.12803},{-26.2561,-7.12803}},                                                                                                                     color = {0,0,127}));
    connect(MotorTorque_Nm.y[1],Q_motor.u1) annotation(Line(points={{-65,20},{
          -50.0311,20},{-50.0311,7.12803},{-26.2561,7.12803}},                                                                                                                        color = {0,0,127}));
    connect(Q_motor.y,gain.u) annotation(Line(points={{1.06805,0},{18,0}},              color = {0,0,127}));
    connect(gain.y,Q_motor_set.u) annotation(Line(points={{41,0},{51.4157,0}},             color = {0,0,127}));
  connect(P_motor_source.y, P_motor_set.u)    annotation (Line(points={{53,28},{63.4157,28}}, color={0,0,127}));
  connect(P_motor_set.y, controlBus.P_motor) annotation (Line(points={{79.8689,
          28},{100,28},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(Q_motor_set.y, controlBus.Q_motor) annotation (Line(points={{67.8689,
          8.88178e-16},{88.9345,8.88178e-16},{88.9345,0},{100,0}}, color={0,0,
          127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
end Motor_2DTable;

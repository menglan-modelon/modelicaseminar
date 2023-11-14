within ModelicaSeminar.Seminar06.EVThermal.Controllers.SubControllers;
model MotorOil_File "motor oil controller, file-based"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.ComponentController;
  parameter String fileName=.Modelica.Utilities.Files.loadResource("modelica://ModelicaSeminar/Resources/Data/Rev26_Controls_Cooling1.txt") "file with controls inputs";

  .Modelica.Blocks.Routing.RealPassThrough oil_flow_set
    annotation (Placement(transformation(extent={{55.0,3.0},{63.0,11.0}},rotation = 0.0,origin = {0.0,0.0})));
  .Modelica.Blocks.Routing.RealPassThrough Q_motor_set
    annotation (Placement(transformation(extent={{55.0,-11.0},{63.0,-3.0}},rotation = 0.0,origin = {0.0,0.0})));
  .Modelica.Blocks.Sources.CombiTimeTable mdot_oil_source(
    tableOnFile=true,
    tableName="mdot_oil_motor",
    fileName=fileName)
    annotation (Placement(transformation(extent={{20,20},{40,40}})));
  .Modelica.Blocks.Sources.CombiTimeTable Qmotor_source(
    tableOnFile=true,
    tableName="Q_motor",
    fileName=fileName)
    annotation (Placement(transformation(extent={{20,-20},{40,0}})));
equation
  connect(oil_flow_set.y, controlBus.mdot_oil_motor) annotation (Line(points={{63.4,7},
          {80,7},{80,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(Q_motor_set.y, controlBus.Q_motor) annotation (Line(points={{63.4,-7},
          {80,-7},{80,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(mdot_oil_source.y[1], oil_flow_set.u) annotation (Line(points={{41,30},
          {50,30},{50,7},{54.2,7}}, color={0,0,127}));
  connect(Qmotor_source.y[1], Q_motor_set.u) annotation (Line(points={{41,-10},{
          50,-10},{50,-7},{54.2,-7}}, color={0,0,127}));
end MotorOil_File;

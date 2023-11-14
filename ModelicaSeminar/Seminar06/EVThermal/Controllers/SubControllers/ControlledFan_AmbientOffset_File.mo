within ModelicaSeminar.Seminar06.EVThermal.Controllers.SubControllers;
model ControlledFan_AmbientOffset_File
  "fan controller based on input temperatures and ambient temperature with offset from file"
  extends .EVThermal.Interfaces.ComponentController;
  parameter String fileName=.Modelica.Utilities.Files.loadResource("modelica://EVThermal/Resources/Data/Rev26_Controls_Cooling1.txt") "file with controls inputs";
  parameter Integer id=1 "component ID";
  parameter Real fanRPM_max=2000 "Constant maximum output if not use_limits_in";
  parameter Real fanRPM_min=20 "Constant maximum output if not use_limits_in";
  parameter Real fanRPM_init=20 "Constant maximum output if not use_limits_in";
  parameter String tableName_fanEnable="fanEnable" "Table name for fan enable signal";
  parameter String tableName_fanPrescribed="fanPrescribed" "Table name for fan prescribed signal";
  parameter String tableName_fanRPM_prescribed="fanRPM_prescribed" "Table name for fan speed signal";
  parameter String tableName_ambientOffset="ambientOffset" "Table name for air temperature signal";
  .Modelica.Blocks.Sources.CombiTimeTable ambientOffset_degC(
    tableOnFile=true,
    tableName=tableName_ambientOffset,
    fileName=fileName)
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  .Modelica.Blocks.Routing.RealPassThrough fanRPM_set annotation (Placement(
        transformation(
        extent={{61,15},{69,23}},
        rotation=0.0)));
  .Modelica.Blocks.Routing.RealPassThrough T_air_set annotation (Placement(
        transformation(extent={{55,-43},{63,-35}},        rotation=0.0)));
  .Modelica.Blocks.Interfaces.RealInput T_sensed "sensed temperature"
    annotation (Placement(transformation(extent={{-130,-60},{-90,-20}})));

  Components.LimPIDInputMinMaxReset PID(controllerType=.Modelica.Blocks.Types.SimpleController.PI,
    k=-100,
    Ti=10,
    y_max=fanRPM_max,
    y_min=fanRPM_min,
    initType=.Modelica.Blocks.Types.Init.InitialOutput,
    y_start=fanRPM_init,
    y_reset=0) annotation (Placement(transformation(extent={{-30,0},{0,30}})));
  .Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{22,-50},{42,-30}})));
  .Modelica.Blocks.Interfaces.RealInput T_setpoint "setpoint temperature"
    annotation (Placement(transformation(extent={{-130,30},{-90,70}})));
  .Modelica.Blocks.Logical.Switch switch
    annotation (Placement(transformation(extent={{-64,-10},{-44,10}})));

  .Modelica.Blocks.Sources.CombiTimeTable fanEnable(
    tableOnFile=true,
    tableName=tableName_fanEnable,
    fileName=fileName)
    annotation (Placement(transformation(extent={{-108,-10},{-88,10}})));
  .Modelica.Blocks.Sources.BooleanExpression reset
    annotation (Placement(transformation(extent={{20,-18},{0,2}})));
  .Modelica.Blocks.Logical.GreaterThreshold greaterThreshold
    annotation (Placement(transformation(extent={{-82,-4},{-74,4}})));
  .Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{30,10},{50,30}})));
  .Modelica.Blocks.Sources.CombiTimeTable fanPrescribed(
    tableOnFile=true,
    tableName=tableName_fanPrescribed,
    fileName=fileName)
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  .Modelica.Blocks.Logical.GreaterThreshold greaterThreshold1
    annotation (Placement(transformation(extent={{6,46},{14,54}})));
  .Modelica.Blocks.Sources.CombiTimeTable fanRPM_prescribed_source(
    tableOnFile=true,
    tableName=tableName_fanRPM_prescribed,
    fileName=fileName)
    annotation (Placement(transformation(extent={{-20,70},{0,90}})));
equation
  connect(fanRPM_set.y, controlBus.fanRPM[id]) annotation (Line(points={{69.4,19},
          {90,19},{90,0},{100,0}},  color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(T_air_set.y, controlBus.T_air[id]) annotation (Line(points={{63.4,-39},
          {90,-39},{90,0},{100,0}},color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(ambientOffset_degC.y[1], add.u1) annotation (Line(points={{11,-30},{
          16,-30},{16,-34},{20,-34}}, color={0,0,127}));
  connect(add.u2, controlBus.T_ambient_degC) annotation (Line(points={{20,-46},
          {14,-46},{14,-56},{100,-56},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(add.y, T_air_set.u)
    annotation (Line(points={{43,-40},{43,-39},{54.2,-39}}, color={0,0,127}));
  connect(PID.u_s, T_setpoint) annotation (Line(points={{-33,15},{-70,15},{-70,50},
          {-110,50}},     color={0,0,127}));
  connect(switch.y, PID.u_m) annotation (Line(points={{-43,0},{-40,0},{-40,8},{-36,
          8},{-36,7.5},{-33,7.5}}, color={0,0,127}));
  connect(reset.y, PID.reset)
    annotation (Line(points={{-1,-8},{-18,-8},{-18,-1.5}}, color={255,0,255}));
  connect(greaterThreshold.y, switch.u2)
    annotation (Line(points={{-73.6,0},{-66,0}}, color={255,0,255}));
  connect(fanEnable.y[1], greaterThreshold.u)
    annotation (Line(points={{-87,0},{-82.8,0}}, color={0,0,127}));
  connect(T_sensed, switch.u1) annotation (Line(points={{-110,-40},{-72,-40},{-72,
          8},{-66,8}}, color={0,0,127}));
  connect(T_setpoint, switch.u3) annotation (Line(points={{-110,50},{-70,50},{-70,
          -8},{-66,-8}}, color={0,0,127}));
  connect(PID.y, switch1.u3) annotation (Line(points={{1.5,15},{8.75,15},{8.75,12},
          {28,12}}, color={0,0,127}));
  connect(switch1.y, fanRPM_set.u)
    annotation (Line(points={{51,20},{51,19},{60.2,19}}, color={0,0,127}));
  connect(fanPrescribed.y[1], greaterThreshold1.u)
    annotation (Line(points={{1,50},{5.2,50}}, color={0,0,127}));
  connect(greaterThreshold1.y, switch1.u2) annotation (Line(points={{14.4,50},{20,
          50},{20,20},{28,20}}, color={255,0,255}));
  connect(fanRPM_prescribed_source.y[1], switch1.u1) annotation (Line(points={{1,
          80},{24,80},{24,28},{28,28}}, color={0,0,127}));
end ControlledFan_AmbientOffset_File;

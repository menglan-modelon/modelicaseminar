within ModelicaSeminar.Seminar06.EVThermal.Controllers.SubControllers;
model RadiatorAirflow_File "radiator airflow controller, file-based"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.ComponentController;
  parameter String fileName=.Modelica.Utilities.Files.loadResource("modelica://ModelicaSeminar/Resources/Data/Rev26_Controls_Cooling1.txt") "file with controls inputs";

  .Modelica.Blocks.Routing.RealPassThrough radPT_flow_set annotation (Placement(
        transformation(
        extent={{55.0,3.0},{63.0,11.0}},
        rotation=0.0,
        origin={0,52})));
  .Modelica.Blocks.Routing.RealPassThrough radPT_T_set    annotation (Placement(transformation(extent={{55.0,-11.0},{63.0,-3.0}},rotation = 0.0,origin={0,40})));
  .Modelica.Blocks.Sources.CombiTimeTable mdot_radPT_source(
    tableOnFile=true,
    tableName="mdot_radPT",
    fileName=fileName)
    annotation (Placement(transformation(extent={{20,60},{40,80}})));
  .Modelica.Blocks.Sources.CombiTimeTable T_radPT_source(
    tableOnFile=true,
    tableName="T_radPT_degC",
    fileName=fileName)
    annotation (Placement(transformation(extent={{20,20},{40,40}})));
  .Modelica.Blocks.Sources.CombiTimeTable mdot_radBattery_source(
    tableOnFile=true,
    tableName="mdot_radBattery",
    fileName=fileName)
    annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
  .Modelica.Blocks.Sources.CombiTimeTable T_radBattery_source(
    tableOnFile=true,
    tableName="T_radBattery_degC",
    fileName=fileName)
    annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
  .Modelica.Blocks.Routing.RealPassThrough radBattery_flow_set annotation (
      Placement(transformation(
        extent={{55.0,3.0},{63.0,11.0}},
        rotation=0.0,
        origin={0,-48})));
  .Modelica.Blocks.Routing.RealPassThrough radBattery_T_set1 annotation (
      Placement(transformation(
        extent={{55.0,-11.0},{63.0,-3.0}},
        rotation=0.0,
        origin={0,-60})));
equation
  connect(mdot_radPT_source.y[1], radPT_flow_set.u) annotation (Line(points={{
          41,70},{50,70},{50,59},{54.2,59}}, color={0,0,127}));
  connect(T_radPT_source.y[1], radPT_T_set.u) annotation (Line(points={{41,30},
          {50,30},{50,33},{54.2,33}}, color={0,0,127}));
  connect(mdot_radBattery_source.y[1], radBattery_flow_set.u) annotation (Line(
        points={{41,-30},{48,-30},{48,-41},{54.2,-41}}, color={0,0,127}));
  connect(T_radBattery_source.y[1], radBattery_T_set1.u) annotation (Line(
        points={{41,-70},{46,-70},{46,-67},{54.2,-67}}, color={0,0,127}));
  connect(radPT_flow_set.y, controlBus.mdot_air[2]) annotation (Line(points={{
          63.4,59},{80,59},{80,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(radPT_T_set.y, controlBus.T_air[2]) annotation (Line(points={{63.4,33},
          {80,33},{80,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(radBattery_flow_set.y, controlBus.mdot_air[1]) annotation (Line(
        points={{63.4,-41},{80,-41},{80,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(radBattery_T_set1.y, controlBus.T_air[1]) annotation (Line(points={{
          63.4,-67},{80,-67},{80,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
end RadiatorAirflow_File;

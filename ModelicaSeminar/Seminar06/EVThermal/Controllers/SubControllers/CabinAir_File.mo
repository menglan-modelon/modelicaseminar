within ModelicaSeminar.Seminar06.EVThermal.Controllers.SubControllers;
model CabinAir_File "cabin air controller, file-based"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.ComponentController;
  parameter String fileName=.Modelica.Utilities.Files.loadResource("modelica://ModelicaSeminar/Resources/Data/Rev26_Controls_Cooling1.txt") "file with controls inputs";

  .Modelica.Blocks.Routing.RealPassThrough cabinAir_flow_set annotation (
      Placement(transformation(
        extent={{55.0,3.0},{63.0,11.0}},
        rotation=0.0,
        origin={0,52})));
  .Modelica.Blocks.Routing.RealPassThrough recircValveOpening_set annotation (
      Placement(transformation(
        extent={{55.0,-11.0},{63.0,-3.0}},
        rotation=0.0,
        origin={0,40})));
  .Modelica.Blocks.Sources.CombiTimeTable mdot_airCabin_source(
    tableOnFile=true,
    tableName="mdot_airCabin",
    fileName=fileName)
    annotation (Placement(transformation(extent={{20,60},{40,80}})));
  .Modelica.Blocks.Sources.CombiTimeTable airRecircValveOpening_source(
    tableOnFile=true,
    tableName="airRecircValveOpening",
    fileName=fileName)
    annotation (Placement(transformation(extent={{20,20},{40,40}})));
  .Modelica.Blocks.Routing.RealPassThrough airSplitClimate_set annotation (
      Placement(transformation(
        extent={{55.0,-11.0},{63.0,-3.0}},
        rotation=0.0,
        origin={0,-10})));
  .Modelica.Blocks.Sources.CombiTimeTable airSplitClimate_source(
    tableOnFile=true,
    tableName="airSplitClimate",
    fileName=fileName)
    annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
equation
  connect(mdot_airCabin_source.y[1], cabinAir_flow_set.u) annotation (Line(
        points={{41,70},{50,70},{50,59},{54.2,59}}, color={0,0,127}));
  connect(airRecircValveOpening_source.y[1], recircValveOpening_set.u)
    annotation (Line(points={{41,30},{50,30},{50,33},{54.2,33}}, color={0,0,127}));
  connect(cabinAir_flow_set.y, controlBus.mdot_airCabin) annotation (Line(
        points={{63.4,59},{80,59},{80,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(recircValveOpening_set.y, controlBus.airRecircValveOpening)
    annotation (Line(points={{63.4,33},{80,33},{80,0},{100,0}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(airSplitClimate_source.y[1], airSplitClimate_set.u) annotation (Line(
        points={{41,-20},{50,-20},{50,-17},{54.2,-17}}, color={0,0,127}));
  connect(airSplitClimate_set.y, controlBus.airSplitClimate) annotation (
     Line(points={{63.4,-17},{80,-17},{80,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
end CabinAir_File;

within ModelicaSeminar.Seminar06.EVThermal.Controllers.SubControllers;
model Fan_File "fan controller, file-based"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.ComponentController;
  parameter String fileName=.Modelica.Utilities.Files.loadResource("modelica://ModelicaSeminar/Resources/Data/Rev26_Controls_Cooling1.txt") "file with controls inputs";
  parameter Integer id=1 "component ID";
  .Modelica.Blocks.Sources.CombiTimeTable fanRPM_source(
    tableOnFile=true,
    tableName=tableName_fanRPM,
    fileName=fileName)
    annotation (Placement(transformation(extent={{20,20},{40,40}})));
  .Modelica.Blocks.Sources.CombiTimeTable T_air_source(
    tableOnFile=true,
    tableName=tableName_T_air,
    fileName=fileName)
    annotation (Placement(transformation(extent={{20,-20},{40,0}})));
  .Modelica.Blocks.Routing.RealPassThrough fanRPM_set annotation (Placement(
        transformation(
        extent={{55,15},{63,23}},
        rotation=0.0)));
  .Modelica.Blocks.Routing.RealPassThrough T_air_set annotation (Placement(
        transformation(extent={{55.0,-11.0},{63.0,-3.0}}, rotation=0.0)));
  parameter String tableName_fanRPM="fanRPM" "Table name for fan speed signal";
  parameter String tableName_T_air="T_air" "Table name for air temperature signal";
equation
  connect(fanRPM_source.y[1], fanRPM_set.u) annotation (Line(points={{41,30},{48,
          30},{48,19},{54.2,19}},    color={0,0,127}));
  connect(T_air_source.y[1], T_air_set.u) annotation (Line(points={{41,-10},{46,
          -10},{46,-7},{54.2,-7}}, color={0,0,127}));
  connect(fanRPM_set.y, controlBus.fanRPM[id]) annotation (Line(points={{63.4,19},
          {80,19},{80,0},{100,0}},  color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(T_air_set.y, controlBus.T_air[id]) annotation (Line(points={{63.4,-7},
          {80,-7},{80,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
end Fan_File;

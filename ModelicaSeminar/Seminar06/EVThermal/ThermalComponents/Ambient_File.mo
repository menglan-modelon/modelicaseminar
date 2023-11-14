within ModelicaSeminar.Seminar06.EVThermal.ThermalComponents;
model Ambient_File "ambient conditions, file-based"
  extends ModelicaSeminar.Seminar06.EVThermal.Interfaces.Ambient;
  parameter String fileName=.Modelica.Utilities.Files.loadResource("modelica://ModelicaSeminar/Resources/Data/Rev26_Controls_Cooling1.txt") "file with controls inputs";

  .Modelica.Blocks.Routing.RealPassThrough T_ambient_degC_set annotation (
      Placement(transformation(extent={{50,-6},{62,6}}, rotation=0.0)));

    .Modelica.Blocks.Sources.CombiTimeTable T_ambient_degC(fileName = fileName,tableName = "T_ambient_degC",tableOnFile = true) annotation(Placement(transformation(extent = {{-99.79818567505662,-47.79818567505663},{-80.20181432494338,-28.20181432494337}},rotation = 0.0,origin={120,38})));
equation
  connect(T_ambient_degC.y[1], T_ambient_degC_set.u)
    annotation (Line(points={{40.778,0},{48.8,0}}, color={0,0,127}));
  connect(T_ambient_degC_set.y, controlBus.T_ambient_degC) annotation (Line(
        points={{62.6,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
end Ambient_File;

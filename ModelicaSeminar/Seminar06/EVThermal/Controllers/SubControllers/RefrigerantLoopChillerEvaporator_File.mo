within ModelicaSeminar.Seminar06.EVThermal.Controllers.SubControllers;
model RefrigerantLoopChillerEvaporator_File
  "refrigerant loop with chiller and evaporator heat, file-based"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.ComponentController;
  parameter String fileName=.Modelica.Utilities.Files.loadResource("modelica://ModelicaSeminar/Resources/Data/Rev26_Controls_Cooling1.txt") "file with controls inputs";

  .Modelica.Blocks.Sources.CombiTimeTable Q_chiller(
    tableOnFile=true,
    tableName="Q_chiller",
    fileName=fileName)
    annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  .Modelica.Blocks.Routing.RealPassThrough Q_chiller_set annotation (Placement(
        transformation(extent={{50,-26},{62,-14}}, rotation=0.0)));
  .Modelica.Blocks.Sources.CombiTimeTable Q_evaporator(
    tableOnFile=true,
    tableName="Q_evaporator",
    fileName=fileName)
    annotation (Placement(transformation(extent={{20,10},{40,30}})));
  .Modelica.Blocks.Routing.RealPassThrough Q_evaporator_set annotation (
      Placement(transformation(extent={{50,14},{62,26}}, rotation=0.0)));
equation
  connect(Q_chiller.y[1], Q_chiller_set.u)
    annotation (Line(points={{41,-20},{48.8,-20}}, color={0,0,127}));
  connect(Q_chiller_set.y, controlBus.Q_chiller) annotation (Line(points={{62.6,
          -20},{90,-20},{90,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(Q_evaporator.y[1], Q_evaporator_set.u)
    annotation (Line(points={{41,20},{48.8,20}}, color={0,0,127}));
  connect(Q_evaporator_set.y, controlBus.Q_evaporator) annotation (Line(points=
          {{62.6,20},{90,20},{90,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
end RefrigerantLoopChillerEvaporator_File;

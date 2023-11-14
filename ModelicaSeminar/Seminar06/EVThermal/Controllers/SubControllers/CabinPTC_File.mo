within ModelicaSeminar.Seminar06.EVThermal.Controllers.SubControllers;
model CabinPTC_File "cabin PTC controller, file based"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.ComponentController;
  parameter String fileName=.Modelica.Utilities.Files.loadResource("modelica://ModelicaSeminar/Resources/Data/Rev26_Controls_Cooling1.txt") "file with controls inputs";

  .Modelica.Blocks.Sources.CombiTimeTable T_PTC_target_degC(
    tableOnFile=true,
    tableName="T_PTC_cabin_target_degC",
    fileName=fileName)    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  .Modelica.Blocks.Sources.CombiTimeTable PTC_enable(
    tableOnFile=true,
    tableName="PTC_cabin_enable",
    fileName=fileName)    annotation (Placement(transformation(extent={{-60,-80},{-40,-60}})));
  .Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=0.5)    annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
  .Modelica.Blocks.Routing.RealPassThrough realPassThrough    annotation (Placement(transformation(extent={{60,40},{40,60}})));

equation
  connect(T_PTC_target_degC.y[1], controlBus.T_PTC_target_cabin) annotation (
      Line(points={{-39,-30},{80,-30},{80,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PTC_enable.y[1], greaterThreshold.u)    annotation (Line(points={{-39,-70},{-22,-70}}, color={0,0,127}));
  connect(greaterThreshold.y, controlBus.PTC_enable_cabin) annotation (Line(
        points={{1,-70},{80,-70},{80,0},{100,0}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(realPassThrough.u, controlBus.T_PTC_coolant_cabin_degC) annotation (
     Line(points={{62,50},{80,50},{80,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(realPassThrough.y, controlBus.T_PTC_sensed_cabin) annotation (Line(
        points={{39,50},{20,50},{20,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
end CabinPTC_File;
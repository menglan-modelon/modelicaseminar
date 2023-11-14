within ModelicaSeminar.Seminar06.EVThermal.Controllers.SubControllers;
model BatteryHeat_CRateTempTable_File  "battery heat based on C rate and battery temperature, file-based"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.ComponentController;
  parameter String fileName=.Modelica.Utilities.Files.loadResource("modelica://ModelicaSeminar/Resources/Data/Rev26_Controls_Cooling1.txt") "file with controls inputs";
  parameter String fileNameSystemConfiguration=fileName "file with system configuration data";

  .Modelica.Blocks.Routing.RealPassThrough Q_battery_set    annotation (Placement(transformation(extent={{68.75,-13.75},{78.75,-3.75}},
                                                                           rotation = 0.0,origin={5.25,
            9.75})));
    .Modelon.Blocks.Tables.ModelonTable2Ds Q_battery(
    descriptor="Battery heat table",
    fileName=fileNameSystemConfiguration,
    tableName="Q_battery_CRateTemp",
    tableOnFile=true) annotation (Placement(transformation(
        extent={{-25.880048264549934,-11.880048264549934},{-2.1199517354500657,
            11.880048264549934}},
        origin={22,0},
        rotation=0.0)));
    .Modelica.Blocks.Math.Gain  gain(k=1000)   annotation(Placement(transformation(extent = {{24.0,-10.0},{44.0,10.0}},origin={16,0},     rotation = 0.0)));
equation
    connect(Q_battery_set.y,controlBus.Q_battery) annotation(Line(points={{84.5,1},
          {84.5,0},{100,0}},                                                                                  color = {0,0,127}));
  connect(gain.y, Q_battery_set.u)
    annotation (Line(points={{61,0},{61,1},{73,1}}, color={0,0,127}));
  connect(Q_battery.y, gain.u)
    annotation (Line(points={{21.0681,0},{38,0}}, color={0,0,127}));
  connect(Q_battery.u2, controlBus.batteryTemp_degC) annotation (Line(points={{
          -6.25606,-7.12803},{-20,-7.12803},{-20,-20},{100,-20},{100,0}}, color=
         {0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(Q_battery.u1, controlBus.batteryCrate) annotation (Line(points={{
          -6.25606,7.12803},{-20,7.12803},{-20,28},{100,28},{100,0}}, color={0,
          0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
end BatteryHeat_CRateTempTable_File;

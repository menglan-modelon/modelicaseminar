within ModelicaSeminar.Seminar06.EVThermal.Controllers.SubControllers;
model RefLoopChillerEvap_2DTable_File
  "refrigerant loop with chiller and evaporator heat, file-based"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.ComponentController;
  parameter String fileName=.Modelica.Utilities.Files.loadResource("modelica://ModelicaSeminar/Resources/Data/Rev26_Controls_Cooling1.txt") "file with controls inputs";
  parameter String fileNameSystemConfiguration=fileName "file with system configuration data";
  parameter Real scale_factor=1 "scale factor applied to chiller power output from table";
  .Modelica.Blocks.Sources.CombiTimeTable Q_evaporator(
    tableOnFile=true,
    tableName="Q_evaporator",
    fileName=fileName)
    annotation (Placement(transformation(extent={{18,68},{42,92}})));
  .Modelica.Blocks.Routing.RealPassThrough Q_evaporator_set annotation (
      Placement(transformation(extent={{50,74},{62,86}}, rotation=0.0)));
    .Modelica.Blocks.Routing.RealPassThrough Q_chiller_set annotation(Placement(transformation(extent = {{58.51310735805295,-51.15355930861372},{72.8202259752804,-36.84644069138628}},rotation = 0.0,origin={8,4})));
    .Modelon.Blocks.Tables.ModelonTable2Ds Q_chiller(
    tableOnFile=true,
    tableName="Q_chiller",
    fileName=fileNameSystemConfiguration,
    descriptor="Chiller cooling power table") annotation (Placement(
        transformation(
        extent={{-41.78002305699165,-53.78002305699165},{-22.219976943008348,-34.21997694300835}},
        origin={2,24},
        rotation=0.0)));

    .Modelica.Blocks.Math.Gain gain(k = -1) annotation(Placement(transformation(extent={{12.1276,
            -32.4},{24.4609,-20.4}},                                                                                                            origin={7.5391,
            6.4},                                                                                                                                                  rotation = 0.0)));
    .Modelica.Blocks.Math.Gain  scale(k=scale_factor)
                                            annotation(Placement(transformation(extent={{12.1276,
            -32.4},{24.4609,-20.4}},                                                                                                            origin={-12.4609,
            6.4},                                                                                                                                                  rotation = 0.0)));
  .Modelica.Blocks.Logical.Switch switch
    annotation (Placement(transformation(extent={{40,-50},{60,-30}})));
  .Modelica.Blocks.Sources.Constant chillerOff_Q(k=0)
    annotation (Placement(transformation(extent={{8,-60},{20,-48}})));
    .Modelon.Blocks.Tables.ModelonTable2Ds COP(
    tableOnFile=true,
    tableName="COP_refloop",
    fileName=fileNameSystemConfiguration,
    descriptor="Refrigerant system COP table") annotation (Placement(
        transformation(
        extent={{-41.78002305699165,-53.78002305699165},{-22.219976943008348,-34.21997694300835}},

        origin={2,64},
        rotation=0.0)));
    .Modelica.Blocks.Routing.RealPassThrough P_compressor_set annotation (
      Placement(transformation(
        extent={{58.51310735805295,-51.15355930861372},{72.8202259752804,-36.84644069138628}},

        rotation=0.0,
        origin={8,70})));
  .Modelica.Blocks.Math.Division division
    annotation (Placement(transformation(extent={{36,16},{56,36}})));
    .Modelica.Blocks.Math.Gain  gain1(k=-1)  annotation(Placement(transformation(extent={{12.1276,
            -32.4},{24.4609,-20.4}},                                                                                                            origin={3.5391,
            58.4},                                                                                                                                                 rotation = 0.0)));
equation
  connect(Q_evaporator.y[1], Q_evaporator_set.u)
    annotation (Line(points={{43.2,80},{48.8,80}},
                                                 color={0,0,127}));
  connect(Q_evaporator_set.y, controlBus.Q_evaporator) annotation (Line(points={{62.6,80},
          {86,80},{86,0},{100,0}},            color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
    connect(Q_chiller_set.y,controlBus.Q_chiller) annotation(Line(points={{81.5356,
          -40},{86,-40},{86,0},{100,0}},                                                                                     color = {0,0,127}));
  connect(Q_chiller.u2, controlBus.ChillerTempIn_degC) annotation (Line(points={{-41.736,
          -25.868},{-46,-25.868},{-46,-80},{100,-80},{100,0}},           color=
          {0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(Q_chiller.y, scale.u)
    annotation (Line(points={{-19.242,-20},{-1.56663,-20}}, color={0,0,127}));
  connect(scale.y, gain.u)
    annotation (Line(points={{12.6167,-20},{18.4334,-20}}, color={0,0,127}));
  connect(Q_chiller.u1, controlBus.T_ambient_degC) annotation (Line(points={{-41.736,
          -14.132},{-80,-14.132},{-80,-92},{100,-92},{100,0}},         color={0,
          0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(gain.y, switch.u1) annotation (Line(points={{32.6167,-20},{34,-20},{
          34,-32},{38,-32}}, color={0,0,127}));
  connect(switch.y, Q_chiller_set.u)
    annotation (Line(points={{61,-40},{65.0824,-40}}, color={0,0,127}));
  connect(switch.u3, chillerOff_Q.y) annotation (Line(points={{38,-48},{28,-48},
          {28,-54},{20.6,-54}}, color={0,0,127}));
  connect(switch.u2, controlBus.chillerOnOff) annotation (Line(points={{38,-40},
          {32,-40},{32,-60},{100,-60},{100,0}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(Q_chiller.u1, COP.u1) annotation (Line(points={{-41.736,-14.132},{-80,
          -14.132},{-80,25.868},{-41.736,25.868}}, color={0,0,127}));
  connect(Q_chiller.u2, COP.u2) annotation (Line(points={{-41.736,-25.868},{-46,
          -25.868},{-46,14},{-44,14},{-44,14.132},{-41.736,14.132}}, color={0,0,
          127}));
  connect(COP.y, division.u2)
    annotation (Line(points={{-19.242,20},{34,20}}, color={0,0,127}));
  connect(division.y, P_compressor_set.u)
    annotation (Line(points={{57,26},{65.0824,26}}, color={0,0,127}));
  connect(P_compressor_set.y, controlBus.P_compressor) annotation (Line(points=
          {{81.5356,26},{86,26},{86,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(gain1.y, division.u1)
    annotation (Line(points={{28.6167,32},{34,32}}, color={0,0,127}));
  connect(switch.y, gain1.u) annotation (Line(points={{61,-40},{62,-40},{62,12},
          {10,12},{10,32},{14.4334,32}}, color={0,0,127}));
end RefLoopChillerEvap_2DTable_File;

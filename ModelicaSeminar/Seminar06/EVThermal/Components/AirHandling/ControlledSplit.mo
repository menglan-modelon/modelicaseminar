within ModelicaSeminar.Seminar06.EVThermal.Components.AirHandling;
model ControlledSplit "split with input control"
extends .AirConditioning.ThermoFluidPro.Icons.NewIcons.Pipes.AirSplit;
  AirConditioning.AirHandling.MultiportVolume vol(
    N=3,
    redeclare package Medium = Medium,
    V_tot=V,
    init=init)
    annotation (Placement(transformation(extent={{-60,-20},{-20,20}})));
  AirConditioning.AirHandling.FlowResistance.VariableFrictionLoss res_b(
    redeclare package Medium = Medium,
    mdot_nom=mdot_nom,
    p_nom=p_nom,
    T_nom=T_nom,
    dp_nom=dp_nom)
    annotation (Placement(transformation(extent={{18,-20},{58,20}})));
  AirConditioning.AirHandling.FlowResistance.VariableFrictionLoss res_c(
    redeclare package Medium = Medium,
    mdot_nom=mdot_nom,
    p_nom=p_nom,
    T_nom=T_nom,
    dp_nom=dp_nom) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={4,-52})));
  .AirConditioning.ThermoFluidPro.Interfaces.AirFlow.FlowA a(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}}),
        iconTransformation(extent={{-110,-10},{-90,10}})));
  .AirConditioning.ThermoFluidPro.Interfaces.AirFlow.FlowB b(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{90,-10},{110,10}}),
        iconTransformation(extent={{90,-10},{110,10}})));
  .AirConditioning.ThermoFluidPro.Interfaces.AirFlow.FlowB c(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-6,-114},{14,-94}}),
        iconTransformation(extent={{-6,-114},{14,-94}})));
  replaceable package Medium = .AirConditioning.ThermoFluidPro.Media.Air.MoistAir "Medium"  annotation(choices(choice(redeclare
          replaceable package Medium =
            .AirConditioning.ThermoFluidPro.Media.Air.MoistAir
          "Air: Moist air model (fog but no ice, 0..150 degC)"),
                          choice(redeclare replaceable package Medium =
            .AirConditioning.ThermoFluidPro.Media.Air.NoncondensingAir
          "Air: Moist air model (non-condensing ideal gas, 200..6000 K)")),
      Documentation(revisions="<html>
<hr><p><font color=\"#E72614\"><b>Copyright &copy; 2004-2018, MODELON AB</b></font> <font color=\"#AFAFAF\">The use of this software component is regulated by the licensing conditions for the Air Conditioning Library. This copyright notice must, unaltered, accompany all components that are derived from, copied from, or by other means have their origin from the Air Conditioning Library. </font>
</html>"));
  parameter .AirConditioning.ThermoFluidPro.InitConditions.AirChannelInit init "Initial values";
  parameter .Modelica.Units.SI.Volume V=0.1 "Total volume";
  parameter .Modelica.Media.Interfaces.PartialMedium.MassFlowRate mdot_nom=0.1
    "Nominal mass flowrate" annotation(Dialog(group="Pressure drop"));
  parameter .Modelica.Units.SI.Pressure p_nom=1.0e5 "Nominal inlet pressure"
    annotation (Dialog(group="Pressure drop"));
  parameter .Modelica.Media.Interfaces.Types.Temperature T_nom=300.0
    "Nominal inlet Temperature" annotation(Dialog(group="Pressure drop"));
  parameter .Modelica.Units.SI.Pressure dp_nom "Nominal pressure drop"
    annotation (Dialog(group="Pressure drop"));
  parameter .Modelica.Units.SI.MassFraction X_nom[Medium.nS]=Medium.reference_X
    "Nominal composition";
  .Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds(table=[1,1,1e-03; 2,1e-03,
        1]) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={0,60})));
  .Modelica.Blocks.Interfaces.RealInput u1
              "Connector of Real input signal" annotation (Placement(
        transformation(
        extent={{20,-20},{-20,20}},
        rotation=90,
        origin={0,100}), iconTransformation(
        extent={{20,-20},{-20,20}},
        rotation=90,
        origin={0,40})));
equation
  connect(vol.a[1], res_b.a) annotation (Line(
      points={{-40,-1.33333},{-12,-1.33333},{-12,0},{18,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(vol.a[2], res_c.a) annotation (Line(
      points={{-40,2.22045e-016},{-18,2.22045e-016},{-18,-32},{4,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(vol.a[3], a) annotation (Line(
      points={{-40,1.33333},{-70,1.33333},{-70,0},{-100,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(res_b.b, b) annotation (Line(
      points={{58,0},{74,0},{74,0},{100,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(res_c.b, c) annotation (Line(
      points={{4,-72},{4,-104}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(c, c) annotation (Line(points={{4,-104},{4,-104}},
        color={85,170,255}));
  connect(combiTable1Ds.u, u1)
    annotation (Line(points={{0,72},{0,100}}, color={0,0,127}));
  connect(combiTable1Ds.y[1], res_c.opening) annotation (Line(points={{0,49},{0,
          40},{80,40},{80,-52},{24,-52}}, color={0,0,127}));
  connect(combiTable1Ds.y[2], res_b.opening)
    annotation (Line(points={{0,49},{0,40},{38,40},{38,20}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),
                   graphics={              Text(
          extent={{-82,8},{78,-12}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={85,170,255},
          textString="%name")}),     Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Documentation(revisions="<html>
<hr><p><font color=\"#E72614\"><b>Copyright &copy; 2004-2018, MODELON AB</b></font> <font color=\"#AFAFAF\">The use of this software component is regulated by the licensing conditions for the Air Conditioning Library. This copyright notice must, unaltered, accompany all components that are derived from, copied from, or by other means have their origin from the Air Conditioning Library. </font>
</html>", info="<html>
<body>
<h4>Split</h4>
</body>
</html>"));
end ControlledSplit;

within ModelicaSeminar.Seminar06.EVThermal.Components.AirHandling.Adapters;
model HXLSegmentedToACL
  "Adapter to go from HXL segmented to ACL representation by ideal mixing"

  replaceable package MediumHXL =
      .Modelon.Media.PreDefined.CondensingGases.MoistAir constrainedby
    .Modelon.Media.Interfaces.HomogeneousMedium annotation (choicesAllMatching=true);

  replaceable package MediumACL = .AirConditioning.ThermoFluidPro.Media.Air.MoistAir
    constrainedby .Modelica.Media.Interfaces.PartialCondensingGases
    "Medium in the component" annotation (choices(choice(redeclare replaceable
          package Medium = ThermoFluidPro.Media.Air.MoistAir
          "Air: Moist air model (fog but no ice, 0..150 degC)"), choice(
          redeclare replaceable package Medium =
            ThermoFluidPro.Media.Air.NoncondensingAir
          "Air: Moist air model (non-condensing ideal gas, 200..6000 K)")),
      Documentation(revisions="<html>
<hr><p><font color=\"#E72614\"><b>Copyright &copy; 2004-2018, MODELON AB</b></font> <font color=\"#AFAFAF\">The use of this software component is regulated by the licensing conditions for the ThermoFluidPro Library. This copyright notice must, unaltered, accompany all components that are derived from, copied from, or by other means have their origin from the ThermoFluidPro Library. </font>
</html>"));

  HeatExchanger.Utilities.Interfaces.SegmentedVolumePort portA(redeclare
      package Medium = MediumHXL, flowSegmentation=flowSegmentation)
    "Upstream port"
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  .AirConditioning.ThermoFluidPro.Interfaces.AirFlow.FlowB portB(redeclare package Medium =
        MediumACL) "Downstream port"
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  parameter HeatExchanger.FlowSegmentation flowSegmentation
    annotation (Dialog(tab="FlowSegmentation"));

  HeatExchanger.Sources.Adapters.SegmentedToLumped segmentedToLumped(redeclare
      package Medium = MediumHXL, flowSegmentation=flowSegmentation)
    annotation (Placement(transformation(extent={{14,-10},{26,10}})));
  Components.AirHandling.Adapters.HXLLumpedToACL hXLLumpedToACL(redeclare
      package MediumHXL = MediumHXL, redeclare package MediumACL = MediumACL)
    annotation (Placement(transformation(extent={{-26,-10},{-14,10}})));
equation

  connect(segmentedToLumped.portA, portA)
    annotation (Line(points={{26,0},{60,0}}, color={0,0,0}));
  connect(segmentedToLumped.portB, hXLLumpedToACL.portA)
    annotation (Line(points={{14,0},{-14,0}}, color={85,170,255}));
  connect(hXLLumpedToACL.portB, portB)
    annotation (Line(points={{-26,0},{-60,0}}, color={85,170,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-100},{60,100}})),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-60,-100},{60,100}}),
        graphics={
        Rectangle(
          extent={{-60,80},{60,-80}},
          lineColor={255,255,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-60,0},{0,40},{50,40}},
          color={85,170,255},
          smooth=Smooth.None),
        Line(
          points={{-60,0},{50,0}},
          color={85,170,255},
          smooth=Smooth.None),
        Line(
          points={{-60,0},{0,-40},{50,-40}},
          color={85,170,255},
          smooth=Smooth.None),
        Polygon(
          points={{20,-40},{36,-36},{36,-44},{20,-40}},
          lineColor={85,170,255},
          smooth=Smooth.None,
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{20,0},{36,4},{36,-4},{20,0}},
          lineColor={85,170,255},
          smooth=Smooth.None,
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{20,40},{36,44},{36,36},{20,40}},
          lineColor={85,170,255},
          smooth=Smooth.None,
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid)}),
    Documentation(revisions="<html>
 <hr><p><font class=\"copyright_bold\">Copyright &copy; 2004-2018, MODELON AB</font> <font class=\"copyright_base\">The use of this software component is regulated by the licensing conditions for the Heat Exchanger Library. This copyright notice must, unaltered, accompany all components that are derived from, copied from, or by other means have their origin from the Heat Exchanger Library. </font></p>
</html>", info="<html>
<h4>SegmentedToLumped</h4>
<p>This component is used to transfer segmented airflow into lumped airflow using ideal mixing.</p>
</html>"));
end HXLSegmentedToACL;

within ModelicaSeminar.Seminar06.EVThermal.Components.AirHandling.Adapters;
model ACLToHXLSegmented
  "Adapter to go from ACL to HXL segmented (homogeneous) representation"

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

  .AirConditioning.ThermoFluidPro.Interfaces.AirFlow.FlowA portA(redeclare package Medium =
        MediumACL) "Upstream port"
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  HeatExchanger.Utilities.Interfaces.SegmentedFlowPort portB(redeclare package
      Medium = MediumHXL, flowSegmentation=flowSegmentation) "Downstream port"
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  parameter HeatExchanger.FlowSegmentation flowSegmentation
    annotation (Dialog(tab="FlowSegmentation"));

  HeatExchanger.Sources.Adapters.LumpedToSegmented lumpedToSegmented(redeclare
      package Medium = MediumHXL, flowSegmentation=flowSegmentation)
    annotation (Placement(transformation(extent={{-26,-10},{-14,10}})));
  ModelicaSeminar.Seminar06.EVThermal.Components.AirHandling.Adapters.ACLToHXLLumped acToHXLLumped(redeclare
      package MediumHXL = MediumHXL, redeclare package MediumACL = MediumACL)
    annotation (Placement(transformation(extent={{14,-10},{26,10}})));
equation

  connect(lumpedToSegmented.portB, portB)
    annotation (Line(points={{-26,0},{-60,0}}, color={0,0,0}));
  connect(acToHXLLumped.portB, lumpedToSegmented.portA)
    annotation (Line(points={{14,0},{-14,0}}, color={85,170,255}));
  connect(acToHXLLumped.portA, portA)
    annotation (Line(points={{26,0},{60,0}}, color={85,170,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-100},{60,100}})),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-60,-100},{60,100}}),
        graphics={
        Rectangle(
          extent={{-58,80},{62,-80}},
          lineColor={255,255,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{50,0},{-10,40},{-60,40}},
          color={85,170,255},
          smooth=Smooth.None),
        Line(
          points={{50,0},{-60,0}},
          color={85,170,255},
          smooth=Smooth.None),
        Line(
          points={{50,0},{-10,-40},{-60,-40}},
          color={85,170,255},
          smooth=Smooth.None),
        Polygon(
          points={{-38,40},{-22,44},{-22,36},{-38,40}},
          lineColor={85,170,255},
          smooth=Smooth.None,
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-38,0},{-22,4},{-22,-4},{-38,0}},
          lineColor={85,170,255},
          smooth=Smooth.None,
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-38,-40},{-22,-36},{-22,-44},{-38,-40}},
          lineColor={85,170,255},
          smooth=Smooth.None,
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid)}),
    Documentation(revisions="<html>
 <hr><p><font class=\"copyright_bold\">Copyright &copy; 2004-2018, MODELON AB</font> <font class=\"copyright_base\">The use of this software component is regulated by the licensing conditions for the Heat Exchanger Library. This copyright notice must, unaltered, accompany all components that are derived from, copied from, or by other means have their origin from the Heat Exchanger Library. </font></p>
</html>", info="<html>
<h4>LumpedToSegmented</h4>
<p>This component is used to transfer lumped airflow into homogeneous segmented airflow.</p>
</html>"));
end ACLToHXLSegmented;

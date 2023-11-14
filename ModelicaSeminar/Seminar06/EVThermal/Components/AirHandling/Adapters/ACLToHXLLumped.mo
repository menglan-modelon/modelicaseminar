within ModelicaSeminar.Seminar06.EVThermal.Components.AirHandling.Adapters;
model ACLToHXLLumped "Adapter for ACL air port to HXL lumped air port"
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
        MediumACL) "Upstream port" annotation (Placement(transformation(extent={{50,-10},
            {70,10}}),           iconTransformation(extent={{50,-10},{70,10}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.AirVolumePort portB(
      redeclare package Medium = MediumHXL)
    "Downstream port" annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
protected
  .Modelica.Units.SI.Temperature Tair;

equation
  assert(MediumHXL.nS == MediumACL.nS, "ACL and HXL must use equivalent media, but MediumACL.nS != MediumHXL.nS");
  assert(MediumHXL.nC == MediumACL.nC, "ACL and HXL must use equivalent media, but MediumACL.nC != MediumHXL.nC");

  portA.p = portB.p;
  portA.m_flow + portB.m_flow = 0;

  // Non-linear equation for Tair
  inStream(portA.h_outflow) = MediumACL.specificEnthalpy(MediumACL.setState_pTX(
    p=portA.p,
    T=Tair,
    X=inStream(portA.X_outflow)));

  // Properties for designed flow
  portB.X_outflow = inStream(portA.X_outflow);
  portB.h_outflow = MediumHXL.specificEnthalpy(MediumHXL.setState_pTX(
    p=portB.p,
    T=Tair,
    X=portB.X_outflow));

  // Properties for reverse flow (not allowed)
  portA.h_outflow = MediumACL.h_default;
  portA.X_outflow = MediumACL.reference_X;

   annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-60,-100},
            {60,100}}), graphics={Line(
          points={{50,0},{-50,0}},
          color={85,170,255},
          smooth=Smooth.None), Polygon(
          points={{-10,0},{6,4},{6,-4},{-10,0}},
          lineColor={85,170,255},
          smooth=Smooth.None,
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid)}),
                         Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-60,-100},{60,100}})));
end ACLToHXLLumped;

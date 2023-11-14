within ModelicaSeminar.Seminar06.EVThermal.Utilities.Records.Summaries.RefrigerantSystem;

partial model TestbenchPars "Parameter model for testbench template models"
  //Medium
  replaceable package RefrigerantMedium =
      .AirConditioning.ThermoFluidPro.Media.TableBasedProperties.R1234yf constrainedby
    .AirConditioning.ThermoFluidPro.Media.Interfaces.ExtendedPartialTwoPhaseMedium
    "Refrigerant medium" annotation (choicesAllMatching);
  replaceable package CoolantMedium =
      .LiquidCooling.Media.AqueousSolutions.EthyleneGlycolWater50 constrainedby
    .Modelon.Media.Templates.CompressibleLiquid "Liquid medium, if applicable"
    annotation (editButton=false, choicesAllMatching);

  replaceable package AirMedium = .AirConditioning.ThermoFluidPro.Media.Air.MoistAir
    constrainedby .Modelica.Media.Interfaces.PartialCondensingGases
    "Air medium " annotation (choicesAllMatching);
  annotation (
    Documentation(info="<html>
<h1>TestbenchPars</h1>
<p>This record contains only the Medium class parameter for
automotive testbench and cycle examples.
It is used as a base class for template models, is not meant to be edited
by the user and does not contain any parameter values.
</p>
</html>", revisions="<html>
Copyright &copy; 2004-2023, MODELON AB <br /> The use of this software component is regulated by the licensing conditions for Modelon Libraries. <br />This copyright notice must, unaltered, accompany all components that are derived from, copied from, <br />or by other means have their origin from any Modelon Library.
</html>"),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
end TestbenchPars;

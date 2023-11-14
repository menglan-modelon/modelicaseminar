within ModelicaSeminar.Seminar06.EVThermal.Controllers.Components;

block LimPIReset "Limited PI controller with reset capability"
  extends .IndustryExamples.Automotive.ThermalManagement.CabinAndBatteryRefrigerantCoolantSystem.Controls.Blocks.LimPI;
  discrete Integer reset_count
    "counter for number of times that reset signal has been applied";
  .Modelica.Blocks.Interfaces.BooleanInput reset "reset signal" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-80,100})));
  .Modelica.Blocks.Interfaces.RealInput y_reset "value at reset condition" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-30,100})));
equation
  when reset then
    reinit(I.y, pre(y_reset)/k - P.y);
    reset_count = pre(reset_count) + 1;
  end when;
  annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-20,100})), Documentation(info=
          "<html><p>This block is extended from <a href=\"modelica://IndustryExamples.Automotive.ThermalManagement.CabinAndBatteryRefrigerantCoolantSystem.Controls.Blocks.LimPI\">LimPI</a>. It has a reset signal through which the controller could be reset.</p></html>",
        revisions="<html>
Copyright &copy; 2004-2023, MODELON AB <br /> The use of this software component is regulated by the licensing conditions for Modelon Libraries. <br />This copyright notice must, unaltered, accompany all components that are derived from, copied from, <br />or by other means have their origin from any Modelon Library.
</html>"));
end LimPIReset;

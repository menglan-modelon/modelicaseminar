within ModelicaSeminar.Seminar06.EVThermal.Utilities.Records.InitData.Choices;
type EvapBranches = enumeration(
    FrontEvapOnly "Only flow through front evaporator",
    BatteryChillerOnly "Only flow through battery chiller",
    TwoBrachesOn "flow through all branches") annotation (Documentation(info="<html>
<h4>ModeOfOperation</h4>
<p>Options for choosing the test bench mode of operation.</p>
</html>"));

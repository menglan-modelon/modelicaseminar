within ModelicaSeminar.Seminar06.EVThermal.Components.Valves;
model ProportionalValveA "proportional valve, design A"
  extends .LiquidCooling.Valves.Generic.ValveIncompressible(Kv=2);
    annotation(Icon(graphics = {Text(textString="",origin={2,-76},extent={{-51.32580717275873,21.29698310119},{51,-22}}),Text(textString="%name",origin={-2,-80},extent={{-84,40},{84,-40}})}));
end ProportionalValveA;

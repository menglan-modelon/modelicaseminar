within ModelicaSeminar.Seminar06.EVThermal.Components.Pumps;
model Pump_100 "pump 100W design"
  extends .LiquidCooling.Pumps.Pump(
    N_nom=2379,
    effParam=.Modelon.ThermoFluid.Choices.EfficiencyParameterization.Torque,
    redeclare function flowCharacteristic =
        .Modelon.ThermoFluid.Pumps.PumpCharacteristics.tableFlow (table=[-0.001666667,
            350; -0.001333333,200; -0.001,100; -0.000666667,30; -0.000333333,18;
            0.00025,15; 0.0015,14; 0.002,13; 0.002666667,10; 0.003333333,5;
            0.003666667,2.5; 0.003833333,0.6; 0.0039,0; 0.005,-17; 0.006666667,
            -60; 0.01,-240]),
    redeclare function torqueCharacteristic =
        .Modelon.ThermoFluid.Pumps.PumpCharacteristics.tableTorque (table=[-0.005,
            130; -0.0025,10; -0.001,3.5; -0.0002,3; 0.001,3.5; 0.002,4; 0.003,4.5;
            0.004,5; 0.005,5.5; 0.006,5; 0.007,6.5; 0.008,6.9; 0.009,7.1; 0.01,7.3;
            0.012,7.2; 0.013,6.9; 0.015,6; 0.02,2.5; 0.03,-8]));
  annotation (Icon(graphics={Text(
          extent={{-44,12},{48,-14}},
          lineColor={0,140,72},
          fillColor={255,255,255},
          fillPattern=FillPattern.None,
          textString="100")}));
end Pump_100;

within ModelicaSeminar.Seminar06.EVThermal.Controllers.RefrigerantSystem;
model Condenser_File "condenser with input conditions from file"
    parameter String fileName=.Modelica.Utilities.Files.loadResource("modelica://EVThermal/Resources/Data/Rev26_Controls_Cooling1.txt") "file with controls inputs";

  .EVThermal.Interfaces.ControlBus controlBus annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={100,0}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={100,0})));


  .Modelica.Blocks.Sources.CombiTimeTable mdot_airCondenser(
    tableOnFile=true,
    tableName="mdot_airCondenser",
    fileName=fileName) annotation (Placement(transformation(
        extent={{-100.0,50.0},{-80.0,70.0}},
        rotation=0.0,
        origin={100,-30})));
    .Modelica.Blocks.Routing.RealPassThrough set_mdot_airCondenser annotation (
      Placement(transformation(
        extent={{-72.0,56.0},{-64.0,64.0}},
        rotation=0.0,
        origin={100,-30})));
    .Modelica.Blocks.Routing.RealPassThrough set_condenserPhi annotation (
      Placement(transformation(
        extent={{-74.0,16.0},{-66.0,24.0}},
        rotation=0.0,
        origin={100,-20})));
    .Modelica.Blocks.Sources.CombiTimeTable condenserPhi(
    fileName=fileName,
    tableName="condenserPhi",
    tableOnFile=true) annotation (Placement(transformation(
        extent={{-100.0,10.0},{-80.0,30.0}},
        rotation=0.0,
        origin={100,-20})));
    .Modelica.Blocks.Sources.CombiTimeTable condenserT_degC(
    fileName=fileName,
    tableName="condenserT_degC",
    tableOnFile=true) annotation (Placement(transformation(
        extent={{-100.0,-30.0},{-80.0,-10.0}},
        rotation=0.0,
        origin={100,-10})));
    .Modelica.Blocks.Routing.RealPassThrough set_condenserT_degC annotation (
      Placement(transformation(
        extent={{-74.0,-24.0},{-66.0,-16.0}},
        rotation=0.0,
        origin={100,-10})));
equation
  connect(mdot_airCondenser.y[1], set_mdot_airCondenser.u)
    annotation (Line(points={{21,30},{27.2,30}}, color={0,0,127}));
  connect(condenserT_degC.y[1], set_condenserT_degC.u)
    annotation (Line(points={{21,-30},{25.2,-30}}, color={0,0,127}));
  connect(condenserPhi.y[1], set_condenserPhi.u)
    annotation (Line(points={{21,0},{25.2,0}}, color={0,0,127}));
  connect(set_condenserT_degC.y, controlBus.condenserT_degC) annotation (Line(
        points={{34.4,-30},{80,-30},{80,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(set_condenserPhi.y, controlBus.condenserPhi) annotation (Line(points=
          {{34.4,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(set_mdot_airCondenser.y, controlBus.mdot_airCondenser) annotation (
      Line(points={{36.4,30},{80,30},{80,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
                                Text(
          textString="%name",
          extent={{-76,42},{68,-34}},
          lineColor={0,0,255})}),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html><p>This controller controls the evaporator air outlet temperature by closing the TXV available before the front evaporator in the refrigeration loop.</p>
<p>Hysteresis receives evaporator air outlet temperature from the control bus. Hysteresis upper and lower limits are defined with a small variation from the set point. Top-level parameters <em>dTEvap_hysteresis_high </em>and <em>dTEvap_hysteresis_low</em> give the deviations. Set point for evaporator air outlet temperature signal is received via the control bus.</p></html>",
        revisions="<html>
Copyright &copy; 2004-2023, MODELON AB <br /> The use of this software component is regulated by the licensing conditions for Modelon Libraries. <br />This copyright notice must, unaltered, accompany all components that are derived from, copied from, <br />or by other means have their origin from any Modelon Library.
</html>"));
end Condenser_File;

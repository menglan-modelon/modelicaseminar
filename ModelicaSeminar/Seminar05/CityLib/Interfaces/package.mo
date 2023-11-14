within ModelicaSeminar.Seminar05.CityLib;

    package Interfaces
    extends Modelica.Icons.InterfacesPackage;
        connector Electricity
            .Modelica.Units.SI.Voltage v;
            flow .Modelica.Units.SI.EnergyFlowRate Pflow "Energy Flow Rate";
            annotation(Icon(graphics = {Rectangle(fillColor={255,170,0},fillPattern=FillPattern.Solid,extent={{-100,100},{100,-100}})}));
        end Electricity;
        connector Electricity_n
            .Modelica.Units.SI.Voltage v;
            flow .Modelica.Units.SI.EnergyFlowRate Pflow "Energy Flow Rate";
            annotation(Icon(graphics = {Rectangle(fillColor={255,255,255},fillPattern=FillPattern.Solid,extent={{-100,100},{100,-100}})}));
        end Electricity_n;
        partial model Electricity_TwoPin
            Interfaces.Electricity p annotation(Placement(visible = true,transformation(origin = {-100,0},extent = {{-10,-10},{10,10}},rotation = 0),iconTransformation(origin = {-100,0},extent = {{-10,-10},{10,10}},rotation = 0)));
            Interfaces.Electricity_n n annotation(Placement(visible = true,transformation(origin = {102,0},extent = {{-10,-10},{10,10}},rotation = 0),iconTransformation(origin = {102,0},extent = {{-10,-10},{10,10}},rotation = 0)));
            .Modelica.Units.SI.EnergyFlowRate Pflow(start = 0) "Power x Hour Flow Rate";
            .Modelica.Units.SI.Voltage v "Voltage difference";
        equation
            v = p.v - n.v;
            p.Pflow + n.Pflow = 0;
            Pflow = p.Pflow;
            annotation(Diagram(graphics = {Line(points={{-60,15},{-60,-15},{30,-15},{30,-30},{60,0},{30,30},{30,15},{-60,15}},color={255,0,0},thickness=1)}),Icon);
        end Electricity_TwoPin;
    end Interfaces;

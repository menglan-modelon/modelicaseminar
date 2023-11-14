within ModelicaSeminar.Seminar05.CityLib;

    package Components
    extends Modelica.Icons.VariantsPackage;
        model Battery
            extends .ModelicaSeminar.Seminar05.CityLib.Interfaces.Electricity_TwoPin;
            parameter .Modelica.Units.SI.Voltage v_max = 3 "Voltage at maximum SOC";
            parameter Real R = 1 "Inner resistance for power flow [V/W]";
            parameter .Modelica.Units.SI.Energy maxWh = 1 "Maximum Power x Sec";
            parameter Real initialSOC = 0.5 "Initial SOC (0~1)";
            parameter Real maxSOC = 1 "Maximum SOC (0~1)";
            parameter Real minSOC = 0 "Minimum SOC (0~1)";
            .Modelica.Units.SI.Energy Wh(start = maxWh * initialSOC) "Power x Sec";
            .Modelica.Units.SI.Energy Wh_maxSOC = maxWh * maxSOC "Power x Sec at max. SOC";
            .Modelica.Units.SI.Energy Wh_minSOC = maxWh * minSOC "Power x Sec at min. SOC";
            Real SOC "State of Charge (0~1)";
            Integer s "State (1:chargeable, 0:non-chargeable)";
            .Modelica.Units.SI.Power Pfb "Power flow to battery";
        equation
            SOC = Wh / maxWh;
            s = if (Wh < Wh_minSOC and Pflow > 0) or (Wh > Wh_maxSOC and Pflow < 0) or (Wh <= Wh_maxSOC and Wh >= Wh_minSOC) then 1 else 0;
            Pfb = if s > 0 then Pflow else 0;
            v = if s > 0 then v_max * SOC + R * Pfb else 0;
            der(Wh) = if s > 0 then Pfb else 0;
            annotation(Icon(graphics = {Bitmap(rotation=270,extent={{-59,60},{59,-60}},imageSource="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"),Line(origin={-63,0},points={{-27,0},{27,0},{27,0}},color={255,170,0},thickness=0.5),Line(origin={65.6686,-0.56213},points={{-27,0},{27,0},{27,0}},color={255,170,0},thickness=0.5),Text(origin={0,76},extent={{-100,20},{100,-20}},textString="%name"),Text(origin={8,-70},extent={{-87,15},{87,-15}},textString="maxWh=1")}));
        end Battery;
        model FlowResistance
            extends .ModelicaSeminar.Seminar05.CityLib.Interfaces.Electricity_TwoPin;
            parameter Real k = 1 "Energy flow resistance";
        equation
            k * Pflow = v;
            annotation(Diagram(graphics = {Line(points={{-60,15},{-60,-15},{30,-15},{30,-30},{60,0},{30,30},{30,15},{-60,15}},color={255,0,0},thickness=1)}),Icon(graphics = {Text(extent={{-150,-40},{150,-80}},textString="k=1"),Rectangle(lineColor={0,0,255},fillColor={255,170,0},fillPattern=FillPattern.Solid,lineThickness=0.75,extent={{-70,30},{70,-30}}),Line(visible=false,points={{0,-100},{0,-30}},color={127,0,0},pattern=LinePattern.Dot),Line(points={{-90,0},{-70,0}},color={255,170,0},thickness=0.75),Text(textColor={0,0,255},extent={{-150,90},{150,50}},textString="%name",origin={-2,-8}),Line(points={{70,0},{90,0}},color={255,170,0},thickness=0.75)}));
        end FlowResistance;
        model Ground "Ground node"
            .ModelicaSeminar.Seminar05.CityLib.Interfaces.Electricity electricity annotation(Placement(visible = true,transformation(origin = {0,100},extent = {{-10,-10},{10,10}},rotation = 0),iconTransformation(origin = {0,100},extent = {{-10,-10},{10,10}},rotation = 0)));
        equation
            electricity.v = 0;
            annotation(Documentation(info = "<html>
    <p>Ground of an electrical circuit. The potential at the ground node is zero. Every electrical circuit has to contain at least one ground object.</p>
    </html>",revisions = "<html>
    <ul>
    <li><em> 1998   </em>
           by Christoph Clauss<br> initially implemented<br>
           </li>
    </ul>
    </html>"),Icon(coordinateSystem(preserveAspectRatio = true,extent = {{-100,-100},{100,100}}),graphics = {Line(points={{-60,50},{60,50}},color={0,0,255}),Line(points={{-40,30},{40,30}},color={0,0,255}),Line(points={{-20,10},{20,10}},color={0,0,255}),Line(points={{0,90},{0,50}},color={0,0,255}),Text(textColor={0,0,255},extent={{-150,-10},{150,-50}},textString="%name")}));
        end Ground;
    end Components;

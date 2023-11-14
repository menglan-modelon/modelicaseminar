within ModelicaSeminar.Seminar04.SpeakerLib;

    package Interfaces
        extends .Modelica.Icons.InterfacesPackage;
        partial model ElectricalTwoPin
            .Modelica.Electrical.Analog.Interfaces.NegativePin n annotation(Placement(visible = true,transformation(origin = {100,0},extent = {{-10,-10},{10,10}},rotation = 0),iconTransformation(origin = {100,0},extent = {{-10,-10},{10,10}},rotation = 0)));
            .Modelica.Electrical.Analog.Interfaces.PositivePin p annotation(Placement(visible = true,transformation(origin = {-100,0},extent = {{-10,-10},{10,10}},rotation = 0),iconTransformation(origin = {-102,0},extent = {{-10,-10},{10,10}},rotation = 0)));
            parameter StateSelect stateSelect = StateSelect.default;
            .Modelica.Units.SI.Voltage u(start = 0,stateSelect = stateSelect) "Voltage drop of the two pins (= p.v - n.v)";
            .Modelica.Units.SI.Current i(start = 0) "Current flowing from pin p to pin n";
        equation
            u = p.v - n.v;
            0 = p.i + n.i;
            i = p.i;
            annotation(Icon(coordinateSystem(initialScale = 1)));
        end ElectricalTwoPin;
        partial model ElectricalTwoPinVertical
            .Modelica.Electrical.Analog.Interfaces.NegativePin n annotation(Placement(visible = true,transformation(origin = {0,98},extent = {{-10,-10},{10,10}},rotation = 0),iconTransformation(origin = {0,100},extent = {{-10,-10},{10,10}},rotation = 0)));
            .Modelica.Electrical.Analog.Interfaces.PositivePin p annotation(Placement(visible = true,transformation(origin = {0,-100},extent = {{-10,-10},{10,10}},rotation = 0),iconTransformation(origin = {0,-102},extent = {{-10,-10},{10,10}},rotation = 0)));
            parameter StateSelect stateSelect = StateSelect.default;
            .Modelica.Units.SI.Voltage u(start = 0,stateSelect = stateSelect) "Voltage drop of the two pins (= p.v - n.v)";
            .Modelica.Units.SI.Current i(start = 0) "Current flowing from pin p to pin n";
        equation
            u = p.v - n.v;
            0 = p.i + n.i;
            i = p.i;
            annotation(Icon(coordinateSystem(initialScale = 1)));
        end ElectricalTwoPinVertical;
        partial model MechanicalTwoFlangesVertical
            .Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a annotation(Placement(visible = true,transformation(origin = {0,-100},extent = {{-10,-10},{10,10}},rotation = 0),iconTransformation(origin = {0,-100},extent = {{-10,-10},{10,10}},rotation = 0)));
            .Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b annotation(Placement(visible = true,transformation(origin = {0,100},extent = {{-10,-10},{10,10}},rotation = 0),iconTransformation(origin = {0,100},extent = {{-10,-10},{10,10}},rotation = 0)));
            .Modelica.Units.SI.Position s_rel(start = 0) "Relative distance (= flange_b.s - flange_a.s)";
            .Modelica.Units.SI.Velocity v "Relative velocity";
            .Modelica.Units.SI.Force f "Force between flanges (positive in direction of flange axis R)";
        equation
            s_rel = flange_b.s - flange_a.s;
            v = der(s_rel);
            flange_b.f = f;
            flange_a.f = -f;
            annotation(Icon(coordinateSystem(initialScale = 1)));
        end MechanicalTwoFlangesVertical;
        connector AcousticPort "Connector port for acoustic systems"
            .Modelica.Units.SI.Pressure p;
            flow .Modelica.Units.SI.VolumeFlowRate q;
            annotation(Icon(coordinateSystem(initialScale = 1),graphics = {Rectangle(lineColor={255,170,0},fillColor={255,170,0},fillPattern=FillPattern.Solid,extent={{-40,40},{40,-40}})}),Diagram(graphics = {Text(lineColor={0,0,255},extent={{-160,110},{40,50}},textString="%name"),Rectangle(lineColor={255,170,0},fillColor={255,170,0},fillPattern=FillPattern.Solid,extent={{-40,40},{40,-40}})}));
        end AcousticPort;
        connector AcousticPort_a "Connector port for acoustic systems"
            extends AcousticPort;
            annotation(Icon(coordinateSystem(initialScale = 1),graphics = {Rectangle(lineColor={255,170,0},fillColor={255,170,0},fillPattern=FillPattern.Solid,extent={{-100,100},{100,-100}})}),Diagram(graphics = {Text(lineColor={0,0,255},extent={{-160,110},{40,50}},textString="%name"),Rectangle(lineColor={255,170,0},fillColor={255,170,0},fillPattern=FillPattern.Solid,extent={{-40,40},{40,-40}})}));
        end AcousticPort_a;
        connector AcousticPort_b "Connector port for acoustic systems"
            extends AcousticPort;
            annotation(Icon(coordinateSystem(initialScale = 1),graphics = {Rectangle(lineColor={255,170,0},fillColor={255,255,255},fillPattern=FillPattern.Solid,lineThickness=0.5,extent={{-100,100},{100,-100}})}),Diagram(graphics = {Text(lineColor={0,0,255},extent={{-160,110},{40,50}},textString="%name"),Rectangle(lineColor={255,170,0},fillColor={255,255,255},fillPattern=FillPattern.Solid,lineThickness=0.5,extent={{-40,40},{40,-40}})}));
        end AcousticPort_b;
        partial model AcousticTwoPorts
            .ModelicaSeminar.Seminar04.SpeakerLib.Interfaces.AcousticPort_a acousticPort_a annotation(Placement(visible = true,transformation(origin = {-100,0},extent = {{-10,-10},{10,10}},rotation = 0),iconTransformation(origin = {-99,1},extent = {{-9,-9},{9,9}},rotation = 0)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Interfaces.AcousticPort_b acousticPort_b annotation(Placement(visible = true,transformation(origin = {100,0},extent = {{-10,-10},{10,10}},rotation = 0),iconTransformation(origin = {99,-1},extent = {{-9,-9},{9,9}},rotation = 0)));
            parameter StateSelect stateSelect = StateSelect.default "Priority to use s and v as states" annotation(Dialog(tab = "Advanced"));
            .Modelica.Units.SI.Pressure p "Pressure drop of the two ports";
            .Modelica.Units.SI.VolumeFlowRate q(start = 0,stateSelect = stateSelect) "Volume rate flowing from port a to port b";
        equation
            p = acousticPort_a.p - acousticPort_b.p;
            0 = acousticPort_a.q + acousticPort_b.q;
            q = acousticPort_a.q;
            annotation(Icon(coordinateSystem(initialScale = 1)),Diagram(graphics = {Text(lineColor={160,160,164},extent={{90,45},{110,25}},textString="q"),Line(origin={0,8},points={{-78,-48},{80,-48}},color={160,160,164}),Line(points={{-110,20},{-85,20}},color={160,160,164}),Polygon(lineColor={160,160,164},fillColor={160,160,164},fillPattern=FillPattern.Solid,points={{105,23},{115,20},{105,17},{105,23}}),Text(lineColor={160,160,164},extent={{-110,25},{-90,45}},textString="q"),Text(origin={0,8},lineColor={160,160,164},extent={{-58,-50},{62,-22}},textString="dp = port_a.p - port_b.p"),Polygon(origin={0,8},lineColor={160,160,164},fillColor={160,160,164},fillPattern=FillPattern.Solid,points={{-69,-45},{-79,-48},{-69,-51},{-69,-45}}),Line(points={{90,20},{115,20}},color={160,160,164}),Polygon(lineColor={160,160,164},fillColor={160,160,164},fillPattern=FillPattern.Solid,points={{-95,23},{-85,20},{-95,17},{-95,23}})}));
        end AcousticTwoPorts;
        partial model AcousticTwoPortsVertical
            .ModelicaSeminar.Seminar04.SpeakerLib.Interfaces.AcousticPort_b acousticPort_b annotation(Placement(visible = true,transformation(origin = {0,100},extent = {{-10,-10},{10,10}},rotation = 0),iconTransformation(origin = {1,99},extent = {{-9,-9},{9,9}},rotation = 0)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Interfaces.AcousticPort_a acousticPort_a annotation(Placement(visible = true,transformation(origin = {0,-100},extent = {{-10,-10},{10,10}},rotation = 0),iconTransformation(origin = {1,-99},extent = {{-9,-9},{9,9}},rotation = 0)));
            .Modelica.Units.SI.Pressure p "Pressure drop of the two ports";
            .Modelica.Units.SI.VolumeFlowRate q "Volume rate flowing from port a to port b";
        equation
            p = acousticPort_a.p - acousticPort_b.p;
            0 = acousticPort_a.q + acousticPort_b.q;
            q = acousticPort_a.q;
            annotation(Icon(coordinateSystem(initialScale = 1)),Diagram(graphics = {Text(origin={-68,-130},lineColor={160,160,164},extent={{90,45},{110,25}},textString="q"),Line(origin={27.6387,1.62581},rotation=-90,points={{-78,-48},{80,-48}},color={160,160,164},arrow={Arrow.None,Arrow.Filled},arrowSize=5),Text(origin={130,68},lineColor={160,160,164},extent={{-110,25},{-90,45}},textString="q"),Text(origin={-68,-4},rotation=90,lineColor={160,160,164},extent={{-58,-50},{62,-22}},textString="dp = port_a.p - port_b.p"),Line(origin={20,-96},rotation=180,points={{0,-10},{0,10},{0,10},{0,10}},thickness=0.75,arrow={Arrow.Filled,Arrow.None},arrowSize=5),Line(origin={20.2452,100.968},rotation=180,points={{0,-10},{0,10},{0,10},{0,10}},thickness=0.75,arrow={Arrow.Filled,Arrow.None},arrowSize=5)}));
        end AcousticTwoPortsVertical;
        partial model TransducerMA
            .Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a annotation(Placement(visible = true,transformation(origin = {-100,98},extent = {{-10,-10},{10,10}},rotation = 0),iconTransformation(origin = {-100,98},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Interfaces.AcousticPort_b acousticPort_b annotation(Placement(visible = true,transformation(origin = {98,98},extent = {{-10,-10},{10,10}},rotation = 0),iconTransformation(origin = {98,98},extent = {{-9,-9},{9,9}},rotation = 0)));
            parameter .Modelica.Units.SI.Pressure p_start = 1e5 "Initial air pressure [Pa]";
            parameter StateSelect stateSelect = StateSelect.default "Priority to use s_rel and v_rel as states" annotation(HideResult = true,Dialog(tab = "Advanced"));
            .Modelica.Units.SI.Position s(start = 0,stateSelect = stateSelect) "Relative distance (= flange_b.s - flange_a.s)";
            .Modelica.Units.SI.Velocity v "Relative velocity";
            .Modelica.Units.SI.Force f "Force between flanges (positive in direction of flange axis R)";
            .Modelica.Units.SI.Pressure p(start = p_start) "Pressure drop of the two ports";
            .Modelica.Units.SI.VolumeFlowRate q "Volume rate flowing from port a to port b";
        equation
            s = flange_a.s;
            v = der(s);
            flange_a.f = -f;
            p = acousticPort_b.p;
            q = acousticPort_b.q;
            annotation(Icon(coordinateSystem(initialScale = 1)));
        end TransducerMA;
        annotation(Icon(coordinateSystem(initialScale = 1)));
    end Interfaces;

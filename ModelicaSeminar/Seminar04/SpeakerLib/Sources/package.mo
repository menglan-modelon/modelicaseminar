within ModelicaSeminar.Seminar04.SpeakerLib;

    package Sources
        extends .Modelica.Icons.SourcesPackage;
        model ElectricPotential "Voltage source"
            extends .ModelicaSeminar.Seminar04.SpeakerLib.Interfaces.ElectricalTwoPinVertical;
            .Modelica.Blocks.Interfaces.RealInput uIn annotation(Placement(visible = true,transformation(origin = {-100,-2},extent = {{-20,-20},{20,20}},rotation = 0),iconTransformation(origin = {-92,-2},extent = {{-20,-20},{20,20}},rotation = 0)));
        equation
            u = uIn;
            annotation(Icon(coordinateSystem(initialScale = 1),graphics = {Line(origin={0,79},points={{0,19},{0,-19}},color={0,0,255},thickness=0.75),Line(origin={-0.14,-79.34},points={{0,19},{0,-19}},color={0,0,255},thickness=0.75),Line(points={{0,60},{0,-60},{0,-60}},color={0,0,255},thickness=0.75),Ellipse(lineColor={0,0,255},lineThickness=0.75,extent={{-60,60},{60,-60}}),Text(lineColor={0,0,255},extent={{-150,90},{150,50}},textString="%name")}));
        end ElectricPotential;
        model ElectricFlow "Current source"
            extends .ModelicaSeminar.Seminar04.SpeakerLib.Interfaces.ElectricalTwoPinVertical;
            .Modelica.Blocks.Interfaces.RealInput iIn annotation(Placement(visible = true,transformation(origin = {-100,0},extent = {{-20,-20},{20,20}},rotation = 0),iconTransformation(origin = {-90,0},extent = {{-20,-20},{20,20}},rotation = 0)));
        equation
            i = iIn;
            annotation(Icon(coordinateSystem(initialScale = 1),graphics = {Line(origin={0,79},points={{0,19},{0,-19}},color={0,0,255},thickness=0.75),Line(origin={-0.14,-79.34},points={{0,19},{0,-19}},color={0,0,255},thickness=0.75),Ellipse(lineColor={0,0,255},lineThickness=0.75,extent={{-60,60},{60,-60}}),Line(origin={-2.62069,-0.31034},points={{-56,-1},{62,-1}},color={0,0,255},thickness=0.75),Text(lineColor={0,0,255},extent={{-150,90},{150,50}},textString="%name")}));
        end ElectricFlow;
        model MechanicalPotential "Velocty source"
            extends .ModelicaSeminar.Seminar04.SpeakerLib.Interfaces.MechanicalTwoFlangesVertical;
            .Modelica.Blocks.Interfaces.RealInput vIn annotation(Placement(visible = true,transformation(origin = {-100,0},extent = {{-20,-20},{20,20}},rotation = 0),iconTransformation(origin = {-98,-2},extent = {{-20,-20},{20,20}},rotation = 0)));
        equation
            v = vIn;
            annotation(Icon(coordinateSystem(initialScale = 1),graphics = {Line(origin={0,79},points={{0,19},{0,-19}},color={85,170,0},thickness=0.75),Line(origin={-0.14,-79.34},points={{0,19},{0,-19}},color={85,170,0},thickness=0.75),Line(points={{0,60},{0,-60},{0,-60}},color={85,170,0},thickness=0.75),Ellipse(lineColor={85,170,0},lineThickness=0.75,extent={{-60,60},{60,-60}}),Text(lineColor={0,0,255},extent={{-150,90},{150,50}},textString="%name")}));
        end MechanicalPotential;
        model MechanicalFlow "Force source"
            extends .ModelicaSeminar.Seminar04.SpeakerLib.Interfaces.MechanicalTwoFlangesVertical;
            .Modelica.Blocks.Interfaces.RealInput fIn annotation(Placement(visible = true,transformation(origin = {-100,0},extent = {{-20,-20},{20,20}},rotation = 0),iconTransformation(origin = {-100,2},extent = {{-20,-20},{20,20}},rotation = 0)));
        equation
            f = fIn;
            annotation(Icon(coordinateSystem(initialScale = 1),graphics = {Line(origin={0,79},points={{0,19},{0,-19}},color={85,170,0},thickness=0.75),Line(origin={-0.14,-79.34},points={{0,19},{0,-19}},color={85,170,0},thickness=0.75),Line(origin={59.3103,59.8621},points={{-118,-60},{0,-60},{0,-60}},color={85,170,0},thickness=0.75),Ellipse(lineColor={85,170,0},lineThickness=0.75,extent={{-60,60},{60,-60}}),Text(lineColor={0,0,255},extent={{-150,90},{150,50}},textString="%name")}));
        end MechanicalFlow;
        model AcousticPotential "Pressure source"
            extends .ModelicaSeminar.Seminar04.SpeakerLib.Interfaces.AcousticTwoPortsVertical;
            .Modelica.Blocks.Interfaces.RealInput pIn annotation(Placement(visible = true,transformation(origin = {-100,0},extent = {{-20,-20},{20,20}},rotation = 0),iconTransformation(origin = {-100,0},extent = {{-20,-20},{20,20}},rotation = 0)));
        equation
            p = pIn;
            annotation(Icon(coordinateSystem(initialScale = 1),graphics = {Line(origin={0,79},points={{0,19},{0,-19}},color={255,170,0},thickness=0.75),Line(origin={-0.14,-79.34},points={{0,19},{0,-19}},color={255,170,0},thickness=0.75),Line(points={{0,60},{0,-60},{0,-60}},color={255,170,0},thickness=0.75),Ellipse(lineColor={255,170,0},lineThickness=0.75,extent={{-60,60},{60,-60}}),Text(lineColor={0,0,255},extent={{-150,90},{150,50}},textString="%name")}));
        end AcousticPotential;
        model AcousticFlow
            extends .ModelicaSeminar.Seminar04.SpeakerLib.Interfaces.AcousticTwoPortsVertical;
            .Modelica.Blocks.Interfaces.RealInput qIn annotation(Placement(visible = true,transformation(origin = {-100,0},extent = {{-20,-20},{20,20}},rotation = 0),iconTransformation(origin = {-104,0},extent = {{-20,-20},{20,20}},rotation = 0)));
        equation
            q = qIn;
            annotation(Icon(coordinateSystem(initialScale = 1),graphics = {Line(origin={0,79},points={{0,19},{0,-19}},color={255,170,0},thickness=0.75),Line(origin={-0.14,-79.34},points={{0,19},{0,-19}},color={255,170,0},thickness=0.75),Line(origin={59.31,59.86},points={{-118,-60},{0,-60},{0,-60}},color={255,170,0},thickness=0.75),Ellipse(lineColor={255,170,0},lineThickness=0.75,extent={{-60,60},{60,-60}}),Text(lineColor={0,0,255},extent={{-150,90},{150,50}},textString="%name")}));
        end AcousticFlow;
        annotation(Icon(coordinateSystem(initialScale = 1)));
    end Sources;

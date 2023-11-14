within ModelicaSeminar.Seminar04.SpeakerLib;
package Components
    extends Modelica.Icons.VariantsPackage;
    model ElectricalResistor "Ideal linear electrical resistor"
        extends .ModelicaSeminar.Seminar04.SpeakerLib.Interfaces.ElectricalTwoPin;
        extends .Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = T_ref);
        parameter .Modelica.Units.SI.Temperature T_ref = 300.15 "Reference temperature";
        parameter .Modelica.Units.SI.Resistance R(start = 1) "Resistance at temperature T_ref";
    equation
        u = R * i;
        LossPower = u * i;
        annotation(Documentation(info = "<html>
    <p>The linear resistor connects the branch voltage <em>v</em> with the branch current <em>i</em> by <em>i*R = v</em>. The Resistance <em>R</em> is allowed to be positive, zero, or negative.</p>
    </html>",revisions = "<html>
    <ul>
    <li><em> August 07, 2009   </em>
           by Anton Haumer<br> temperature dependency of resistance added<br>
           </li>
    <li><em> March 11, 2009   </em>
           by Christoph Clauss<br> conditional heat port added<br>
           </li>
    <li><em> 1998   </em>
           by Christoph Clauss<br> initially implemented<br>
           </li>
    </ul>
    </html>"),Icon(coordinateSystem(preserveAspectRatio = true,extent = {{-100,-100},{100,100}},initialScale = 1),graphics = {Rectangle(lineColor={0,0,255},fillColor={255,255,255},fillPattern=FillPattern.Solid,extent={{-70,30},{70,-30}}),Line(points={{-90,0},{-70,0}},color={0,0,255}),Line(origin={0.673077,0},points={{70,0},{90,0}},color={0,0,255}),Text(extent={{-150,-40},{150,-80}},textString="R=%R"),Line(visible=false,points={{0,-100},{0,-30}},color={127,0,0},pattern=LinePattern.Dot),Text(lineColor={0,0,255},extent={{-150,90},{150,50}},textString="%name")}));
    end ElectricalResistor;
    model ElectricalCapacitor "Ideal linear electrical capacitor"
        extends .ModelicaSeminar.Seminar04.SpeakerLib.Interfaces.ElectricalTwoPin;
        parameter .Modelica.Units.SI.Capacitance C(start = 1) "Capacitance";
    equation
        i = C * der(u);
        annotation(Documentation(info = "<html>
    <p>The linear capacitor connects the branch voltage <em>v</em> with the branch current <em>i</em> by <em>i = C * dv/dt</em>. The Capacitance <em>C</em> is allowed to be positive or zero.</p>
    
    </html>",revisions = "<html>
    <ul>
    <li><em> 1998   </em>
           by Christoph Clauss<br> initially implemented<br>
           </li>
    </ul>
    </html>"),Icon(coordinateSystem(preserveAspectRatio = true,extent = {{-100,-100},{100,100}}),graphics = {Line(points={{-6,28},{-6,-28}},color={0,0,255}),Line(points={{6,28},{6,-28}},color={0,0,255}),Line(points={{-90,0},{-6,0}},color={0,0,255}),Line(points={{6,0},{90,0}},color={0,0,255}),Text(extent={{-150,-40},{150,-80}},textString="C=%C"),Text(extent={{-150,90},{150,50}},textString="%name",textColor={0,0,255})}));
    end ElectricalCapacitor;
    model ElectricalInductor "Ideal linear electrical inductor"
        extends .ModelicaSeminar.Seminar04.SpeakerLib.Interfaces.ElectricalTwoPin;
        parameter .Modelica.Units.SI.Inductance L(start = 1) "Inductance";
    equation
        L * der(i) = u;
        annotation(Documentation(info = "<html>
    <p>The linear inductor connects the branch voltage <em>v</em> with the branch current <em>i</em> by <em>v = L * di/dt</em>. The Inductance <em>L</em> is allowed to be positive, or zero.</p>
    
    </html>",revisions = "<html>
    <ul>
    <li><em> 1998   </em>
           by Christoph Clauss<br> initially implemented<br>
           </li>
    </ul>
    </html>"),Icon(coordinateSystem(preserveAspectRatio = true,extent = {{-100,-100},{100,100}}),graphics = {Line(points={{60,0},{90,0}},color={0,0,255}),Line(points={{-90,0},{-60,0}},color={0,0,255}),Text(extent={{-150,-40},{150,-80}},textString="L=%L"),Line(points={{-60,0},{-59,6},{-52,14},{-38,14},{-31,6},{-30,0}},color={0,0,255},smooth=Smooth.Bezier),Line(points={{-30,0},{-29,6},{-22,14},{-8,14},{-1,6},{0,0}},color={0,0,255},smooth=Smooth.Bezier),Line(points={{0,0},{1,6},{8,14},{22,14},{29,6},{30,0}},color={0,0,255},smooth=Smooth.Bezier),Line(points={{30,0},{31,6},{38,14},{52,14},{59,6},{60,0}},color={0,0,255},smooth=Smooth.Bezier),Text(extent={{-150,90},{150,50}},textString="%name",textColor={0,0,255})}));
    end ElectricalInductor;
    model MechanicalAdmittance "Linear 1D translational damper"
        extends .Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
        extends .Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;
        parameter .Modelica.Units.SI.Admittance h(final min = 0,start = 0) "Damping conductance";
    equation
        h * f = v_rel;
        lossPower = f * v_rel;
        annotation(Documentation(info = "<html>
    <p>
    <em>Linear, velocity dependent damper</em> element. It can be either connected
    between a sliding mass and the housing (model Fixed), or
    between two sliding masses.
    </p>
    
    </html>"),Icon(coordinateSystem(preserveAspectRatio = true,extent = {{-100,-100},{100,100}}),graphics = {Line(points={{-90,0},{100,0}},color={0,127,0}),Line(points={{-60,-30},{-60,30}}),Rectangle(lineColor={0,127,0},fillColor={192,192,192},fillPattern=FillPattern.Solid,extent={{-60,30},{30,-30}}),Polygon(lineColor={95,127,95},fillColor={95,127,95},fillPattern=FillPattern.Solid,points={{50,-90},{20,-80},{20,-100},{50,-90}}),Line(points={{-60,-90},{20,-90}},color={95,127,95}),Text(lineColor={0,0,255},extent={{-150,90},{150,50}},textString="%name"),Text(extent={{-150,-45},{150,-75}},textString="h=%h"),Line(visible=false,points={{-100,-100},{-100,-20},{-14,-20}},color={191,0,0},pattern=LinePattern.Dot),Line(points={{60,-30},{-60,-30},{-60,30},{60,30}},color={0,127,0})}));
    end MechanicalAdmittance;
    model MechanicalMass "Sliding mass with inertia"
        parameter .Modelica.Units.SI.Mass m(min = 0,start = 1) "Mass of the sliding mass";
        parameter StateSelect stateSelect = StateSelect.default "Priority to use s and v as states" annotation(Dialog(tab = "Advanced"));
        extends .Modelica.Mechanics.Translational.Interfaces.PartialRigid(L = 0,s(start = 0,stateSelect = stateSelect));
        .Modelica.Units.SI.Velocity v(start = 0,stateSelect = stateSelect) "Absolute velocity of component";
        .Modelica.Units.SI.Acceleration a(start = 0) "Absolute acceleration of component";
    equation
        v = der(s);
        a = der(v);
        m * a = flange_a.f + flange_b.f;
        annotation(Documentation(info = "<html>
    <p>
    Sliding mass with <em>inertia, without friction</em> and two rigidly connected flanges.
    </p>
    <p>
    The sliding mass has the length L, the position coordinate s is in the middle.
    Sign convention: A positive force at flange flange_a moves the sliding mass in the positive direction.
    A negative force at flange flange_a moves the sliding mass to the negative direction.
    </p>
    
    </html>"),Icon(coordinateSystem(preserveAspectRatio = true,extent = {{-100,-100},{100,100}}),graphics = {Line(points={{-100,0},{100,0}},color={0,127,0}),Rectangle(lineColor={0,127,0},fillColor={160,215,160},fillPattern=FillPattern.Sphere,extent={{-55,-30},{56,30}}),Polygon(lineColor={95,127,95},fillColor={95,127,95},fillPattern=FillPattern.Solid,points={{50,-90},{20,-80},{20,-100},{50,-90}}),Line(points={{-60,-90},{20,-90}},color={95,127,95}),Text(lineColor={0,0,255},fillColor={110,210,110},fillPattern=FillPattern.Solid,extent={{-150,85},{150,45}},textString="%name"),Text(fillColor={110,221,110},fillPattern=FillPattern.Solid,extent={{-150,-45},{150,-75}},textString="m=%m"),Line(points={{-6,28},{-6,-28}},color={0,170,0},thickness=0.5),Line(points={{6,28},{6,-28}},color={0,170,0},thickness=0.5),Line(points={{6,0},{90,0}},color={0,170,0},thickness=0.5),Line(points={{-90,0},{-6,0}},color={0,170,0},thickness=0.5)}));
    end MechanicalMass;
    model MechanicalInductance "Sliding mass with inertia"
        parameter Real n(min = 0,start = 1) "Mechanical Compliance";
        extends .Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
    equation
        n * der(f) = v_rel;
        annotation(Documentation(info = "<html>
        <p>
        Sliding mass with <em>inertia, without friction</em> and two rigidly connected flanges.
        </p>
        <p>
        The sliding mass has the length L, the position coordinate s is in the middle.
        Sign convention: A positive force at flange flange_a moves the sliding mass in the positive direction.
        A negative force at flange flange_a moves the sliding mass to the negative direction.
        </p>
        
        </html>"),Icon(coordinateSystem(preserveAspectRatio = true,extent = {{-100,-100},{100,100}}),graphics = {Line(points={{-100,0},{100,0}},color={0,127,0}),Rectangle(lineColor={0,127,0},fillColor={85,170,0},fillPattern=FillPattern.Solid,extent={{-55,-30},{56,30}}),Polygon(lineColor={95,127,95},fillColor={95,127,95},fillPattern=FillPattern.Solid,points={{50,-90},{20,-80},{20,-100},{50,-90}}),Line(points={{-60,-90},{20,-90}},color={95,127,95}),Text(lineColor={0,0,255},fillColor={110,210,110},fillPattern=FillPattern.Solid,extent={{-150,85},{150,45}},textString="%name"),Text(fillColor={110,221,110},fillPattern=FillPattern.Solid,extent={{-150,-45},{150,-75}},textString="n=%n")}));
    end MechanicalInductance;
    extends .Modelica.Icons.Package;
    model AcousticResistor
        extends .ModelicaSeminar.Seminar04.SpeakerLib.Interfaces.AcousticTwoPorts;
        parameter Real Z(start = 1) "Acoustic friction";
    equation
        p = Z * q;
        annotation(Icon(coordinateSystem(initialScale = 1),graphics = {Rectangle(lineColor={255,170,0},fillColor={255,255,255},fillPattern=FillPattern.Solid,extent={{-70,30},{70,-30}}),Text(lineColor={0,0,255},extent={{-150,90},{150,50}},textString="%name"),Text(extent={{-150,-40},{150,-80}},textString="Z=%Z"),Line(points={{-90,0},{-70,0}},color={255,170,0}),Line(origin={0.67,0},points={{70,0},{90,0}},color={255,170,0})}));
    end AcousticResistor;
    model AcousticCompliance
        extends .ModelicaSeminar.Seminar04.SpeakerLib.Interfaces.AcousticTwoPorts;
        parameter Real N(start = 1) "Acoustic compliance";
    equation
        N * der(p) = q;
        annotation(Icon(coordinateSystem(initialScale = 1),graphics = {Text(lineColor={0,0,255},extent={{-150,90},{150,50}},textString="%name"),Text(extent={{-150,-40},{150,-80}},textString="N=%N"),Line(points={{-6,28},{-6,-28}},color={255,170,0}),Line(points={{6,0},{90,0}},color={255,170,0}),Line(points={{-90,0},{-6,0}},color={255,170,0}),Line(points={{6,28},{6,-28}},color={255,170,0})}));
    end AcousticCompliance;
    model AcousticMass
        extends .ModelicaSeminar.Seminar04.SpeakerLib.Interfaces.AcousticTwoPorts;
        parameter Real M(start = 1) "Acoustic mass";
    equation
        p = M * der(q);
        annotation(Icon(coordinateSystem(initialScale = 1),graphics = {Text(lineColor={0,0,255},extent={{-150,90},{150,50}},textString="%name"),Text(extent={{-150,-40},{150,-80}},textString="M=%M"),Rectangle(lineColor={255,170,0},fillColor={255,170,0},fillPattern=FillPattern.Solid,extent={{-55,-30},{56,30}}),Line(points={{-100,0},{100,0}},color={255,170,0})}));
    end AcousticMass;
    model SpeakerCone
        extends .ModelicaSeminar.Seminar04.SpeakerLib.Interfaces.TransducerMA;
        parameter .Modelica.Units.SI.Radius a = 0.1 "Radius of speaker cone";
        .Modelica.Units.SI.Area A = .Modelica.Constants.pi * a ^ 2 "Area of speaker cone";
        .Modelica.Blocks.Interfaces.RealInput driveForce annotation(Placement(visible = true,transformation(origin = {-100,0},extent = {{-20,-20},{20,20}},rotation = 0),iconTransformation(origin = {-96,0},extent = {{-12,-12},{12,12}},rotation = 0)));
    equation
        v * A = q;
        f = driveForce + A * p;
        annotation(Icon(coordinateSystem(initialScale = 1),graphics = {Bitmap(origin={-2,24},extent={{-88,-84},{88,84}},imageSource="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"),Rectangle(origin={45,26},lineColor={255,0,0},lineThickness=0.5,extent={{-41,72},{41,-72}}),Rectangle(extent={{-100,100},{100,-100}}),Text(origin={-7,-82},extent={{-59,22},{59,-22}},textString="fp=A*p"),Text(origin={-7,-48},extent={{-59,22},{59,-22}},textString="A*v=q")}),Diagram);
    end SpeakerCone;
    model SpeakerByText
        parameter .Modelica.Units.SI.MagneticFluxDensity B0 = 0.8;
        parameter .Modelica.Units.SI.Length l = 8 "Coil lenght";
        parameter .Modelica.Units.SI.Resistance R = 6 "Electric register";
        parameter .Modelica.Units.SI.Mass mw = 0.03 "Mechanical movable mass";
        parameter Real nw = 2.1e-3 "Mechanical inductance of spring";
        parameter Real rw = 1e-3 "Mechanical admittance of damper";
        parameter Real ml = 3.2e-3 "Mechanical movable mass of air";
        parameter Real rl = 8e-3 "Mechanical admittance of air damper";
        parameter Real rel = 6.82 "Mechanical admittance of electric register";
        parameter .Modelica.Units.SI.Area A = .Modelica.Constants.pi * 0.1 ^ 2 "Area of speaker cone";
        .Modelica.Units.SI.ElectricCurrent i;
        .Modelica.Units.SI.Length s;
        .Modelica.Units.SI.Velocity v;
        .Modelica.Units.SI.Acceleration a;
        .Modelica.Units.SI.Force fw;
        .Modelica.Units.SI.Force fm;
        .Modelica.Units.SI.Force fp;
        .Modelica.Units.SI.Force f;
        .Modelica.Units.SI.Pressure p(start = 0,fixed = true);
        .Modelica.Units.SI.MassFlowRate q;
        Real TF;
        .Modelica.Blocks.Interfaces.RealInput u0 annotation(Placement(visible = true,transformation(origin = {-100,-2},extent = {{-20,-20},{20,20}},rotation = 0),iconTransformation(origin = {-86,-2},extent = {{-20,-20},{20,20}},rotation = 0)));
    equation
        v = der(s);
        a = der(v);
        u0 = i * R + B0 * l * v;
        fw = B0 * l * i;
        fm = (-v / rw) - s / nw;
        mw * a = fm + fw - fp;
        f = fm - fp;
        p = ml * A * a + rl * A * v;
        q = A * v;
        fp = A * p;
        TF = abs(v / u0);
        annotation(Icon(coordinateSystem(initialScale = 0.1)));
    end SpeakerByText;
    annotation(Icon(coordinateSystem(initialScale = 1)));
end Components;

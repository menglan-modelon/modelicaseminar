within ModelicaSeminar.Seminar06.EVThermal.Utilities.Visualizers;
model PH_R1234yf_3line "R1234yf visualizer with three lines"
  extends XYDiagramBackgroundImage3lines(
    rectangle_scale=true,
    imageName="modelica://AirConditioning/Resources/Images/phR1234yflogp.png",
    imagePixelHeight=960,
    imagePixelWidth=1320,
    point_1={(150.0e3),(.Modelica.Math.log(1.0e5))},
    point_1_imagePixelCoord={91,893},
    point_2={(450.0e3),(.Modelica.Math.log(40.0e5))},
    point_2_imagePixelCoord={1280,10});
    annotation (Documentation(info="<html>
    <body>
    <h4>PH_R1234yf</h4>
    <p>
    This model provides a dynamic display for ph-diagrams of refrigeration cycles 
    using R1234yf as refrigerant, with IIR as reference state. The y-axis (pressure) has logarithmic scaling in this diagram.
    The dynamic element is an arbitrary polyeder.
    Two vectors of variables from the model parametrize the corner points of the diagram.
    This model can be adapted to other refrigerants by pointing to a different bitmap file.
<h4>Parametrization</h4>
<p>The parametrization of the polygon is achieved by: </p>
<ul>
<li><code class=\"modelica\">x</code>: Vector which contains all the specific enthalpy values for the polygon.</li>
<li><code class=\"modelica\">y</code>: Vector which contains all the the logarithm of pressure values for the polygon. </li>
</ul>
<h4>Important note on scale</h4>
<p>If the aspect ratio of this model is changed, the polygon displayed in the diagram will not be correct. To avoid this, scale the image so the rectangle matches with the frame of the diagram.</p>

    </body>
    </html>", revisions="<html>
<hr><p><font color=\"#E72614\"><b>Copyright &copy; 2004-2022, MODELON AB</b></font> <font color=\"#AFAFAF\"><br /><br /> The use of this software component is regulated by the licensing conditions for Modelon Libraries. <br /> This copyright notice must, unaltered, accompany all components that are derived from, copied from, <br /> or by other means have their origin from any Modelon Library. </font></p>
</html>"));
end PH_R1234yf_3line;

within ModelicaSeminar.Seminar06.EVThermal.Utilities.Visualizers;
model XYDiagramBackgroundImage3lines "XY digram with background image, 3 lines"
  extends .Modelon.Visualizers.XYDiagramBackgroundImage;
  input Real x2[:]={1} "x-axis values for 2nd line" annotation (Dialog(group="Inputs"));
  input Real y2[size(x2, 1)]={1} "y-axis values for 2nd line" annotation (Dialog(group="Inputs"));
  parameter .Modelon.Visualizers.Internal.Types.RGBColor color2=color
    "Color (RGB) of second line" annotation(Dialog(group="Diagram attributes"));
  input Real x3[:]={1} "Horizontal values for curve" annotation (Dialog(group="Inputs"));
  input Real y3[size(x3, 1)]={1} "Vertical values for curve" annotation (Dialog(group="Inputs"));
  parameter .Modelon.Visualizers.Internal.Types.RGBColor color3=color
    "Color (RGB) of curve" annotation (Dialog(group="Diagram attributes"));

  Real[size(x2, 1),2] points_line_2;
  Real[size(x3, 1),2] points_line_3;

protected
  Real x_rel_coord_2[size(x2, 1)];
  Real y_rel_coord_2[size(x2, 1)];
  Real x_coord_2[size(x2, 1)];
  Real y_coord_2[size(x2, 1)];
  Real x_rel_coord_3[size(x3, 1)];
  Real y_rel_coord_3[size(x3, 1)];
  Real x_coord_3[size(x3, 1)];
  Real y_coord_3[size(x3, 1)];

equation
  // Line
  for i in 1:size(x2, 1) loop
    x_rel_coord_2[i] = ((x2[i] - point_1[X])/(point_2[X] - point_1[X]))*(
      relPos_Xmax - relPos_Xmin) + relPos_Xmin;
    y_rel_coord_2[i] = ((y2[i] - point_1[Y])/(point_2[Y] - point_1[Y]))*(
      relPos_Ymax - relPos_Ymin) + relPos_Ymin;
    x_coord_2[i] = lowerLeftCornerCoord[1] + x_rel_coord_2[i]*(
      upperRightCornerCoord[1] - lowerLeftCornerCoord[1]);
    y_coord_2[i] = lowerLeftCornerCoord[2] + y_rel_coord_2[i]*(
      upperRightCornerCoord[2] - lowerLeftCornerCoord[2]);
  end for;
  points_line_2 = transpose({x_coord_2,y_coord_2});

  for i in 1:size(x3, 1) loop
    x_rel_coord_3[i] = ((x3[i] - point_1[X])/(point_2[X] - point_1[X]))*(
      relPos_Xmax - relPos_Xmin) + relPos_Xmin;
    y_rel_coord_3[i] = ((y3[i] - point_1[Y])/(point_2[Y] - point_1[Y]))*(
      relPos_Ymax - relPos_Ymin) + relPos_Ymin;
    x_coord_3[i] = lowerLeftCornerCoord[1] + x_rel_coord_3[i]*(
      upperRightCornerCoord[1] - lowerLeftCornerCoord[1]);
    y_coord_3[i] = lowerLeftCornerCoord[2] + y_rel_coord_3[i]*(
      upperRightCornerCoord[2] - lowerLeftCornerCoord[2]);
  end for;
  points_line_3 = transpose({x_coord_3,y_coord_3});

  annotation (Icon(graphics={
          Line(points=DynamicSelect({{-100,-100},{-15,20},{15,-20},{100,100}},
              points_line_2), color=DynamicSelect({0,0,0}, color2)),
          Line(points=DynamicSelect({{-100,-100},{-15,20},{15,-20},{100,100}},
              points_line_3), color=DynamicSelect({0,0,0}, color3))}),
          Diagram(graphics={
          Line(points=DynamicSelect({{-100,-100},{-15,20},{15,-20},{100,100}},
              points_line_2), color=DynamicSelect({0,0,0}, color2)),
          Line(points=DynamicSelect({{-100,-100},{-15,20},{15,-20},{100,100}},
              points_line_3), color=DynamicSelect({0,0,0}, color3))}),
      Documentation(revisions="<html>
  <hr><p><font class=\"copyright_bold\">Copyright &copy; 2004-2022, MODELON AB</font> <font class=\"copyright_base\">The use of this software component is regulated by the licensing conditions for the Modelon Library. This copyright notice must, unaltered, accompany all components that are derived from, copied from, or by other means have their origin from the Modelon Library. </font></p>
  </html>"));
end XYDiagramBackgroundImage3lines;

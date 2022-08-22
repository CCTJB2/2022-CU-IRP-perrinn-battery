within CU_IRP_perrinn_battery.Electrical.ECM.EECM_Parameter.Ro_param;
block ai "Calculation of surface area per volume"
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  parameter Modelica.Blocks.Interfaces.RealInput epsilon
    "active material volume fraction"
    annotation (Placement(transformation(extent={{-142,20},{-102,60}})));
  parameter Modelica.Blocks.Interfaces.RealInput R
    "particle size in m, magnitude is usually 1e-6"
    annotation (Placement(transformation(extent={{-140,-60},{-100,-20}})));
  Modelica.Blocks.Math.Gain gain(k=3)
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Modelica.Blocks.Math.Division division
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
equation
  connect(gain.u, epsilon) annotation (Line(points={{-42,30},{-78,30},{-78,40},
          {-122,40}}, color={0,0,127}));
  connect(division.u1, gain.y) annotation (Line(points={{-2,6},{-12,6},{-12,30},
          {-19,30}}, color={0,0,127}));
  connect(division.u2, R) annotation (Line(points={{-2,-6},{-54,-6},{-54,-40},{
          -120,-40}}, color={0,0,127}));
  connect(y, division.y)
    annotation (Line(points={{110,0},{21,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ai;

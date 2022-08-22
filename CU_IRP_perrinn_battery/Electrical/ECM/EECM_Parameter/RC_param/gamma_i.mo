within CU_IRP_perrinn_battery.Electrical.ECM.EECM_Parameter.RC_param;
block gamma_i
  "Calculation of surface area per volume for electrolyte reaction at electrodes, Input 1: ai, Input 2: t_0"
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  parameter Modelica.Blocks.Interfaces.RealInput t_0 "transference number"
    annotation (Placement(transformation(extent={{-120,-20},{-100,0}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=ai*(1 - t_0)/(F*
        epsilon_e))
    annotation (Placement(transformation(extent={{-40,-10},{0,10}})));
  Modelica.Blocks.Interfaces.RealInput ai "surface to volume ratio"
    annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
  parameter Modelica.Blocks.Interfaces.RealInput F
    "Faraday's Constant, Coulmb/mol, Ampere-second/mol"
    annotation (Placement(transformation(extent={{-120,-40},{-100,-20}})));
  parameter Modelica.Blocks.Interfaces.RealInput F1
    "Faraday's Constant, Coulmb/mol, Ampere-second/mol"
    annotation (Placement(transformation(extent={{-120,-60},{-100,-40}})));
equation
  connect(realExpression.y, y)
    annotation (Line(points={{2,0},{110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end gamma_i;

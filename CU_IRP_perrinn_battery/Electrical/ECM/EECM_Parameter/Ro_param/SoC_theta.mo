within CU_IRP_perrinn_battery.Electrical.ECM.EECM_Parameter.Ro_param;
block SoC_theta "Linearized function of molar fraction from SoC"
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Sources.RealExpression F_express(y=theta_0 + SoC*(theta_100
         - theta_0))
    annotation (Placement(transformation(extent={{-20,-6},{38,8}})));
  Modelica.Blocks.Interfaces.RealInput SoC
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  parameter Modelica.Blocks.Interfaces.RealInput theta_0
    "Molar Fraction of electrode at 0% SoC"
    annotation (Placement(transformation(extent={{-110,-30},{-100,-20}})));
  parameter Modelica.Blocks.Interfaces.RealInput theta_100
    "Molar Fraction of electrode at 100% SoC"
    annotation (Placement(transformation(extent={{-110,-50},{-100,-40}})));
equation
  connect(F_express.y, y) annotation (Line(points={{40.9,1},{71.45,1},{71.45,0},
          {110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end SoC_theta;

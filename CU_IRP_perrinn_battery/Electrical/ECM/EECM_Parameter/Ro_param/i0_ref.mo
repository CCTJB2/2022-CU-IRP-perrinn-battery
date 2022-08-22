within CU_IRP_perrinn_battery.Electrical.ECM.EECM_Parameter.Ro_param;
block i0_ref "Calculation of exchange current density"
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  parameter Modelica.Blocks.Interfaces.RealInput F
    "Faraday's Constant, Coulmb/mol, Ampere-second/mol"
    annotation (Placement(transformation(extent={{-110,-50},{-100,-40}})));
  parameter Modelica.Blocks.Interfaces.RealInput k
    "electrode reaction rate coefficient, kinetic rate constants"
    annotation (Placement(transformation(extent={{-110,-60},{-100,-50}})));
  parameter Modelica.Blocks.Interfaces.RealInput c_max
    "Maximum concentration at the electrode, mol/m^3"
    annotation (Placement(transformation(extent={{-110,-70},{-100,-60}})));
  parameter Modelica.Blocks.Interfaces.RealInput Ce_0
    "Initial Electrolyte Concentration in mol/m^3, 1e3"
    annotation (Placement(transformation(extent={{-110,-80},{-100,-70}})));
  Modelica.Blocks.Sources.RealExpression Fk_express(y=F*k)
    annotation (Placement(transformation(extent={{0,32},{20,42}})));
  Modelica.Blocks.Sources.RealExpression F_express1(y=theta*c_max*Ce_0*(c_max
         - theta*c_max))
    annotation (Placement(transformation(extent={{-80,-38},{0,-24}})));
  Modelica.Blocks.Math.Sqrt sqrt1
    annotation (Placement(transformation(extent={{20,-20},{40,0}})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Interfaces.RealInput theta "Molar Fraction at the electrode"
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
equation
  connect(F_express1.y, sqrt1.u) annotation (Line(points={{4,-31},{12,-31},{12,
          -10},{18,-10}}, color={0,0,127}));
  connect(Fk_express.y, product.u1) annotation (Line(points={{21,37},{48.5,37},
          {48.5,6},{58,6}}, color={0,0,127}));
  connect(sqrt1.y, product.u2) annotation (Line(points={{41,-10},{50,-10},{50,
          -6},{58,-6}}, color={0,0,127}));
  connect(product.y, y)
    annotation (Line(points={{81,0},{110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end i0_ref;

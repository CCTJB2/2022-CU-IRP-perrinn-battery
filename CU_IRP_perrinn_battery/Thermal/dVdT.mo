within CU_IRP_perrinn_battery.Thermal;
block dVdT
  Modelica.Blocks.Interfaces.RealInput Temp
    annotation (Placement(transformation(extent={{-140,-60},{-100,-20}})));
  Modelica.Blocks.Interfaces.RealOutput dVdT
    "Entropy Coefficient, slope of voltage change versus temperature"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Math.Add minus(k2=-1)
    annotation (Placement(transformation(extent={{0,-56},{20,-36}})));
  Modelica.Blocks.Tables.CombiTable1Ds SoC_dVdT(
    tableName="table",
    fileName=
        "C:/Users/jason/OneDrive - The Hong Kong Polytechnic University/Cranfield Studies/4 Course Projects/IRP Battery/A123/A123_OCV_Discharge.mat",
    tableOnFile=false,
    table=[0,-4e-5; 0.05,-0.00035; 0.1,-0.0003; 0.15,-0.00015; 0.2,-0.0001;
        0.25,-9e-5; 0.3,-5e-5; 0.35,-2.5e-5; 0.4,6e-5; 0.45,9e-5; 0.5,8e-5;
        0.55,7e-5; 0.6,4e-5; 0.65,-2.5e-5; 0.7,-2e-5; 0.75,-1e-5; 0.8,-2e-5;
        0.85,-2.5e-5; 0.9,4e-5; 0.95,5.5e-5; 1,4.5e-5])
    annotation (Placement(transformation(extent={{0,20},{20,40}})));

  Modelica.Blocks.Sources.Constant Tref(k=25 + 273.15) annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-30,-70})));
  Modelica.Blocks.Interfaces.RealInput SoC
    annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
equation
  connect(Tref.y, minus.u2) annotation (Line(points={{-19,-70},{-12,-70},{-12,-52},
          {-2,-52}}, color={0,0,127}));
  connect(minus.u1, Temp)
    annotation (Line(points={{-2,-40},{-120,-40}}, color={0,0,127}));
  connect(SoC, SoC_dVdT.u) annotation (Line(points={{-120,40},{-62,40},{-62,30},
          {-2,30}}, color={0,0,127}));
  connect(SoC_dVdT.y[1], product.u1)
    annotation (Line(points={{21,30},{28,30},{28,6},{58,6}}, color={0,0,127}));
  connect(minus.y, product.u2) annotation (Line(points={{21,-46},{40,-46},{40,
          -6},{58,-6}}, color={0,0,127}));
  connect(product.y, dVdT)
    annotation (Line(points={{81,0},{110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Text(
          extent={{-80,80},{20,20}},
          lineColor={28,108,200},
          textString="SoC"),
        Text(
          extent={{-80,-20},{20,-80}},
          lineColor={28,108,200},
          textString="Kelvin"),
        Text(
          extent={{0,20},{100,-20}},
          lineColor={28,108,200},
          textString="dV/dK"),
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200})}),
      Diagram(coordinateSystem(preserveAspectRatio=false)));
end dVdT;

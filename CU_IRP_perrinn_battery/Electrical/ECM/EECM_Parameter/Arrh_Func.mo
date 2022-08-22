within CU_IRP_perrinn_battery.Electrical.ECM.EECM_Parameter;
block Arrh_Func
  "Arrhenium Function for Temperature Dependence,  Input 1: Activation Energy, Input 2: Temperature, Input 3: Reference Value P1"
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput P1
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput Ea "Activation Energy"
    annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
  parameter Modelica.Blocks.Interfaces.RealInput Tref "Reference Temperature"
    annotation (Placement(transformation(extent={{-110,-40},{-100,-30}})));
  Modelica.Blocks.Interfaces.RealInput T "Temperature in Kelvins"
    annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=P1*exp((Ea/Rbar)*(1/
        Tref - 1/T)))
    annotation (Placement(transformation(extent={{-60,-10},{0,10}})));
  parameter Modelica.Blocks.Interfaces.RealInput Rbar
    "Universal Gas constant, 8.314 J/mol K"
    annotation (Placement(transformation(extent={{-110,-50},{-100,-40}})));
equation
  connect(realExpression.y, y)
    annotation (Line(points={{3,0},{110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Arrh_Func;

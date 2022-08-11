within CU_IRP_perrinn_battery.Electrical.Batteries;
model SoC_OCV "Generalized SoC-OCV  Model"
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Math.Log log
    annotation (Placement(transformation(extent={{-6,-52},{14,-32}})));
  Modelica.Blocks.Math.Gain c(k=-0.106)
    annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica.Blocks.Math.Gain b(k=-0.0334)
    annotation (Placement(transformation(extent={{0,20},{20,40}})));
  Modelica.Blocks.Sources.Constant a(k=3.5)
    annotation (Placement(transformation(extent={{32,58},{52,78}})));
  Modelica.Blocks.Math.Gain d(k=0.7399)
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Modelica.Blocks.Math.Gain negative(k=-1)
    annotation (Placement(transformation(extent={{-38,22},{-18,42}})));
  Modelica.Blocks.Math.Add3 add3_2
    annotation (Placement(transformation(extent={{32,0},{52,20}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{68,-10},{88,10}})));
  Modelica.Blocks.Math.Exp exp
    annotation (Placement(transformation(extent={{-40,62},{-20,82}})));
  Modelica.Blocks.Math.MultiSum multiSum
    annotation (Placement(transformation(extent={{40,-40},{60,-20}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end SoC_OCV;

within CU_IRP_perrinn_battery;
block MathPower_InputBase
  Modelica.Blocks.Interfaces.RealInput base
    annotation (Placement(transformation(extent={{-120,20},{-80,60}})));
  Modelica.Blocks.Interfaces.RealInput power
    annotation (Placement(transformation(extent={{-120,-60},{-80,-20}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  y = base^power;
  annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={
        Text(
          extent={{-150,140},{150,100}},
          textString="%name",
          textColor={0,0,255}),
        Text(
          extent={{60,-52},{-80,48}},
          lineColor={28,108,200},
          textString="base"),
        Text(
          extent={{96,2},{-4,62}},
          lineColor={28,108,200},
          textString="power"),
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200})}));
end MathPower_InputBase;

within CU_IRP_perrinn_battery.Electrical.ECM;
block Thevenin_2RC_SoC_Temp_NCM
  Modelica.Electrical.Analog.Interfaces.PositivePin
              p
    "Positive pin (potential p.v > n.v for positive voltage drop v)" annotation (Placement(
        transformation(extent={{90,70},{110,90}}),    iconTransformation(extent={{-120,
            -20},{-80,20}})));
  Modelica.Electrical.Analog.Basic.VariableResistor Rc(useHeatPort=false, T_ref
      =296.15) "Cathode Resistance"
    annotation (Placement(transformation(extent={{30,0},{50,20}})));
  Modelica.Electrical.Analog.Basic.VariableCapacitor Cc "Cathode Capacitance"
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={40,-10})));
  Modelica.Electrical.Analog.Interfaces.NegativePin
              n "Negative pin" annotation (Placement(transformation(extent={{110,-90},
            {90,-70}}),         iconTransformation(extent={{120,-20},{80,20}})));
  Modelica.Electrical.Analog.Basic.VariableResistor Ra(useHeatPort=false, T_ref
      =296.15) "Anode Resistance"
    annotation (Placement(transformation(extent={{60,0},{80,20}})));
  Modelica.Electrical.Analog.Basic.VariableCapacitor Ca "Anode Capacitance"
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={70,-10})));
  Modelica.Blocks.Interfaces.RealInput Temp annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
  Modelica.Blocks.Interfaces.RealInput SoC annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-60,120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-60,120})));
  Modelica.Blocks.Interfaces.RealInput SoH annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={60,120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={62,120})));
  SoC_OCV.EP_16Ah8_NMC_4PartEq eP_16Ah8_NMC_4PartEq
    annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage Voc annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-10,-50})));
  Thermal.dVdT dVdT
    annotation (Placement(transformation(extent={{-60,40},{-40,20}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-34,-26})));
  Modelica.Electrical.Analog.Basic.VariableResistor Ro(useHeatPort=false, T_ref
      =296.15) annotation (Placement(transformation(extent={{0,-20},{20,0}})));
  Modelica.Blocks.Sources.Constant Set_Rpa(k=0.25e-3) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={26,34})));
  Modelica.Blocks.Sources.Constant Set_Rpc(k=1e-3)
    annotation (Placement(transformation(extent={{54,28},{66,40}})));
  Modelica.Blocks.Sources.Constant Set_Cpc(k=15e3)
    annotation (Placement(transformation(extent={{54,-40},{66,-28}})));
  Modelica.Blocks.Sources.Constant Set_Cpa(k=5e3)
    annotation (Placement(transformation(extent={{20,-40},{32,-28}})));
  EECM_Parameter.Ro EECM_Ro
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  Modelica.Blocks.Sources.RealExpression SoC_express(y=SoC)
    annotation (Placement(transformation(extent={{-100,-20},{-80,0}})));
  Modelica.Blocks.Sources.RealExpression Temp_express(y=Temp)
    annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  Modelica.Blocks.Sources.RealExpression SoC_express2(y=SoC)
    annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
equation
  connect(Ra.n, Ca.n)
    annotation (Line(points={{80,10},{80,-10}}, color={0,0,255}));
  connect(Ra.p, Ca.p)
    annotation (Line(points={{60,10},{60,-10}}, color={0,0,255}));
  connect(Ca.n, p) annotation (Line(points={{80,-10},{88,-10},{88,80},{100,80}},
        color={0,0,255}));
  connect(Rc.n, Cc.n)
    annotation (Line(points={{50,10},{50,-10}}, color={0,0,255}));
  connect(Rc.p, Cc.p)
    annotation (Line(points={{30,10},{30,-10}}, color={0,0,255}));
  connect(Cc.n, Ca.p)
    annotation (Line(points={{50,-10},{60,-10}}, color={0,0,255}));
  connect(Voc.n, n)
    annotation (Line(points={{-10,-60},{-10,-80},{100,-80}}, color={0,0,255}));
  connect(Ro.p, Voc.p)
    annotation (Line(points={{0,-10},{-10,-10},{-10,-40}}, color={0,0,255}));
  connect(Ro.n, Cc.p)
    annotation (Line(points={{20,-10},{30,-10}}, color={0,0,255}));
  connect(Set_Rpa.y, Rc.R)
    annotation (Line(points={{32.6,34},{40,34},{40,21}}, color={0,0,127}));
  connect(Set_Cpa.y, Cc.C)
    annotation (Line(points={{32.6,-34},{40,-34},{40,-21}}, color={0,0,127}));
  connect(Set_Cpc.y, Ca.C)
    annotation (Line(points={{66.6,-34},{70,-34},{70,-21}}, color={0,0,127}));
  connect(Set_Rpc.y, Ra.R)
    annotation (Line(points={{66.6,34},{70,34},{70,21}}, color={0,0,127}));
  connect(add.y, Voc.v) annotation (Line(points={{-34,-32.6},{-34,-50},{-17,-50}},
        color={0,0,127}));
  connect(dVdT.dVdT, add.u1) annotation (Line(points={{-39,30},{-30,30},{-30,
          -18.8},{-30.4,-18.8}},
                          color={0,0,127}));
  connect(eP_16Ah8_NMC_4PartEq.y, add.u2) annotation (Line(points={{-39,-10},{
          -38,-10},{-38,-18.8},{-37.6,-18.8}}, color={0,0,127}));
  connect(n, n) annotation (Line(points={{100,-80},{96,-80},{96,-80},{100,-80}},
        color={0,0,255}));
  connect(SoC_express.y, eP_16Ah8_NMC_4PartEq.s)
    annotation (Line(points={{-79,-10},{-62,-10}}, color={0,0,127}));
  connect(dVdT.SoC, SoC_express.y) annotation (Line(points={{-62,26},{-72,26},{
          -72,-10},{-79,-10}}, color={0,0,127}));
  connect(SoC_express2.y, EECM_Ro.SoC) annotation (Line(points={{-39,70},{-34,
          70},{-34,39},{-21,39}}, color={0,0,127}));
  connect(Temp_express.y, dVdT.Temp) annotation (Line(points={{-79,50},{-72,50},
          {-72,34},{-62,34}}, color={0,0,127}));
  connect(EECM_Ro.T, dVdT.Temp) annotation (Line(points={{-21,37},{-38,37},{-38,
          50},{-72,50},{-72,34},{-62,34}}, color={0,0,127}));
  connect(EECM_Ro.y, Ro.R)
    annotation (Line(points={{1,30},{10,30},{10,1}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),                                  graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200}),
        Line(points={{-125,0},{-115,0}}, color={160,160,164}),
        Line(points={{-120,-5},{-120,5}}, color={160,160,164}),
        Line(points={{115,0},{125,0}}, color={160,160,164}),
        Text(
          extent={{-156,192},{144,152}},
          textString="%name",
          lineColor={0,0,255}),
        Text(
          extent={{100,80},{160,20}},
          lineColor={160,160,164},
          textString="-"),
        Text(
          extent={{-100,20},{100,-100}},
          lineColor={28,108,200},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          textString="Thev
2RC"),  Text(
          extent={{-160,80},{-100,20}},
          lineColor={160,160,164},
          textString="+"),
        Text(
          extent={{-100,100},{-20,54}},
          lineColor={28,108,200},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          textString="SoC"),
        Text(
          extent={{20,100},{100,52}},
          lineColor={28,108,200},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          textString="SoH"),
        Text(
          extent={{-50,60},{50,14}},
          lineColor={28,108,200},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          textString="Temp")}),Diagram(coordinateSystem(preserveAspectRatio=
            false, extent={{-100,-100},{100,100}})));
end Thevenin_2RC_SoC_Temp_NCM;

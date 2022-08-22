within CU_IRP_perrinn_battery.Thermal_ECM;
block Thermal_ECM
  Electrical.ECM.Thevenin_2RC_SoC_Temp_NCM Thev_ECM annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={20,20})));
  Electrical.SoC_Estimation.Columb_Counting_delta995 CC
    annotation (Placement(transformation(extent={{60,60},{80,40}})));
  Modelica.Blocks.Sources.Constant Ah_design(k=16.8)
                                                   annotation (Placement(
        transformation(
        extent={{-6,6},{6,-6}},
        rotation=0,
        origin={46,36})));
  Thermal.Thermal_1D Thermal_1D(
    m=337,
    Cp=1.07,
    k=1.05,
    A=(74.5/1000)*(174/1000),
    L=11.3/1000)
    annotation (Placement(transformation(extent={{-30,0},{-10,20}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin
              p
    "Positive pin (potential p.v > n.v for positive voltage drop v)" annotation (Placement(
        transformation(extent={{90,80},{110,100}}),   iconTransformation(extent={{-120,
            -20},{-80,20}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin
              n "Negative pin" annotation (Placement(transformation(extent={{110,-10},
            {90,10}}),          iconTransformation(extent={{120,-20},{80,20}})));
  Modelica.Blocks.Sources.RealExpression Qirr(y=Thev_ECM.p.i*(Thev_ECM.p.v -
        Thev_ECM.Voc.v)) "Irreversible Heat Rejection"
    annotation (Placement(transformation(extent={{-100,64},{-30,82}})));
  Modelica.Blocks.Sources.RealExpression Qrev(y=Thev_ECM.p.i*Thev_ECM.dVdT.Tref.k
        *Thev_ECM.dVdT.dVdT)
                            "Reversible Heat Rejection"
    annotation (Placement(transformation(extent={{-100,46},{-30,66}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor Vt annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={90,30})));
  Modelica.Blocks.Sources.Constant set_SoH(k=1) annotation (Placement(
        transformation(
        extent={{-6,6},{6,-6}},
        rotation=0,
        origin={-6,-14})));
equation
  connect(Thev_ECM.p, CC.p)
    annotation (Line(points={{20,30},{20,50},{60,50}}, color={0,0,255}));
  connect(CC.SoC, Thev_ECM.SoC) annotation (Line(points={{75,61},{75,90},{0,90},
          {0,26},{8,26}}, color={0,0,127}));
  connect(Ah_design.y, CC.Qtyp_Ah)
    annotation (Line(points={{52.6,36},{64,36},{64,38}}, color={0,0,127}));
  connect(Thermal_1D.Temp, Thev_ECM.Temp)
    annotation (Line(points={{-9,6},{0,6},{0,20},{8,20}},
                                              color={0,0,127}));
  connect(CC.n, p) annotation (Line(points={{80,50},{90,50},{90,90},{100,90}},
        color={0,0,255}));
  connect(Thev_ECM.n, n)
    annotation (Line(points={{20,10},{20,0},{100,0}},    color={0,0,255}));
  connect(Thermal_1D.port_a, port_a) annotation (Line(points={{-20,0},{-20,-60},
          {0,-60},{0,-100}}, color={191,0,0}));
  connect(n, n) annotation (Line(points={{100,0},{100,0}}, color={0,0,255}));
  connect(Qrev.y, Thermal_1D.Qrev)
    annotation (Line(points={{-26.5,56},{-20,56},{-20,22}}, color={0,0,127}));
  connect(Qirr.y, Thermal_1D.Qirr)
    annotation (Line(points={{-26.5,73},{-13,73},{-13,22}}, color={0,0,127}));
  connect(Vt.n, n)
    annotation (Line(points={{90,20},{90,0},{100,0}}, color={0,0,255}));
  connect(Vt.p, p)
    annotation (Line(points={{90,40},{90,90},{100,90}}, color={0,0,255}));
  connect(set_SoH.y, Thev_ECM.SoH) annotation (Line(points={{0.6,-14},{4,-14},{
          4,13.8},{8,13.8}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Text(
          extent={{-160,80},{-100,20}},
          lineColor={160,160,164},
          textString="+"),
        Text(
          extent={{100,80},{160,20}},
          lineColor={160,160,164},
          textString="-"),
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
        Text(
          extent={{-100,20},{100,-100}},
          lineColor={28,108,200},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          textString="Thermal
Thev_2RC")}), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Thermal_ECM;

within CU_IRP_perrinn_battery.Electrical.Coupled_Models.Static_Cell;
model A123_26Ah_2RC_OCV_4PartEq "A123 26Ah NCM Pouch"
  Modelica.Electrical.Analog.Sources.SignalVoltage OCV annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-30,10})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={130,50})));
  Modelica.Electrical.Analog.Sources.SignalCurrent LoadCurrent annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={148,10})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{40,-100},{60,-80}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor V_OCV annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={10,10})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor V_cell annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={178,10})));
  CU_IRP_perrinn_battery.Electrical.SoC_Estimation.Columb_Counting_delta995
    columb_Counting annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,110})));
  Modelica.Blocks.Interfaces.RealOutput V_cell_out
    annotation (Placement(transformation(extent={{200,0},{220,20}})));
  Modelica.Blocks.Interfaces.RealInput I_demand
    annotation (Placement(transformation(extent={{60,20},{80,40}})));
  Modelica.Blocks.Sources.Constant Ah_design(k=26) annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={110,90})));
  Modelica.Blocks.Interfaces.RealOutput OCV_out
    annotation (Placement(transformation(extent={{30,0},{50,20}})));
  Modelica.Blocks.Interfaces.RealOutput I_cell_out
    annotation (Placement(transformation(extent={{200,40},{220,60}})));
  Modelica.Blocks.Interfaces.RealOutput SoC_out
    annotation (Placement(transformation(extent={{60,80},{80,100}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{100,0},{120,20}})));
  Modelica.Blocks.Sources.Constant manaul_set(k=26)
                                                   annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={70,-30})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{60,0},{80,20}})));
  CU_IRP_perrinn_battery.Electrical.ECM.Thevenin_2RC_static_NCM
    thevenin_static_NCM
    annotation (Placement(transformation(extent={{40,40},{60,60}})));
  CU_IRP_perrinn_battery.Electrical.ECM.SoC_OCV.EP_16Ah8_NMC_4PartEq
    eP_16Ah8_NMC_4PartEq
    annotation (Placement(transformation(extent={{-70,0},{-50,20}})));
equation
  connect(LoadCurrent.n, ground.p)
    annotation (Line(points={{148,0},{148,-80},{50,-80}}, color={0,0,255}));
  connect(OCV.n, ground.p)
    annotation (Line(points={{-30,0},{-30,-80},{50,-80}}, color={0,0,255}));
  connect(V_OCV.p, OCV.p)
    annotation (Line(points={{10,20},{-30,20}}, color={0,0,255}));
  connect(OCV.n, V_OCV.n)
    annotation (Line(points={{-30,0},{10,0}}, color={0,0,255}));
  connect(V_cell.p, LoadCurrent.p)
    annotation (Line(points={{178,20},{148,20}}, color={0,0,255}));
  connect(currentSensor.i, columb_Counting.Iload_A)
    annotation (Line(points={{130,60},{130,116},{80.2,116}}, color={0,0,127}));
  connect(currentSensor.n, LoadCurrent.p)
    annotation (Line(points={{140,50},{148,50},{148,20}}, color={0,0,255}));
  connect(LoadCurrent.n, V_cell.n)
    annotation (Line(points={{148,0},{178,0}}, color={0,0,255}));
  connect(V_cell.v, V_cell_out)
    annotation (Line(points={{188,10},{210,10}}, color={0,0,127}));
  connect(V_cell_out, V_cell_out)
    annotation (Line(points={{210,10},{210,10}}, color={0,0,127}));
  connect(Ah_design.y, columb_Counting.Qtyp_Ah) annotation (Line(points={{99,90},
          {90,90},{90,122},{76,122}}, color={0,0,127}));
  connect(V_OCV.v, OCV_out)
    annotation (Line(points={{20,10},{40,10}}, color={0,0,127}));
  connect(currentSensor.i, I_cell_out) annotation (Line(points={{130,60},{166,
          60},{166,50},{210,50}}, color={0,0,127}));
  connect(SoC_out, columb_Counting.SoC) annotation (Line(points={{70,90},{42,90},
          {42,99},{65,99}},   color={0,0,127}));
  connect(switch1.y, LoadCurrent.i)
    annotation (Line(points={{121,10},{141,10}}, color={0,0,127}));
  connect(I_demand, switch1.u1) annotation (Line(points={{70,30},{84,30},{84,18},
          {98,18}}, color={0,0,127}));
  connect(manaul_set.y, switch1.u3) annotation (Line(points={{81,-30},{90,-30},
          {90,2},{98,2}}, color={0,0,127}));
  connect(booleanConstant.y, switch1.u2)
    annotation (Line(points={{81,10},{98,10}}, color={255,0,255}));
  connect(thevenin_static_NCM.n, currentSensor.p)
    annotation (Line(points={{60,50},{120,50}}, color={0,0,255}));
  connect(thevenin_static_NCM.p, OCV.p)
    annotation (Line(points={{40,50},{-30,50},{-30,20}}, color={0,0,255}));
  connect(eP_16Ah8_NMC_4PartEq.s, columb_Counting.SoC) annotation (Line(points=
          {{-72,10},{-80,10},{-80,99},{65,99}}, color={0,0,127}));
  connect(eP_16Ah8_NMC_4PartEq.y, OCV.v)
    annotation (Line(points={{-49,10},{-37,10}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{220,
            140}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            220,140}})),
    experiment(StopTime=3600),
    __Dymola_experimentSetupOutput,
    __Dymola_experimentFlags(
      Advanced(GenerateVariableDependencies=false, OutputModelicaCode=false),
      Evaluate=false,
      OutputCPUtime=false,
      OutputFlatModelica=false));
end A123_26Ah_2RC_OCV_4PartEq;

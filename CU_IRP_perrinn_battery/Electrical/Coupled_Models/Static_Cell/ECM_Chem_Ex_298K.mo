within CU_IRP_perrinn_battery.Electrical.Coupled_Models.Static_Cell;
model ECM_Chem_Ex_298K
  Modelica.Electrical.Spice3.Basic.R_Resistor Rcc_A(R=1e-3)
    annotation (Placement(transformation(extent={{0,0},{-20,20}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage OCV annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-40,-30})));
  Modelica.Electrical.Spice3.Basic.R_Resistor Rel_A(R=4.3e-3)
    annotation (Placement(transformation(extent={{68,20},{88,40}})));
  Modelica.Electrical.Spice3.Basic.C_Capacitor Cel_C(C=39027.16) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={140,10})));
  Modelica.Electrical.Spice3.Basic.R_Resistor Rel_C(R=6e-3)
    annotation (Placement(transformation(extent={{130,20},{150,40}})));
  Modelica.Blocks.Logical.TerminateSimulation terminateSimulation(condition=
        V_cell.v < 2.5)
    annotation (Placement(transformation(extent={{-86,-98},{-6,-90}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={270,10})));
  Modelica.Electrical.Spice3.Basic.C_Capacitor Cel_A(C=74506.39) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={78,10})));
  Modelica.Electrical.Analog.Sources.SignalCurrent LoadCurrent annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={290,-30})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{40,-80},{60,-60}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor V_OCV annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-10,-30})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor V_cell annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={310,-30})));
  Modelica.Blocks.Tables.CombiTable1Ds DoD_OCV(
    tableOnFile=true,
    tableName="table",
    fileName=
        "C:/Users/jason/OneDrive - The Hong Kong Polytechnic University/Cranfield Studies/4 Course Projects/IRP Battery/A123/A123_OCV_Discharge.mat")
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  CU_IRP_perrinn_battery.Electrical.SoC_Estimation.Columb_Counting_delta995
    columb_Counting annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={68,134})));
  Modelica.Blocks.Sources.Constant Ah(k=5)
    annotation (Placement(transformation(extent={{178,114},{158,134}})));
  Modelica.Blocks.Sources.Constant Idischarge_A(k=5)   annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={212,-30})));
  Modelica.Electrical.Spice3.Basic.R_Resistor Rel_S(R=6.7e-3)
    annotation (Placement(transformation(extent={{100,20},{120,40}})));
  Modelica.Electrical.Spice3.Basic.C_Capacitor Cel_S(C=88698.08) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,10})));
  Modelica.Electrical.Spice3.Basic.C_Capacitor Cdl_A(C=737.36) annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={50,10})));
  Modelica.Electrical.Spice3.Basic.C_Capacitor Cdl_C(C=230.27) annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={170,10})));
  Modelica.Electrical.Spice3.Basic.R_Resistor Rcc_C(R=2e-3)
    annotation (Placement(transformation(extent={{240,0},{220,20}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor V_Rcc_C
    "Voltage across cathode current collector" annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={230,30})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor V_Cdl_C annotation (
      Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={170,30})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor V_Cel_C annotation (
      Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={140,52})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor V_Cel_S
    "Voltage across cathode current collector" annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={110,50})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor V_Cel_A
    "Voltage across cathode current collector" annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={78,50})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor V_Cdl_A
    "Voltage across cathode current collector" annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={50,30})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor V_Rcc_A
    "Voltage across cathode current collector" annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={-10,30})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor V_ECM
    "Voltage across cathode current collector" annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={110,90})));
  Modelica.Electrical.Spice3.Basic.R_Resistor Rel_A1(R=4.3e-3) annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={20,10})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor V_Rel_A1
    "Voltage across cathode current collector" annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={20,30})));
  Modelica.Electrical.Spice3.Basic.R_Resistor Rel_C1(R=6e-3) annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={200,10})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor V_Rel_C1 annotation (
      Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={200,30})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{332,-40},{352,-20}})));
equation
  connect(LoadCurrent.n, ground.p)
    annotation (Line(points={{290,-40},{290,-60},{50,-60}},
                                                          color={0,0,255}));
  connect(V_OCV.p, OCV.p)
    annotation (Line(points={{-10,-20},{-40,-20}},
                                                color={0,0,255}));
  connect(OCV.n, V_OCV.n)
    annotation (Line(points={{-40,-40},{-10,-40}},
                                              color={0,0,255}));
  connect(V_cell.p, LoadCurrent.p)
    annotation (Line(points={{310,-20},{290,-20}},
                                                 color={0,0,255}));
  connect(V_cell.n, LoadCurrent.n) annotation (Line(points={{310,-40},{290,-40}},
                                               color={0,0,255}));
  connect(DoD_OCV.y[1], OCV.v)
    annotation (Line(points={{-59,-30},{-47,-30}},
                                                 color={0,0,127}));
  connect(Idischarge_A.y, LoadCurrent.i)
    annotation (Line(points={{223,-30},{283,-30}},
                                                 color={0,0,127}));
  connect(Ah.y, columb_Counting.Qtyp_Ah) annotation (Line(points={{157,124},{
          150,124},{150,146},{74,146}},
                                  color={0,0,127}));
  connect(currentSensor.i, columb_Counting.Iload_A)
    annotation (Line(points={{270,20},{270,140},{78.2,140}}, color={0,0,127}));
  connect(currentSensor.n, LoadCurrent.p)
    annotation (Line(points={{280,10},{290,10},{290,-20}},color={0,0,255}));
  connect(columb_Counting.DoD, DoD_OCV.u) annotation (Line(points={{73,123},{
          -92,123},{-92,-30},{-82,-30}},
                                       color={0,0,127}));
  connect(OCV.n, ground.p)
    annotation (Line(points={{-40,-40},{-40,-60},{50,-60}}, color={0,0,255}));
  connect(Rcc_C.p, currentSensor.p)
    annotation (Line(points={{240,10},{260,10}}, color={0,0,255}));
  connect(Rcc_A.n, OCV.p)
    annotation (Line(points={{-20,10},{-40,10},{-40,-20}}, color={0,0,255}));
  connect(V_Rcc_C.n, Rcc_C.n)
    annotation (Line(points={{220,30},{220,10}}, color={0,0,255}));
  connect(V_Rcc_C.p, Rcc_C.p)
    annotation (Line(points={{240,30},{240,10}}, color={0,0,255}));
  connect(V_Cdl_C.p, Cdl_C.p)
    annotation (Line(points={{180,30},{180,10}}, color={0,0,255}));
  connect(V_Cdl_C.n, Cdl_C.n)
    annotation (Line(points={{160,30},{160,10}}, color={0,0,255}));
  connect(V_Cdl_A.p, Cdl_A.p)
    annotation (Line(points={{60,30},{60,10}}, color={0,0,255}));
  connect(V_Cdl_A.n, Cdl_A.n)
    annotation (Line(points={{40,30},{40,10}}, color={0,0,255}));
  connect(V_Rcc_A.p, Rcc_A.p)
    annotation (Line(points={{0,30},{0,10}}, color={0,0,255}));
  connect(V_Rcc_A.n, Rcc_A.n)
    annotation (Line(points={{-20,30},{-20,10}}, color={0,0,255}));
  connect(V_Cel_A.n, Rel_A.p)
    annotation (Line(points={{68,50},{68,30}}, color={0,0,255}));
  connect(V_Cel_A.p, Rel_A.n)
    annotation (Line(points={{88,50},{88,30}}, color={0,0,255}));
  connect(Rel_A.n, Cel_A.n)
    annotation (Line(points={{88,30},{88,10}}, color={0,0,255}));
  connect(Rel_A.p, Cel_A.p)
    annotation (Line(points={{68,30},{68,10}}, color={0,0,255}));
  connect(Rel_S.p, Cel_S.p)
    annotation (Line(points={{100,30},{100,10}}, color={0,0,255}));
  connect(V_Cel_S.n, Rel_S.p)
    annotation (Line(points={{100,50},{100,30}}, color={0,0,255}));
  connect(V_Cel_S.p, Rel_S.n)
    annotation (Line(points={{120,50},{120,30}}, color={0,0,255}));
  connect(Rel_S.n, Cel_S.n)
    annotation (Line(points={{120,30},{120,10}}, color={0,0,255}));
  connect(Rel_C.p, Cel_C.p)
    annotation (Line(points={{130,30},{130,10}}, color={0,0,255}));
  connect(V_Cel_C.n, Rel_C.p)
    annotation (Line(points={{130,52},{130,30}}, color={0,0,255}));
  connect(V_Cel_C.p, Rel_C.n)
    annotation (Line(points={{150,52},{150,30}}, color={0,0,255}));
  connect(Rel_C.n, Cel_C.n)
    annotation (Line(points={{150,30},{150,10}}, color={0,0,255}));
  connect(Cel_C.n, Cdl_C.n)
    annotation (Line(points={{150,10},{160,10}}, color={0,0,255}));
  connect(Cel_S.p, Cel_A.n)
    annotation (Line(points={{100,10},{88,10}}, color={0,0,255}));
  connect(Cel_C.p, Cel_S.n)
    annotation (Line(points={{130,10},{120,10}}, color={0,0,255}));
  connect(Cel_A.p, Cdl_A.p)
    annotation (Line(points={{68,10},{60,10}}, color={0,0,255}));
  connect(V_ECM.p, currentSensor.p) annotation (Line(points={{120,90},{250,90},
          {250,10},{260,10}}, color={0,0,255}));
  connect(V_ECM.n, OCV.p)
    annotation (Line(points={{100,90},{-40,90},{-40,-20}}, color={0,0,255}));
  connect(Rcc_A.p, Rel_A1.n)
    annotation (Line(points={{0,10},{10,10}}, color={0,0,255}));
  connect(Rel_A1.p, Cdl_A.n)
    annotation (Line(points={{30,10},{40,10}}, color={0,0,255}));
  connect(V_Rel_A1.p, Rel_A1.p)
    annotation (Line(points={{30,30},{30,10}}, color={0,0,255}));
  connect(V_Rel_A1.n, Rel_A1.n)
    annotation (Line(points={{10,30},{10,10}}, color={0,0,255}));
  connect(Rel_C1.p, Rcc_C.n)
    annotation (Line(points={{210,10},{220,10}}, color={0,0,255}));
  connect(Cdl_C.p, Rel_C1.n)
    annotation (Line(points={{180,10},{190,10}}, color={0,0,255}));
  connect(V_Rel_C1.p, Rel_C1.p)
    annotation (Line(points={{210,30},{210,10}}, color={0,0,255}));
  connect(V_Rel_C1.n, Rel_C1.n)
    annotation (Line(points={{190,30},{190,10}}, color={0,0,255}));
  connect(y, y)
    annotation (Line(points={{342,-30},{342,-30}}, color={0,0,127}));
  connect(y, V_cell.v)
    annotation (Line(points={{342,-30},{320,-30}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{340,
            160}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            340,160}}), graphics={
        Text(
          extent={{102,80},{122,60}},
          lineColor={28,108,200},
          textString="Seperator"),
        Rectangle(extent={{126,40},{246,0}}, lineColor={28,108,200}),
        Text(
          extent={{200,70},{220,50}},
          lineColor={28,108,200},
          textString="Cathode"),
        Text(
          extent={{20,80},{40,60}},
          lineColor={28,108,200},
          textString="Anode"),
        Rectangle(extent={{96,40},{122,0}}, lineColor={28,108,200}),
        Rectangle(extent={{-30,40},{92,0}}, lineColor={28,108,200}),
        Rectangle(extent={{64,40},{92,0}}, lineColor={28,108,200}),
        Text(
          extent={{72,0},{92,-20}},
          lineColor={28,108,200},
          textString="Electrolyte"),
        Text(
          extent={{20,0},{40,-20}},
          lineColor={28,108,200},
          textString="Electrode"),
        Text(
          extent={{180,0},{200,-20}},
          lineColor={28,108,200},
          textString="Electrode"),
        Rectangle(extent={{126,40},{154,0}}, lineColor={28,108,200})}),
    experiment(StopTime=3600),
    __Dymola_experimentSetupOutput,
    __Dymola_experimentFlags(
      Advanced(GenerateVariableDependencies=false, OutputModelicaCode=false),
      Evaluate=false,
      OutputCPUtime=false,
      OutputFlatModelica=false));
end ECM_Chem_Ex_298K;

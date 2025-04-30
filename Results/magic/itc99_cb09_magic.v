// NOR_NOT mapped module b09_C

module b09_C (
  input  X       ,
  input  D_OUT_REG_7__SCAN_IN,
  input  D_OUT_REG_6__SCAN_IN,
  input  D_OUT_REG_5__SCAN_IN,
  input  D_OUT_REG_4__SCAN_IN,
  input  D_OUT_REG_3__SCAN_IN,
  input  D_OUT_REG_2__SCAN_IN,
  input  D_OUT_REG_1__SCAN_IN,
  input  D_OUT_REG_0__SCAN_IN,
  input  OLD_REG_7__SCAN_IN,
  input  OLD_REG_6__SCAN_IN,
  input  OLD_REG_5__SCAN_IN,
  input  OLD_REG_4__SCAN_IN,
  input  OLD_REG_3__SCAN_IN,
  input  OLD_REG_2__SCAN_IN,
  input  OLD_REG_1__SCAN_IN,
  input  OLD_REG_0__SCAN_IN,
  input  Y_REG_SCAN_IN,
  input  STATO_REG_1__SCAN_IN,
  input  STATO_REG_0__SCAN_IN,
  input  D_IN_REG_8__SCAN_IN,
  input  D_IN_REG_7__SCAN_IN,
  input  D_IN_REG_6__SCAN_IN,
  input  D_IN_REG_5__SCAN_IN,
  input  D_IN_REG_4__SCAN_IN,
  input  D_IN_REG_3__SCAN_IN,
  input  D_IN_REG_2__SCAN_IN,
  input  D_IN_REG_1__SCAN_IN,
  output Y       ,
  output D_OUT_REG_7__SCAN_OUT,
  output D_OUT_REG_6__SCAN_OUT,
  output D_OUT_REG_5__SCAN_OUT,
  output D_OUT_REG_4__SCAN_OUT,
  output D_OUT_REG_3__SCAN_OUT,
  output D_OUT_REG_2__SCAN_OUT,
  output D_OUT_REG_1__SCAN_OUT,
  output D_OUT_REG_0__SCAN_OUT,
  output OLD_REG_7__SCAN_OUT,
  output OLD_REG_6__SCAN_OUT,
  output OLD_REG_5__SCAN_OUT,
  output OLD_REG_4__SCAN_OUT,
  output OLD_REG_3__SCAN_OUT,
  output OLD_REG_2__SCAN_OUT,
  output OLD_REG_1__SCAN_OUT,
  output OLD_REG_0__SCAN_OUT,
  output Y_REG_SCAN_OUT,
  output STATO_REG_1__SCAN_OUT,
  output STATO_REG_0__SCAN_OUT,
  output D_IN_REG_8__SCAN_OUT,
  output D_IN_REG_7__SCAN_OUT,
  output D_IN_REG_6__SCAN_OUT,
  output D_IN_REG_5__SCAN_OUT,
  output D_IN_REG_4__SCAN_OUT,
  output D_IN_REG_3__SCAN_OUT,
  output D_IN_REG_2__SCAN_OUT,
  output D_IN_REG_1__SCAN_OUT,
  output D_IN_REG_0__SCAN_OUT);

  wire wr_30;
  wire wr_31;
  wire wr_32;
  wire wr_33;
  wire wr_34;
  wire wr_35;
  wire wr_36;
  wire wr_37;
  wire wr_38;
  wire wr_39;
  wire wr_40;
  wire wr_41;
  wire wr_42;
  wire wr_43;
  wire wr_44;
  wire wr_45;
  wire wr_46;
  wire wr_47;
  wire wr_48;
  wire wr_49;
  wire wr_50;
  wire wr_51;
  wire wr_52;
  wire wr_53;
  wire wr_54;
  wire wr_55;
  wire wr_56;
  wire wr_57;
  wire wr_58;
  wire wr_59;
  wire wr_60;
  wire wr_61;
  wire wr_62;
  wire wr_63;
  wire wr_64;
  wire wr_65;
  wire wr_66;
  wire wr_67;
  wire wr_68;
  wire wr_69;
  wire wr_70;
  wire wr_71;
  wire wr_72;
  wire wr_73;
  wire wr_74;
  wire wr_75;
  wire wr_76;
  wire wr_77;
  wire wr_78;
  wire wr_79;
  wire wr_80;
  wire wr_81;
  wire wr_82;
  wire wr_83;
  wire wr_84;
  wire wr_85;
  wire wr_86;
  wire wr_87;
  wire wr_88;
  wire wr_89;
  wire wr_90;

  not    g1( wr_31   ,           STATO_REG_0__SCAN_IN);
  not    g2( wr_34   ,           STATO_REG_1__SCAN_IN);
  not    g3( wr_30   ,           D_OUT_REG_7__SCAN_IN);
  not    g4( wr_32   ,           D_OUT_REG_6__SCAN_IN);
  not    g5( wr_39   ,           D_OUT_REG_5__SCAN_IN);
  not    g6( wr_43   ,           D_OUT_REG_4__SCAN_IN);
  not    g7( wr_47   ,           D_OUT_REG_3__SCAN_IN);
  not    g8( wr_51   ,           D_OUT_REG_2__SCAN_IN);
  not    g9( wr_55   ,           D_OUT_REG_1__SCAN_IN);
  not   g10( wr_59   ,           D_OUT_REG_0__SCAN_IN);
  not   g11( wr_75   ,           Y_REG_SCAN_IN);
  not   g12( wr_63   ,           OLD_REG_7__SCAN_IN);
  nor   g13( wr_64   , STATO_REG_0__SCAN_IN, STATO_REG_1__SCAN_IN);
  not   g14( wr_65   ,           OLD_REG_6__SCAN_IN);
  not   g15( wr_66   ,           OLD_REG_5__SCAN_IN);
  not   g16( wr_67   ,           OLD_REG_4__SCAN_IN);
  not   g17( wr_68   ,           OLD_REG_3__SCAN_IN);
  not   g18( wr_69   ,           OLD_REG_2__SCAN_IN);
  not   g19( wr_70   ,           OLD_REG_1__SCAN_IN);
  not   g20( wr_71   ,           OLD_REG_0__SCAN_IN);
  not   g21( wr_80   ,           D_IN_REG_2__SCAN_IN);
  not   g22( wr_81   ,           D_IN_REG_1__SCAN_IN);
  not   g23( wr_82   ,           D_IN_REG_4__SCAN_IN);
  not   g24( wr_83   ,           D_IN_REG_3__SCAN_IN);
  not   g25( wr_84   ,           D_IN_REG_7__SCAN_IN);
  not   g26( wr_85   ,           D_IN_REG_8__SCAN_IN);
  not   g27( wr_86   ,           D_IN_REG_6__SCAN_IN);
  not   g28( wr_87   ,           D_IN_REG_5__SCAN_IN);
  not   g29( wr_89   ,           X       );
  nor   g30( wr_90   , STATO_REG_0__SCAN_IN, STATO_REG_1__SCAN_IN);
  not   g31( Y       ,           Y_REG_SCAN_IN);
  not   g32( STATO_REG_1__SCAN_OUT,           STATO_REG_1__SCAN_IN);
  nor   g33( wr_35   , STATO_REG_0__SCAN_IN, wr_34   );
  nor   g34( wr_72   , STATO_REG_0__SCAN_IN, wr_34   );
  nor   g35( wr_76   , wr_31   , STATO_REG_1__SCAN_IN);
  nor   g36( wr_33   , wr_31   , wr_32   );
  nor   g37( wr_40   , wr_31   , wr_39   );
  nor   g38( wr_44   , wr_31   , wr_43   );
  nor   g39( wr_48   , wr_31   , wr_47   );
  nor   g40( wr_52   , wr_31   , wr_51   );
  nor   g41( wr_56   , wr_31   , wr_55   );
  nor   g42( wr_60   , wr_31   , wr_59   );
  nor   g43( wr_88   , STATO_REG_0__SCAN_IN, wr_34   );
  nor   g44( D_OUT_REG_7__SCAN_OUT, wr_31   , wr_30   );
  nor   g45( OLD_REG_7__SCAN_OUT, wr_64   , wr_63   );
  nor   g46( OLD_REG_6__SCAN_OUT, wr_64   , wr_65   );
  nor   g47( OLD_REG_5__SCAN_OUT, wr_64   , wr_66   );
  nor   g48( OLD_REG_4__SCAN_OUT, wr_64   , wr_67   );
  nor   g49( OLD_REG_3__SCAN_OUT, wr_64   , wr_68   );
  nor   g50( OLD_REG_2__SCAN_OUT, wr_64   , wr_69   );
  nor   g51( OLD_REG_1__SCAN_OUT, wr_64   , wr_70   );
  nor   g52( OLD_REG_0__SCAN_OUT, wr_64   , wr_71   );
  nor   g53( D_IN_REG_8__SCAN_OUT, wr_90   , wr_89   );
  nor   g54( D_IN_REG_7__SCAN_OUT, wr_90   , wr_85   );
  nor   g55( D_IN_REG_6__SCAN_OUT, wr_90   , wr_84   );
  nor   g56( D_IN_REG_5__SCAN_OUT, wr_90   , wr_86   );
  nor   g57( D_IN_REG_4__SCAN_OUT, wr_90   , wr_87   );
  nor   g58( D_IN_REG_3__SCAN_OUT, wr_90   , wr_82   );
  nor   g59( D_IN_REG_2__SCAN_OUT, wr_90   , wr_83   );
  nor   g60( D_IN_REG_1__SCAN_OUT, wr_90   , wr_80   );
  nor   g61( D_IN_REG_0__SCAN_OUT, wr_90   , wr_81   );
  not   g62( wr_36   ,           wr_35   );
  not   g63( wr_73   ,           wr_72   );
  not   g64( wr_77   ,           wr_76   );
  not   g65( STATO_REG_0__SCAN_OUT,           wr_88   );
  nor   g66( wr_37   , wr_36   , wr_30   );
  nor   g67( wr_41   , wr_36   , wr_32   );
  nor   g68( wr_45   , wr_36   , wr_39   );
  nor   g69( wr_49   , wr_36   , wr_43   );
  nor   g70( wr_53   , wr_36   , wr_47   );
  nor   g71( wr_57   , wr_36   , wr_51   );
  nor   g72( wr_61   , wr_36   , wr_55   );
  nor   g73( wr_74   , wr_73   , wr_59   );
  nor   g74( wr_78   , wr_77   , wr_75   );
  nor   g75( wr_38   , wr_37   , wr_33   );
  nor   g76( wr_42   , wr_41   , wr_40   );
  nor   g77( wr_46   , wr_45   , wr_44   );
  nor   g78( wr_50   , wr_49   , wr_48   );
  nor   g79( wr_54   , wr_53   , wr_52   );
  nor   g80( wr_58   , wr_57   , wr_56   );
  nor   g81( wr_62   , wr_61   , wr_60   );
  nor   g82( wr_79   , wr_78   , wr_74   );
  not   g83( D_OUT_REG_6__SCAN_OUT,           wr_38   );
  not   g84( D_OUT_REG_5__SCAN_OUT,           wr_42   );
  not   g85( D_OUT_REG_4__SCAN_OUT,           wr_46   );
  not   g86( D_OUT_REG_3__SCAN_OUT,           wr_50   );
  not   g87( D_OUT_REG_2__SCAN_OUT,           wr_54   );
  not   g88( D_OUT_REG_1__SCAN_OUT,           wr_58   );
  not   g89( D_OUT_REG_0__SCAN_OUT,           wr_62   );
  not   g90( Y_REG_SCAN_OUT,           wr_79   );

endmodule

// NOR_NOT mapped module b01_C

module b01_C (
  input  LINE2   ,
  input  OVERFLW_REG_SCAN_IN,
  input  STATO_REG_2__SCAN_IN,
  input  STATO_REG_1__SCAN_IN,
  input  STATO_REG_0__SCAN_IN,
  input  OUTP_REG_SCAN_IN,
  output OUTP    ,
  output OVERFLW ,
  output STATO_REG_2__SCAN_OUT,
  output STATO_REG_1__SCAN_OUT,
  output STATO_REG_0__SCAN_OUT,
  output OUTP_REG_SCAN_OUT,
  output OVERFLW_REG_SCAN_OUT);

  wire wr_8;
  wire wr_9;
  wire wr_10;
  wire wr_11;
  wire wr_12;
  wire wr_13;
  wire wr_14;
  wire wr_15;
  wire wr_16;
  wire wr_17;
  wire wr_18;
  wire wr_19;
  wire wr_20;
  wire wr_21;
  wire wr_22;
  wire wr_23;
  wire wr_24;
  wire wr_25;
  wire wr_26;
  wire wr_27;
  wire wr_28;
  wire wr_29;
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

  not    g1( wr_13   ,           STATO_REG_1__SCAN_IN);
  not    g2( wr_21   ,           LINE2   );
  not    g3( wr_8    ,           STATO_REG_2__SCAN_IN);
  not    g4( wr_18   ,           STATO_REG_0__SCAN_IN);
  nor    g5( wr_9    , STATO_REG_0__SCAN_IN, LINE2   );
  nor    g6( wr_29   , STATO_REG_0__SCAN_IN, STATO_REG_1__SCAN_IN);
  not    g7( OUTP    ,           OUTP_REG_SCAN_IN);
  not    g8( OVERFLW ,           OVERFLW_REG_SCAN_IN);
  nor    g9( wr_14   , STATO_REG_0__SCAN_IN, wr_13   );
  nor   g10( wr_22   , STATO_REG_0__SCAN_IN, wr_21   );
  nor   g11( wr_32   , wr_18   , STATO_REG_2__SCAN_IN);
  nor   g12( wr_20   , wr_13   , LINE2   );
  nor   g13( wr_10   , wr_9    , wr_8    );
  not   g14( wr_30   ,           wr_29   );
  nor   g15( wr_19   , wr_18   , STATO_REG_1__SCAN_IN);
  nor   g16( wr_23   , wr_22   , wr_8    );
  nor   g17( wr_34   , wr_14   , wr_8    );
  not   g18( wr_15   ,           wr_14   );
  not   g19( wr_33   ,           wr_32   );
  not   g20( wr_11   ,           wr_10   );
  nor   g21( wr_31   , wr_30   , STATO_REG_2__SCAN_IN);
  not   g22( wr_24   ,           wr_23   );
  not   g23( wr_35   ,           wr_34   );
  nor   g24( wr_16   , wr_15   , STATO_REG_2__SCAN_IN);
  nor   g25( OVERFLW_REG_SCAN_OUT, wr_33   , wr_13   );
  nor   g26( wr_12   , wr_11   , STATO_REG_1__SCAN_IN);
  nor   g27( wr_40   , wr_34   , wr_21   );
  nor   g28( wr_25   , wr_24   , wr_20   );
  nor   g29( wr_36   , wr_35   , wr_21   );
  nor   g30( wr_41   , wr_35   , LINE2   );
  nor   g31( wr_17   , wr_16   , wr_12   );
  nor   g32( wr_26   , wr_25   , wr_16   );
  nor   g33( wr_37   , wr_36   , OVERFLW_REG_SCAN_OUT);
  nor   g34( wr_42   , wr_41   , wr_40   );
  not   g35( STATO_REG_2__SCAN_OUT,           wr_17   );
  not   g36( wr_27   ,           wr_26   );
  not   g37( wr_38   ,           wr_37   );
  not   g38( OUTP_REG_SCAN_OUT,           wr_42   );
  nor   g39( wr_28   , wr_27   , wr_19   );
  nor   g40( wr_39   , wr_38   , wr_31   );
  not   g41( STATO_REG_1__SCAN_OUT,           wr_28   );
  not   g42( STATO_REG_0__SCAN_OUT,           wr_39   );

endmodule

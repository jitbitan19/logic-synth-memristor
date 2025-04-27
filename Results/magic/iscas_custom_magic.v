// NOR_NOT mapped module half_adder

module half_adder (
  input  a      ,
  input  b      ,
  output c      ,
  output s      );

  wire wr_3;
  wire wr_4;
  wire wr_5;
  wire wr_6;
  wire wr_7;

  not    g1( wr_3   ,          b      );
  not    g2( wr_5   ,          a      );
  nor    g3( wr_4   , wr_3   , a      );
  nor    g4( wr_6   , b      , wr_5    );
  nor    g5( s      , wr_3   , wr_5    );
  nor    g6( wr_7   , wr_6   , wr_4    );
  not    g7( c      ,          wr_7    );

endmodule

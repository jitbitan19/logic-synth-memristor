// NOR_NOT mapped module c17

module c17 (
  input  G1gat  ,
  input  G2gat  ,
  input  G3gat  ,
  input  G6gat  ,
  input  G7gat  ,
  output G22gat ,
  output G23gat );

  wire wr_3;
  wire wr_4;
  wire wr_5;
  wire wr_6;
  wire wr_7;
  wire wr_8;
  wire wr_9;
  wire wr_10;
  wire wr_11;
  wire wr_12;
  wire wr_13;

  not    g1( wr_4   ,          G3gat  );
  not    g2( wr_7   ,          G6gat  );
  not    g3( wr_3   ,          G1gat  );
  not    g4( wr_6   ,          G2gat  );
  not    g5( wr_11  ,          G7gat  );
  nor    g6( wr_8   , wr_7   , wr_4    );
  nor    g7( wr_5   , wr_4   , wr_3    );
  nor    g8( wr_9   , wr_8   , wr_6    );
  nor    g9( wr_12  , wr_8   , wr_11   );
  nor   g10( wr_10  , wr_9   , wr_5    );
  nor   g11( wr_13  , wr_12  , wr_9    );
  not   g12( G22gat ,          wr_10   );
  not   g13( G23gat ,          wr_13   );

endmodule

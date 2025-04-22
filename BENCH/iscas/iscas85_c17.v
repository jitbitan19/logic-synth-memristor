// Benchmark "./input/c17" written by ABC on Thu Aug  8 02:45:58 2024

module c17  ( 
    G1gat, G2gat, G3gat, G6gat, G7gat,
    G22gat, G23gat  );
  input  G1gat, G2gat, G3gat, G6gat, G7gat;
  output G22gat, G23gat;
  wire new_G10gat_, new_G11gat_, new_G16gat_, new_G19gat_;
  assign new_G10gat_ = ~G1gat | ~G3gat;
  assign new_G11gat_ = ~G3gat | ~G6gat;
  assign new_G16gat_ = ~G2gat | ~new_G11gat_;
  assign new_G19gat_ = ~new_G11gat_ | ~G7gat;
  assign G22gat = ~new_G10gat_ | ~new_G16gat_;
  assign G23gat = ~new_G16gat_ | ~new_G19gat_;
endmodule



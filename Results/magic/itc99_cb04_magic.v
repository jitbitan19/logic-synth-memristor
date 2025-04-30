// NOR_NOT mapped module b04_C

module b04_C (
  input  AVERAGE ,
  input  ENABLE  ,
  input  DATA_IN_7_,
  input  DATA_IN_6_,
  input  DATA_IN_5_,
  input  DATA_IN_4_,
  input  DATA_IN_3_,
  input  DATA_IN_2_,
  input  DATA_IN_1_,
  input  DATA_IN_0_,
  input  STATO_REG_0__SCAN_IN,
  input  STATO_REG_1__SCAN_IN,
  input  DATA_OUT_REG_0__SCAN_IN,
  input  DATA_OUT_REG_1__SCAN_IN,
  input  DATA_OUT_REG_2__SCAN_IN,
  input  DATA_OUT_REG_3__SCAN_IN,
  input  DATA_OUT_REG_4__SCAN_IN,
  input  DATA_OUT_REG_5__SCAN_IN,
  input  DATA_OUT_REG_6__SCAN_IN,
  input  DATA_OUT_REG_7__SCAN_IN,
  input  REG4_REG_0__SCAN_IN,
  input  REG4_REG_1__SCAN_IN,
  input  REG4_REG_2__SCAN_IN,
  input  RMAX_REG_7__SCAN_IN,
  input  RMAX_REG_6__SCAN_IN,
  input  RMAX_REG_5__SCAN_IN,
  input  RMAX_REG_4__SCAN_IN,
  input  RMAX_REG_3__SCAN_IN,
  input  RMAX_REG_2__SCAN_IN,
  input  RMAX_REG_1__SCAN_IN,
  input  RMAX_REG_0__SCAN_IN,
  input  RMIN_REG_7__SCAN_IN,
  input  RMIN_REG_6__SCAN_IN,
  input  RMIN_REG_5__SCAN_IN,
  input  RMIN_REG_4__SCAN_IN,
  input  RMIN_REG_3__SCAN_IN,
  input  RMIN_REG_2__SCAN_IN,
  input  RMIN_REG_1__SCAN_IN,
  input  RMIN_REG_0__SCAN_IN,
  input  RLAST_REG_7__SCAN_IN,
  input  RLAST_REG_6__SCAN_IN,
  input  RLAST_REG_5__SCAN_IN,
  input  RLAST_REG_4__SCAN_IN,
  input  RLAST_REG_3__SCAN_IN,
  input  RLAST_REG_2__SCAN_IN,
  input  RLAST_REG_1__SCAN_IN,
  input  RLAST_REG_0__SCAN_IN,
  input  REG1_REG_7__SCAN_IN,
  input  REG1_REG_6__SCAN_IN,
  input  REG1_REG_5__SCAN_IN,
  input  REG1_REG_4__SCAN_IN,
  input  REG1_REG_3__SCAN_IN,
  input  REG1_REG_2__SCAN_IN,
  input  REG1_REG_1__SCAN_IN,
  input  REG1_REG_0__SCAN_IN,
  input  REG2_REG_7__SCAN_IN,
  input  REG2_REG_6__SCAN_IN,
  input  REG2_REG_5__SCAN_IN,
  input  REG2_REG_4__SCAN_IN,
  input  REG2_REG_3__SCAN_IN,
  input  REG2_REG_2__SCAN_IN,
  input  REG2_REG_1__SCAN_IN,
  input  REG2_REG_0__SCAN_IN,
  input  REG3_REG_7__SCAN_IN,
  input  REG3_REG_6__SCAN_IN,
  input  REG3_REG_5__SCAN_IN,
  input  REG3_REG_4__SCAN_IN,
  input  REG3_REG_3__SCAN_IN,
  input  REG3_REG_2__SCAN_IN,
  input  REG3_REG_1__SCAN_IN,
  input  REG3_REG_0__SCAN_IN,
  input  REG4_REG_7__SCAN_IN,
  input  REG4_REG_6__SCAN_IN,
  input  REG4_REG_5__SCAN_IN,
  input  REG4_REG_4__SCAN_IN,
  input  REG4_REG_3__SCAN_IN,
  output DATA_OUT_7_,
  output DATA_OUT_6_,
  output DATA_OUT_5_,
  output DATA_OUT_4_,
  output DATA_OUT_3_,
  output DATA_OUT_2_,
  output DATA_OUT_1_,
  output DATA_OUT_0_,
  output RMAX_REG_7__SCAN_OUT,
  output RMAX_REG_6__SCAN_OUT,
  output RMAX_REG_5__SCAN_OUT,
  output RMAX_REG_4__SCAN_OUT,
  output RMAX_REG_3__SCAN_OUT,
  output RMAX_REG_2__SCAN_OUT,
  output RMAX_REG_1__SCAN_OUT,
  output RMAX_REG_0__SCAN_OUT,
  output RMIN_REG_7__SCAN_OUT,
  output RMIN_REG_6__SCAN_OUT,
  output RMIN_REG_5__SCAN_OUT,
  output RMIN_REG_4__SCAN_OUT,
  output RMIN_REG_3__SCAN_OUT,
  output RMIN_REG_2__SCAN_OUT,
  output RMIN_REG_1__SCAN_OUT,
  output RMIN_REG_0__SCAN_OUT,
  output RLAST_REG_7__SCAN_OUT,
  output RLAST_REG_6__SCAN_OUT,
  output RLAST_REG_5__SCAN_OUT,
  output RLAST_REG_4__SCAN_OUT,
  output RLAST_REG_3__SCAN_OUT,
  output RLAST_REG_2__SCAN_OUT,
  output RLAST_REG_1__SCAN_OUT,
  output RLAST_REG_0__SCAN_OUT,
  output REG1_REG_7__SCAN_OUT,
  output REG1_REG_6__SCAN_OUT,
  output REG1_REG_5__SCAN_OUT,
  output REG1_REG_4__SCAN_OUT,
  output REG1_REG_3__SCAN_OUT,
  output REG1_REG_2__SCAN_OUT,
  output REG1_REG_1__SCAN_OUT,
  output REG1_REG_0__SCAN_OUT,
  output REG2_REG_7__SCAN_OUT,
  output REG2_REG_6__SCAN_OUT,
  output REG2_REG_5__SCAN_OUT,
  output REG2_REG_4__SCAN_OUT,
  output REG2_REG_3__SCAN_OUT,
  output REG2_REG_2__SCAN_OUT,
  output REG2_REG_1__SCAN_OUT,
  output REG2_REG_0__SCAN_OUT,
  output REG3_REG_7__SCAN_OUT,
  output REG3_REG_6__SCAN_OUT,
  output REG3_REG_5__SCAN_OUT,
  output REG3_REG_4__SCAN_OUT,
  output REG3_REG_3__SCAN_OUT,
  output REG3_REG_2__SCAN_OUT,
  output REG3_REG_1__SCAN_OUT,
  output REG3_REG_0__SCAN_OUT,
  output REG4_REG_7__SCAN_OUT,
  output REG4_REG_6__SCAN_OUT,
  output REG4_REG_5__SCAN_OUT,
  output REG4_REG_4__SCAN_OUT,
  output REG4_REG_3__SCAN_OUT,
  output REG4_REG_2__SCAN_OUT,
  output REG4_REG_1__SCAN_OUT,
  output REG4_REG_0__SCAN_OUT,
  output DATA_OUT_REG_7__SCAN_OUT,
  output DATA_OUT_REG_6__SCAN_OUT,
  output DATA_OUT_REG_5__SCAN_OUT,
  output DATA_OUT_REG_4__SCAN_OUT,
  output DATA_OUT_REG_3__SCAN_OUT,
  output DATA_OUT_REG_2__SCAN_OUT,
  output DATA_OUT_REG_1__SCAN_OUT,
  output DATA_OUT_REG_0__SCAN_OUT,
  output STATO_REG_1__SCAN_OUT,
  output STATO_REG_0__SCAN_OUT);

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
  wire wr_91;
  wire wr_92;
  wire wr_93;
  wire wr_94;
  wire wr_95;
  wire wr_96;
  wire wr_97;
  wire wr_98;
  wire wr_99;
  wire wr_100;
  wire wr_101;
  wire wr_102;
  wire wr_103;
  wire wr_104;
  wire wr_105;
  wire wr_106;
  wire wr_107;
  wire wr_108;
  wire wr_109;
  wire wr_110;
  wire wr_111;
  wire wr_112;
  wire wr_113;
  wire wr_114;
  wire wr_115;
  wire wr_116;
  wire wr_117;
  wire wr_118;
  wire wr_119;
  wire wr_120;
  wire wr_121;
  wire wr_122;
  wire wr_123;
  wire wr_124;
  wire wr_125;
  wire wr_126;
  wire wr_127;
  wire wr_128;
  wire wr_129;
  wire wr_130;
  wire wr_131;
  wire wr_132;
  wire wr_133;
  wire wr_134;
  wire wr_135;
  wire wr_136;
  wire wr_137;
  wire wr_138;
  wire wr_139;
  wire wr_140;
  wire wr_141;
  wire wr_142;
  wire wr_143;
  wire wr_144;
  wire wr_145;
  wire wr_146;
  wire wr_147;
  wire wr_148;
  wire wr_149;
  wire wr_150;
  wire wr_151;
  wire wr_152;
  wire wr_153;
  wire wr_154;
  wire wr_155;
  wire wr_156;
  wire wr_157;
  wire wr_158;
  wire wr_159;
  wire wr_160;
  wire wr_161;
  wire wr_162;
  wire wr_163;
  wire wr_164;
  wire wr_165;
  wire wr_166;
  wire wr_167;
  wire wr_168;
  wire wr_169;
  wire wr_170;
  wire wr_171;
  wire wr_172;
  wire wr_173;
  wire wr_174;
  wire wr_175;
  wire wr_176;
  wire wr_177;
  wire wr_178;
  wire wr_179;
  wire wr_180;
  wire wr_181;
  wire wr_182;
  wire wr_183;
  wire wr_184;
  wire wr_185;
  wire wr_186;
  wire wr_187;
  wire wr_188;
  wire wr_189;
  wire wr_190;
  wire wr_191;
  wire wr_192;
  wire wr_193;
  wire wr_194;
  wire wr_195;
  wire wr_196;
  wire wr_197;
  wire wr_198;
  wire wr_199;
  wire wr_200;
  wire wr_201;
  wire wr_202;
  wire wr_203;
  wire wr_204;
  wire wr_205;
  wire wr_206;
  wire wr_207;
  wire wr_208;
  wire wr_209;
  wire wr_210;
  wire wr_211;
  wire wr_212;
  wire wr_213;
  wire wr_214;
  wire wr_215;
  wire wr_216;
  wire wr_217;
  wire wr_218;
  wire wr_219;
  wire wr_220;
  wire wr_221;
  wire wr_222;
  wire wr_223;
  wire wr_224;
  wire wr_225;
  wire wr_226;
  wire wr_227;
  wire wr_228;
  wire wr_229;
  wire wr_230;
  wire wr_231;
  wire wr_232;
  wire wr_233;
  wire wr_234;
  wire wr_235;
  wire wr_236;
  wire wr_237;
  wire wr_238;
  wire wr_239;
  wire wr_240;
  wire wr_241;
  wire wr_242;
  wire wr_243;
  wire wr_244;
  wire wr_245;
  wire wr_246;
  wire wr_247;
  wire wr_248;
  wire wr_249;
  wire wr_250;
  wire wr_251;
  wire wr_252;
  wire wr_253;
  wire wr_254;
  wire wr_255;
  wire wr_256;
  wire wr_257;
  wire wr_258;
  wire wr_259;
  wire wr_260;
  wire wr_261;
  wire wr_262;
  wire wr_263;
  wire wr_264;
  wire wr_265;
  wire wr_266;
  wire wr_267;
  wire wr_268;
  wire wr_269;
  wire wr_270;
  wire wr_271;
  wire wr_272;
  wire wr_273;
  wire wr_274;
  wire wr_275;
  wire wr_276;
  wire wr_277;
  wire wr_278;
  wire wr_279;
  wire wr_280;
  wire wr_281;
  wire wr_282;
  wire wr_283;
  wire wr_284;
  wire wr_285;
  wire wr_286;
  wire wr_287;
  wire wr_288;
  wire wr_289;
  wire wr_290;
  wire wr_291;
  wire wr_292;
  wire wr_293;
  wire wr_294;
  wire wr_295;
  wire wr_296;
  wire wr_297;
  wire wr_298;
  wire wr_299;
  wire wr_300;
  wire wr_301;
  wire wr_302;
  wire wr_303;
  wire wr_304;
  wire wr_305;
  wire wr_306;
  wire wr_307;
  wire wr_308;
  wire wr_309;
  wire wr_310;
  wire wr_311;
  wire wr_312;
  wire wr_313;
  wire wr_314;
  wire wr_315;
  wire wr_316;
  wire wr_317;
  wire wr_318;
  wire wr_319;
  wire wr_320;
  wire wr_321;
  wire wr_322;
  wire wr_323;
  wire wr_324;
  wire wr_325;
  wire wr_326;
  wire wr_327;
  wire wr_328;
  wire wr_329;
  wire wr_330;
  wire wr_331;
  wire wr_332;
  wire wr_333;
  wire wr_334;
  wire wr_335;
  wire wr_336;
  wire wr_337;
  wire wr_338;
  wire wr_339;
  wire wr_340;
  wire wr_341;
  wire wr_342;
  wire wr_343;
  wire wr_344;
  wire wr_345;
  wire wr_346;
  wire wr_347;
  wire wr_348;
  wire wr_349;
  wire wr_350;
  wire wr_351;
  wire wr_352;
  wire wr_353;
  wire wr_354;
  wire wr_355;
  wire wr_356;
  wire wr_357;
  wire wr_358;
  wire wr_359;
  wire wr_360;
  wire wr_361;
  wire wr_362;
  wire wr_363;
  wire wr_364;
  wire wr_365;
  wire wr_366;
  wire wr_367;
  wire wr_368;
  wire wr_369;
  wire wr_370;
  wire wr_371;
  wire wr_372;
  wire wr_373;
  wire wr_374;
  wire wr_375;
  wire wr_376;
  wire wr_377;
  wire wr_378;
  wire wr_379;
  wire wr_380;
  wire wr_381;
  wire wr_382;
  wire wr_383;
  wire wr_384;
  wire wr_385;
  wire wr_386;
  wire wr_387;
  wire wr_388;
  wire wr_389;
  wire wr_390;
  wire wr_391;
  wire wr_392;
  wire wr_393;
  wire wr_394;
  wire wr_395;
  wire wr_396;
  wire wr_397;
  wire wr_398;
  wire wr_399;
  wire wr_400;
  wire wr_401;
  wire wr_402;
  wire wr_403;
  wire wr_404;
  wire wr_405;
  wire wr_406;
  wire wr_407;
  wire wr_408;
  wire wr_409;
  wire wr_410;
  wire wr_411;
  wire wr_412;
  wire wr_413;
  wire wr_414;
  wire wr_415;
  wire wr_416;
  wire wr_417;
  wire wr_418;
  wire wr_419;
  wire wr_420;
  wire wr_421;
  wire wr_422;
  wire wr_423;
  wire wr_424;
  wire wr_425;
  wire wr_426;
  wire wr_427;
  wire wr_428;
  wire wr_429;
  wire wr_430;
  wire wr_431;
  wire wr_432;
  wire wr_433;
  wire wr_434;
  wire wr_435;
  wire wr_436;
  wire wr_437;
  wire wr_438;
  wire wr_439;
  wire wr_440;
  wire wr_441;
  wire wr_442;
  wire wr_443;
  wire wr_444;
  wire wr_445;
  wire wr_446;
  wire wr_447;
  wire wr_448;
  wire wr_449;
  wire wr_450;
  wire wr_451;
  wire wr_452;
  wire wr_453;
  wire wr_454;
  wire wr_455;
  wire wr_456;
  wire wr_457;
  wire wr_458;
  wire wr_459;
  wire wr_460;
  wire wr_461;
  wire wr_462;
  wire wr_463;
  wire wr_464;
  wire wr_465;
  wire wr_466;
  wire wr_467;
  wire wr_468;
  wire wr_469;
  wire wr_470;
  wire wr_471;
  wire wr_472;
  wire wr_473;
  wire wr_474;
  wire wr_475;
  wire wr_476;
  wire wr_477;
  wire wr_478;
  wire wr_479;
  wire wr_480;
  wire wr_481;
  wire wr_482;
  wire wr_483;
  wire wr_484;
  wire wr_485;
  wire wr_486;
  wire wr_487;
  wire wr_488;
  wire wr_489;
  wire wr_490;
  wire wr_491;
  wire wr_492;
  wire wr_493;
  wire wr_494;
  wire wr_495;
  wire wr_496;
  wire wr_497;
  wire wr_498;
  wire wr_499;
  wire wr_500;
  wire wr_501;
  wire wr_502;
  wire wr_503;
  wire wr_504;
  wire wr_505;
  wire wr_506;
  wire wr_507;
  wire wr_508;
  wire wr_509;
  wire wr_510;
  wire wr_511;
  wire wr_512;
  wire wr_513;
  wire wr_514;
  wire wr_515;
  wire wr_516;
  wire wr_517;
  wire wr_518;
  wire wr_519;
  wire wr_520;
  wire wr_521;
  wire wr_522;
  wire wr_523;
  wire wr_524;
  wire wr_525;
  wire wr_526;
  wire wr_527;
  wire wr_528;
  wire wr_529;
  wire wr_530;
  wire wr_531;
  wire wr_532;
  wire wr_533;
  wire wr_534;
  wire wr_535;
  wire wr_536;
  wire wr_537;
  wire wr_538;
  wire wr_539;
  wire wr_540;
  wire wr_541;
  wire wr_542;
  wire wr_543;
  wire wr_544;
  wire wr_545;
  wire wr_546;
  wire wr_547;
  wire wr_548;
  wire wr_549;
  wire wr_550;
  wire wr_551;
  wire wr_552;
  wire wr_553;
  wire wr_554;
  wire wr_555;
  wire wr_556;
  wire wr_557;
  wire wr_558;
  wire wr_559;
  wire wr_560;
  wire wr_561;
  wire wr_562;
  wire wr_563;
  wire wr_564;
  wire wr_565;
  wire wr_566;
  wire wr_567;
  wire wr_568;
  wire wr_569;
  wire wr_570;
  wire wr_571;
  wire wr_572;
  wire wr_573;
  wire wr_574;
  wire wr_575;
  wire wr_576;
  wire wr_577;
  wire wr_578;
  wire wr_579;
  wire wr_580;
  wire wr_581;
  wire wr_582;
  wire wr_583;
  wire wr_584;
  wire wr_585;
  wire wr_586;
  wire wr_587;
  wire wr_588;
  wire wr_589;
  wire wr_590;
  wire wr_591;
  wire wr_592;
  wire wr_593;
  wire wr_594;
  wire wr_595;
  wire wr_596;
  wire wr_597;
  wire wr_598;
  wire wr_599;
  wire wr_600;
  wire wr_601;
  wire wr_602;
  wire wr_603;
  wire wr_604;
  wire wr_605;
  wire wr_606;
  wire wr_607;
  wire wr_608;
  wire wr_609;
  wire wr_610;
  wire wr_611;
  wire wr_612;
  wire wr_613;
  wire wr_614;
  wire wr_615;
  wire wr_616;
  wire wr_617;
  wire wr_618;
  wire wr_619;
  wire wr_620;
  wire wr_621;
  wire wr_622;
  wire wr_623;
  wire wr_624;
  wire wr_625;
  wire wr_626;
  wire wr_627;
  wire wr_628;
  wire wr_629;
  wire wr_630;
  wire wr_631;
  wire wr_632;
  wire wr_633;
  wire wr_634;
  wire wr_635;
  wire wr_636;
  wire wr_637;
  wire wr_638;
  wire wr_639;
  wire wr_640;
  wire wr_641;
  wire wr_642;
  wire wr_643;
  wire wr_644;
  wire wr_645;
  wire wr_646;
  wire wr_647;
  wire wr_648;
  wire wr_649;
  wire wr_650;
  wire wr_651;
  wire wr_652;
  wire wr_653;
  wire wr_654;
  wire wr_655;
  wire wr_656;
  wire wr_657;
  wire wr_658;
  wire wr_659;
  wire wr_660;
  wire wr_661;
  wire wr_662;
  wire wr_663;
  wire wr_664;
  wire wr_665;
  wire wr_666;
  wire wr_667;
  wire wr_668;
  wire wr_669;
  wire wr_670;
  wire wr_671;
  wire wr_672;
  wire wr_673;
  wire wr_674;
  wire wr_675;
  wire wr_676;
  wire wr_677;
  wire wr_678;
  wire wr_679;
  wire wr_680;
  wire wr_681;
  wire wr_682;
  wire wr_683;
  wire wr_684;
  wire wr_685;
  wire wr_686;
  wire wr_687;
  wire wr_688;
  wire wr_689;
  wire wr_690;
  wire wr_691;
  wire wr_692;
  wire wr_693;
  wire wr_694;
  wire wr_695;
  wire wr_696;
  wire wr_697;
  wire wr_698;
  wire wr_699;
  wire wr_700;

  not    g1( wr_88   ,           DATA_IN_0_);
  not    g2( wr_94   ,           DATA_IN_1_);
  not    g3( wr_393  ,           REG4_REG_1__SCAN_IN);
  not    g4( wr_397  ,           REG4_REG_0__SCAN_IN);
  nor    g5( wr_534  , REG4_REG_1__SCAN_IN, DATA_IN_1_);
  not    g6( wr_89   ,           RMAX_REG_1__SCAN_IN);
  not    g7( wr_104  ,           DATA_IN_3_);
  not    g8( wr_385  ,           REG4_REG_3__SCAN_IN);
  nor    g9( wr_409  , REG4_REG_2__SCAN_IN, DATA_IN_2_);
  not   g10( wr_86   ,           DATA_IN_2_);
  not   g11( wr_389  ,           REG4_REG_2__SCAN_IN);
  not   g12( wr_168  ,           RMIN_REG_0__SCAN_IN);
  nor   g13( wr_407  , REG4_REG_3__SCAN_IN, DATA_IN_3_);
  not   g14( wr_172  ,           RMIN_REG_1__SCAN_IN);
  not   g15( wr_82   ,           DATA_IN_4_);
  not   g16( wr_99   ,           RMAX_REG_2__SCAN_IN);
  not   g17( wr_381  ,           REG4_REG_4__SCAN_IN);
  nor   g18( wr_405  , REG4_REG_4__SCAN_IN, DATA_IN_4_);
  not   g19( wr_165  ,           RMIN_REG_2__SCAN_IN);
  not   g20( wr_84   ,           RMAX_REG_3__SCAN_IN);
  not   g21( wr_114  ,           DATA_IN_5_);
  not   g22( wr_377  ,           REG4_REG_5__SCAN_IN);
  nor   g23( wr_491  , REG4_REG_5__SCAN_IN, DATA_IN_5_);
  not   g24( wr_78   ,           DATA_IN_6_);
  not   g25( wr_181  ,           RMIN_REG_3__SCAN_IN);
  not   g26( wr_109  ,           RMAX_REG_4__SCAN_IN);
  not   g27( wr_75   ,           DATA_IN_7_);
  not   g28( wr_162  ,           RMIN_REG_4__SCAN_IN);
  not   g29( wr_369  ,           REG4_REG_7__SCAN_IN);
  nor   g30( wr_531  , REG4_REG_7__SCAN_IN, DATA_IN_7_);
  not   g31( wr_80   ,           RMAX_REG_5__SCAN_IN);
  not   g32( wr_373  ,           REG4_REG_6__SCAN_IN);
  not   g33( wr_530  ,           ENABLE  );
  not   g34( wr_190  ,           RMIN_REG_5__SCAN_IN);
  not   g35( wr_76   ,           STATO_REG_1__SCAN_IN);
  not   g36( wr_119  ,           RMAX_REG_6__SCAN_IN);
  not   g37( wr_159  ,           RMIN_REG_6__SCAN_IN);
  not   g38( wr_270  ,           STATO_REG_0__SCAN_IN);
  not   g39( wr_564  ,           AVERAGE );
  not   g40( wr_124  ,           RMAX_REG_7__SCAN_IN);
  not   g41( wr_157  ,           RMIN_REG_7__SCAN_IN);
  not   g42( wr_596  ,           DATA_OUT_REG_5__SCAN_IN);
  not   g43( wr_620  ,           DATA_OUT_REG_4__SCAN_IN);
  not   g44( wr_232  ,           RLAST_REG_7__SCAN_IN);
  not   g45( wr_240  ,           RLAST_REG_6__SCAN_IN);
  not   g46( wr_256  ,           RLAST_REG_2__SCAN_IN);
  not   g47( wr_260  ,           RLAST_REG_1__SCAN_IN);
  not   g48( wr_264  ,           RLAST_REG_0__SCAN_IN);
  not   g49( wr_658  ,           DATA_OUT_REG_2__SCAN_IN);
  not   g50( wr_676  ,           DATA_OUT_REG_1__SCAN_IN);
  not   g51( wr_693  ,           DATA_OUT_REG_0__SCAN_IN);
  nor   g52( wr_233  , STATO_REG_0__SCAN_IN, ENABLE  );
  not   g53( wr_244  ,           RLAST_REG_5__SCAN_IN);
  not   g54( wr_248  ,           RLAST_REG_4__SCAN_IN);
  not   g55( wr_252  ,           RLAST_REG_3__SCAN_IN);
  not   g56( wr_562  ,           DATA_OUT_REG_7__SCAN_IN);
  not   g57( wr_585  ,           DATA_OUT_REG_6__SCAN_IN);
  not   g58( wr_648  ,           DATA_OUT_REG_3__SCAN_IN);
  nor   g59( STATO_REG_0__SCAN_OUT, STATO_REG_1__SCAN_IN, STATO_REG_0__SCAN_IN);
  not   g60( wr_154  ,           RMAX_REG_0__SCAN_IN);
  not   g61( wr_268  ,           REG1_REG_7__SCAN_IN);
  not   g62( wr_277  ,           REG1_REG_6__SCAN_IN);
  not   g63( wr_281  ,           REG1_REG_5__SCAN_IN);
  not   g64( wr_285  ,           REG1_REG_4__SCAN_IN);
  not   g65( wr_289  ,           REG1_REG_3__SCAN_IN);
  not   g66( wr_293  ,           REG1_REG_2__SCAN_IN);
  not   g67( wr_297  ,           REG1_REG_1__SCAN_IN);
  not   g68( wr_301  ,           REG1_REG_0__SCAN_IN);
  not   g69( wr_305  ,           REG2_REG_7__SCAN_IN);
  not   g70( wr_309  ,           REG2_REG_6__SCAN_IN);
  not   g71( wr_313  ,           REG2_REG_5__SCAN_IN);
  not   g72( wr_317  ,           REG2_REG_4__SCAN_IN);
  not   g73( wr_321  ,           REG2_REG_3__SCAN_IN);
  not   g74( wr_325  ,           REG2_REG_2__SCAN_IN);
  not   g75( wr_329  ,           REG2_REG_1__SCAN_IN);
  not   g76( wr_333  ,           REG2_REG_0__SCAN_IN);
  not   g77( wr_337  ,           REG3_REG_7__SCAN_IN);
  not   g78( wr_341  ,           REG3_REG_6__SCAN_IN);
  not   g79( wr_345  ,           REG3_REG_5__SCAN_IN);
  not   g80( wr_349  ,           REG3_REG_4__SCAN_IN);
  not   g81( wr_353  ,           REG3_REG_3__SCAN_IN);
  not   g82( wr_357  ,           REG3_REG_2__SCAN_IN);
  not   g83( wr_361  ,           REG3_REG_1__SCAN_IN);
  not   g84( wr_365  ,           REG3_REG_0__SCAN_IN);
  not   g85( DATA_OUT_7_,           DATA_OUT_REG_7__SCAN_IN);
  not   g86( DATA_OUT_6_,           DATA_OUT_REG_6__SCAN_IN);
  not   g87( DATA_OUT_5_,           DATA_OUT_REG_5__SCAN_IN);
  not   g88( DATA_OUT_4_,           DATA_OUT_REG_4__SCAN_IN);
  not   g89( DATA_OUT_3_,           DATA_OUT_REG_3__SCAN_IN);
  not   g90( DATA_OUT_2_,           DATA_OUT_REG_2__SCAN_IN);
  not   g91( DATA_OUT_1_,           DATA_OUT_REG_1__SCAN_IN);
  not   g92( DATA_OUT_0_,           DATA_OUT_REG_0__SCAN_IN);
  nor   g93( wr_410  , wr_397  , wr_88   );
  nor   g94( wr_532  , wr_393  , wr_94   );
  nor   g95( wr_90   , wr_89   , DATA_IN_1_);
  nor   g96( wr_406  , wr_385  , wr_104  );
  nor   g97( wr_408  , wr_389  , wr_86   );
  nor   g98( wr_95   , RMAX_REG_1__SCAN_IN, wr_94   );
  nor   g99( wr_169  , wr_168  , DATA_IN_0_);
  nor  g100( wr_167  , RMIN_REG_1__SCAN_IN, wr_94   );
  nor  g101( wr_454  , REG4_REG_2__SCAN_IN, wr_86   );
  nor  g102( wr_87   , RMAX_REG_2__SCAN_IN, wr_86   );
  nor  g103( wr_173  , wr_172  , DATA_IN_1_);
  nor  g104( wr_455  , wr_389  , DATA_IN_2_);
  nor  g105( wr_463  , REG4_REG_1__SCAN_IN, wr_94   );
  nor  g106( wr_100  , wr_99   , DATA_IN_2_);
  nor  g107( wr_404  , wr_381  , wr_82   );
  nor  g108( wr_166  , wr_165  , DATA_IN_2_);
  nor  g109( wr_85   , wr_84   , DATA_IN_3_);
  nor  g110( wr_177  , RMIN_REG_2__SCAN_IN, wr_86   );
  nor  g111( wr_430  , REG4_REG_3__SCAN_IN, wr_104  );
  nor  g112( wr_440  , REG4_REG_4__SCAN_IN, wr_82   );
  nor  g113( wr_489  , wr_377  , wr_114  );
  nor  g114( wr_105  , RMAX_REG_3__SCAN_IN, wr_104  );
  nor  g115( wr_431  , wr_385  , DATA_IN_3_);
  nor  g116( wr_441  , wr_381  , DATA_IN_4_);
  nor  g117( wr_449  , REG4_REG_0__SCAN_IN, wr_88   );
  nor  g118( wr_450  , wr_397  , DATA_IN_0_);
  nor  g119( wr_164  , RMIN_REG_3__SCAN_IN, wr_104  );
  nor  g120( wr_83   , RMAX_REG_4__SCAN_IN, wr_82   );
  nor  g121( wr_182  , wr_181  , DATA_IN_3_);
  nor  g122( wr_110  , wr_109  , DATA_IN_4_);
  nor  g123( wr_401  , REG4_REG_5__SCAN_IN, wr_114  );
  nor  g124( wr_163  , wr_162  , DATA_IN_4_);
  nor  g125( wr_402  , wr_377  , DATA_IN_5_);
  nor  g126( wr_553  , wr_369  , wr_75   );
  nor  g127( wr_81   , wr_80   , DATA_IN_5_);
  nor  g128( wr_186  , RMIN_REG_4__SCAN_IN, wr_82   );
  nor  g129( wr_486  , REG4_REG_6__SCAN_IN, wr_78   );
  nor  g130( wr_487  , wr_373  , DATA_IN_6_);
  nor  g131( wr_115  , RMAX_REG_5__SCAN_IN, wr_114  );
  nor  g132( wr_161  , RMIN_REG_5__SCAN_IN, wr_114  );
  nor  g133( wr_79   , RMAX_REG_6__SCAN_IN, wr_78   );
  nor  g134( wr_191  , wr_190  , DATA_IN_5_);
  nor  g135( wr_120  , wr_119  , DATA_IN_6_);
  nor  g136( wr_528  , wr_76   , STATO_REG_0__SCAN_IN);
  nor  g137( wr_160  , wr_159  , DATA_IN_6_);
  nor  g138( wr_269  , wr_76   , STATO_REG_0__SCAN_IN);
  nor  g139( wr_271  , STATO_REG_1__SCAN_IN, wr_270  );
  nor  g140( wr_77   , RMAX_REG_7__SCAN_IN, wr_75   );
  nor  g141( wr_195  , RMIN_REG_6__SCAN_IN, wr_78   );
  nor  g142( wr_125  , wr_124  , DATA_IN_7_);
  nor  g143( wr_158  , wr_157  , DATA_IN_7_);
  nor  g144( wr_199  , RMIN_REG_7__SCAN_IN, wr_75   );
  nor  g145( wr_236  , wr_233  , wr_76   );
  nor  g146( wr_234  , wr_233  , STATO_REG_0__SCAN_OUT);
  nor  g147( wr_533  , wr_532  , wr_410  );
  nor  g148( wr_91   , wr_90   , wr_88   );
  not  g149( wr_411  ,           wr_410  );
  nor  g150( wr_413  , wr_410  , DATA_IN_1_);
  nor  g151( wr_467  , wr_410  , wr_393  );
  not  g152( wr_170  ,           wr_169  );
  nor  g153( wr_456  , wr_455  , wr_454  );
  not  g154( wr_464  ,           wr_463  );
  nor  g155( wr_432  , wr_431  , wr_430  );
  nor  g156( wr_442  , wr_441  , wr_440  );
  nor  g157( wr_451  , wr_450  , wr_449  );
  nor  g158( wr_403  , wr_402  , wr_401  );
  nor  g159( wr_488  , wr_487  , wr_486  );
  not  g160( wr_529  ,           wr_528  );
  nor  g161( wr_272  , wr_271  , wr_269  );
  not  g162( wr_237  ,           wr_236  );
  not  g163( wr_274  ,           wr_269  );
  nor  g164( wr_235  , wr_234  , wr_232  );
  nor  g165( wr_241  , wr_234  , wr_240  );
  nor  g166( wr_245  , wr_234  , wr_244  );
  nor  g167( wr_249  , wr_234  , wr_248  );
  nor  g168( wr_253  , wr_234  , wr_252  );
  nor  g169( wr_257  , wr_234  , wr_256  );
  nor  g170( wr_261  , wr_234  , wr_260  );
  nor  g171( wr_265  , wr_234  , wr_264  );
  nor  g172( wr_535  , wr_534  , wr_533  );
  not  g173( wr_92   ,           wr_91   );
  nor  g174( wr_412  , wr_411  , wr_94   );
  nor  g175( wr_414  , wr_413  , wr_393  );
  nor  g176( wr_466  , wr_411  , REG4_REG_1__SCAN_IN);
  nor  g177( wr_171  , wr_170  , wr_167  );
  nor  g178( wr_465  , wr_464  , wr_410  );
  not  g179( wr_452  ,           wr_451  );
  not  g180( wr_496  ,           wr_488  );
  nor  g181( wr_565  , wr_529  , wr_564  );
  not  g182( STATO_REG_1__SCAN_OUT,           wr_272  );
  nor  g183( wr_570  , wr_529  , ENABLE  );
  nor  g184( wr_238  , wr_237  , wr_75   );
  nor  g185( wr_242  , wr_237  , wr_78   );
  nor  g186( wr_246  , wr_237  , wr_114  );
  nor  g187( wr_250  , wr_237  , wr_82   );
  nor  g188( wr_254  , wr_237  , wr_104  );
  nor  g189( wr_258  , wr_237  , wr_86   );
  nor  g190( wr_262  , wr_237  , wr_94   );
  nor  g191( wr_266  , wr_237  , wr_88   );
  nor  g192( wr_275  , wr_274  , wr_75   );
  nor  g193( wr_279  , wr_274  , wr_78   );
  nor  g194( wr_283  , wr_274  , wr_114  );
  nor  g195( wr_287  , wr_274  , wr_82   );
  nor  g196( wr_291  , wr_274  , wr_104  );
  nor  g197( wr_295  , wr_274  , wr_86   );
  nor  g198( wr_299  , wr_274  , wr_94   );
  nor  g199( wr_303  , wr_274  , wr_88   );
  nor  g200( wr_307  , wr_274  , wr_268  );
  nor  g201( wr_311  , wr_274  , wr_277  );
  nor  g202( wr_315  , wr_274  , wr_281  );
  nor  g203( wr_319  , wr_274  , wr_285  );
  nor  g204( wr_323  , wr_274  , wr_289  );
  nor  g205( wr_327  , wr_274  , wr_293  );
  nor  g206( wr_331  , wr_274  , wr_297  );
  nor  g207( wr_335  , wr_274  , wr_301  );
  nor  g208( wr_339  , wr_274  , wr_305  );
  nor  g209( wr_343  , wr_274  , wr_309  );
  nor  g210( wr_347  , wr_274  , wr_313  );
  nor  g211( wr_351  , wr_274  , wr_317  );
  nor  g212( wr_355  , wr_274  , wr_321  );
  nor  g213( wr_359  , wr_274  , wr_325  );
  nor  g214( wr_363  , wr_274  , wr_329  );
  nor  g215( wr_367  , wr_274  , wr_333  );
  nor  g216( wr_371  , wr_274  , wr_337  );
  nor  g217( wr_375  , wr_274  , wr_341  );
  nor  g218( wr_379  , wr_274  , wr_345  );
  nor  g219( wr_383  , wr_274  , wr_349  );
  nor  g220( wr_387  , wr_274  , wr_353  );
  nor  g221( wr_391  , wr_274  , wr_357  );
  nor  g222( wr_395  , wr_274  , wr_361  );
  nor  g223( wr_399  , wr_274  , wr_365  );
  not  g224( wr_536  ,           wr_535  );
  nor  g225( wr_93   , wr_92   , RMAX_REG_0__SCAN_IN);
  nor  g226( wr_415  , wr_414  , wr_412  );
  nor  g227( wr_468  , wr_467  , wr_466  );
  not  g228( wr_470  ,           wr_412  );
  nor  g229( wr_174  , wr_173  , wr_171  );
  nor  g230( wr_497  , wr_489  , wr_496  );
  not  g231( wr_566  ,           wr_565  );
  nor  g232( wr_597  , STATO_REG_1__SCAN_OUT, wr_596  );
  nor  g233( wr_621  , STATO_REG_1__SCAN_OUT, wr_620  );
  not  g234( wr_571  ,           wr_570  );
  nor  g235( wr_659  , STATO_REG_1__SCAN_OUT, wr_658  );
  nor  g236( wr_677  , STATO_REG_1__SCAN_OUT, wr_676  );
  nor  g237( wr_694  , STATO_REG_1__SCAN_OUT, wr_693  );
  nor  g238( wr_563  , STATO_REG_1__SCAN_OUT, wr_562  );
  nor  g239( wr_586  , STATO_REG_1__SCAN_OUT, wr_585  );
  nor  g240( wr_649  , STATO_REG_1__SCAN_OUT, wr_648  );
  nor  g241( wr_273  , STATO_REG_1__SCAN_OUT, wr_268  );
  nor  g242( wr_278  , STATO_REG_1__SCAN_OUT, wr_277  );
  nor  g243( wr_282  , STATO_REG_1__SCAN_OUT, wr_281  );
  nor  g244( wr_286  , STATO_REG_1__SCAN_OUT, wr_285  );
  nor  g245( wr_290  , STATO_REG_1__SCAN_OUT, wr_289  );
  nor  g246( wr_294  , STATO_REG_1__SCAN_OUT, wr_293  );
  nor  g247( wr_298  , STATO_REG_1__SCAN_OUT, wr_297  );
  nor  g248( wr_302  , STATO_REG_1__SCAN_OUT, wr_301  );
  nor  g249( wr_306  , STATO_REG_1__SCAN_OUT, wr_305  );
  nor  g250( wr_310  , STATO_REG_1__SCAN_OUT, wr_309  );
  nor  g251( wr_314  , STATO_REG_1__SCAN_OUT, wr_313  );
  nor  g252( wr_318  , STATO_REG_1__SCAN_OUT, wr_317  );
  nor  g253( wr_322  , STATO_REG_1__SCAN_OUT, wr_321  );
  nor  g254( wr_326  , STATO_REG_1__SCAN_OUT, wr_325  );
  nor  g255( wr_330  , STATO_REG_1__SCAN_OUT, wr_329  );
  nor  g256( wr_334  , STATO_REG_1__SCAN_OUT, wr_333  );
  nor  g257( wr_338  , STATO_REG_1__SCAN_OUT, wr_337  );
  nor  g258( wr_342  , STATO_REG_1__SCAN_OUT, wr_341  );
  nor  g259( wr_346  , STATO_REG_1__SCAN_OUT, wr_345  );
  nor  g260( wr_350  , STATO_REG_1__SCAN_OUT, wr_349  );
  nor  g261( wr_354  , STATO_REG_1__SCAN_OUT, wr_353  );
  nor  g262( wr_358  , STATO_REG_1__SCAN_OUT, wr_357  );
  nor  g263( wr_362  , STATO_REG_1__SCAN_OUT, wr_361  );
  nor  g264( wr_366  , STATO_REG_1__SCAN_OUT, wr_365  );
  nor  g265( wr_370  , STATO_REG_1__SCAN_OUT, wr_369  );
  nor  g266( wr_374  , STATO_REG_1__SCAN_OUT, wr_373  );
  nor  g267( wr_378  , STATO_REG_1__SCAN_OUT, wr_377  );
  nor  g268( wr_382  , STATO_REG_1__SCAN_OUT, wr_381  );
  nor  g269( wr_386  , STATO_REG_1__SCAN_OUT, wr_385  );
  nor  g270( wr_390  , STATO_REG_1__SCAN_OUT, wr_389  );
  nor  g271( wr_394  , STATO_REG_1__SCAN_OUT, wr_393  );
  nor  g272( wr_398  , STATO_REG_1__SCAN_OUT, wr_397  );
  nor  g273( wr_239  , wr_238  , wr_235  );
  nor  g274( wr_243  , wr_242  , wr_241  );
  nor  g275( wr_247  , wr_246  , wr_245  );
  nor  g276( wr_251  , wr_250  , wr_249  );
  nor  g277( wr_255  , wr_254  , wr_253  );
  nor  g278( wr_259  , wr_258  , wr_257  );
  nor  g279( wr_263  , wr_262  , wr_261  );
  nor  g280( wr_267  , wr_266  , wr_265  );
  nor  g281( wr_537  , wr_536  , wr_409  );
  nor  g282( wr_96   , wr_95   , wr_93   );
  nor  g283( wr_416  , wr_415  , wr_409  );
  nor  g284( wr_458  , wr_454  , wr_415  );
  nor  g285( wr_469  , wr_468  , DATA_IN_1_);
  nor  g286( wr_471  , wr_470  , wr_393  );
  not  g287( wr_453  ,           wr_415  );
  not  g288( wr_175  ,           wr_174  );
  not  g289( wr_498  ,           wr_497  );
  nor  g290( wr_567  , wr_566  , wr_530  );
  nor  g291( wr_572  , wr_571  , wr_232  );
  nor  g292( wr_588  , wr_571  , wr_240  );
  nor  g293( wr_655  , wr_571  , wr_256  );
  nor  g294( wr_673  , wr_571  , wr_260  );
  nor  g295( wr_690  , wr_571  , wr_264  );
  nor  g296( wr_594  , wr_571  , wr_244  );
  nor  g297( wr_618  , wr_571  , wr_248  );
  nor  g298( wr_636  , wr_571  , wr_252  );
  nor  g299( wr_276  , wr_275  , wr_273  );
  nor  g300( wr_280  , wr_279  , wr_278  );
  nor  g301( wr_284  , wr_283  , wr_282  );
  nor  g302( wr_288  , wr_287  , wr_286  );
  nor  g303( wr_292  , wr_291  , wr_290  );
  nor  g304( wr_296  , wr_295  , wr_294  );
  nor  g305( wr_300  , wr_299  , wr_298  );
  nor  g306( wr_304  , wr_303  , wr_302  );
  nor  g307( wr_308  , wr_307  , wr_306  );
  nor  g308( wr_312  , wr_311  , wr_310  );
  nor  g309( wr_316  , wr_315  , wr_314  );
  nor  g310( wr_320  , wr_319  , wr_318  );
  nor  g311( wr_324  , wr_323  , wr_322  );
  nor  g312( wr_328  , wr_327  , wr_326  );
  nor  g313( wr_332  , wr_331  , wr_330  );
  nor  g314( wr_336  , wr_335  , wr_334  );
  nor  g315( wr_340  , wr_339  , wr_338  );
  nor  g316( wr_344  , wr_343  , wr_342  );
  nor  g317( wr_348  , wr_347  , wr_346  );
  nor  g318( wr_352  , wr_351  , wr_350  );
  nor  g319( wr_356  , wr_355  , wr_354  );
  nor  g320( wr_360  , wr_359  , wr_358  );
  nor  g321( wr_364  , wr_363  , wr_362  );
  nor  g322( wr_368  , wr_367  , wr_366  );
  nor  g323( wr_372  , wr_371  , wr_370  );
  nor  g324( wr_376  , wr_375  , wr_374  );
  nor  g325( wr_380  , wr_379  , wr_378  );
  nor  g326( wr_384  , wr_383  , wr_382  );
  nor  g327( wr_388  , wr_387  , wr_386  );
  nor  g328( wr_392  , wr_391  , wr_390  );
  nor  g329( wr_396  , wr_395  , wr_394  );
  nor  g330( wr_400  , wr_399  , wr_398  );
  not  g331( RLAST_REG_7__SCAN_OUT,           wr_239  );
  not  g332( RLAST_REG_6__SCAN_OUT,           wr_243  );
  not  g333( RLAST_REG_5__SCAN_OUT,           wr_247  );
  not  g334( RLAST_REG_4__SCAN_OUT,           wr_251  );
  not  g335( RLAST_REG_3__SCAN_OUT,           wr_255  );
  not  g336( RLAST_REG_2__SCAN_OUT,           wr_259  );
  not  g337( RLAST_REG_1__SCAN_OUT,           wr_263  );
  not  g338( RLAST_REG_0__SCAN_OUT,           wr_267  );
  nor  g339( wr_538  , wr_537  , wr_406  );
  not  g340( wr_97   ,           wr_96   );
  nor  g341( wr_417  , wr_416  , wr_408  );
  not  g342( wr_459  ,           wr_458  );
  nor  g343( wr_472  , wr_471  , wr_469  );
  nor  g344( wr_457  , wr_456  , wr_453  );
  nor  g345( wr_176  , wr_175  , wr_166  );
  not  g346( wr_568  ,           wr_567  );
  not  g347( REG1_REG_7__SCAN_OUT,           wr_276  );
  not  g348( REG1_REG_6__SCAN_OUT,           wr_280  );
  not  g349( REG1_REG_5__SCAN_OUT,           wr_284  );
  not  g350( REG1_REG_4__SCAN_OUT,           wr_288  );
  not  g351( REG1_REG_3__SCAN_OUT,           wr_292  );
  not  g352( REG1_REG_2__SCAN_OUT,           wr_296  );
  not  g353( REG1_REG_1__SCAN_OUT,           wr_300  );
  not  g354( REG1_REG_0__SCAN_OUT,           wr_304  );
  not  g355( REG2_REG_7__SCAN_OUT,           wr_308  );
  not  g356( REG2_REG_6__SCAN_OUT,           wr_312  );
  not  g357( REG2_REG_5__SCAN_OUT,           wr_316  );
  not  g358( REG2_REG_4__SCAN_OUT,           wr_320  );
  not  g359( REG2_REG_3__SCAN_OUT,           wr_324  );
  not  g360( REG2_REG_2__SCAN_OUT,           wr_328  );
  not  g361( REG2_REG_1__SCAN_OUT,           wr_332  );
  not  g362( REG2_REG_0__SCAN_OUT,           wr_336  );
  not  g363( REG3_REG_7__SCAN_OUT,           wr_340  );
  not  g364( REG3_REG_6__SCAN_OUT,           wr_344  );
  not  g365( REG3_REG_5__SCAN_OUT,           wr_348  );
  not  g366( REG3_REG_4__SCAN_OUT,           wr_352  );
  not  g367( REG3_REG_3__SCAN_OUT,           wr_356  );
  not  g368( REG3_REG_2__SCAN_OUT,           wr_360  );
  not  g369( REG3_REG_1__SCAN_OUT,           wr_364  );
  not  g370( REG3_REG_0__SCAN_OUT,           wr_368  );
  not  g371( REG4_REG_7__SCAN_OUT,           wr_372  );
  not  g372( REG4_REG_6__SCAN_OUT,           wr_376  );
  not  g373( REG4_REG_5__SCAN_OUT,           wr_380  );
  not  g374( REG4_REG_4__SCAN_OUT,           wr_384  );
  not  g375( REG4_REG_3__SCAN_OUT,           wr_388  );
  not  g376( REG4_REG_2__SCAN_OUT,           wr_392  );
  not  g377( REG4_REG_1__SCAN_OUT,           wr_396  );
  not  g378( REG4_REG_0__SCAN_OUT,           wr_400  );
  not  g379( wr_539  ,           wr_538  );
  nor  g380( wr_98   , wr_97   , wr_87   );
  nor  g381( wr_418  , wr_417  , wr_407  );
  nor  g382( wr_460  , wr_459  , wr_455  );
  not  g383( wr_473  ,           wr_472  );
  nor  g384( wr_178  , wr_177  , wr_176  );
  nor  g385( wr_434  , wr_430  , wr_417  );
  not  g386( wr_429  ,           wr_417  );
  nor  g387( wr_569  , wr_568  , wr_369  );
  nor  g388( wr_587  , wr_568  , wr_373  );
  nor  g389( wr_595  , wr_568  , wr_377  );
  nor  g390( wr_619  , wr_568  , wr_381  );
  nor  g391( wr_638  , wr_568  , wr_385  );
  nor  g392( wr_654  , wr_568  , wr_389  );
  nor  g393( wr_672  , wr_568  , wr_393  );
  nor  g394( wr_689  , wr_568  , wr_397  );
  nor  g395( wr_540  , wr_539  , wr_408  );
  nor  g396( wr_101  , wr_100  , wr_98   );
  nor  g397( wr_419  , wr_418  , wr_406  );
  nor  g398( wr_461  , wr_460  , wr_457  );
  nor  g399( wr_474  , wr_473  , wr_465  );
  not  g400( wr_179  ,           wr_178  );
  not  g401( wr_435  ,           wr_434  );
  nor  g402( wr_433  , wr_432  , wr_429  );
  nor  g403( wr_573  , wr_572  , wr_569  );
  nor  g404( wr_589  , wr_588  , wr_587  );
  nor  g405( wr_656  , wr_655  , wr_654  );
  nor  g406( wr_674  , wr_673  , wr_672  );
  nor  g407( wr_691  , wr_690  , wr_689  );
  nor  g408( wr_541  , wr_540  , wr_407  );
  not  g409( wr_102  ,           wr_101  );
  nor  g410( wr_444  , wr_440  , wr_419  );
  not  g411( wr_462  ,           wr_461  );
  not  g412( wr_475  ,           wr_474  );
  not  g413( wr_439  ,           wr_419  );
  nor  g414( wr_180  , wr_179  , wr_164  );
  nor  g415( wr_420  , wr_419  , wr_405  );
  nor  g416( wr_436  , wr_435  , wr_431  );
  nor  g417( wr_509  , wr_474  , wr_452  );
  not  g418( wr_574  ,           wr_573  );
  not  g419( wr_590  ,           wr_589  );
  not  g420( wr_657  ,           wr_656  );
  not  g421( wr_675  ,           wr_674  );
  not  g422( wr_692  ,           wr_691  );
  not  g423( wr_542  ,           wr_541  );
  nor  g424( wr_103  , wr_102  , wr_85   );
  not  g425( wr_445  ,           wr_444  );
  nor  g426( wr_476  , wr_475  , wr_462  );
  nor  g427( wr_443  , wr_442  , wr_439  );
  nor  g428( wr_183  , wr_182  , wr_180  );
  nor  g429( wr_421  , wr_420  , wr_404  );
  nor  g430( wr_437  , wr_436  , wr_433  );
  nor  g431( wr_514  , wr_475  , wr_452  );
  nor  g432( wr_508  , wr_475  , wr_451  );
  nor  g433( wr_575  , wr_574  , wr_563  );
  nor  g434( wr_591  , wr_590  , wr_586  );
  nor  g435( wr_543  , wr_542  , wr_405  );
  nor  g436( wr_106  , wr_105  , wr_103  );
  nor  g437( wr_446  , wr_445  , wr_441  );
  not  g438( wr_477  ,           wr_476  );
  not  g439( wr_184  ,           wr_183  );
  nor  g440( wr_424  , wr_421  , wr_401  );
  not  g441( wr_438  ,           wr_437  );
  not  g442( wr_422  ,           wr_421  );
  nor  g443( wr_515  , wr_514  , wr_461  );
  nor  g444( wr_510  , wr_509  , wr_508  );
  nor  g445( wr_495  , wr_491  , wr_421  );
  not  g446( wr_576  ,           wr_575  );
  not  g447( wr_592  ,           wr_591  );
  nor  g448( wr_544  , wr_543  , wr_404  );
  not  g449( wr_107  ,           wr_106  );
  nor  g450( wr_447  , wr_446  , wr_443  );
  nor  g451( wr_478  , wr_477  , wr_452  );
  nor  g452( wr_185  , wr_184  , wr_163  );
  not  g453( wr_425  ,           wr_424  );
  nor  g454( wr_423  , wr_422  , wr_403  );
  nor  g455( wr_490  , wr_489  , wr_422  );
  not  g456( wr_511  ,           wr_510  );
  nor  g457( wr_499  , wr_498  , wr_495  );
  nor  g458( wr_545  , wr_544  , wr_491  );
  nor  g459( wr_108  , wr_107  , wr_83   );
  not  g460( wr_448  ,           wr_447  );
  not  g461( wr_479  ,           wr_478  );
  nor  g462( wr_512  , wr_478  , wr_437  );
  nor  g463( wr_187  , wr_186  , wr_185  );
  nor  g464( wr_426  , wr_425  , wr_402  );
  nor  g465( wr_516  , wr_515  , wr_478  );
  nor  g466( wr_492  , wr_491  , wr_490  );
  nor  g467( wr_546  , wr_545  , wr_489  );
  nor  g468( wr_111  , wr_110  , wr_108  );
  nor  g469( wr_480  , wr_479  , wr_448  );
  nor  g470( wr_503  , wr_479  , wr_438  );
  not  g471( wr_188  ,           wr_187  );
  nor  g472( wr_427  , wr_426  , wr_423  );
  not  g473( wr_493  ,           wr_492  );
  nor  g474( wr_661  , wr_516  , wr_511  );
  not  g475( wr_679  ,           wr_516  );
  nor  g476( wr_678  , wr_516  , wr_510  );
  not  g477( wr_547  ,           wr_546  );
  nor  g478( wr_549  , wr_546  , wr_78   );
  not  g479( wr_112  ,           wr_111  );
  not  g480( wr_481  ,           wr_480  );
  nor  g481( wr_513  , wr_512  , wr_503  );
  nor  g482( wr_189  , wr_188  , wr_161  );
  not  g483( wr_428  ,           wr_427  );
  nor  g484( wr_494  , wr_493  , wr_488  );
  nor  g485( wr_504  , wr_503  , wr_447  );
  nor  g486( wr_680  , wr_679  , wr_511  );
  nor  g487( wr_548  , wr_547  , DATA_IN_6_);
  nor  g488( wr_550  , wr_549  , REG4_REG_6__SCAN_IN);
  nor  g489( wr_113  , wr_112  , wr_81   );
  nor  g490( wr_482  , wr_481  , wr_438  );
  nor  g491( wr_517  , wr_516  , wr_513  );
  nor  g492( wr_192  , wr_191  , wr_189  );
  nor  g493( wr_500  , wr_499  , wr_494  );
  not  g494( wr_660  ,           wr_513  );
  nor  g495( wr_681  , wr_680  , wr_678  );
  nor  g496( wr_551  , wr_550  , wr_548  );
  nor  g497( wr_116  , wr_115  , wr_113  );
  not  g498( wr_483  ,           wr_482  );
  not  g499( wr_518  ,           wr_517  );
  nor  g500( wr_506  , wr_482  , wr_427  );
  not  g501( wr_193  ,           wr_192  );
  nor  g502( wr_505  , wr_504  , wr_482  );
  not  g503( wr_524  ,           wr_500  );
  nor  g504( wr_662  , wr_661  , wr_660  );
  nor  g505( wr_552  , wr_551  , wr_531  );
  not  g506( wr_117  ,           wr_116  );
  nor  g507( wr_484  , wr_483  , wr_428  );
  nor  g508( wr_519  , wr_518  , wr_511  );
  nor  g509( wr_194  , wr_193  , wr_160  );
  not  g510( wr_643  ,           wr_505  );
  nor  g511( wr_554  , wr_553  , wr_552  );
  nor  g512( wr_118  , wr_117  , wr_79   );
  nor  g513( wr_507  , wr_506  , wr_484  );
  not  g514( wr_520  ,           wr_519  );
  nor  g515( wr_196  , wr_195  , wr_194  );
  not  g516( wr_485  ,           wr_484  );
  nor  g517( wr_525  , wr_524  , wr_484  );
  nor  g518( wr_663  , wr_662  , wr_519  );
  nor  g519( wr_644  , wr_519  , wr_643  );
  not  g520( wr_598  ,           wr_554  );
  nor  g521( wr_555  , wr_554  , AVERAGE );
  nor  g522( wr_121  , wr_120  , wr_118  );
  nor  g523( wr_521  , wr_520  , wr_507  );
  not  g524( wr_197  ,           wr_196  );
  nor  g525( wr_501  , wr_500  , wr_485  );
  nor  g526( wr_630  , wr_520  , wr_505  );
  not  g527( wr_664  ,           wr_663  );
  not  g528( wr_629  ,           wr_507  );
  nor  g529( wr_599  , wr_598  , wr_530  );
  not  g530( wr_556  ,           wr_555  );
  not  g531( wr_122  ,           wr_121  );
  not  g532( wr_522  ,           wr_521  );
  nor  g533( wr_198  , wr_197  , wr_158  );
  nor  g534( wr_579  , wr_525  , wr_501  );
  nor  g535( wr_645  , wr_644  , wr_630  );
  not  g536( wr_502  ,           wr_501  );
  nor  g537( wr_631  , wr_630  , wr_629  );
  not  g538( wr_600  ,           wr_599  );
  nor  g539( wr_557  , wr_556  , wr_530  );
  nor  g540( wr_123  , wr_122  , wr_77   );
  nor  g541( wr_523  , wr_522  , wr_505  );
  nor  g542( wr_200  , wr_199  , wr_198  );
  not  g543( wr_612  ,           wr_579  );
  not  g544( wr_646  ,           wr_645  );
  nor  g545( wr_601  , wr_600  , AVERAGE );
  not  g546( wr_558  ,           wr_557  );
  nor  g547( wr_126  , wr_125  , wr_123  );
  not  g548( wr_578  ,           wr_523  );
  nor  g549( wr_613  , wr_612  , wr_523  );
  nor  g550( wr_526  , wr_523  , wr_502  );
  nor  g551( wr_632  , wr_631  , wr_523  );
  not  g552( wr_602  ,           wr_601  );
  nor  g553( wr_559  , wr_558  , wr_529  );
  not  g554( wr_130  ,           wr_126  );
  nor  g555( wr_580  , wr_579  , wr_578  );
  nor  g556( wr_127  , wr_126  , wr_76   );
  not  g557( wr_527  ,           wr_526  );
  not  g558( wr_633  ,           wr_632  );
  nor  g559( wr_603  , wr_602  , wr_529  );
  not  g560( wr_560  ,           wr_559  );
  nor  g561( wr_205  , wr_130  , wr_76   );
  nor  g562( wr_201  , wr_200  , wr_130  );
  not  g563( wr_581  ,           wr_580  );
  nor  g564( wr_131  , wr_130  , STATO_REG_0__SCAN_IN);
  nor  g565( wr_614  , wr_613  , wr_580  );
  nor  g566( wr_128  , wr_127  , STATO_REG_0__SCAN_IN);
  not  g567( wr_604  ,           wr_603  );
  nor  g568( wr_665  , wr_664  , wr_560  );
  nor  g569( wr_682  , wr_681  , wr_560  );
  nor  g570( wr_695  , wr_560  , wr_510  );
  not  g571( wr_206  ,           wr_205  );
  nor  g572( wr_202  , wr_201  , STATO_REG_0__SCAN_IN);
  nor  g573( wr_582  , wr_581  , wr_501  );
  nor  g574( wr_647  , wr_646  , wr_560  );
  nor  g575( wr_132  , wr_131  , STATO_REG_0__SCAN_OUT);
  not  g576( wr_615  ,           wr_614  );
  nor  g577( wr_129  , wr_128  , wr_75   );
  nor  g578( wr_135  , wr_128  , wr_78   );
  nor  g579( wr_138  , wr_128  , wr_114  );
  nor  g580( wr_141  , wr_128  , wr_82   );
  nor  g581( wr_144  , wr_128  , wr_104  );
  nor  g582( wr_147  , wr_128  , wr_86   );
  nor  g583( wr_150  , wr_128  , wr_94   );
  nor  g584( wr_153  , wr_128  , wr_88   );
  nor  g585( wr_561  , wr_560  , wr_527  );
  nor  g586( wr_634  , wr_633  , wr_560  );
  nor  g587( wr_605  , wr_604  , wr_524  );
  nor  g588( wr_622  , wr_604  , wr_427  );
  nor  g589( wr_637  , wr_604  , wr_447  );
  nor  g590( wr_666  , wr_665  , wr_659  );
  nor  g591( wr_683  , wr_682  , wr_677  );
  nor  g592( wr_696  , wr_695  , wr_694  );
  nor  g593( wr_207  , wr_206  , wr_200  );
  nor  g594( wr_203  , wr_202  , STATO_REG_0__SCAN_OUT);
  nor  g595( wr_583  , wr_582  , wr_526  );
  nor  g596( wr_650  , wr_649  , wr_647  );
  nor  g597( wr_133  , wr_132  , wr_124  );
  nor  g598( wr_136  , wr_132  , wr_119  );
  nor  g599( wr_139  , wr_132  , wr_80   );
  nor  g600( wr_142  , wr_132  , wr_109  );
  nor  g601( wr_145  , wr_132  , wr_84   );
  nor  g602( wr_148  , wr_132  , wr_99   );
  nor  g603( wr_151  , wr_132  , wr_89   );
  nor  g604( wr_155  , wr_132  , wr_154  );
  nor  g605( wr_616  , wr_615  , wr_560  );
  nor  g606( wr_653  , wr_604  , wr_437  );
  nor  g607( wr_671  , wr_604  , wr_461  );
  nor  g608( wr_688  , wr_604  , wr_474  );
  nor  g609( wr_577  , wr_576  , wr_561  );
  nor  g610( wr_606  , wr_605  , wr_597  );
  nor  g611( wr_623  , wr_622  , wr_621  );
  nor  g612( wr_639  , wr_638  , wr_637  );
  not  g613( wr_667  ,           wr_666  );
  not  g614( wr_684  ,           wr_683  );
  not  g615( wr_697  ,           wr_696  );
  nor  g616( wr_208  , wr_207  , STATO_REG_0__SCAN_IN);
  nor  g617( wr_204  , wr_203  , wr_157  );
  nor  g618( wr_211  , wr_203  , wr_159  );
  nor  g619( wr_214  , wr_203  , wr_190  );
  nor  g620( wr_217  , wr_203  , wr_162  );
  nor  g621( wr_220  , wr_203  , wr_181  );
  nor  g622( wr_223  , wr_203  , wr_165  );
  nor  g623( wr_226  , wr_203  , wr_172  );
  nor  g624( wr_229  , wr_203  , wr_168  );
  nor  g625( wr_584  , wr_583  , wr_560  );
  not  g626( wr_651  ,           wr_650  );
  nor  g627( wr_134  , wr_133  , wr_129  );
  nor  g628( wr_137  , wr_136  , wr_135  );
  nor  g629( wr_140  , wr_139  , wr_138  );
  nor  g630( wr_143  , wr_142  , wr_141  );
  nor  g631( wr_146  , wr_145  , wr_144  );
  nor  g632( wr_149  , wr_148  , wr_147  );
  nor  g633( wr_152  , wr_151  , wr_150  );
  nor  g634( wr_156  , wr_155  , wr_153  );
  not  g635( DATA_OUT_REG_7__SCAN_OUT,           wr_577  );
  not  g636( wr_607  ,           wr_606  );
  not  g637( wr_624  ,           wr_623  );
  not  g638( wr_640  ,           wr_639  );
  nor  g639( wr_668  , wr_667  , wr_657  );
  nor  g640( wr_685  , wr_684  , wr_675  );
  nor  g641( wr_698  , wr_697  , wr_692  );
  nor  g642( wr_209  , wr_208  , wr_75   );
  nor  g643( wr_212  , wr_208  , wr_78   );
  nor  g644( wr_215  , wr_208  , wr_114  );
  nor  g645( wr_218  , wr_208  , wr_82   );
  nor  g646( wr_221  , wr_208  , wr_104  );
  nor  g647( wr_224  , wr_208  , wr_86   );
  nor  g648( wr_227  , wr_208  , wr_94   );
  nor  g649( wr_230  , wr_208  , wr_88   );
  nor  g650( wr_593  , wr_592  , wr_584  );
  not  g651( RMAX_REG_7__SCAN_OUT,           wr_134  );
  not  g652( RMAX_REG_6__SCAN_OUT,           wr_137  );
  not  g653( RMAX_REG_5__SCAN_OUT,           wr_140  );
  not  g654( RMAX_REG_4__SCAN_OUT,           wr_143  );
  not  g655( RMAX_REG_3__SCAN_OUT,           wr_146  );
  not  g656( RMAX_REG_2__SCAN_OUT,           wr_149  );
  not  g657( RMAX_REG_1__SCAN_OUT,           wr_152  );
  not  g658( RMAX_REG_0__SCAN_OUT,           wr_156  );
  nor  g659( wr_608  , wr_607  , wr_595  );
  nor  g660( wr_625  , wr_624  , wr_619  );
  nor  g661( wr_641  , wr_640  , wr_636  );
  not  g662( wr_669  ,           wr_668  );
  not  g663( wr_686  ,           wr_685  );
  not  g664( wr_699  ,           wr_698  );
  nor  g665( wr_210  , wr_209  , wr_204  );
  nor  g666( wr_213  , wr_212  , wr_211  );
  nor  g667( wr_216  , wr_215  , wr_214  );
  nor  g668( wr_219  , wr_218  , wr_217  );
  nor  g669( wr_222  , wr_221  , wr_220  );
  nor  g670( wr_225  , wr_224  , wr_223  );
  nor  g671( wr_228  , wr_227  , wr_226  );
  nor  g672( wr_231  , wr_230  , wr_229  );
  not  g673( DATA_OUT_REG_6__SCAN_OUT,           wr_593  );
  not  g674( wr_609  ,           wr_608  );
  not  g675( wr_626  ,           wr_625  );
  not  g676( wr_642  ,           wr_641  );
  nor  g677( wr_670  , wr_669  , wr_653  );
  nor  g678( wr_687  , wr_686  , wr_671  );
  nor  g679( wr_700  , wr_699  , wr_688  );
  not  g680( RMIN_REG_7__SCAN_OUT,           wr_210  );
  not  g681( RMIN_REG_6__SCAN_OUT,           wr_213  );
  not  g682( RMIN_REG_5__SCAN_OUT,           wr_216  );
  not  g683( RMIN_REG_4__SCAN_OUT,           wr_219  );
  not  g684( RMIN_REG_3__SCAN_OUT,           wr_222  );
  not  g685( RMIN_REG_2__SCAN_OUT,           wr_225  );
  not  g686( RMIN_REG_1__SCAN_OUT,           wr_228  );
  not  g687( RMIN_REG_0__SCAN_OUT,           wr_231  );
  nor  g688( wr_610  , wr_609  , wr_594  );
  nor  g689( wr_627  , wr_626  , wr_618  );
  nor  g690( wr_652  , wr_651  , wr_642  );
  not  g691( DATA_OUT_REG_2__SCAN_OUT,           wr_670  );
  not  g692( DATA_OUT_REG_1__SCAN_OUT,           wr_687  );
  not  g693( DATA_OUT_REG_0__SCAN_OUT,           wr_700  );
  not  g694( wr_611  ,           wr_610  );
  not  g695( wr_628  ,           wr_627  );
  not  g696( DATA_OUT_REG_3__SCAN_OUT,           wr_652  );
  nor  g697( wr_617  , wr_616  , wr_611  );
  nor  g698( wr_635  , wr_634  , wr_628  );
  not  g699( DATA_OUT_REG_5__SCAN_OUT,           wr_617  );
  not  g700( DATA_OUT_REG_4__SCAN_OUT,           wr_635  );

endmodule

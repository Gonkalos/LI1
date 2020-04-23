<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
span.lineno { color: white; background: #aaaaaa; border-right: solid white 12px }
span.nottickedoff { background: yellow}
span.istickedoff { background: white }
span.tickonlyfalse { margin: -1px; border: 1px solid #f20913; background: #f20913 }
span.tickonlytrue  { margin: -1px; border: 1px solid #60de51; background: #60de51 }
span.funcount { font-size: small; color: orange; z-index: 2; position: absolute; right: 20 }
span.decl { font-weight: bold }
span.spaces    { background: white }
</style>
</head>
<body><pre><span class="decl"><span class="nottickedoff">never executed</span> <span class="tickonlytrue">always true</span> <span class="tickonlyfalse">always false</span></span>
</pre>
<pre><span class="decl"><span class="nottickedoff">never executed</span> <span class="tickonlytrue">always true</span> <span class="tickonlyfalse">always false</span></span>
</pre>
<pre><span class="lineno">    1 </span>module Maps where
<span class="lineno">    2 </span>
<span class="lineno">    3 </span>import LI11819
<span class="lineno">    4 </span>import Oracle
<span class="lineno">    5 </span>import OracleT1
<span class="lineno">    6 </span>import OracleTH
<span class="lineno">    7 </span>
<span class="lineno">    8 </span>caminho1 :: Instrucoes
<span class="lineno">    9 </span><span class="decl"><span class="nottickedoff">caminho1 = replicate 10 (Move D) ++ replicate 10 (Move B)</span></span>
<span class="lineno">   10 </span>
<span class="lineno">   11 </span>caminho2 :: Instrucoes
<span class="lineno">   12 </span><span class="decl"><span class="nottickedoff">caminho2 = replicate 10 (Move E) ++ replicate 10 (Move C)</span></span>
<span class="lineno">   13 </span>
<span class="lineno">   14 </span>caminho3 :: Instrucoes
<span class="lineno">   15 </span><span class="decl"><span class="nottickedoff">caminho3 = [Move D,Move D,Move D,Move D,Desenha,Move B,Move B,Move B,Roda,MudaParede,Desenha,Move B,Move B,Move B,Move B,Move B,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Desenha,Move B,Move B,Move B,Move B]</span></span>
<span class="lineno">   16 </span>
<span class="lineno">   17 </span>caminho4 :: Instrucoes
<span class="lineno">   18 </span><span class="decl"><span class="nottickedoff">caminho4 = [ Roda, MudaTetromino, Desenha, MudaParede, Desenha, MudaParede, Move D, Roda, Roda, MudaTetromino, Roda, Move E, Move B, Move C, MudaParede, Desenha ]</span></span>
<span class="lineno">   19 </span>
<span class="lineno">   20 </span>mapa1 :: Mapa
<span class="lineno">   21 </span><span class="decl"><span class="nottickedoff">mapa1 = constroi caminho1</span></span>
<span class="lineno">   22 </span>
<span class="lineno">   23 </span>mapa2 :: Mapa
<span class="lineno">   24 </span><span class="decl"><span class="nottickedoff">mapa2 = mkMapa</span>
<span class="lineno">   25 </span><span class="spaces">    </span><span class="nottickedoff">["******"</span>
<span class="lineno">   26 </span><span class="spaces">    </span><span class="nottickedoff">,"*    *"</span>
<span class="lineno">   27 </span><span class="spaces">    </span><span class="nottickedoff">,"*    *"</span>
<span class="lineno">   28 </span><span class="spaces">    </span><span class="nottickedoff">,"*    *"</span>
<span class="lineno">   29 </span><span class="spaces">    </span><span class="nottickedoff">,"*    *"</span>
<span class="lineno">   30 </span><span class="spaces">    </span><span class="nottickedoff">,"******"</span>
<span class="lineno">   31 </span><span class="spaces">    </span><span class="nottickedoff">]</span></span>
<span class="lineno">   32 </span>
<span class="lineno">   33 </span>mapa3 :: Mapa
<span class="lineno">   34 </span><span class="decl"><span class="nottickedoff">mapa3 = constroi caminho3</span></span>
<span class="lineno">   35 </span>
<span class="lineno">   36 </span>mapa4 :: Mapa
<span class="lineno">   37 </span><span class="decl"><span class="nottickedoff">mapa4 = mkMapa</span>
<span class="lineno">   38 </span><span class="spaces">    </span><span class="nottickedoff">["**********"</span>
<span class="lineno">   39 </span><span class="spaces">    </span><span class="nottickedoff">,"*  ++    *"</span>
<span class="lineno">   40 </span><span class="spaces">    </span><span class="nottickedoff">,"*  ++    *"</span>
<span class="lineno">   41 </span><span class="spaces">    </span><span class="nottickedoff">,"*  ****  *"</span>
<span class="lineno">   42 </span><span class="spaces">    </span><span class="nottickedoff">,"*    ++  *"</span>
<span class="lineno">   43 </span><span class="spaces">    </span><span class="nottickedoff">,"*    ++  *"</span>
<span class="lineno">   44 </span><span class="spaces">    </span><span class="nottickedoff">,"**********"</span>
<span class="lineno">   45 </span><span class="spaces">    </span><span class="nottickedoff">]</span></span>
<span class="lineno">   46 </span>    
<span class="lineno">   47 </span>mapa5 :: Mapa
<span class="lineno">   48 </span><span class="decl"><span class="nottickedoff">mapa5 = mkMapa</span>
<span class="lineno">   49 </span><span class="spaces">    </span><span class="nottickedoff">["************************"</span>
<span class="lineno">   50 </span><span class="spaces">    </span><span class="nottickedoff">,"*  ++      ++          *"</span>
<span class="lineno">   51 </span><span class="spaces">    </span><span class="nottickedoff">,"*  ++      ++          *"</span>
<span class="lineno">   52 </span><span class="spaces">    </span><span class="nottickedoff">,"*  ********  ********  *"</span>
<span class="lineno">   53 </span><span class="spaces">    </span><span class="nottickedoff">,"*+++++++++*  *+++++++  *"</span>
<span class="lineno">   54 </span><span class="spaces">    </span><span class="nottickedoff">,"*+++++++++*  *+++++++  *"</span>
<span class="lineno">   55 </span><span class="spaces">    </span><span class="nottickedoff">,"*  *****++*  *++*****  *"</span>
<span class="lineno">   56 </span><span class="spaces">    </span><span class="nottickedoff">,"*+++++++++*  *+++++++++*"</span>
<span class="lineno">   57 </span><span class="spaces">    </span><span class="nottickedoff">,"*+++++++++*  *+++++++  *"</span>
<span class="lineno">   58 </span><span class="spaces">    </span><span class="nottickedoff">,"*  ********  ********  *"</span>
<span class="lineno">   59 </span><span class="spaces">    </span><span class="nottickedoff">,"*          ++          *"</span>
<span class="lineno">   60 </span><span class="spaces">    </span><span class="nottickedoff">,"*          ++          *"</span>
<span class="lineno">   61 </span><span class="spaces">    </span><span class="nottickedoff">,"************************"</span>
<span class="lineno">   62 </span><span class="spaces">    </span><span class="nottickedoff">]</span></span>
<span class="lineno">   63 </span>
<span class="lineno">   64 </span>mapa6 :: Mapa
<span class="lineno">   65 </span><span class="decl"><span class="nottickedoff">mapa6 = mkMapa</span>
<span class="lineno">   66 </span><span class="spaces">    </span><span class="nottickedoff">["*************************"</span>
<span class="lineno">   67 </span><span class="spaces">    </span><span class="nottickedoff">,"*     +         ++      *"</span>
<span class="lineno">   68 </span><span class="spaces">    </span><span class="nottickedoff">,"*     +         ++      *"</span>
<span class="lineno">   69 </span><span class="spaces">    </span><span class="nottickedoff">,"*               ++      *"</span>
<span class="lineno">   70 </span><span class="spaces">    </span><span class="nottickedoff">,"*               ++      *"</span>
<span class="lineno">   71 </span><span class="spaces">    </span><span class="nottickedoff">,"**************          *"</span>
<span class="lineno">   72 </span><span class="spaces">    </span><span class="nottickedoff">,"*            *          *"</span>
<span class="lineno">   73 </span><span class="spaces">    </span><span class="nottickedoff">,"*            *          *"</span>
<span class="lineno">   74 </span><span class="spaces">    </span><span class="nottickedoff">,"**************          *"</span>
<span class="lineno">   75 </span><span class="spaces">    </span><span class="nottickedoff">,"*  ****                 *"</span>
<span class="lineno">   76 </span><span class="spaces">    </span><span class="nottickedoff">,"*  ****                 *"</span>
<span class="lineno">   77 </span><span class="spaces">    </span><span class="nottickedoff">,"*     *   ***           *"</span>
<span class="lineno">   78 </span><span class="spaces">    </span><span class="nottickedoff">,"*     *   *   ++++      *"</span>
<span class="lineno">   79 </span><span class="spaces">    </span><span class="nottickedoff">,"*  *      *++++++   +   *"</span>
<span class="lineno">   80 </span><span class="spaces">    </span><span class="nottickedoff">,"*  *      *+  ++++  +   *"</span>
<span class="lineno">   81 </span><span class="spaces">    </span><span class="nottickedoff">,"*  ********+++++++  +   *"</span>
<span class="lineno">   82 </span><span class="spaces">    </span><span class="nottickedoff">,"*                       *"</span>
<span class="lineno">   83 </span><span class="spaces">    </span><span class="nottickedoff">,"*                       *"</span>
<span class="lineno">   84 </span><span class="spaces">    </span><span class="nottickedoff">,"*  +       **+   +++++  *"</span>
<span class="lineno">   85 </span><span class="spaces">    </span><span class="nottickedoff">,"*          +**      ++  *"</span>
<span class="lineno">   86 </span><span class="spaces">    </span><span class="nottickedoff">,"*          +*+   +++++  *"</span>
<span class="lineno">   87 </span><span class="spaces">    </span><span class="nottickedoff">,"*          +*+          *"</span>
<span class="lineno">   88 </span><span class="spaces">    </span><span class="nottickedoff">,"*          +*+          *"</span>
<span class="lineno">   89 </span><span class="spaces">    </span><span class="nottickedoff">,"*          +*+          *"</span>
<span class="lineno">   90 </span><span class="spaces">    </span><span class="nottickedoff">,"*************************"</span>
<span class="lineno">   91 </span><span class="spaces">    </span><span class="nottickedoff">]</span></span>
<span class="lineno">   92 </span>
<span class="lineno">   93 </span>mapa7 :: Mapa
<span class="lineno">   94 </span><span class="decl"><span class="nottickedoff">mapa7 = mkMapa</span>
<span class="lineno">   95 </span><span class="spaces">    </span><span class="nottickedoff">["****************************************"</span>
<span class="lineno">   96 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                      *"</span>
<span class="lineno">   97 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                      *"</span>
<span class="lineno">   98 </span><span class="spaces">    </span><span class="nottickedoff">,"*  **          **********    ****      *"</span>
<span class="lineno">   99 </span><span class="spaces">    </span><span class="nottickedoff">,"*  **          **********    ****      *"</span>
<span class="lineno">  100 </span><span class="spaces">    </span><span class="nottickedoff">,"*  **              **          **      *"</span>
<span class="lineno">  101 </span><span class="spaces">    </span><span class="nottickedoff">,"*  **              **          **      *"</span>
<span class="lineno">  102 </span><span class="spaces">    </span><span class="nottickedoff">,"*  **              **          **      *"</span>
<span class="lineno">  103 </span><span class="spaces">    </span><span class="nottickedoff">,"*  **              **          **      *"</span>
<span class="lineno">  104 </span><span class="spaces">    </span><span class="nottickedoff">,"*  **              **          **      *"</span>
<span class="lineno">  105 </span><span class="spaces">    </span><span class="nottickedoff">,"*  **              **          **      *"</span>
<span class="lineno">  106 </span><span class="spaces">    </span><span class="nottickedoff">,"*  **              **          **      *"</span>
<span class="lineno">  107 </span><span class="spaces">    </span><span class="nottickedoff">,"*  **              **          **      *"</span>
<span class="lineno">  108 </span><span class="spaces">    </span><span class="nottickedoff">,"*  **              **          **      *"</span>
<span class="lineno">  109 </span><span class="spaces">    </span><span class="nottickedoff">,"*  **********  **********  **********  *"</span>
<span class="lineno">  110 </span><span class="spaces">    </span><span class="nottickedoff">,"*  **********  **********  **********  *"</span>
<span class="lineno">  111 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                      *"</span>
<span class="lineno">  112 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                      *"</span>
<span class="lineno">  113 </span><span class="spaces">    </span><span class="nottickedoff">,"****************************************"</span>
<span class="lineno">  114 </span><span class="spaces">    </span><span class="nottickedoff">]</span></span>
<span class="lineno">  115 </span>
<span class="lineno">  116 </span><span class="decl"><span class="nottickedoff">mapa8 = mkMapa</span>
<span class="lineno">  117 </span><span class="spaces">    </span><span class="nottickedoff">["*******************************************************************"</span>
<span class="lineno">  118 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                      +++++++++++++++++++++      *"</span>
<span class="lineno">  119 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                      +++++++++++++++++++++      *"</span>
<span class="lineno">  120 </span><span class="spaces">    </span><span class="nottickedoff">,"*    +++++++++      +++++++++          +++++++++++ +++++++++      *"</span>
<span class="lineno">  121 </span><span class="spaces">    </span><span class="nottickedoff">,"*    ++++*****+++++++++++++++          +++++++++*+++++++++++      *"</span>
<span class="lineno">  122 </span><span class="spaces">    </span><span class="nottickedoff">,"*    ++++*****++++++ ++++++++          ++++++++***+++++++++++++   *"</span>
<span class="lineno">  123 </span><span class="spaces">    </span><span class="nottickedoff">,"*    ++++++++++++++++++++++++          ++++++++++++++++++++++++   *"</span>
<span class="lineno">  124 </span><span class="spaces">    </span><span class="nottickedoff">,"*    ++++++++++++++++++++++++   +++++++++++++++++++++++++++++++   *"</span>
<span class="lineno">  125 </span><span class="spaces">    </span><span class="nottickedoff">,"*    ++++++ +++++++++++++++++   +++++++++ ++++++++ ++++++++++++   *"</span>
<span class="lineno">  126 </span><span class="spaces">    </span><span class="nottickedoff">,"*    ++++++++++++++++++++++++   ++++ +++++++++++++++++++ ++++++   *"</span>
<span class="lineno">  127 </span><span class="spaces">    </span><span class="nottickedoff">,"*    ++++++++++++++++++++++++   +++++++**++++++++++++++++++++++   *"</span>
<span class="lineno">  128 </span><span class="spaces">    </span><span class="nottickedoff">,"*    ++++**        **++++++++   +++++++**++++++++++++++++++++++   *"</span>
<span class="lineno">  129 </span><span class="spaces">    </span><span class="nottickedoff">,"*    ++++************+++++++++++++++++++++++ ++++++++++++++++++   *"</span>
<span class="lineno">  130 </span><span class="spaces">    </span><span class="nottickedoff">,"*    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   *"</span>
<span class="lineno">  131 </span><span class="spaces">    </span><span class="nottickedoff">,"*    ++++++++++++++++++++++++++++++++++**++++++++*++++++          *"</span>
<span class="lineno">  132 </span><span class="spaces">    </span><span class="nottickedoff">,"*    ++++++++++++*****+++++ ++++++++ +++**+++++++**+++++          *"</span>
<span class="lineno">  133 </span><span class="spaces">    </span><span class="nottickedoff">,"*     +++++++++++*****+++++++++++++++++++++++++++*++++++          *"</span>
<span class="lineno">  134 </span><span class="spaces">    </span><span class="nottickedoff">,"*     ++++++++++++++++++++++++++++++++ +++++++++++++++++          *"</span>
<span class="lineno">  135 </span><span class="spaces">    </span><span class="nottickedoff">,"*     ++++++++++++++++++++++++++++++++++++++++++++++++++    ****  *"</span>
<span class="lineno">  136 </span><span class="spaces">    </span><span class="nottickedoff">,"*     +++++++ ++++++++ +++++++++++++++++++++++ +++++++++          *"</span>
<span class="lineno">  137 </span><span class="spaces">    </span><span class="nottickedoff">,"*     +++++++++++++++++++++++++++*++++++++++*++++++++             *"</span>
<span class="lineno">  138 </span><span class="spaces">    </span><span class="nottickedoff">,"*     +++++++++++*****+++++++++++*++++++++++*++++++++             *"</span>
<span class="lineno">  139 </span><span class="spaces">    </span><span class="nottickedoff">,"*     +++++++++++*****+++++++++++*++++++++++*+++++++++++++        *"</span>
<span class="lineno">  140 </span><span class="spaces">    </span><span class="nottickedoff">,"*     ++++++++++++**+++++++++++++*+++++ ++++*+++++++++++++        *"</span>
<span class="lineno">  141 </span><span class="spaces">    </span><span class="nottickedoff">,"*     ++++++++++++**++++++++++++++++++++++++++++++++++++++        *"</span>
<span class="lineno">  142 </span><span class="spaces">    </span><span class="nottickedoff">,"*     ++++++++ +++**++++++++++++  ++++++++++++++++++++++++        *"</span>
<span class="lineno">  143 </span><span class="spaces">    </span><span class="nottickedoff">,"*  *    ++++++++++**++++++++++++  +++++++++++ ++++++++++++        *"</span>
<span class="lineno">  144 </span><span class="spaces">    </span><span class="nottickedoff">,"*  **   ++++++++++**++++++++++++  ++++++++++++++++++++++++        *"</span>
<span class="lineno">  145 </span><span class="spaces">    </span><span class="nottickedoff">,"*   *   ++++++++++++++++++++++++  ++++++++++*+++++++ +++++        *"</span>
<span class="lineno">  146 </span><span class="spaces">    </span><span class="nottickedoff">,"*****   ++++++++++++++++++++++++  ++++++++++**++++++++++++        *"</span>
<span class="lineno">  147 </span><span class="spaces">    </span><span class="nottickedoff">,"*****   +++ +++++ ++++++++++++++  ++++++ ++++*++++++++++++        *"</span>
<span class="lineno">  148 </span><span class="spaces">    </span><span class="nottickedoff">,"*       ++++++++++++++++++++++++  ++++++++++++++++++++++++        *"</span>
<span class="lineno">  149 </span><span class="spaces">    </span><span class="nottickedoff">,"*       ++++++++++++++++++++++++  ++++++++++++++++++**++++        *"</span>
<span class="lineno">  150 </span><span class="spaces">    </span><span class="nottickedoff">,"*       +++++++ ++++++++++++++++  +++++ ++++++++ +++**++++        *"</span>
<span class="lineno">  151 </span><span class="spaces">    </span><span class="nottickedoff">,"*       ++++++++++++****++++++++  ++++++++++++++++++++++++        *"</span>
<span class="lineno">  152 </span><span class="spaces">    </span><span class="nottickedoff">,"*       ++++++++++++++++++++++++                                  *"</span>
<span class="lineno">  153 </span><span class="spaces">    </span><span class="nottickedoff">,"*       ++++++++++++++++++++++++                                  *"</span>
<span class="lineno">  154 </span><span class="spaces">    </span><span class="nottickedoff">,"*       ++++++++++++++++++++++++                                  *"</span>
<span class="lineno">  155 </span><span class="spaces">    </span><span class="nottickedoff">,"*******************************************************************"</span>
<span class="lineno">  156 </span><span class="spaces">    </span><span class="nottickedoff">]</span></span>
<span class="lineno">  157 </span>
<span class="lineno">  158 </span>mapa9 :: Mapa
<span class="lineno">  159 </span><span class="decl"><span class="nottickedoff">mapa9 = mkMapa</span>
<span class="lineno">  160 </span><span class="spaces">    </span><span class="nottickedoff">["*******************************************************************"</span>
<span class="lineno">  161 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  162 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  163 </span><span class="spaces">    </span><span class="nottickedoff">,"*    +++++++++      *********          +++++++++++ +++++++++      *"</span>
<span class="lineno">  164 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  165 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  166 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  167 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  168 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  169 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  170 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  171 </span><span class="spaces">    </span><span class="nottickedoff">,"*    ++++**        **++++++++   +++++++**++++++++++++++++++++++   *"</span>
<span class="lineno">  172 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  173 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  174 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  175 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  176 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  177 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  178 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  179 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  180 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  181 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  182 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  183 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  184 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  185 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  186 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  187 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  188 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  189 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  190 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  191 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  192 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  193 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  194 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  195 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  196 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  197 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  198 </span><span class="spaces">    </span><span class="nottickedoff">,"*******************************************************************"</span>
<span class="lineno">  199 </span><span class="spaces">    </span><span class="nottickedoff">]</span></span>
<span class="lineno">  200 </span>
<span class="lineno">  201 </span>mapa10 :: Mapa
<span class="lineno">  202 </span><span class="decl"><span class="nottickedoff">mapa10 = mkMapa</span>
<span class="lineno">  203 </span><span class="spaces">    </span><span class="nottickedoff">["*******************************************************************"</span>
<span class="lineno">  204 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  205 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  206 </span><span class="spaces">    </span><span class="nottickedoff">,"*                                                                 *"</span>
<span class="lineno">  207 </span><span class="spaces">    </span><span class="nottickedoff">,"*******************************************************************"</span>
<span class="lineno">  208 </span><span class="spaces">    </span><span class="nottickedoff">]</span></span>
<span class="lineno">  209 </span>
<span class="lineno">  210 </span>mapa11 :: Mapa
<span class="lineno">  211 </span><span class="decl"><span class="nottickedoff">mapa11 = mkMapa</span>
<span class="lineno">  212 </span><span class="spaces">    </span><span class="nottickedoff">["*******************************************************************"</span>
<span class="lineno">  213 </span><span class="spaces">    </span><span class="nottickedoff">,"*     + +**  *+++ *+++ ** *+*+*++ *+*++*++  *++* *+*++  *+**      *"</span>
<span class="lineno">  214 </span><span class="spaces">    </span><span class="nottickedoff">,"*    + +  ++*+ ++++ *  *+ * ++* *     + *+  +++*+*+*++  * + +*    *"</span>
<span class="lineno">  215 </span><span class="spaces">    </span><span class="nottickedoff">,"*      *    *+ *++ ++++***  *+*+   *+* *+ * +  +**+ +    +        *"</span>
<span class="lineno">  216 </span><span class="spaces">    </span><span class="nottickedoff">,"*    * *+* ** * *+++   + ++ *   +  + * *+  * +*++**+*+*+  ****    *"</span>
<span class="lineno">  217 </span><span class="spaces">    </span><span class="nottickedoff">,"*+* + ****+ + +***  +*+*+ +     **+++ *  ++**+  ** *****   ++++** *"</span>
<span class="lineno">  218 </span><span class="spaces">    </span><span class="nottickedoff">,"*   * * +  *+ +++ * *++ +* *+ * ***+     *++ +**    * ** *  +* *+**"</span>
<span class="lineno">  219 </span><span class="spaces">    </span><span class="nottickedoff">,"*+ +*+** + +++ ++ *++*++*  *++*+ *+++*+ * +*+*+ ***++*****+ + +*  *"</span>
<span class="lineno">  220 </span><span class="spaces">    </span><span class="nottickedoff">,"*+  **+ +*++**+**+*++ *+**+   * + *+**  +*++** +*   * ++ +*+ * ++**"</span>
<span class="lineno">  221 </span><span class="spaces">    </span><span class="nottickedoff">,"**+  +*++ ** + + **  ****+  ** **   **+    + ***  *+*+*******+*+++*"</span>
<span class="lineno">  222 </span><span class="spaces">    </span><span class="nottickedoff">,"** ** +  ++  +*+* +*+ +***+ * ++   +++*+*  **   *++**+ *++** *    *"</span>
<span class="lineno">  223 </span><span class="spaces">    </span><span class="nottickedoff">,"**  ++*+     * *+ **+*++*+**  ++* *++++  **++**+***++*++*+   **+***"</span>
<span class="lineno">  224 </span><span class="spaces">    </span><span class="nottickedoff">,"** +  +++  *+++   *+  ++++* +  **+ **++* ++++ **   +***   **+ * * *"</span>
<span class="lineno">  225 </span><span class="spaces">    </span><span class="nottickedoff">,"*++ * +** +    * ++* +   ** *+ *++ * *+ ++++ +*+  * +* +****++ +*+*"</span>
<span class="lineno">  226 </span><span class="spaces">    </span><span class="nottickedoff">,"** +**+**+ ** *+* *+*++*++* ++****++ ++*+ ++  **  +  +  * + ++ ++ *"</span>
<span class="lineno">  227 </span><span class="spaces">    </span><span class="nottickedoff">,"*+ *+ +*+ +**+*+    + *++ *++ *++ +** +  ++  ** +*+ +*+++*+*** * **"</span>
<span class="lineno">  228 </span><span class="spaces">    </span><span class="nottickedoff">,"***+*+*+* ++++   **+***+ ++++* +**   *      * +*+++  ***  +*+** * *"</span>
<span class="lineno">  229 </span><span class="spaces">    </span><span class="nottickedoff">,"** + +++*++*+ *+ * +  + *+ ++**   ** +++  ++* *+++  *+**+++++*** **"</span>
<span class="lineno">  230 </span><span class="spaces">    </span><span class="nottickedoff">,"*+*++ + *+  +++*  *+**+ +***+  +***  + +*++ +  +***   + *+++*  +* *"</span>
<span class="lineno">  231 </span><span class="spaces">    </span><span class="nottickedoff">,"*+**++* + ***+ + +**+ + + +* + ++++*++*+*++ +*+ **+++ ++ +*++    +*"</span>
<span class="lineno">  232 </span><span class="spaces">    </span><span class="nottickedoff">,"*+* +  +**  *+  **++++* ++++  *++**+++  *+ + ****+  ++* + + * ++*+*"</span>
<span class="lineno">  233 </span><span class="spaces">    </span><span class="nottickedoff">,"*     **  * ******+ + + ++*+ ++  +**  * * ** * + **+++++    *+*+* *"</span>
<span class="lineno">  234 </span><span class="spaces">    </span><span class="nottickedoff">,"** +*** *  +  * *+ **   ***+* +* +++*++++** ++  +  + ** *  +++ +* *"</span>
<span class="lineno">  235 </span><span class="spaces">    </span><span class="nottickedoff">,"** *+ ++ +++*+++****+ **+ +*+*  +*+  + +* ++* +**+*     +++**+ *+**"</span>
<span class="lineno">  236 </span><span class="spaces">    </span><span class="nottickedoff">,"* ++*++*+*++ +*   * * ++++* *  * ++*+++* +*** *+ *+*++ ++*** +*+ **"</span>
<span class="lineno">  237 </span><span class="spaces">    </span><span class="nottickedoff">,"**+ * +**+*  +** +*++  *+++ +  + +*** +*   * +*+*++++* *    **+*++*"</span>
<span class="lineno">  238 </span><span class="spaces">    </span><span class="nottickedoff">,"*++ ++   *** **+*  + **  ++++***   + *+  + +  +*** +*+ *** *+ ** +*"</span>
<span class="lineno">  239 </span><span class="spaces">    </span><span class="nottickedoff">,"*+ +*+*   **+ *++*+*+*+****++ +*    ** * +*++++*+ +* ++ +*  *+++  *"</span>
<span class="lineno">  240 </span><span class="spaces">    </span><span class="nottickedoff">,"*+++*** * + *++*+++  **+**+ * *++* +++++  *+ ***+ ** ** *  ** +   *"</span>
<span class="lineno">  241 </span><span class="spaces">    </span><span class="nottickedoff">,"*   + +*+**++*+ + *+*+ ++ ++*******++ +**  +**++*+++*+*+ +  ++***+*"</span>
<span class="lineno">  242 </span><span class="spaces">    </span><span class="nottickedoff">,"* *+* * * ***   *+ *   +++++*+  *  +   *++* * *+ **++*+*+*  +   +**"</span>
<span class="lineno">  243 </span><span class="spaces">    </span><span class="nottickedoff">,"** + *++*+ +   *++ *+ ++     * ++ ***++**++***+*++* + ++**++*+*+ **"</span>
<span class="lineno">  244 </span><span class="spaces">    </span><span class="nottickedoff">,"** + + ++* + * *+  *+* +* *  + +**+ ***+*  +   +* +++*** ++ +*++*+*"</span>
<span class="lineno">  245 </span><span class="spaces">    </span><span class="nottickedoff">,"**++ * +***+* +++  ++***++  + * + + + *++**++ +* ***  * +++* * +***"</span>
<span class="lineno">  246 </span><span class="spaces">    </span><span class="nottickedoff">,"**+* * *+  + *+* +*+ ** + * +*   +*+* ++**  +* ++*  +  ** + *** ***"</span>
<span class="lineno">  247 </span><span class="spaces">    </span><span class="nottickedoff">,"** +   +++++***** +** + *+*****  ++ + *+**+ + *+*  ***+ + ++ +** **"</span>
<span class="lineno">  248 </span><span class="spaces">    </span><span class="nottickedoff">,"*++++++ +  ++* *++* *  +    + + + + +**+*+*+ + *+* ++ * *+ ++* * **"</span>
<span class="lineno">  249 </span><span class="spaces">    </span><span class="nottickedoff">,"*+ +* + +* +++++   *+  * +*+**** *** ++* +* * ** +  *  +     +*+ +*"</span>
<span class="lineno">  250 </span><span class="spaces">    </span><span class="nottickedoff">,"*******************************************************************"</span>
<span class="lineno">  251 </span><span class="spaces">    </span><span class="nottickedoff">]</span></span>
<span class="lineno">  252 </span>
<span class="lineno">  253 </span><span class="decl"><span class="nottickedoff">mapa12 = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Destrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Destrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Bloco Destrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Bloco Indestrutivel,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]]</span></span>
<span class="lineno">  254 </span>
<span class="lineno">  255 </span><span class="decl"><span class="nottickedoff">mapa13 = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]]</span></span>
<span class="lineno">  256 </span>
<span class="lineno">  257 </span>{- remap x = case x of {'a' -&gt; ' '; 'b' -&gt; '+'; 'c' -&gt; '*'}
<span class="lineno">  258 </span>   line = newStdGen &gt;&gt;= \g -&gt; print .(++"*") .('*':) . map remap . take 65 $ (randomRs ('a', 'c') g)
<span class="lineno">  259 </span>   sequence $ replicate 37 line
<span class="lineno">  260 </span>-}
<span class="lineno">  261 </span>mapas :: [Mapa]
<span class="lineno">  262 </span><span class="decl"><span class="nottickedoff">mapas = [mapa1,mapa2,mapa3,mapa4,mapa5,mapa6,mapa7,mapa8,mapa9,mapa10,mapa11]</span></span>
<span class="lineno">  263 </span>
<span class="lineno">  264 </span>mapas_torneio :: [Mapa]
<span class="lineno">  265 </span><span class="decl"><span class="nottickedoff">mapas_torneio = mapas</span></span>
<span class="lineno">  266 </span>
<span class="lineno">  267 </span><span class="decl"><span class="nottickedoff">estado1 = Estado (constroi caminho1) [Jogador (5,5) B 4 0 4] [mkDisparo 0 Choque Nothing Nothing (Just 5)]</span></span>
<span class="lineno">  268 </span><span class="decl"><span class="nottickedoff">estado2 = Estado (constroi caminho2) [Jogador (5,5) B 4 0 4] [mkDisparo 0 Choque Nothing Nothing (Just 5)]</span></span>
<span class="lineno">  269 </span><span class="decl"><span class="nottickedoff">estado3 = Estado (constroi caminho3) [Jogador (5,5) B 4 0 4] [mkDisparo 0 Choque Nothing Nothing (Just 5)]</span></span>
<span class="lineno">  270 </span><span class="decl"><span class="nottickedoff">estado4 = Estado (constroi caminho3) [Jogador (5,5) B 4 0 4] [mkDisparo 0 Canhao (Just (2,3)) (Just D) Nothing]</span></span>
<span class="lineno">  271 </span><span class="decl"><span class="nottickedoff">estado5 = Estado (constroi caminho3) [Jogador (5,5) B 4 0 4] [mkDisparo 0 Laser (Just (2,3)) (Just B) Nothing]</span></span>
<span class="lineno">  272 </span>
<span class="lineno">  273 </span>
<span class="lineno">  274 </span>-- Enunciado
<span class="lineno">  275 </span>is :: Instrucoes
<span class="lineno">  276 </span><span class="decl"><span class="nottickedoff">is = [Move D,Desenha,Move B,Move B,Move B,Roda,MudaParede,Move D,Move D,Move D,Desenha,Move B]</span></span> 
<span class="lineno">  277 </span>m :: Mapa
<span class="lineno">  278 </span><span class="decl"><span class="nottickedoff">m = constroi is</span></span>
<span class="lineno">  279 </span>e :: Estado
<span class="lineno">  280 </span><span class="decl"><span class="nottickedoff">e = Estado m</span>
<span class="lineno">  281 </span><span class="spaces">    </span><span class="nottickedoff">[Jogador (1,1) B 2 1 0,Jogador (5,1) D 1 0 2,Jogador (6,5) E 0 2 2,Jogador (1,5) C 3 0 0]</span>
<span class="lineno">  282 </span><span class="spaces">    </span><span class="nottickedoff">[mkDisparo 0 Canhao (Just (3,1)) (Just B) Nothing,mkDisparo 1 Laser (Just (5,2)) (Just D) Nothing,mkDisparo 2 Canhao (Just (6,4)) (Just E) Nothing,mkDisparo 3 Choque Nothing Nothing (Just 2)]</span></span>
<span class="lineno">  283 </span>
<span class="lineno">  284 </span>-- Lixo
<span class="lineno">  285 </span>
<span class="lineno">  286 </span>j1 :: (Int,Jogada,Estado)
<span class="lineno">  287 </span><span class="decl"><span class="nottickedoff">j1 = ( 1</span>
<span class="lineno">  288 </span><span class="spaces">    </span><span class="nottickedoff">, Movimenta D</span>
<span class="lineno">  289 </span><span class="spaces">    </span><span class="nottickedoff">, Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (2,1), direcaoJogador = B, vidasJogador = 2, lasersJogador = 1, choquesJogador = 0},Jogador {posicaoJogador = (5,1), direcaoJogador = D, vidasJogador = 1, lasersJogador = 0, choquesJogador = 2},Jogador {posicaoJogador = (6,5), direcaoJogador = E, vidasJogador = 0, lasersJogador = 2, choquesJogador = 2},Jogador {posicaoJogador = (1,5), direcaoJogador = C, vidasJogador = 3, lasersJogador = 0, choquesJogador = 0}], disparosEstado = [DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (3,1), direcaoDisparo = B},DisparoLaser {jogadorDisparo = 1, posicaoDisparo = (5,2), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 2, posicaoDisparo = (6,4), direcaoDisparo = E},DisparoChoque {jogadorDisparo = 0, tempoDisparo = 2}]} )</span></span>
<span class="lineno">  290 </span>
<span class="lineno">  291 </span>-- * Testes para avaliação
<span class="lineno">  292 </span>-- Por uma questão de consistência no feedback dos oráculos, acrescentara sempre novos testes à cauda.
<span class="lineno">  293 </span>
<span class="lineno">  294 </span>testesT1 :: [Instrucoes]
<span class="lineno">  295 </span><span class="decl"><span class="nottickedoff">testesT1 = [t1te,t1t0,t1t1,t1t2,t1t3,t1t4,t1t5,t1t6,t1t7,t1t8,t1t9,t1t10,t1t11,t1t12,caminho1,caminho2,caminho3,caminho4]</span></span>
<span class="lineno">  296 </span><span class="decl"><span class="nottickedoff">t1te = []</span></span>
<span class="lineno">  297 </span><span class="decl"><span class="nottickedoff">t1t0 = [Desenha]</span></span>
<span class="lineno">  298 </span><span class="decl"><span class="nottickedoff">t1t1 = [Move D,Move B,Roda,Desenha]</span></span>
<span class="lineno">  299 </span><span class="decl"><span class="nottickedoff">t1t2 = muda 1 ++ [Move D,Move B,Roda,Desenha] ++ replicate 4 (Move D) ++ [MudaTetromino,Desenha]</span></span>
<span class="lineno">  300 </span><span class="decl"><span class="nottickedoff">t1t3 = muda 2 ++ [Move D,Move B,Roda,Desenha] ++ replicate 2 (Move B) ++ [MudaTetromino,Desenha]</span></span>
<span class="lineno">  301 </span><span class="decl"><span class="nottickedoff">t1t4 = muda 3 ++ [Move D,Move B,Roda,Desenha] ++ replicate 5 (Move E) ++ [MudaTetromino,Desenha]</span></span>
<span class="lineno">  302 </span><span class="decl"><span class="nottickedoff">t1t5 = muda 4 ++ [Move D,Move B,Roda,Desenha] ++ replicate 5 (Move C) ++ [MudaTetromino,Desenha]</span></span>
<span class="lineno">  303 </span><span class="decl"><span class="nottickedoff">t1t6 = muda 5 ++ [Move D,Move B,Roda,Desenha] ++ replicate 2 (Move D) ++ [MudaTetromino,MudaParede,Desenha]</span></span>
<span class="lineno">  304 </span><span class="decl"><span class="nottickedoff">t1t7 = muda 5 ++ [Move D,Move B,Roda,Desenha] ++ replicate 2 (Move D) ++ [MudaTetromino,MudaParede,MudaParede,Desenha]</span></span>
<span class="lineno">  305 </span><span class="decl"><span class="nottickedoff">t1t8 = muda 4 ++ [Roda,Desenha,Move E, Move E]</span></span>
<span class="lineno">  306 </span><span class="decl"><span class="nottickedoff">t1t9 = muda 4 ++ [Roda,Roda,Desenha]</span></span>
<span class="lineno">  307 </span><span class="decl"><span class="nottickedoff">t1t10 = muda 4 ++ [Roda,Roda,Roda,Desenha]</span></span>
<span class="lineno">  308 </span><span class="decl"><span class="nottickedoff">t1t11 = muda 4 ++ [Roda,Roda,Roda,Roda,Desenha]</span></span>
<span class="lineno">  309 </span><span class="decl"><span class="nottickedoff">t1t12 = muda 1 ++ [Desenha,MudaParede,Move B,Desenha,Move B,MudaParede,Desenha,Move B,MudaParede,Desenha]</span></span>
<span class="lineno">  310 </span><span class="decl"><span class="nottickedoff">muda n = replicate n MudaTetromino</span></span>
<span class="lineno">  311 </span>
<span class="lineno">  312 </span>testesT2 :: [(Int,Jogada,Estado)]
<span class="lineno">  313 </span><span class="decl"><span class="nottickedoff">testesT2 = []</span></span>
<span class="lineno">  314 </span>
<span class="lineno">  315 </span>testesT3 :: [Estado]
<span class="lineno">  316 </span><span class="decl"><span class="nottickedoff">testesT3 = competicaoT3Estados</span></span>
<span class="lineno">  317 </span>
<span class="lineno">  318 </span><span class="decl"><span class="nottickedoff">competicaoT3Estados =</span>
<span class="lineno">  319 </span><span class="spaces">  </span><span class="nottickedoff">[ competicaoT3Estado01 -- mapa 6x6 vazio, sem jogadores, sem disparos</span>
<span class="lineno">  320 </span><span class="spaces">  </span><span class="nottickedoff">, competicaoT3Estado02 -- mapa 6x6 vazio, 4 jogadores, sem disparos</span>
<span class="lineno">  321 </span><span class="spaces">  </span><span class="nottickedoff">, competicaoT3Estado03 -- mapa pequeno, 2 jogadores, 1 disparo</span>
<span class="lineno">  322 </span><span class="spaces">  </span><span class="nottickedoff">, competicaoT3Estado04 -- mapa pequeno, 3 jogadores, 2 disparos</span>
<span class="lineno">  323 </span><span class="spaces">  </span><span class="nottickedoff">, competicaoT3Estado05 -- mapa médio, 4 jogadores, 6 disparos</span>
<span class="lineno">  324 </span><span class="spaces">  </span><span class="nottickedoff">, competicaoT3Estado06 -- mapa médio, 4 jogadores, 3 disparos</span>
<span class="lineno">  325 </span><span class="spaces">  </span><span class="nottickedoff">, competicaoT3Estado07 -- mapa médio, 4 jogadores, 1 disparo</span>
<span class="lineno">  326 </span><span class="spaces">  </span><span class="nottickedoff">, competicaoT3Estado08 -- mapa grande, 2 jogadores</span>
<span class="lineno">  327 </span><span class="spaces">  </span><span class="nottickedoff">, competicaoT3Estado09 -- mapa grande, 2 jogadores, poucas peças</span>
<span class="lineno">  328 </span><span class="spaces">  </span><span class="nottickedoff">, competicaoT3Estado10 -- mapa pequeno, 2 jogadores, muitos disparos</span>
<span class="lineno">  329 </span><span class="spaces">  </span><span class="nottickedoff">, competicaoT3Estado11 -- mapa grande aleatório, 2 jogadores, sem disparos</span>
<span class="lineno">  330 </span><span class="spaces">  </span><span class="nottickedoff">, competicaoT3Estado12 -- mapa médio gerado pelo editor (sem sobreposições), 3 jogadores, sem disparos</span>
<span class="lineno">  331 </span><span class="spaces">  </span><span class="nottickedoff">, competicaoT3Estado13 -- mapa grande gerado pelo editor (com sobreposições), sem jogadores, sem disparos</span>
<span class="lineno">  332 </span><span class="spaces">  </span><span class="nottickedoff">]</span></span>
<span class="lineno">  333 </span>
<span class="lineno">  334 </span><span class="decl"><span class="nottickedoff">mkMapa = map (map aux)</span>
<span class="lineno">  335 </span><span class="spaces">  </span><span class="nottickedoff">where aux '*' = Bloco Indestrutivel</span>
<span class="lineno">  336 </span><span class="spaces">        </span><span class="nottickedoff">aux '+' = Bloco Destrutivel</span>
<span class="lineno">  337 </span><span class="spaces">        </span><span class="nottickedoff">aux ' ' = Vazia</span></span>
<span class="lineno">  338 </span>
<span class="lineno">  339 </span>
<span class="lineno">  340 </span><span class="decl"><span class="nottickedoff">competicaoT3Estado01 = Estado</span>
<span class="lineno">  341 </span><span class="spaces">  </span><span class="nottickedoff">(mapa2)</span>
<span class="lineno">  342 </span><span class="spaces">  </span><span class="nottickedoff">[]</span>
<span class="lineno">  343 </span><span class="spaces">  </span><span class="nottickedoff">[]</span></span>
<span class="lineno">  344 </span>
<span class="lineno">  345 </span><span class="decl"><span class="nottickedoff">competicaoT3Estado02 = Estado</span>
<span class="lineno">  346 </span><span class="spaces">  </span><span class="nottickedoff">(mapa2)</span>
<span class="lineno">  347 </span><span class="spaces">  </span><span class="nottickedoff">[Jogador (1,1) D 1 0 0</span>
<span class="lineno">  348 </span><span class="spaces">  </span><span class="nottickedoff">,Jogador (1,3) D 1 0 0</span>
<span class="lineno">  349 </span><span class="spaces">  </span><span class="nottickedoff">,Jogador (3,1) D 0 0 0</span>
<span class="lineno">  350 </span><span class="spaces">  </span><span class="nottickedoff">,Jogador (3,3) D 1 0 0</span>
<span class="lineno">  351 </span><span class="spaces">  </span><span class="nottickedoff">]</span>
<span class="lineno">  352 </span><span class="spaces">  </span><span class="nottickedoff">[]</span></span>
<span class="lineno">  353 </span>
<span class="lineno">  354 </span><span class="decl"><span class="nottickedoff">competicaoT3Estado03 = Estado</span>
<span class="lineno">  355 </span><span class="spaces">  </span><span class="nottickedoff">(mapa4)</span>
<span class="lineno">  356 </span><span class="spaces">  </span><span class="nottickedoff">[Jogador (1,1) D 1 0 0</span>
<span class="lineno">  357 </span><span class="spaces">  </span><span class="nottickedoff">,Jogador (4,7) D 1 0 0</span>
<span class="lineno">  358 </span><span class="spaces">  </span><span class="nottickedoff">]</span>
<span class="lineno">  359 </span><span class="spaces">  </span><span class="nottickedoff">[DisparoCanhao 0 (1,1) D]</span></span>
<span class="lineno">  360 </span>
<span class="lineno">  361 </span><span class="decl"><span class="nottickedoff">competicaoT3Estado04 = Estado</span>
<span class="lineno">  362 </span><span class="spaces">  </span><span class="nottickedoff">(mapa4)</span>
<span class="lineno">  363 </span><span class="spaces">  </span><span class="nottickedoff">[Jogador (1,1) B 1 0 0</span>
<span class="lineno">  364 </span><span class="spaces">  </span><span class="nottickedoff">,Jogador (1,6) E 1 0 0</span>
<span class="lineno">  365 </span><span class="spaces">  </span><span class="nottickedoff">,Jogador (4,1) D 1 0 0</span>
<span class="lineno">  366 </span><span class="spaces">  </span><span class="nottickedoff">]</span>
<span class="lineno">  367 </span><span class="spaces">  </span><span class="nottickedoff">[DisparoCanhao 0 (2,1) B</span>
<span class="lineno">  368 </span><span class="spaces">  </span><span class="nottickedoff">,DisparoCanhao 1 (3,1) C]</span></span>
<span class="lineno">  369 </span>
<span class="lineno">  370 </span><span class="decl"><span class="nottickedoff">competicaoT3Estado05 = Estado</span>
<span class="lineno">  371 </span><span class="spaces">  </span><span class="nottickedoff">(mapa5)</span>
<span class="lineno">  372 </span><span class="spaces">  </span><span class="nottickedoff">[Jogador ( 2, 1) B 99 45 99</span>
<span class="lineno">  373 </span><span class="spaces">  </span><span class="nottickedoff">,Jogador (10, 3) E   2  2    0</span>
<span class="lineno">  374 </span><span class="spaces">  </span><span class="nottickedoff">,Jogador ( 4,21) B   1  0    4</span>
<span class="lineno">  375 </span><span class="spaces">  </span><span class="nottickedoff">,Jogador (10,18) E  42  8    0</span>
<span class="lineno">  376 </span><span class="spaces">  </span><span class="nottickedoff">]</span>
<span class="lineno">  377 </span><span class="spaces">  </span><span class="nottickedoff">[DisparoCanhao 2 ( 4,21) B</span>
<span class="lineno">  378 </span><span class="spaces">  </span><span class="nottickedoff">,DisparoCanhao 2 ( 5,21) B</span>
<span class="lineno">  379 </span><span class="spaces">  </span><span class="nottickedoff">,DisparoCanhao 2 ( 6,21) B</span>
<span class="lineno">  380 </span><span class="spaces">  </span><span class="nottickedoff">,DisparoCanhao 0 ( 3, 1) B</span>
<span class="lineno">  381 </span><span class="spaces">  </span><span class="nottickedoff">,DisparoCanhao 1 (10, 7) D</span>
<span class="lineno">  382 </span><span class="spaces">  </span><span class="nottickedoff">,DisparoCanhao 1 (10, 8) D</span>
<span class="lineno">  383 </span><span class="spaces">  </span><span class="nottickedoff">]</span></span>
<span class="lineno">  384 </span>
<span class="lineno">  385 </span><span class="decl"><span class="nottickedoff">competicaoT3Estado06 = Estado</span>
<span class="lineno">  386 </span><span class="spaces">  </span><span class="nottickedoff">(mapa6)</span>
<span class="lineno">  387 </span><span class="spaces">  </span><span class="nottickedoff">[Jogador ( 2,11) D 2 11 0</span>
<span class="lineno">  388 </span><span class="spaces">  </span><span class="nottickedoff">,Jogador ( 8,18) E 0  2 0</span>
<span class="lineno">  389 </span><span class="spaces">  </span><span class="nottickedoff">,Jogador (16, 9) D 1  0 4</span>
<span class="lineno">  390 </span><span class="spaces">  </span><span class="nottickedoff">,Jogador ( 9,17) B 2  1 1</span>
<span class="lineno">  391 </span><span class="spaces">  </span><span class="nottickedoff">]</span>
<span class="lineno">  392 </span><span class="spaces">  </span><span class="nottickedoff">[DisparoChoque 0 4</span>
<span class="lineno">  393 </span><span class="spaces">  </span><span class="nottickedoff">,DisparoLaser  2 (16,12) D</span>
<span class="lineno">  394 </span><span class="spaces">  </span><span class="nottickedoff">,DisparoCanhao 3 (10,17) B</span>
<span class="lineno">  395 </span><span class="spaces">  </span><span class="nottickedoff">]</span></span>
<span class="lineno">  396 </span>
<span class="lineno">  397 </span><span class="decl"><span class="nottickedoff">competicaoT3Estado07 = Estado</span>
<span class="lineno">  398 </span><span class="spaces">  </span><span class="nottickedoff">(mapa7)</span>
<span class="lineno">  399 </span><span class="spaces">  </span><span class="nottickedoff">[Jogador ( 6, 8) D 6 9 2</span>
<span class="lineno">  400 </span><span class="spaces">  </span><span class="nottickedoff">,Jogador (11, 1) C 1 2 3</span>
<span class="lineno">  401 </span><span class="spaces">  </span><span class="nottickedoff">,Jogador (16,15) E 4 5 6</span>
<span class="lineno">  402 </span><span class="spaces">  </span><span class="nottickedoff">,Jogador ( 9,26) B 7 8 9</span>
<span class="lineno">  403 </span><span class="spaces">  </span><span class="nottickedoff">]</span>
<span class="lineno">  404 </span><span class="spaces">  </span><span class="nottickedoff">[DisparoChoque 3 2]</span></span>
<span class="lineno">  405 </span>
<span class="lineno">  406 </span><span class="decl"><span class="nottickedoff">competicaoT3Estado08 = Estado</span>
<span class="lineno">  407 </span><span class="spaces">  </span><span class="nottickedoff">(mapa8)</span>
<span class="lineno">  408 </span><span class="spaces">  </span><span class="nottickedoff">[Jogador ( 1,10) D 5 0 1</span>
<span class="lineno">  409 </span><span class="spaces">  </span><span class="nottickedoff">,Jogador (25,63) C 5 0 0</span>
<span class="lineno">  410 </span><span class="spaces">  </span><span class="nottickedoff">]</span>
<span class="lineno">  411 </span><span class="spaces">  </span><span class="nottickedoff">[DisparoChoque 1 2]</span></span>
<span class="lineno">  412 </span>
<span class="lineno">  413 </span><span class="decl"><span class="nottickedoff">competicaoT3Estado09 = Estado</span>
<span class="lineno">  414 </span><span class="spaces">  </span><span class="nottickedoff">(mapa9)</span>
<span class="lineno">  415 </span><span class="spaces">  </span><span class="nottickedoff">[Jogador ( 1,10) D 5 0 1</span>
<span class="lineno">  416 </span><span class="spaces">  </span><span class="nottickedoff">,Jogador (25,63) C 5 0 0</span>
<span class="lineno">  417 </span><span class="spaces">  </span><span class="nottickedoff">]</span>
<span class="lineno">  418 </span><span class="spaces">  </span><span class="nottickedoff">[DisparoChoque 1 2]</span></span>
<span class="lineno">  419 </span> 
<span class="lineno">  420 </span><span class="decl"><span class="nottickedoff">competicaoT3Estado10 = Estado</span>
<span class="lineno">  421 </span><span class="spaces">  </span><span class="nottickedoff">(mapa10)</span>
<span class="lineno">  422 </span><span class="spaces">  </span><span class="nottickedoff">[Jogador ( 1,1) D 5 0 1</span>
<span class="lineno">  423 </span><span class="spaces">  </span><span class="nottickedoff">,Jogador (2,64) E 5 0 0</span>
<span class="lineno">  424 </span><span class="spaces">  </span><span class="nottickedoff">]</span>
<span class="lineno">  425 </span><span class="spaces">  </span><span class="nottickedoff">([DisparoChoque 0 2,DisparoChoque 1 4]</span>
<span class="lineno">  426 </span><span class="spaces">  </span><span class="nottickedoff">++ map (\i -&gt; DisparoCanhao 0 (1,i) D) [2..63]</span>
<span class="lineno">  427 </span><span class="spaces">  </span><span class="nottickedoff">++ map (\i -&gt; DisparoCanhao 1 (2,i) E) [2..63])</span></span>
<span class="lineno">  428 </span>
<span class="lineno">  429 </span><span class="decl"><span class="nottickedoff">competicaoT3Estado11 = Estado</span>
<span class="lineno">  430 </span><span class="spaces">  </span><span class="nottickedoff">(mapa11)</span>
<span class="lineno">  431 </span><span class="spaces">  </span><span class="nottickedoff">[Jogador ( 1,1) D 5 2 1</span>
<span class="lineno">  432 </span><span class="spaces">  </span><span class="nottickedoff">,Jogador (1,64) C 5 2 0</span>
<span class="lineno">  433 </span><span class="spaces">  </span><span class="nottickedoff">]</span>
<span class="lineno">  434 </span><span class="spaces">  </span><span class="nottickedoff">[]</span></span>
<span class="lineno">  435 </span>  
<span class="lineno">  436 </span><span class="decl"><span class="nottickedoff">competicaoT3Estado12 = Estado</span>
<span class="lineno">  437 </span><span class="spaces">  </span><span class="nottickedoff">(mapa12)</span>
<span class="lineno">  438 </span><span class="spaces">  </span><span class="nottickedoff">[Jogador ( 1,1) D 5 2 1</span>
<span class="lineno">  439 </span><span class="spaces">  </span><span class="nottickedoff">,Jogador (4,1) C 5 2 0</span>
<span class="lineno">  440 </span><span class="spaces">  </span><span class="nottickedoff">,Jogador (4,3) C 5 2 0</span>
<span class="lineno">  441 </span><span class="spaces">  </span><span class="nottickedoff">]</span>
<span class="lineno">  442 </span><span class="spaces">  </span><span class="nottickedoff">[]</span></span>
<span class="lineno">  443 </span>  
<span class="lineno">  444 </span><span class="decl"><span class="nottickedoff">competicaoT3Estado13 = Estado</span>
<span class="lineno">  445 </span><span class="spaces">  </span><span class="nottickedoff">(mapa13)</span>
<span class="lineno">  446 </span><span class="spaces">  </span><span class="nottickedoff">[]</span>
<span class="lineno">  447 </span><span class="spaces">  </span><span class="nottickedoff">[]</span></span>
<span class="lineno">  448 </span>
<span class="lineno">  449 </span>testesT4 :: [Estado]
<span class="lineno">  450 </span><span class="decl"><span class="nottickedoff">testesT4 = [estado1,estado2,estado3]</span></span>

</pre>


</body></html>
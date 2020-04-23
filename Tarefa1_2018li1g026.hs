
-- | Este módulo define funções comuns da Tarefa 1 do trabalho prático.

module Tarefa1_2018li1g026 where

import LI11819
import Tarefa0_2018li1g026
import AuxiliaresT1

-- * Testes

-- | Testes unitários da Tarefa 1.
--
-- Cada teste é uma sequência de 'Instrucoes'.

testesT1 :: [Instrucoes]
testesT1 = [[Roda,Roda,Roda,Roda,MudaTetromino,Roda,Roda,Roda,Roda,MudaTetromino,Roda,Roda,Roda,Roda,MudaTetromino,Roda,Roda,Roda,Roda,MudaTetromino,Roda,Roda,Roda,Roda,MudaTetromino,Roda,Roda,Roda,Roda,MudaTetromino,Roda,Roda,Roda,Roda,MudaTetromino,Move C,Move E,Move D,Move D,Move B,Move B,Move E,Move E,Move E,Move B,Desenha,MudaTetromino,Desenha,MudaTetromino,Desenha,MudaTetromino,Desenha,MudaTetromino,Desenha,MudaTetromino,Desenha,MudaTetromino,Desenha,MudaTetromino,Desenha,MudaTetromino,Desenha,MudaTetromino,Desenha,MudaTetromino,Desenha,MudaTetromino,Desenha,MudaTetromino,Desenha,MudaTetromino,Desenha,Move D,Move D,Move D,Move D,MudaTetromino,Desenha,MudaTetromino,MudaTetromino,MudaTetromino,Move D,Move D,Move B,Move B,Desenha,Move C,Move C,Desenha,Move C,Move C,Desenha,MudaParede,Move E,Desenha,Move E,Desenha,Move E,Desenha,Move E,Desenha,Move E,Move E,Desenha,Move B,Desenha,Move B,Desenha,Move B,Desenha,Move B,Move B,Move D,Desenha,Move D,Desenha,Move D,Desenha,Move D,Desenha,Move C,Move C,Desenha,Move C,Move C,Move D,Desenha,Move D,Desenha],
            [Move C,Move E,Move D,Move D,Move B,Move B,Move E,Move C,Move E,Roda,Roda,Roda,Roda,Roda,Roda,Roda,Roda,Roda,Roda,Roda,Roda,Desenha,Roda,Desenha,Roda,Desenha,Roda,Desenha,MudaTetromino,Desenha,Roda,Desenha,Roda,Desenha,Roda,Desenha,MudaTetromino,Desenha,Roda,Desenha,Roda,Desenha,Roda,Desenha,MudaTetromino,Desenha,Roda,Desenha,Desenha,Roda,Desenha,Roda,Desenha,Desenha,Roda,Desenha,Roda,MudaTetromino,Desenha,Roda,Desenha,Roda,Desenha,Roda,Desenha,Roda,Desenha,Roda,Desenha,MudaTetromino,Roda,Desenha,Roda,Desenha,Roda,Desenha,Roda,Desenha,Roda,Desenha,MudaTetromino,Desenha,Roda,Desenha,Roda,Roda,Desenha,Roda,Desenha,Roda,Desenha,Roda,Move C,Move D,Move D,Move D,MudaTetromino,Desenha,Roda,Move E,Move E,Move C,Desenha,Roda,Roda,Move D,Move D,Desenha,Move C,Move B,Move E,Move E,Move E,Desenha,Move C,Move C,Roda,Roda,MudaTetromino,MudaTetromino,MudaTetromino,Desenha,Move D,Move D,Move D,Move D,Move D,Desenha,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Desenha,Move E,Move E,Move E,Move E,Move E,Desenha,MudaParede,Move E,Move E,Move E,Move E,Move E,Desenha,Move C,Move C,Desenha,Move C,Move C,Desenha,Desenha,Move C,Move C,Desenha,Move C,Desenha,Move D,Desenha,Move D,Desenha,Move B,Move B,Desenha,Move B,Desenha,Move B,Desenha,Move B,Desenha,Move B,Desenha,Move B,Desenha,Move D,Move D,Desenha,Move C,Desenha,Move C,Desenha,Move C,Desenha,Move C,Desenha,Move C,Desenha,Move C,Desenha,Move C,Desenha,Move D,Move D,Desenha,Move B,Desenha,Move B,Desenha,Move B,Desenha,Move B,Desenha,Move B,Desenha,Move B,Desenha,Move B,Desenha,Move D,Move D,Desenha,Move C,Desenha,Move C,Desenha,Move C,Desenha,Move C,Desenha,Move C,Desenha,Move C,Desenha,Move C,Desenha,Move D,Move D,Desenha,Move B,Desenha,Move B,Desenha,Move B,Desenha,Move B,Desenha,Move B,Desenha,Move B,Move B,Desenha,Move E,Move E,Move E,Move E,Move E,Move E,MudaParede,Move E,Move E,Move E,Move E,Move E,Move E,Move C,Move C,Move C,Move C,Move D,Move C,Move C,Move B,Move C,Move B,Move B,Move B,Move B,Move B,Move D,Move D,Move E,Move E,Move C,Move C,Move C,Move C,Move C,Desenha,Move B,Desenha,Move B,Desenha,Move B,Desenha,Move B,Desenha,Move B,Desenha,Move D,Desenha,Move D,Desenha,Move D,Move D,Move D,Desenha,Move D,Desenha,Move C,Desenha,Move C,Desenha,Move C,Desenha,Move C,Desenha,Move C,Desenha,Move E,Desenha,Move D,Move D,Desenha,Move B,Move B,Move B,Move B,Move B,Desenha,Move E,Move C,Move C,Move C,Move C,Move C,Move D,Move D,Move D,Move D,Desenha,Move B,Desenha,Move B,Desenha,Move B,Desenha,Move B,Desenha,Move B,Desenha,Move E,Move E,Move E,Move E,Move E,Move E,MudaParede,Move E,Move E,Move E,Move E,Move E,Move B,Desenha,Move C,Move C,Desenha,Move C,Desenha,Move C,Desenha,Move C,Desenha,Move C,Desenha,Move C,Desenha,MudaParede,Move B,Move D,Desenha,Move B,Desenha,Move B,Desenha,Move B,Desenha,Move B,Move B,Desenha,Desenha],
            [Move E,Move C,Move E,Move C,Move E,Move D,Move D,Move D,Move D,Move D,Move B,Move B,Move B,Move B,Move E,Move E,Move E,Move E,Move E,Move E,Move E],
            [MudaTetromino,MudaTetromino,MudaTetromino,MudaTetromino,MudaTetromino,MudaTetromino,MudaParede,Desenha,Roda,Desenha,Roda,Move B,Desenha,Roda,Desenha,Roda,Desenha,Roda,Desenha,Roda,Desenha,Roda,Desenha,Roda,Desenha]]

-- * Funções principais da Tarefa 1.

-- | Aplica uma 'Instrucao' num 'Editor'.
--
--    * 'Move' - move numa dada 'Direcao'.
--
--    * 'MudaTetromino' - seleciona a 'Peca' seguinte (usar a ordem léxica na estrutura de dados),
--       sem alterar os outros parâmetros.
--
--    * 'MudaParede' - muda o tipo de 'Parede'.
--
--    * 'Desenha' - altera o 'Mapa' para incluir o 'Tetromino' atual, sem alterar os outros parâmetros.

instrucao :: Instrucao -- ^ A 'Instrucao' a aplicar.
          -> Editor    -- ^ O 'Editor' anterior.
          -> Editor    -- ^ O 'Editor' resultante após aplicar a 'Instrucao'.

instrucao i (Editor (l,c) d t p m) | i == Move C && l > 0                               = Editor (l-1,c) d t p m
                                   | i == Move B && l < ultimaLinha  (dimensaoMatriz m) = Editor (l+1,c) d t p m
                                   | i == Move D && c < ultimaColuna (dimensaoMatriz m) = Editor (l,c+1) d t p m
                                   | i == Move E && c > 0                               = Editor (l,c-1) d t p m
                                   | i == Roda                                          = Editor (l,c) (editorDirecao d) t p m
                                   | i == MudaTetromino                                 = Editor (l,c) d (editorTetromino t) p m
                                   | i == MudaParede                                    = Editor (l,c) d t (editorParede p) m
                                   | i == Desenha                                       = Editor (l,c) d t p (editorDesenha (l,c) d t p m) 

-- | Aplica uma sequência de 'Instrucoes' num 'Editor'.
--
-- __NB:__ Deve chamar a função 'instrucao'.

instrucoes :: Instrucoes -- ^ As 'Instrucoes' a aplicar.
           -> Editor     -- ^ O 'Editor' anterior.
           -> Editor     -- ^ O 'Editor' resultante após aplicar as 'Instrucoes'.

instrucoes [] e    = e
instrucoes (h:t) e = instrucoes t (instrucao h e) 

-- | Cria um 'Mapa' inicial com 'Parede's nas bordas e o resto vazio.

mapaInicial :: Dimensao -- ^ A 'Dimensao' do 'Mapa' a criar.
            -> Mapa     -- ^ O 'Mapa' resultante com a 'Dimensao' dada.

mapaInicial (l,c) = desenhaBordasB (l,c) (desenhaBordasE (l,c) (desenhaBordasD (l,c) (desenhaBordasC (l,c) (mapaVazio (l,c)))))

-- | Cria um 'Editor' inicial.
--
-- __NB:__ Deve chamar as funções 'mapaInicial', 'dimensaoInicial', e 'posicaoInicial'.

editorInicial :: Instrucoes  -- ^ Uma sequência de 'Instrucoes' de forma a poder calcular a  'dimensaoInicial' e a 'posicaoInicial'.
              -> Editor      -- ^ O 'Editor' inicial, usando a 'Peca' 'I' 'Indestrutivel' voltada para 'C'.
 
editorInicial ins = Editor (posicaoInicial ins) C I Indestrutivel (mapaInicial (dimensaoInicial ins))  

-- | Constrói um 'Mapa' dada uma sequência de 'Instrucoes'.
--
-- __NB:__ Deve chamar as funções 'Instrucoes' e 'editorInicial'.

constroi :: Instrucoes -- ^ Uma sequência de 'Instrucoes' dadas a um 'Editor' para construir um 'Mapa'.
         -> Mapa       -- ^ O 'Mapa' resultante.

constroi ins = mapaFinal (instrucoes ins (editorInicial ins))





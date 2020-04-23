-- | Este módulo define funções comuns da Tarefa 2 do trabalho prático.
module Tarefa2_2018li1g026 where

import LI11819
import AuxiliaresT1
import Tarefa0_2018li1g026
import Tarefa1_2018li1g026
import AuxiliaresT2


-- * Testes

-- | Testes unitários da Tarefa 2.
--
-- Cada teste é um triplo (/identificador do 'Jogador'/,/'Jogada' a efetuar/,/'Estado' anterior/).
testesT2 :: [(Int,Jogada,Estado)]
testesT2 = [(1,Movimenta D,     Estado mapa [Jogador (2,2) D 1 1 1,Jogador (2,6) D 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Movimenta D,     Estado mapa [Jogador (2,2) D 1 1 1,Jogador (2,6) E 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Movimenta C,     Estado mapa [Jogador (2,2) D 1 1 1,Jogador (2,6) C 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Movimenta B,     Estado mapa [Jogador (2,2) D 1 1 1,Jogador (2,6) B 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Movimenta E,     Estado mapa [Jogador (2,2) D 1 1 1,Jogador (2,6) E 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Movimenta C,     Estado mapa [Jogador (4,3) D 1 1 1,Jogador (1,1) C 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Movimenta C,     Estado mapa [Jogador (4,3) D 1 1 1,Jogador (9,12) D 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Movimenta C,     Estado mapa [Jogador (4,3) D 1 1 1,Jogador (1,1) E 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Movimenta C,     Estado mapa [Jogador (4,3) D 1 1 1,Jogador (9,12) B 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Movimenta D,     Estado mapa2 [Jogador (2,2) D 1 1 1,Jogador (5,5) D 1 1 1,Jogador (6,2) D 1 1 1,Jogador (8,8) D 1 1 1] []),
            (1,Movimenta B,     Estado mapa [Jogador (2,2) D 1 1 1,Jogador (2,6) D 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Movimenta C,     Estado mapa [Jogador (6,6) D 1 1 1,Jogador (1,1) D 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Movimenta C,     Estado mapa [Jogador (6,6) E 1 1 1,Jogador (1,1) D 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Movimenta C,     Estado mapa [Jogador (1,3) E 1 1 1,Jogador (3,3) C 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Movimenta C,     Estado mapa [Jogador (6,6) B 1 1 1,Jogador (1,1) D 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Movimenta C,     Estado mapa [Jogador (6,6) C 1 1 1,Jogador (1,1) D 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Movimenta C,     Estado mapa [Jogador (2,2) D 1 1 1,Jogador (2,6) D 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Movimenta E,     Estado mapa [Jogador (2,2) D 1 1 1,Jogador (2,6) D 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Dispara Canhao,  Estado mapa [Jogador (2,2) D 1 1 1,Jogador (2,6) D 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Dispara Canhao,  Estado mapa [Jogador (2,2) E 1 1 1,Jogador (2,6) E 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Dispara Canhao,  Estado mapa [Jogador (2,2) C 1 1 1,Jogador (2,6) C 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Dispara Canhao,  Estado mapa [Jogador (2,2) B 1 1 1,Jogador (2,6) B 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Dispara Laser,   Estado mapa [Jogador (2,2) D 1 1 1,Jogador (2,6) D 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (0,Movimenta D,     Estado [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]] [Jogador (1,9) D 1 1 1,Jogador (3,3) D 1 1 1,Jogador (5,5) D 1 1 1,Jogador (7,7) D 1 1 1] []),
            (1,Dispara Choque,  Estado mapa [Jogador (2,2) D 1 1 1,Jogador (2,6) D 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Dispara Canhao,  Estado mapa [Jogador (2,2) D 1 1 1,Jogador (2,6) D 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Movimenta D,     Estado mapa [Jogador (2,2) D 1 1 1,Jogador (2,4) D 1 1 1,Jogador (2,6) D 1 1 1,Jogador (5,5) D 1 1 1] []),
            (1,Movimenta D,     Estado mapa [Jogador (4,2) D 1 1 1,Jogador (2,5) D 1 1 1,Jogador (4,6) D 1 1 1,Jogador (6,5) D 1 1 1] [DisparoCanhao 3 (2,6) E]),
            (1,Movimenta D,     Estado mapa [Jogador (2,2) D 1 1 1,Jogador (2,6) D 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] [DisparoChoque 1 5]),
            (3,Movimenta D,     Estado mapa [Jogador (2,2) D 1 1 1,Jogador (2,6) D 1 1 1,Jogador (6,2) D 1 1 1,Jogador (5,5) D 1 1 1] [DisparoChoque 1 5])]
            where
                mapa = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]]
                mapa2 = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]]


-- * Funções principais da Tarefa 2.

-- | Efetua uma jogada.
jogada :: Int -- ^ O identificador do 'Jogador' que efetua a jogada.
       -> Jogada -- ^ A 'Jogada' a efetuar.
       -> Estado -- ^ O 'Estado' anterior.
       -> Estado -- ^ O 'Estado' resultante após o jogador efetuar a jogada.
jogada n jogada (Estado mapa jogadores disparos)
    | isAlive (escolheJogador n jogadores) && isBloco (escolheJogador n jogadores) mapa == False    && temLaser (escolheJogador n jogadores)    && jogada == Dispara Laser  = Estado mapa (atualizaJogadores n (alteraJogador n mapa disparos jogada (escolheJogador n jogadores) jogadores) jogadores) ((criaDisparo n (escolheJogador n jogadores) jogada):disparos)
    | isAlive (escolheJogador n jogadores) && isBloco (escolheJogador n jogadores) mapa == False                                                && jogada == Dispara Canhao = Estado mapa (atualizaJogadores n (alteraJogador n mapa disparos jogada (escolheJogador n jogadores) jogadores) jogadores) ((criaDisparo n (escolheJogador n jogadores) jogada):disparos)
    | isAlive (escolheJogador n jogadores)                                                          && temChoque (escolheJogador n jogadores)   && jogada == Dispara Choque = Estado mapa (atualizaJogadores n (alteraJogador n mapa disparos jogada (escolheJogador n jogadores) jogadores) jogadores) ((criaDisparo n (escolheJogador n jogadores) jogada):disparos)
    | isAlive (escolheJogador n jogadores) == False                                                                 = Estado mapa jogadores disparos 
    | otherwise = Estado mapa (atualizaJogadores n (alteraJogador n mapa disparos jogada (escolheJogador n jogadores) jogadores) jogadores) disparos


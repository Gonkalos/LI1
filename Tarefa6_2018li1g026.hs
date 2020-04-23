
-- | Este módulo define funções comuns da Tarefa 6 do trabalho prático.

module Tarefa6_2018li1g026 where

import LI11819
import Tarefa4_2018li1g026
import AuxiliaresT4

-- * Funções principais da Tarefa 6.

-- | Define um ro'bot' capaz de jogar autonomamente o jogo.
bot :: Int          -- ^ O identificador do 'Jogador' associado ao ro'bot'.
    -> Estado       -- ^ O 'Estado' para o qual o ro'bot' deve tomar uma decisão.
    -> Maybe Jogada -- ^ Uma possível 'Jogada' a efetuar pelo ro'bot'.
bot = undefined


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- | Verifica se o bot deve disparar um laser

disparaLaser :: Int -> Estado -> Maybe Jogada
disparaLaser j (Estado m js ds) = case (dirJogador j js) == C && (lsJogador j js) > 0 && disparaLaserC j (Estado m js ds)
                                    || (dirJogador j js) == D && (lsJogador j js) > 0 && disparaLaserD j (Estado m js ds)
                                    || (dirJogador j js) == B && (lsJogador j js) > 0 && disparaLaserB j (Estado m js ds)
                                    || (dirJogador j js) == E && (lsJogador j js) > 0 && disparaLaserE j (Estado m js ds) of
                                    True  -> Just (Dispara Laser)
                                    False -> Nothing


-- | Verifica se o bot deve disparar um laser para cima

disparaLaserC :: Int -> Estado -> Bool
disparaLaserC j (Estado _ js _) | comparaVidasJ js (colisaoLaser2 (DisparoLaser j (posDisparo3 C (posDisparo2 j js)) C) js) = False
                                | otherwise = True 


-- | Verifica se o bot deve disparar um laser para a direita

disparaLaserD :: Int -> Estado -> Bool
disparaLaserD j (Estado _ js _) | comparaVidasJ js (colisaoLaser2 (DisparoLaser j (posDisparo3 D (posDisparo2 j js)) C) js) = False
                                | otherwise = True


-- | Verifica se o bot deve disparar um laser para baixo

disparaLaserB :: Int -> Estado -> Bool
disparaLaserB j (Estado _ js _) | comparaVidasJ js (colisaoLaser2 (DisparoLaser j (posDisparo3 B (posDisparo2 j js)) B) js) = False
                                | otherwise = True


-- | Verifica se o bot deve disparar um laser para a esquerda

disparaLaserE :: Int -> Estado -> Bool
disparaLaserE j (Estado _ js _) | comparaVidasJ js (colisaoLaser2 (DisparoLaser j (posDisparo3 E (posDisparo2 j js)) E) js) = False
                                | otherwise = True

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- | Retoma a posição de um jogador numa lista de jogadores

posDisparo2 :: Int -> [Jogador] -> Posicao
posDisparo2 j (h:t) | j == 0    = posJogador h
                    | otherwise = posDisparo2 (j-1) t


-- | Retoma a posição de um disparo segundo a posição e direção do jogador

posDisparo3 :: Direcao -> Posicao -> Posicao
posDisparo3 d (l,c) = case d of
                        C -> (l-1,c)
                        D -> (l,c+1)
                        B -> (l+1,c)
                        E -> (l,c-1)


-- | Retoma a lista de jogadores de um estado

jogadores :: Estado -> [Jogador]
jogadores (Estado m js ds) = js


-- | Retoma a direção de um jogador

dirJogador :: Int -> [Jogador] -> Direcao
dirJogador j ((Jogador _ d _ _ _):t) | j == 0 = d
                                     | otherwise = dirJogador (j-1) t 


-- | Retoma os laser de um jogador

lsJogador :: Int -> [Jogador] -> Int
lsJogador j ((Jogador _ _ _ ls _):t) | j == 0 = ls
                                     | otherwise = lsJogador (j-1) t 







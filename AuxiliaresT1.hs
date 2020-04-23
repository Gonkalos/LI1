
-- | Este módulo define funções auxiliares da Tarefa 1 do trabalho prático.

module AuxiliaresT1 where

import LI11819
import Tarefa0_2018li1g026

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- | Desenha a borda vertical da direita

desenhaBordasD :: Dimensao -- ^ Dimensão do mapa
               -> Mapa     -- ^ Mapa a adicionar borda 
               -> Mapa     -- ^ Mapa com borda na direita

desenhaBordasD (1,c) (h:t) = desenhaPeca (Bloco Indestrutivel) (0,c-1) (h:t)
desenhaBordasD (l,c) (h:t) = desenhaBordasD (l-1,c) (desenhaPeca (Bloco Indestrutivel) (l-1,c-1) (h:t))


-- | Desenha a borda vertical da esquerda

desenhaBordasE :: Dimensao -- ^ Dimensão do mapa 
               -> Mapa     -- ^ Mapa a adicionar borda
               -> Mapa     -- ^ Mapa com borda na esquerda

desenhaBordasE (1,c) (h:t) = desenhaPeca (Bloco Indestrutivel) (0,0) (h:t)
desenhaBordasE (l,c) (h:t) = desenhaBordasE (l-1,c) (desenhaPeca (Bloco Indestrutivel) (l-1,0) (h:t))


-- | Desenha a borda horizontal de cima

desenhaBordasC :: Dimensao -- ^ Dimensão do mapa
               -> Mapa     -- ^ Mapa a adicionar borda
               -> Mapa     -- ^ Mapa com borda em cima

desenhaBordasC (l,c) (h:t) = (desenhaLinhaBorda c):t


-- | Desenha a borda horizontal de baixo

desenhaBordasB :: Dimensao -- ^ Dimensão do mapa
               -> Mapa     -- ^ Mapa a adicionar borda
               -> Mapa     -- ^ Mapa com borda em cima

desenhaBordasB (l,c) (h:t) | l == 1 = [desenhaLinhaBorda c]
                           | otherwise = h:desenhaBordasB (l-1,c) t


-- | Desenha uma peça em um mapa

desenhaPeca :: Peca    -- ^ Peça a desenhar
            -> Posicao -- ^ Posição da peça
            -> Mapa    -- ^ Mapa a onde desenhar a peça  
            -> Mapa    -- ^ Mapa com a peça desenhada

desenhaPeca p (l,c) (h:t) | l /= 0 = h:desenhaPeca p (l-1,c) t
                          | l == 0 = (atualizaIndiceLista c p h):t


-- | Desenha uma linha de Blocos Indestrutiveis 

desenhaLinhaBorda :: Int    -- ^ Número de colunas da linha
                  -> [Peca] -- ^ Linha de Blocos Indestrutíveis

desenhaLinhaBorda 0 = []
desenhaLinhaBorda c = (Bloco Indestrutivel):desenhaLinhaBorda (c-1)


-- | Desenha uma linha de Vazias

mapaVazioX :: Int    -- ^ Número de colunas da linha
           -> [Peca] -- ^ Linha de Vazias

mapaVazioX 0 = []
mapaVazioX c = Vazia:mapaVazioX (c-1)


-- | Desenha um mapa formado de Vazias

mapaVazio :: Dimensao -- ^ Dimensão do mapa
          -> Mapa     -- ^ Mapa de Vazias

mapaVazio (l,c) = (mapaVazioX c):mapaVazio (l-1,c)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- | Muda a direção de um Editor

editorDirecao :: Direcao -- ^ Direção inicial
              -> Direcao -- ^ Direção final

editorDirecao d | d == C = D
                | d == D = B
                | d == B = E
                | d == E = C

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- | Muda um tetromino para o seguinte

editorTetromino :: Tetromino -- ^ Tetromino inicial
                -> Tetromino -- ^ Tetromino final

editorTetromino t | t == I = J
                  | t == J = L
                  | t == L = O
                  | t == O = S
                  | t == S = T
                  | t == T = Z
                  | t == Z = I

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- | Muda uma parede para a seguinte

editorParede :: Parede -- ^ Parede inicial
             -> Parede -- ^ Parede final

editorParede p | p == Indestrutivel = Destrutivel
               | otherwise = Indestrutivel

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Adiciona uma linha na parte de cima do mapa
--addLinhaC :: Dimensao -> Mapa -> Mapa
--addLinhaC d [] = []
--addLinhaC (l,c) (h:t) = h:((addLinha c):t)

--Adiciona uma linha na parte de baixo do mapa
--addLinhaB :: Dimensao -> Mapa -> Mapa
--addLinhaB d [] = []
--addLinhaB (l,c) (h:t) | l == 2 = h:((addLinha c):t)
--                      | otherwise = h:(addLinhaB (l-1,c) t)

-- Cria uma linha vazia com bordas
--addLinha :: Int -> [Peca]
--addLinha c = [Bloco Indestrutivel] ++ (addLinha2 c) ++ [Bloco Indestrutivel] 

--addLinha2 :: Int -> [Peca]
--addLinha2 c | c-2 > 0 = [Vazia] ++ addLinha2 (c-1)
--            | otherwise = [] 

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Adiciona uma coluna vazia no lado direito
--addColunaD :: Dimensao -> Int -> Mapa -> Mapa
--addColunaD d p [] = []
--addColunaD (l,c) p (h:t) | p == 0 || p == l-1 = (addPecaLista D (Bloco Indestrutivel) (l,c) h):(addColunaD (l,c) (p+1) t)
--                         | otherwise = (addPecaLista D Vazia (l,c) h):(addColunaD (l,c) (p+1) t)

-- Adiciona uma coluna vazia no lado esquerdo
--addColunaE :: Dimensao -> Int -> Mapa -> Mapa
--addColunaE d p [] = []
--addColunaE (l,c) p (h:t) | p == 0 || p == l-1 = (addPecaLista E (Bloco Indestrutivel) (l,c) h):(addColunaE (l,c) (p+1) t)
--                         | otherwise = (addPecaLista E Vazia (l,c) h):(addColunaE (l,c) (p+1) t)

-- Adiciona uma peça a uma lista de peças
--addPecaLista :: Direcao -> Peca -> Dimensao -> [Peca] -> [Peca]
--addPecaLista dr p dm [] = []
--addPecaLista dr p (l,c) (h:t) | dr == D && c-1 == 0 = p:(h:t)
--                              | dr == D && c-1 /= 0 = h:(addPecaLista dr p (l,c-1) t)
--                              | otherwise = h:(p:t)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- | Retorna a última linha jogável

ultimaLinha :: Dimensao -- ^ Dimensão do mapa
            -> Int      -- ^ Número da última linha jogável

ultimaLinha (l,c) = l-1


-- | Retoma a última coluna jogável

ultimaColuna :: Dimensao -- ^ Dimensão do mapa
             -> Int      -- ^ Número da última coluna jogável

ultimaColuna (l,c) = c-1

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- | Desenha um tetromino num mapa

editorDesenha :: Posicao   -- ^ Posição do Tetromino
              -> Direcao   -- ^ Direção do Tetromino
              -> Tetromino -- ^ Tetromino a desenhar
              -> Parede    -- ^ Parede do Tetromino
              -> Mapa      -- ^ Mapa a onde desenhar o Tetromino
              -> Mapa      -- ^ Mapa com o Tetromino desenhado

editorDesenha (l,c) d t p m | t == I = desenhaI (l,c) d p m
                            | t == J = desenhaJ (l,c) d p m
                            | t == L = desenhaL (l,c) d p m
                            | t == O = desenhaO (l,c) d p m
                            | t == S = desenhaS (l,c) d p m
                            | t == T = desenhaT (l,c) d p m
                            | t == Z = desenhaZ (l,c) d p m


-- | Desenha o tetromino I num mapa

desenhaI :: Posicao -- ^ Posição do Tetromino
         -> Direcao -- ^ Direção do Tetromino
         -> Parede  -- ^ Parede do Tetromino
         -> Mapa    -- ^ Mapa a onde desenhar o Tetromino
         -> Mapa    -- ^ Mapa com o Tetromino desenhado
 
desenhaI (l,c) d p m | d == C = atualizaPosicaoMapa (l,c+1) p (atualizaPosicaoMapa (l+1,c+1) p (atualizaPosicaoMapa (l+2,c+1) p (atualizaPosicaoMapa (l+3,c+1) p m)))
                     | d == D = atualizaPosicaoMapa (l+1,c) p (atualizaPosicaoMapa (l+1,c+1) p (atualizaPosicaoMapa (l+1,c+2) p (atualizaPosicaoMapa (l+1,c+3) p m)))
                     | d == B = atualizaPosicaoMapa (l,c+2) p (atualizaPosicaoMapa (l+1,c+2) p (atualizaPosicaoMapa (l+2,c+2) p (atualizaPosicaoMapa (l+3,c+2) p m)))
                     | d == E = atualizaPosicaoMapa (l+2,c) p (atualizaPosicaoMapa (l+2,c+1) p (atualizaPosicaoMapa (l+2,c+2) p (atualizaPosicaoMapa (l+2,c+3) p m)))


-- | Desenha o tetromino J num mapa

desenhaJ :: Posicao -- ^ Posição do Tetromino
         -> Direcao -- ^ Direção do Tetromino
         -> Parede  -- ^ Parede do Tetromino
         -> Mapa    -- ^ Mapa a onde desenhar o Tetromino
         -> Mapa    -- ^ Mapa com o Tetromino desenhado

desenhaJ (l,c) d p m | d == C = atualizaPosicaoMapa (l,c+1) p (atualizaPosicaoMapa (l+1,c+1) p (atualizaPosicaoMapa (l+2,c)   p (atualizaPosicaoMapa (l+2,c+1) p m)))
                     | d == D = atualizaPosicaoMapa (l,c)   p (atualizaPosicaoMapa (l+1,c)   p (atualizaPosicaoMapa (l+1,c+1) p (atualizaPosicaoMapa (l+1,c+2) p m)))
                     | d == B = atualizaPosicaoMapa (l,c+1) p (atualizaPosicaoMapa (l+1,c+1) p (atualizaPosicaoMapa (l+2,c+1) p (atualizaPosicaoMapa (l,c+2)   p m)))
                     | d == E = atualizaPosicaoMapa (l+1,c) p (atualizaPosicaoMapa (l+1,c+1) p (atualizaPosicaoMapa (l+1,c+2) p (atualizaPosicaoMapa (l+2,c+2) p m)))


-- | Desenha o tetromino L num mapa

desenhaL :: Posicao -- ^ Posição do Tetromino
         -> Direcao -- ^ Direção do Tetromino
         -> Parede  -- ^ Parede do Tetromino
         -> Mapa    -- ^ Mapa a onde desenhar o Tetromino
         -> Mapa    -- ^ Mapa com o Tetromino desenhado
 
desenhaL (l,c) d p m | d == C = atualizaPosicaoMapa (l,c+1) p (atualizaPosicaoMapa (l+1,c+1) p (atualizaPosicaoMapa (l+2,c+1) p (atualizaPosicaoMapa (l+2,c+2) p m)))
                     | d == D = atualizaPosicaoMapa (l+1,c) p (atualizaPosicaoMapa (l+1,c+1) p (atualizaPosicaoMapa (l+1,c+2) p (atualizaPosicaoMapa (l+2,c)   p m)))
                     | d == B = atualizaPosicaoMapa (l,c)   p (atualizaPosicaoMapa (l,c+1)   p (atualizaPosicaoMapa (l+1,c+1) p (atualizaPosicaoMapa (l+2,c+1) p m)))
                     | d == E = atualizaPosicaoMapa (l,c+2) p (atualizaPosicaoMapa (l+1,c)   p (atualizaPosicaoMapa (l+1,c+1) p (atualizaPosicaoMapa (l+1,c+2) p m)))


-- | Desenha o tetromino O num mapa

desenhaO :: Posicao -- ^ Posição do Tetromino
         -> Direcao -- ^ Direção do Tetromino
         -> Parede  -- ^ Parede do Tetromino
         -> Mapa    -- ^ Mapa a onde desenhar o Tetromino
         -> Mapa    -- ^ Mapa com o Tetromino desenhado

desenhaO (l,c) d p m = atualizaPosicaoMapa (l,c) p (atualizaPosicaoMapa (l,c+1) p (atualizaPosicaoMapa (l+1,c) p (atualizaPosicaoMapa (l+1,c+1) p m)))


-- | Desenha o tetromino S num mapa

desenhaS :: Posicao -- ^ Posição do Tetromino
         -> Direcao -- ^ Direção do Tetromino
         -> Parede  -- ^ Parede do Tetromino
         -> Mapa    -- ^ Mapa a onde desenhar o Tetromino
         -> Mapa    -- ^ Mapa com o Tetromino desenhado

desenhaS (l,c) d p m | d == C = atualizaPosicaoMapa (l,c+1)   p (atualizaPosicaoMapa (l,c+2)   p (atualizaPosicaoMapa (l+1,c)   p (atualizaPosicaoMapa (l+1,c+1) p m)))
                     | d == D = atualizaPosicaoMapa (l,c+1)   p (atualizaPosicaoMapa (l+1,c+1) p (atualizaPosicaoMapa (l+1,c+2) p (atualizaPosicaoMapa (l+2,c+2) p m)))
                     | d == B = atualizaPosicaoMapa (l+1,c+1) p (atualizaPosicaoMapa (l+1,c+2) p (atualizaPosicaoMapa (l+2,c)   p (atualizaPosicaoMapa (l+2,c+1) p m)))
                     | d == E = atualizaPosicaoMapa (l,c)     p (atualizaPosicaoMapa (l+1,c)   p (atualizaPosicaoMapa (l+1,c+1) p (atualizaPosicaoMapa (l+2,c+1) p m)))


-- | Desenha o tetromino T num mapa

desenhaT :: Posicao -- ^ Posição do Tetromino
         -> Direcao -- ^ Direção do Tetromino
         -> Parede  -- ^ Parede do Tetromino
         -> Mapa    -- ^ Mapa a onde desenhar o Tetromino
         -> Mapa    -- ^ Mapa com o Tetromino desenhado

desenhaT (l,c) d p m | d == C = atualizaPosicaoMapa (l+1,c) p (atualizaPosicaoMapa (l+1,c+1) p (atualizaPosicaoMapa (l+1,c+2) p (atualizaPosicaoMapa (l+2,c+1) p m)))
                     | d == D = atualizaPosicaoMapa (l,c+1) p (atualizaPosicaoMapa (l+1,c)   p (atualizaPosicaoMapa (l+1,c+1) p (atualizaPosicaoMapa (l+2,c+1) p m)))
                     | d == B = atualizaPosicaoMapa (l,c+1) p (atualizaPosicaoMapa (l+1,c)   p (atualizaPosicaoMapa (l+1,c+1) p (atualizaPosicaoMapa (l+1,c+2) p m)))
                     | d == E = atualizaPosicaoMapa (l,c+1) p (atualizaPosicaoMapa (l+1,c+1) p (atualizaPosicaoMapa (l+1,c+2) p (atualizaPosicaoMapa (l+2,c+1) p m)))


-- | Desenha o tetromino Z num mapa

desenhaZ :: Posicao -- ^ Posição do Tetromino
         -> Direcao -- ^ Direção do Tetromino
         -> Parede  -- ^ Parede do Tetromino
         -> Mapa    -- ^ Mapa a onde desenhar o Tetromino
         -> Mapa    -- ^ Mapa com o Tetromino desenhado

desenhaZ (l,c) d p m | d == C = atualizaPosicaoMapa (l,c)   p (atualizaPosicaoMapa (l,c+1)   p (atualizaPosicaoMapa (l+1,c+1) p (atualizaPosicaoMapa (l+1,c+2) p m)))
                     | d == D = atualizaPosicaoMapa (l,c+2) p (atualizaPosicaoMapa (l+1,c+1) p (atualizaPosicaoMapa (l+1,c+2) p (atualizaPosicaoMapa (l+2,c+1) p m))) 
                     | d == B = atualizaPosicaoMapa (l+1,c) p (atualizaPosicaoMapa (l+1,c+1) p (atualizaPosicaoMapa (l+2,c+1) p (atualizaPosicaoMapa (l+2,c+2) p m)))
                     | d == E = atualizaPosicaoMapa (l,c+1) p (atualizaPosicaoMapa (l+1,c)   p (atualizaPosicaoMapa (l+1,c+1) p (atualizaPosicaoMapa (l+2,c)   p m)))

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- | Atualiza uma posição num mapa

atualizaPosicaoMapa :: Posicao -- ^ Posição da Peça
                    -> Parede  -- ^ Parede da Peça
                    -> Mapa    -- ^ Mapa a onde atualizar a Peça
                    -> Mapa    -- ^ Mapa com a Peça atualizada

atualizaPosicaoMapa (l,c) p m | l >= 0 && l <= ultimaLinha (dimensaoMatriz m) && c >= 0 && c <= ultimaColuna (dimensaoMatriz m) = atualizaPosicaoMatriz (l,c) (Bloco p) m

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- | Retorna o mapa de um editor

mapaFinal :: Editor -- ^ Editor dado 
          -> Mapa   -- ^ Mapa do Editor

mapaFinal (Editor (l,c) d t p m) = m





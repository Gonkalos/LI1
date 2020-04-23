-- | Este módulo define funções comuns da Tarefa 2 do trabalho prático.
module AuxiliaresT2 where

import LI11819
import AuxiliaresT1
import Tarefa0_2018li1g026
import Tarefa1_2018li1g026

-- | Altera o jogador.
alteraJogador :: Int -- ^ O identificador do 'Jogador' que é alterado.
              -> Mapa -- ^ O 'Mapa' onde a 'Jogada' está a ser efetuada.
              -> [Disparo] -- ^ A Lista de todos os 'Disparos'.
              -> Jogada -- ^ A 'Jogada' a efetuar.
              -> Jogador -- ^ O 'Jogador' a ser alterado. 
              -> [Jogador] -- ^ A Lista de todos os 'Jogadores'.
              -> Jogador -- ^ o 'Jogador' resultante após ser efetuada a jogada.
alteraJogador n m dis jogada (Jogador (l,c) dir 0 lasers choques) (h:t)
    = Jogador (l,c) dir 0 lasers choques
alteraJogador n m dis (Movimenta C) (Jogador (l,c) dir vidas lasers choques) (h:t)
    | dir /= C                                              = Jogador (l,c)     C   vidas lasers choques
    | dir == C && (testeC1 && testeC2) && colisao && choque = Jogador (l-1,c)   dir vidas lasers choques
    | otherwise                                             = Jogador (l,c) dir vidas lasers choques
    where
        testeC1 = encontraPosicaoMatriz (l-1,c) m == Vazia
        testeC2 = encontraPosicaoMatriz (l-1,c+1) m == Vazia
        colisao = comparaJogadores (Movimenta C) (Jogador (l,c) dir vidas lasers choques) (retiraJogador n (retiraMortos (h:t))) == False 
        choque  = jogadorChoques (criaListaPos (criaListaJogadores (criaListaChoques dis) (h:t))) (Jogador (l,c) dir vidas lasers choques)
alteraJogador n m dis (Movimenta D) (Jogador (l,c) dir vidas lasers choques) (h:t)
    | dir /= D                                              = Jogador (l,c)     D   vidas lasers choques
    | dir == D && (testeD1 && testeD2) && colisao && choque = Jogador (l,c+1)   dir vidas lasers choques
    | otherwise                                             = Jogador (l,c) dir vidas lasers choques
    where
        testeD1 = encontraPosicaoMatriz (l,c+2) m == Vazia
        testeD2 = encontraPosicaoMatriz (l+1,c+2) m == Vazia
        colisao = comparaJogadores (Movimenta D) (Jogador (l,c) dir vidas lasers choques) (retiraJogador n (retiraMortos (h:t))) == False
        choque  = jogadorChoques (criaListaPos (criaListaJogadores (criaListaChoques dis) (h:t))) (Jogador (l,c) dir vidas lasers choques)
alteraJogador n m dis (Movimenta B) (Jogador (l,c) dir vidas lasers choques) (h:t)
    | dir /= B                                               = Jogador (l,c)     B   vidas lasers choques
    | dir == B && (testeB1 && testeB2) &&  colisao && choque = Jogador (l+1,c)   dir vidas lasers choques
    | otherwise                                              = Jogador (l,c) dir vidas lasers choques
    where
        testeB1 = encontraPosicaoMatriz (l+2,c) m == Vazia
        testeB2 = encontraPosicaoMatriz (l+2,c+1) m == Vazia
        colisao = comparaJogadores (Movimenta B) (Jogador (l,c) dir vidas lasers choques) (retiraJogador n (retiraMortos (h:t))) == False -- comparaJogadores (Movimenta B) (Jogador (5,5) C 4 0 4) (retira 0 [Jogador (5,5) C 4 0 4, Jogador (2,8) C 4 0 4, Jogador (10,10) B 4 0 4, Jogador (3,4) B 0 2 1])
        choque  = jogadorChoques (criaListaPos (criaListaJogadores (criaListaChoques dis) (h:t))) (Jogador (l,c) dir vidas lasers choques) --  jogadorChoques (criaListaPos (criaListaJogadores (criaListaChoques [DisparoChoque 0 5]) [Jogador (5,5) C 4 0 4, Jogador (2,8) C 4 0 4, Jogador (10,10) B 4 0 4, Jogador (3,4) B 0 2 1])) (Jogador (5,5) C 4 0 4)

alteraJogador n m dis (Movimenta E) (Jogador (l,c) dir vidas lasers choques) (h:t)
    | dir /= E                                              = Jogador (l,c)     E   vidas lasers choques
    | dir == E && (testeE1 && testeE2) && colisao && choque = Jogador (l,c-1)   dir vidas lasers choques
    | otherwise                                             = Jogador (l,c) dir vidas lasers choques
    where
        testeE1 = encontraPosicaoMatriz (l,c-1) m == Vazia
        testeE2 = encontraPosicaoMatriz (l+1,c-1) m == Vazia
        colisao = comparaJogadores (Movimenta E) (Jogador (l,c) dir vidas lasers choques) (retiraJogador n (retiraMortos (h:t))) == False
        choque  = jogadorChoques (criaListaPos (criaListaJogadores (criaListaChoques dis) (h:t))) (Jogador (l,c) dir vidas lasers choques)
alteraJogador n m dis (Dispara Laser) (Jogador (l,c) dir vidas lasers choques) (h:t)
    | lasers /= 0 = Jogador (l,c) dir vidas (lasers-1) choques
    | otherwise   = Jogador (l,c) dir vidas (lasers) choques
alteraJogador n m dis (Dispara Choque) (Jogador (l,c) dir vidas lasers choques) (h:t)
    | choques /= 0 = Jogador (l,c) dir vidas lasers (choques-1)
    | otherwise    = Jogador (l,c) dir vidas lasers (choques)
alteraJogador n m dis (Dispara Canhao) (Jogador (l,c) dir vidas lasers choques) (h:t)
    = Jogador (l,c) dir vidas lasers choques


-- | Cria um disparo.
criaDisparo :: Int -- ^ O identificador do 'Jogador' que efetua o 'Disparo'.
            -> Jogador -- ^ O 'Jogador' que efetua o 'Disparo'. 
            -> Jogada -- ^ A 'Jogada' que é efetuada.
            -> Disparo -- ^ O 'Disparo' resultante após ser efetuada a jogada.
criaDisparo n (Jogador (l,c) dir v laser choque) (Dispara Choque)
    | choque /= 0 = DisparoChoque n 5
    | otherwise = DisparoChoque n 0
criaDisparo n (Jogador (l,c) dir v laser choque) (Dispara x)
    | dir == C = disparo n (l-1,c) dir
    | dir == D = disparo n (l,c+1) dir
    | dir == B = disparo n (l+1,c) dir
    | dir == E = disparo n (l,c-1) dir
    where 
        disparo | x == Laser = DisparoLaser
                | x == Canhao = DisparoCanhao

-- | Atualiza um jogador de uma lista de jogadores.
atualizaJogadores :: Int -- ^ O identificador do 'Jogador'.
                  -> Jogador -- ^ O 'Jogador' a ser atualizado.
                  -> [Jogador] -- ^ A lista de 'Jogadores' antes de ser atualizada.
                  -> [Jogador] -- ^ A lista de 'Jogadores' com o jogador atualizado.
atualizaJogadores n jogador [] = []
atualizaJogadores n jogador (h:t)
    | n > 0 = h:atualizaJogadores (n-1) jogador t
    | otherwise = (jogador:t)


-- | Devolve um jogador de uma lista.
escolheJogador :: Int -- ^ O identificador do 'Jogador'.
               -> [Jogador] -- ^ A lista de 'Jogadores'.
               -> Jogador -- ^ O 'Jogador' da lista com o identificador fornecido.
escolheJogador n (h:t) 
    | n > 0 = escolheJogador (n-1) t
    | otherwise = h

-- | Retira um jogador de uma lista.
retiraJogador :: Int -- ^ O identificador do 'Jogador'.
              -> [Jogador] -- ^ A lista de 'Jogadores'.
              -> [Jogador] -- ^ A lista de 'Jogadores' sem o jogador do identificador fornecido.
retiraJogador n (h:t)
    | n > 0 = h:retiraJogador (n-1) t
    | otherwise = t


-- | Compara um jogador com uma lista de jogadores.
comparaJogadores :: Jogada -- ^ A 'Jogada' a ser efetuada.
                 -> Jogador -- ^ O 'Jogador' em que vai ser efetuada a jogada.
                 -> [Jogador] -- ^ A lista de 'Jogadores' presentes no mapa.
                 -> Bool -- ^ Resulta em 'True' caso exista um 'Jogador' numa das posições a seguir ao 'Jogador' ao qual vai ser efetuada a jogada, 'False' caso contrário.
comparaJogadores jogada jogador [] = False
comparaJogadores jogada (Jogador (l,c) dir vidas lasers choques) ((Jogador (l2,c2) dir2 vidas2 lasers2 choques2):t)
    | jogada == Movimenta B && (l2 < l + 3 && l2 > l) && (c2 < c + 2 && c2 > c - 2) = True
    | jogada == Movimenta C && (l2 < l && l2 > l - 3) && (c2 < c + 2 && c2 > c - 2) = True
    | jogada == Movimenta D && (l2 < l + 2 && l2 > l - 2) && (c2 < c + 3 && c2 > c) = True 
    | jogada == Movimenta E && (l2 < l + 2 && l2 > l - 2) && (c2 < c && c2 > c - 3) = True
    | otherwise = comparaJogadores jogada (Jogador (l,c) dir vidas lasers choques) t

-- | Cria uma lista com os números dos jogadores que tem os choques ativos.
criaListaChoques :: [Disparo] -- ^ A lista de 'Disparos' presentes no 'Estado'. 
                 -> [Int] -- ^ A lista de identificadores dos 'Jogadores' que tem o 'Choque' ativo.
criaListaChoques [] = []
criaListaChoques ((DisparoChoque n ticks):t) = n:criaListaChoques t
criaListaChoques (h:t) = criaListaChoques t


-- | Cria uma lista com os jogadores que tem os choques ativos.
criaListaJogadores :: [Int] -- ^ A lista de identificadores dos 'Jogadores' que tem o 'Choque' ativo.
                   -> [Jogador] -- ^ A lista de 'Jogadores' presentes no mapa.
                   -> [Jogador] -- ^ A lista de 'Jogadores' que tem o choque ativo.
criaListaJogadores [] j = []
criaListaJogadores (h:t) j = (escolheJogador h j):criaListaJogadores t j


-- | Cria uma lista com as posições dos jogadores que tem choque ativo.
criaListaPos :: [Jogador] -- ^ A lista de 'Jogadores' que tem o choque ativo.
             -> [(Int,Int)] -- ^ A lista de posições dos 'Jogadores' que tem o choque ativo.
criaListaPos [] = []
criaListaPos ((Jogador pos dir vidas lasers choques):t) = pos:criaListaPos t

-- | Vê se um jogador não está sob efeito de um choque.
jogadorChoques :: [(Int,Int)] -- ^ A lista de posições dos 'Jogadores' com choque ativo.
               -> Jogador -- ^ O 'Jogador' a quem vai ser efetuada uma jogada.
               -> Bool -- ^ Resulta em 'True' caso o 'Jogador' possa se mover porque não está sob efeito de choque, 'False' caso contrário.
jogadorChoques [] jogador = True
jogadorChoques ((l2,c2):t) (Jogador (l,c) dir vidas lasers choques)
    | l2 == l && c2 == c = True 
    | (l >= l2 - 3 && l <= l2 + 3) && (c >= c2 - 3 && c <= c2 + 3) = False
    | otherwise = jogadorChoques t (Jogador (l,c) dir vidas lasers choques) 

isAlive :: Jogador -> Bool
isAlive (Jogador pos dir vidas lasers choques)
    | vidas < 1 = False
    | otherwise = True

retiraMortos :: [Jogador] -> [Jogador]
retiraMortos [] = []
retiraMortos ((Jogador pos dir 0 lasers choques):t) = retiraMortos t
retiraMortos (h:t) = h:retiraMortos t

temLaser :: Jogador -> Bool
temLaser (Jogador pos dir vidas lasers choques)
    | lasers < 1 = False
    | otherwise = True

temChoque :: Jogador -> Bool
temChoque (Jogador pos dir vidas lasers choques)
    | choques < 1 = False
    | otherwise = True

isBloco :: Jogador -> Mapa -> Bool
isBloco (Jogador (l,c) dir vidas lasers choques) m
        | any (/= Vazia) [encontraPosicaoMatriz (l+1,c+1) m,encontraPosicaoMatriz (l,c) m,encontraPosicaoMatriz (l+1,c) m,encontraPosicaoMatriz (l,c+1) m] = True
        | otherwise = False
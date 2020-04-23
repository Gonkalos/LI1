
-- | Este módulo define funções genéricas sobre vetores e matrizes, que serão úteis na resolução do trabalho prático.

module Tarefa0_2018li1g026 where

import LI11819

-- * Funções não-recursivas.

-- | Um 'Vetor' é uma 'Posicao' em relação à origem.

type Vetor = Posicao

-- ^ <<http://oi64.tinypic.com/mhvk2x.jpg vetor>>

-- ** Funções sobre vetores

-- *** Funções gerais sobre 'Vetor'es.

v1,v2 :: Vetor
v1 = (4,6)
v2 = (6,3)


-- | Soma dois 'Vetor'es.

somaVetores :: Vetor -- ^ Vetor inicial
            -> Vetor -- ^ Vetor a adicionar
            -> Vetor -- ^ Soma dos Vetores

somaVetores (a,b) (c,d) = (a+c, b+d)


-- | Subtrai dois 'Vetor'es.

subtraiVetores :: Vetor -- ^ Vetor inicial
               -> Vetor -- ^ Vetor a subtrair
               -> Vetor -- ^ Subtração dos vetores

subtraiVetores (a,b) (c,d) = (a-c, b-d)


-- | Multiplica um escalar por um 'Vetor'.

multiplicaVetor :: Int   -- ^ Escalar a multiplicar
                -> Vetor -- ^ Vetor a multiplicar
                -> Vetor -- ^ Multiplicação do escalar pelo vetor

multiplicaVetor x (a,b) = (a*x, b*x) 


-- | Roda um 'Vetor' 90º no sentido dos ponteiros do relógio, alterando a sua direção sem alterar o seu comprimento (distânciaa à origem).
--
-- <<http://oi65.tinypic.com/2j5o268.jpg rodaVetor>>

rodaVetor :: Vetor -- ^ Vetor a rodar
          -> Vetor -- ^ Vetor rodado 90º

rodaVetor (a,b) = (b, 0-a)


-- | Espelha um 'Vetor' na horizontal (sendo o espelho o eixo vertical).
--
-- <<http://oi63.tinypic.com/jhfx94.jpg inverteVetorH>>

inverteVetorH :: Vetor -- ^ Vetor a inverter
              -> Vetor -- ^ Vetor invertido na horizontal

inverteVetorH (a,b) = (a, 0-b)


-- | Espelha um 'Vetor' na vertical (sendo o espelho o eixo horizontal).
--
-- <<http://oi68.tinypic.com/2n7fqxy.jpg inverteVetorV>>

inverteVetorV :: Vetor -- ^ Vetor a inverter
              -> Vetor -- ^ Vetor invertido na vertical

inverteVetorV (a,b) = (0-a, b)

-- *** Funções do trabalho sobre 'Vetor'es.


-- | Devolve um 'Vetor' unitário (de comprimento 1) com a 'Direcao' dada.

direcaoParaVetor :: Direcao -- ^ Direção do vetor 
                 -> Vetor   -- ^ Vetor unitário

direcaoParaVetor d | d == C = (-1,0)
                   | d == D = (0,1)
                   | d == B = (1,0)
                   | d == E = (0,-1)


-- ** Funções sobre listas

-- *** Funções gerais sobre listas.
--
-- Funções não disponíveis no 'Prelude', mas com grande utilidade.


-- | Verifica se o indice pertence à lista.

eIndiceListaValido :: Int  -- ^ Índice a verificar
                   -> [a]  -- ^ Lista em causa
                   -> Bool -- ^ Resultado da procura

eIndiceListaValido x [] = False
eIndiceListaValido x l | x >= 0 && tamanhoLista l > x = True
                       | otherwise = False


-- | Devolve o tamanho de uma lista

tamanhoLista :: [a] -- ^ Lista em causa
             -> Int -- ^ Tamanho da lista

tamanhoLista [] = 0
tamanhoLista (h:t) = 1 + tamanhoLista t


-- ** Funções sobre matrizes.

-- *** Funções gerais sobre matrizes.


-- | Uma matriz é um conjunto de elementos a duas dimensões.
--
-- Em notação matemática, é geralmente representada por:
--
-- <<https://upload.wikimedia.org/wikipedia/commons/d/d8/Matriz_organizacao.png matriz>>

type Matriz a = [[a]]


-- | Calcula a dimensão de uma matriz.

dimensaoMatriz :: Matriz a -- ^ Matriz em causa
               -> Dimensao -- ^ Dimensão da matriz

dimensaoMatriz [] = (0,0)
dimensaoMatriz (h:t) | tamanhoLista h /= 0 = (tamanhoMatriz (h:t), tamanhoLista h)
                     | otherwise = (0,0)


-- | Devolve o tamanho de uma matriz

tamanhoMatriz :: Matriz a -- ^ Matriz em causa
              -> Int      -- ^ Tamanho da matriz

tamanhoMatriz [] = 0
tamanhoMatriz (h:t) = 1 + tamanhoMatriz t


-- | Verifica se a posição pertence à matriz.

ePosicaoMatrizValida :: Posicao  -- ^ Posição da matriz
                     -> Matriz a -- ^ Matriz em causa
                     -> Bool     -- ^ Resultado da procura

ePosicaoMatrizValida p [] = False
ePosicaoMatrizValida (x,y) m | x >= 0 && y >= 0 && x < tamanhoMatriz m && y < tamanhoLista (head m) = True
                             | otherwise = False  


-- | Devolve o primeiro elemento de uma dimensão

primeiro :: Dimensao -- ^ Dimensão da matriz
         -> Int      -- ^ Número de linhas

primeiro (a,b) = a


-- | Devolve o segundo elemento de uma dimensão

segundo :: Dimensao -- ^ Dimensão da matriz
        -> Int      -- ^ Número de colunas

segundo (a,b) = b


-- | Verifica se a posição está numa borda da matriz.

eBordaMatriz :: Posicao  -- ^ Posição da matriz 
             -> Matriz a -- ^ Matriz em causa 
             -> Bool     -- ^ Resultado da verificação
             
eBordaMatriz (a,b) m | (a == 0 || b == 0 || a == (primeiro (dimensaoMatriz m)) -1 || b == (segundo (dimensaoMatriz m)) -1 ) = True
                     | otherwise = False


-- *** Funções do trabalho sobre matrizes.


-- | Converte um 'Tetromino' (orientado para cima) numa 'Matriz' de 'Bool'.
--
-- <<http://oi68.tinypic.com/m8elc9.jpg tetrominos>>

tetrominoParaMatriz :: Tetromino   -- ^ Tetromino a desenhar
                    -> Matriz Bool -- ^ Matriz com o tetromino desenhado em bool

tetrominoParaMatriz t | t == I = [[False, True, False, False], [False, True, False, False], [False, True, False, False], [False, True, False, False]]
                      | t == J = [[False, True, False], [False, True, False], [True, True, False]]
                      | t == L = [[False, True, False], [False, True, False], [False, True, True]]
                      | t == O = [[True, True], [True, True]]
                      | t == S = [[False, True, True], [True, True, False], [False, False, False]]
                      | t == T = [[False, False, False], [True, True, True], [False, True, False]]
                      | t == Z = [[True, True, False], [False, True, True], [False, False, False]]


-- * Funções recursivas.

-- ** Funções sobre listas.
--
-- Funções não disponíveis no 'Prelude', mas com grande utilidade.


-- | Devolve o elemento num dado índice de uma lista.

encontraIndiceLista :: Int -- ^ Índice a procurar
                    -> [a] -- ^ Lista a onde procurar
                    -> a   -- ^ Elemento no índice na lista

encontraIndiceLista x (h:t) | x == 0 = h
                            | otherwise = encontraIndiceLista (x-1) t


-- | Modifica um elemento num dado índice.
--
-- __NB:__ Devolve a própria lista se o elemento não existir.

atualizaIndiceLista :: Int -- ^ Índice a atualizar 
                    -> a   -- ^ Novo elemento
                    -> [a] -- ^ Lista a onde atualizar
                    -> [a] -- ^ Lista atualizada

atualizaIndiceLista x y []    = []
atualizaIndiceLista x y (h:t) | (x == 0)  = (y:t)
                              | otherwise = (h:(atualizaIndiceLista (x-1) y t))


-- ** Funções sobre matrizes.

-- | Roda uma 'Matriz' 90º no sentido dos ponteiros do relógio.
--
-- <<http://oi68.tinypic.com/21deluw.jpg rodaMatriz>>

rodaMatriz :: Matriz a -- ^ Matriz inicial
           -> Matriz a -- ^ Matriz rodada 90º

rodaMatriz [] = []
rodaMatriz m = inverteMatriz (rodaMatrizAux m)


-- | Junta os primeiros elementos das linhas numa linha e adiante

rodaMatrizAux :: Matriz a  
              -> Matriz a

rodaMatrizAux [] = []
rodaMatrizAux m = juntaMatrizes (add (criaVazia (dimensaoMatriz m)) (head m)) (rodaMatrizAux (tail m))


-- | Cria uma matriz vazia 

criaVazia :: Dimensao -- ^ Dimensão da matriz 
          -> Matriz a -- ^ Matriz de Vazias com a dimensão dada

criaVazia (l,c) | c > 0 = []:(criaVazia (l,c-1))
                | otherwise = []


-- | Adiciona uma coluna no início da matriz

add :: Matriz a -- ^ Matriz inicial
    -> [a]      -- ^ coluna
    -> Matriz a -- ^ Matriz final

add m [] = m
add (h:t) (x:xs) = ([x] ++ h):(add t xs)


-- | Adiciona os elementos de uma lista noutra lista

juntaListas :: [a] -- ^ Lista inicial
            -> [a] -- ^ Lista adicionada
            -> [a] -- ^ Lista final

juntaListas l [] = l
juntaListas [] l = l 
juntaListas (h:t) l = juntaListas t (h:l)


-- | Adiciona os elementos de cada linha de uma matriz na respetiva linha de outra matriz

juntaMatrizes :: Matriz a -- ^ Matriz inicial
              -> Matriz a -- ^ Matriz adicionada
              -> Matriz a -- ^ Matriz final

juntaMatrizes m [] = m 
juntaMatrizes [] m = m 
juntaMatrizes (h:t) (x:xs) = (juntaListas h x):juntaMatrizes t xs


-- | Inverte uma lista

inverte :: [a] -- ^ Lista inicial 
        -> [a] -- ^ Lista invertida

inverte [] = []
inverte (h:t) = inverte t ++ [h]


-- | Inverte uma matriz

inverteMatriz :: Matriz a -- ^ Matriz inicial 
              -> Matriz a -- ^ Matriz invertida

inverteMatriz [] = []
inverteMatriz (h:t) = (inverte h):(inverteMatriz t) 


-- | Inverte uma 'Matriz' na horizontal.
--
-- <<http://oi64.tinypic.com/iwhm5u.jpg inverteMatrizH>>

inverteMatrizH :: Matriz a -- ^ Matriz inicial
               -> Matriz a -- ^ Matriz invertida na horizontal

inverteMatrizH [] = []
inverteMatrizH (h:t) = (inverte h):(inverteMatrizH t)

-- | Inverte uma 'Matriz' na vertical.
--
-- <<http://oi64.tinypic.com/11l563p.jpg inverteMatrizV>>

inverteMatrizV :: Matriz a -- ^ Matriz inicial
               -> Matriz a -- ^ Matriz invertida na vertical

inverteMatrizV [] = []
inverteMatrizV (h:t) = inverteMatrizV t ++ [h]


-- | Cria uma nova 'Matriz' com o mesmo elemento.

criaMatriz :: Dimensao -- ^ Dimensão da matriz
           -> a        -- ^ Elemento da matriz
           -> Matriz a -- ^ Nova Matriz

criaMatriz (0,0) z = []
criaMatriz (x,y) z | x > 0 = (criaLinha y z):(criaMatriz (x-1,y) z)
                   | otherwise = []


-- | Cria uma nova linha com o mesmo elemento

criaLinha :: Int -- ^ Tamanho da linha
          -> a   -- ^ Elemento da linha
          -> [a] -- ^ Nova lista

criaLinha y z | y > 0 = z:(criaLinha (y-1) z)
              | otherwise = []


-- | Devolve o elemento numa dada 'Posicao' de uma 'Matriz'.

encontraPosicaoMatriz :: Posicao  -- ^ Posição do elemento
                      -> Matriz a -- ^ Matriz em causa
                      -> a        -- ^ Elemento na posição na matriz
encontraPosicaoMatriz (x,y) (h:t) | x == 0 = encontraIndiceLista y h
                                  | otherwise = encontraPosicaoMatriz (x-1, y) t


-- | Modifica um elemento numa dada 'Posicao'
--
-- __NB:__ Devolve a própria 'Matriz' se o elemento não existir.

atualizaPosicaoMatriz :: Posicao  -- ^ Posição a atualizar
                      -> a        -- ^ Novo elemento
                      -> Matriz a -- ^ Matriz inicial
                      -> Matriz a -- ^ Matriz atualizada

atualizaPosicaoMatriz (x,y) z [] = []
atualizaPosicaoMatriz (x,y) z (h:t) | x == 0 = (atualizaIndiceLista y z h):t
                                    | otherwise = h:(atualizaPosicaoMatriz (x-1,y) z t)



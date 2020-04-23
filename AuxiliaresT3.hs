
-- | Este módulo define funções auxiliares da Tarefa 3 do trabalho prático.

module AuxiliaresT3 where

import LI11819
import Tarefa0_2018li1g026

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- | Comprime uma linha de um mapa

comprimeLinha :: [Peca] -- ^ [Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Bloco Destrutivel,Vazia,Vazia,Bloco Indestrutivel]
              -> String -- ^ "IDDDVVDVVI"

comprimeLinha [] = ""
comprimeLinha (h:t) | h == Bloco Destrutivel   = "D" ++ comprimeLinha t
                    | h == Bloco Indestrutivel = "I" ++ comprimeLinha t
                    | h == Vazia               = "V" ++ comprimeLinha t


-- | Comprime uma linha de um mapa

comprimeLinha2 :: String -- ^ "IDDDVVDVVI"
               -> String -- ^ "DDDVVDVV"

comprimeLinha2 [] = ""
comprimeLinha2 (h:t) = removeUlt t


-- | Comprime uma linha de um mapa

comprimeLinha3 :: String -- ^ "DDDVVDVV"
               -> String -- ^ "3D2V1D2V"

comprimeLinha3 [] = ""
comprimeLinha3 s  = show (repetidos s) ++ cabeca s ++ comprimeLinha3 (removeRepetidos s)


-- | Comprime uma linha de um mapa

comprimeLinha4 :: String -- ^ "3D2V1D2V"
               -> String -- ^ "3D2VD2V"

comprimeLinha4 []  = ""
comprimeLinha4 [x] = [x]
comprimeLinha4 (h1:h2:t) |  h1 == '1' && h2 == 'I' = [h2] ++ comprimeLinha4 t
                         |  h1 == '1' && h2 == 'D' = [h2] ++ comprimeLinha4 t
                         |  h1 == '1' && h2 == 'V' = [h2] ++ comprimeLinha4 t
                         | (h1 == '1' || h1 == '2' || h1 == '3' || h1 == '4' || h1 == '5' || h1 == '6' || h1 == '7' || h1 == '8' || h1 == '9') && h2 == '1' = [h1] ++ [h2] ++ comprimeLinha4 t 
                         | otherwise = [h1] ++ comprimeLinha4 ([h2] ++ t)


-- | Comprime um mapa

comprimeMapa :: Mapa   -- ^ Mapa a comprimir
             -> String -- ^ Mapa comprimido

comprimeMapa [] = ""
comprimeMapa (h:t) = comprimeLinha4 (comprimeLinha3 (comprimeLinha2 (comprimeLinha h))) ++ ";" ++ comprimeMapa t


-- | Comprime um mapa

comprimeMapa2 :: String -- ^ Mapa comprimido
              -> String -- ^ Remove a primeira e última linha de um mapa (bordas)

comprimeMapa2 [] = ""
comprimeMapa2 s  = removePrimeiroE (removeUltimoE s)


-- | Função que comprime um jogador

comprimeJogador :: Jogador -- ^ Jogador a comprimir 
                -> String  -- ^ Jogador comprimido

comprimeJogador (Jogador (l,c) d v ls ch) = show l ++ "," ++ show c ++ "," ++ show d ++ "," ++ show v ++ "," ++ show ls ++ "," ++ show ch ++ ";"


-- | Função que comprime uma lista de jogadores

comprimeJogadores :: [Jogador] -- ^ Lista de jogadores a comprimir
                  -> String    -- ^ Lista de jogadores comprimidos

comprimeJogadores [] = ""
comprimeJogadores (h:t) = comprimeJogador h ++ comprimeJogadores t


-- | Função que comprime um disparo

comprimeDisparo :: Disparo -- ^ Disparo a comprimir
                -> String  -- ^ Disparo comprimido

comprimeDisparo (DisparoCanhao n (l,c) d) = "C," ++ show n ++ "," ++ show l ++ "," ++ show c ++ "," ++ show d
comprimeDisparo (DisparoLaser  n (l,c) d) = "L," ++ show n ++ "," ++ show l ++ "," ++ show c ++ "," ++ show d
comprimeDisparo (DisparoChoque n t)       = "X," ++ show n ++ "," ++ show t


-- | Função que comprime uma lista de disparos

comprimeDisparos :: [Disparo] -- ^ Lista de disparos a comprimir 
                 -> String    -- ^ Lista de disparos comprimidos

comprimeDisparos [] = ""
comprimeDisparos (h:t) | t == [] = comprimeDisparo h ++ comprimeDisparos t
                       | otherwise = comprimeDisparo h ++ ";" ++ comprimeDisparos t

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- | Descomprime uma linha de um mapa

descomprimeLinha :: String -- ^ "I"
                 -> String -- ^ "1I"

descomprimeLinha [] = ""
descomprimeLinha s  | s == "I" = "1I"
                    | s == "D" = "1D"
                    | s == "V" = "1V"
                    | otherwise = s


-- | Descomprime uma linha de um mapa

descomprimeLinha2 :: String -- ^ "3D,2V,D,2V,"
                  -> String -- ^ "3D,2V,1D,2V,"

descomprimeLinha2 [] = ""
descomprimeLinha2 s = descomprimeLinha (separaEl s) ++ "," ++ descomprimeLinha2 (removeEl s 1) 


-- | Descomprime uma linha de um mapa

descomprimeLinha3 :: String -- ^ "3D"
                  -> String -- ^ "DDD"

descomprimeLinha3 [] = ""
descomprimeLinha3 s | descomprimeN (removePeca s) == 1 = pecas s
                    | otherwise = descomprimeLinha3 (show (descomprimeN ((removePeca s))-1) ++ peca s ++ pecas s)


-- | Descomprime uma linha de um mapa

descomprimeLinha4 :: String -- ^ "3D,2V,1D,2V,"
                  -> String -- ^ "DDDVVDVV"

descomprimeLinha4 [] = ""
descomprimeLinha4 s = descomprimeLinha3 (separaEl s) ++ descomprimeLinha4 (removeEl2 s)


-- | Descomprime uma linha de um mapa

descomprimeLinha5 :: String -- ^ "DDDVVDVV"
                  -> String -- ^ "IDDDVVDVVI"

descomprimeLinha5 [] = ""
descomprimeLinha5 s  = "I" ++ s ++ "I"


-- | Descomprime uma linha de um mapa

descomprimeLinha6 :: String -- ^ "IDDDVVDVVI"
                  -> [Peca] -- ^ [Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Bloco Destrutivel,Vazia,Vazia,Bloco Indestrutivel]

descomprimeLinha6 [] = []
descomprimeLinha6 (h:t) | h == 'I'  = [Bloco Indestrutivel] ++ descomprimeLinha6 t
                        | h == 'D'  = [Bloco Destrutivel] ++ descomprimeLinha6 t
                        | otherwise = [Vazia] ++ descomprimeLinha6 t 


-- | Descomprime um mapa

descomprimeMapa :: String -- ^ "3V2D;3V2D;3V2D;3V2D;3V2D;"
                -> String -- ^ "3V,2D;3V,2D;3V,2D;3V,2D;3V,2D;"

descomprimeMapa [] = ""
descomprimeMapa (h:t) | (h == 'I' || h == 'D' || h == 'V') && cabeca t /= ";" = [h] ++ "," ++ descomprimeMapa t
                      | otherwise = [h] ++ descomprimeMapa t


-- | Descomprime um mapa

descomprimeMapa2 :: String -- ^ "3V,2D;3V,2D;3V,2D;3V,2D;3V,2D;"
                 -> String -- ^ "IVVVDDI;IVVVDDI;IVVVDDI;IVVVDDI;IVVVDDI;"

descomprimeMapa2 [] = []
descomprimeMapa2 s  = descomprimeLinha5 (descomprimeLinha4 (descomprimeLinha2 (separaPrimeiroE s))) ++ ";" ++ descomprimeMapa2 (removePrimeiroE s) 


-- | Descomprime um mapa

descomprimeMapa3 :: String -- ^ "IVVVDDI;IVVVDDI;IVVVDDI;IVVVDDI;IVVVDDI;"
                 -> String -- ^ "IIIIIII;IVVVDDI;IVVVDDI;IVVVDDI;IVVVDDI;IVVVDDI;IIIIIII"

descomprimeMapa3 [] = ""
descomprimeMapa3 s  = descomprimeLinha3 (show (nColunas s) ++ "I;") ++ s ++ descomprimeLinha3 (show (nColunas s) ++ "I")  


-- | Descomprime um mapa

descomprimeMapa4 :: String -- ^ Mapa a descomprimir
                 -> Mapa   -- ^ Mapa descomprimido 

descomprimeMapa4 [] = []
descomprimeMapa4 s  = [descomprimeLinha6 (separaPrimeiroE s)] ++ descomprimeMapa4 (removePrimeiroE s)


-- | Descomprime um mapa

descomprimeMapa5 :: String -- ^ Mapa a descomprimir
                 -> Mapa   -- ^ Mapa descomprimido 

descomprimeMapa5 [] = []
descomprimeMapa5 s = descomprimeMapa4 (descomprimeMapa3 (descomprimeMapa2 (descomprimeMapa s)))


-- | Função que descomprime um jogador

descomprimeJogador :: String  -- ^ Jogador a descomprimir
                   -> Jogador -- ^ Jogador descomprimido

descomprimeJogador s = Jogador (descomprimeN s,descomprimeN (removeEl s 1)) (descomprimeDirecao (removeEl s 2)) (descomprimeN (removeEl s 3)) (descomprimeN (removeEl s 4)) (descomprimeN (removeEl s 5))


-- | Função que descomprime uma lista de jogadores

descomprimeJogadores :: String    -- ^ Lista de jogadores a descomprimir
                     -> [Jogador] -- ^ Lista de jogadores descomprimida

descomprimeJogadores [] = []
descomprimeJogadores s  = [descomprimeJogador (separaPrimeiroE s)] ++ descomprimeJogadores (removePrimeiroE s) 


-- | Função que descomprime um disparo

descomprimeDisparo :: String  -- ^ Disparo a descomprimir
                   -> Disparo -- ^ Disparo descomprimido

descomprimeDisparo (h:t) | h == 'C' = DisparoCanhao (descomprimeN (removeEl (h:t) 1)) ((descomprimeN (removeEl (h:t) 2)),(descomprimeN (removeEl (h:t) 3))) (descomprimeDirecao (removeEl (h:t) 4))
                         | h == 'L' = DisparoLaser  (descomprimeN (removeEl (h:t) 1)) ((descomprimeN (removeEl (h:t) 2)),(descomprimeN (removeEl (h:t) 3))) (descomprimeDirecao (removeEl (h:t) 4))
                         | h == 'X' = DisparoChoque (descomprimeN (removeEl (h:t) 1)) (descomprimeN (removeEl (h:t) 2))


-- | Função que descomprime uma lista de disparos

descomprimeDisparos :: String    -- ^ Lista de disparos 
                    -> [Disparo] -- ^ Lista de disparos descomprimida

descomprimeDisparos [] = []
descomprimeDisparos s = [descomprimeDisparo (separaPrimeiroE s)] ++ descomprimeDisparos (removePrimeiroE s)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- | Remove o último caracter de uma string

removeUlt :: String -- ^ "IDVDI"
          -> String -- ^ "IDVD"

removeUlt [] = ""
removeUlt (h:t) | t == "" = ""
                | otherwise = [h] ++ removeUlt t


-- | Retoma a cabeça de uma string

cabeca :: String -- ^ "IDVDI"
       -> String -- ^ "I"

cabeca [] = ""
cabeca (h:t) = [h]


-- | Retoma o número de peças consecutivas repetidas no início da string

repetidos :: String -- ^ "III"
          -> Int    -- ^ 3

repetidos [] = 0
repetidos (h:t) | [h] == (cabeca t) = 1 + (repetidos t)
                | otherwise = 1


-- | Remove as peças repetidas consecutivas no início da string

removeRepetidos :: String -- ^ "IIDVDII"
                -> String -- ^ "DVDII"

removeRepetidos [] = ""
removeRepetidos (h:t) | [h] == cabeca t = removeRepetidos t
                      | otherwise = t


-- | Separa os componentes do estado com /

separa :: String -- ^ "abc"
       -> String -- ^ "abc/"

separa [] = ""
separa (h:t) | t == [] = "/"
             | otherwise = [h] ++ separa t


-- | Separa o primeiro componente de um estado

separaPrimeiro :: String -- ^ "abc/def"
               -> String -- ^ "abc"

separaPrimeiro [] = ""
separaPrimeiro (h:t) | h == '/' = ""
                     | otherwise = [h] ++ separaPrimeiro t


-- | Remove o primeiro componente de um estado

removePrimeiro :: String -- ^ "abc/def"
               -> String -- ^ "def"

removePrimeiro [] = ""
removePrimeiro (h:t) | h == '/' = t
                     | otherwise = removePrimeiro t 


-- | Separa o primeiro elemento de um componente de um estado

separaPrimeiroE :: String -- ^ "IIDVDII;IIIIIII"
                -> String -- ^ "IIDVDII"

separaPrimeiroE [] = ""
separaPrimeiroE (h:t) | h == ';' = ""
                      | otherwise = [h] ++ separaPrimeiroE t 


-- | Remove o primeiro elemento de um componente de um estado

removePrimeiroE :: String -- ^ "IIDVDII;IIIIIII"
                -> String -- ^ "IIIIIII"

removePrimeiroE [] = ""
removePrimeiroE (h:t) | h == ';' = t
                      | otherwise = removePrimeiroE t


-- | Remove o último elemento de um componente de um estado

removeUltimoE :: String -- ^ "IIDVDII;IIIIIII;IIDVDII"
              -> String -- ^ "IIDVDII;IIIIIII"

removeUltimoE [] = ""
removeUltimoE s | removePrimeiroE s == "" = ""
                | otherwise = separaPrimeiroE s ++ ";" ++ removeUltimoE (removePrimeiroE s)


-- | Separa o primeiro elemento de um mapa

separaEl :: String -- ^ "3D,2V,D,2V"
         -> String -- ^ "3D"

separaEl [] = ""
separaEl (h:t) | h == ',' = ""
               | otherwise = [h] ++ separaEl t 


-- | Remove os primeiros elementos de um jogador/disparo

removeEl :: String -- ^ String a qual remover o elemento
         -> Int    -- ^ Número de vezes que remove
         -> String -- ^ String com os elementos removidos

removeEl s 0 = s
removeEl s 1 = removeEl2 s
removeEl s x = removeEl (removeEl2 s) (x-1) 


-- | Remove o primeiro elemento de um jogador/disparo

removeEl2 :: String -- ^ "3,3,C,1,1,1"
          -> String -- ^ "3,C,1,1,1"

removeEl2 [] = ""
removeEl2 (h:t) | h == ',' || h == ';' = t
                | otherwise = removeEl2 t 


-- | Remove uma peça de uma string  

removePeca :: String -- ^ "5I"
           -> String -- ^ "5"

removePeca [] = ""
removePeca (h:t) | h == 'I' || h == 'D' || h == 'V' = ""
                 | otherwise = [h] ++ removePeca t


-- | Remove o número de peças de uma string 

pecas :: String -- ^ "5III"
      -> String -- ^ "III"

pecas [] = ""
pecas (h:t) | h == 'I' = (h:t)
            | h == 'D' = (h:t)
            | h == 'V' = (h:t)
            | otherwise = pecas t


-- | Retoma a peça de uma string

peca :: String -- ^ "5III"
     -> String -- ^ "I"

peca [] = ""
peca (h:t) | h == 'I' = "I"
           | h == 'D' = "D"
           | h == 'V' = "V"
           | otherwise = peca t


-- | Retoma o número de colunas de um mapa

nColunas :: String -- ^ Linha de um mapa
         -> Int    -- ^ Número de colunas da linha

nColunas [] = 0
nColunas (h:t) | h == ';' = 0
               | otherwise = 1 + nColunas t


-- | Indica os valores posicionais de um inteiro

posicionais :: String -- ^ "100"
            -> Int    -- ^ 3

posicionais [] = 0
posicionais (h:t) | h == ',' = 0
                  | otherwise = 1 + posicionais t


-- | Descomprime um inteiro

descomprimeN :: String -- ^ String com o número a descomprimir 
             -> Int    -- ^ Número descomprimido

descomprimeN [] = 0
descomprimeN s  = descomprimeN2 s ((posicionais s)-1)


-- | Descomprime um inteiro

descomprimeN2 :: String -- ^ "100"
              -> Int    -- ^ Valores Posicionais do inteiro (2)
              -> Int    -- ^ 100

descomprimeN2 [] x = 0 
descomprimeN2 (h:t) x | h == ',' = 0
                      | otherwise = read [h] * (10^x) + descomprimeN2 t (x-1)


-- | Descomprime uma direção

descomprimeDirecao :: String  -- ^ String com a descomprimir
                   -> Direcao -- ^ Direção descomprimida

descomprimeDirecao (h:t) | h == 'C' = C
                         | h == 'D' = D
                         | h == 'B' = B 
                         | h == 'E' = E 





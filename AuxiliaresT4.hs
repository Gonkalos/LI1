
-- | Este módulo define funções auxiliares da Tarefa 4 do trabalho prático.

module AuxiliaresT4 where

import LI11819
import Tarefa0_2018li1g026

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- | Destroi as peças destrutíveis afetadas por um disparo laser

destroiLaser :: Mapa    -- ^ Mapa do estado anterior
             -> Disparo -- ^ Disparo laser em causa
             -> Mapa    -- ^ Mapa afetado pelo disparo

destroiLaser m (DisparoLaser _ p d) = case d of
                                        C -> destroiLaserC m p  
                                        D -> destroiLaserD m p
                                        B -> destroiLaserB m p
                                        E -> destroiLaserE m p


-- | Destroi as peças destrutíveis afetadas por um disparo laser com direção C

destroiLaserC :: Mapa    -- ^ Mapa do estado anterior
              -> Posicao -- ^ Posição do disparo
              -> Mapa    -- ^ Mapa afetado pelo disparo

destroiLaserC m (l,c) | find1 == Bloco Destrutivel   && find2 == Bloco Indestrutivel = update1
                      | find1 == Bloco Indestrutivel && find2 == Bloco Destrutivel   = update2
                      | find1 == Bloco Destrutivel   && find2 == Bloco Destrutivel   = destroiLaserC update12 (l-1,c)
                      | find1 == Bloco Destrutivel   && find2 == Vazia               = destroiLaserC update1  (l-1,c)
                      | find1 == Vazia               && find2 == Bloco Destrutivel   = destroiLaserC update2  (l-1,c)
                      | find1 == Vazia               && find2 == Vazia               = destroiLaserC m        (l-1,c)
                      | otherwise                                                    = m

                where find1    = encontraPosicaoMatriz (l,c)   m
                      find2    = encontraPosicaoMatriz (l,c+1) m
                      update1  = atualizaPosicaoMatriz (l,c)   Vazia m 
                      update2  = atualizaPosicaoMatriz (l,c+1) Vazia m
                      update12 = atualizaPosicaoMatriz (l,c)   Vazia (atualizaPosicaoMatriz (l,c+1) Vazia m)


-- | Destroi as peças destrutíveis afetadas por um disparo laser com direção D

destroiLaserD :: Mapa    -- ^ Mapa do estado anterior
              -> Posicao -- ^ Posição do disparo
              -> Mapa    -- ^ Mapa afetado pelo disparo

destroiLaserD m (l,c) | find1 == Bloco Destrutivel   && find2 == Bloco Indestrutivel = update1
                      | find1 == Bloco Indestrutivel && find2 == Bloco Destrutivel   = update2
                      | find1 == Bloco Destrutivel   && find2 == Bloco Destrutivel   = destroiLaserD update12 (l,c+1)
                      | find1 == Bloco Destrutivel   && find2 == Vazia               = destroiLaserD update1  (l,c+1)
                      | find1 == Vazia               && find2 == Bloco Destrutivel   = destroiLaserD update2  (l,c+1)
                      | find1 == Vazia               && find2 == Vazia               = destroiLaserD m        (l,c+1)
                      | otherwise                                                    = m

                where find1    = encontraPosicaoMatriz (l,c-1)   m
                      find2    = encontraPosicaoMatriz (l+1,c-1) m
                      update1  = atualizaPosicaoMatriz (l,c-1)   Vazia m 
                      update2  = atualizaPosicaoMatriz (l+1,c-1) Vazia m
                      update12 = atualizaPosicaoMatriz (l,c-1)  Vazia (atualizaPosicaoMatriz (l+1,c-1) Vazia m)


-- | Destroi as peças destrutíveis afetadas por um disparo laser com direção B

destroiLaserB :: Mapa    -- ^ Mapa do estado anterior
              -> Posicao -- ^ Posição do disparo
              -> Mapa    -- ^ Mapa afetado pelo disparo

destroiLaserB m (l,c) | find1 == Bloco Destrutivel   && find2 == Bloco Indestrutivel = update1
                      | find1 == Bloco Indestrutivel && find2 == Bloco Destrutivel   = update2
                      | find1 == Bloco Destrutivel   && find2 == Bloco Destrutivel   = destroiLaserB update12 (l+1,c)
                      | find1 == Bloco Destrutivel   && find2 == Vazia               = destroiLaserB update1  (l+1,c)
                      | find1 == Vazia               && find2 == Bloco Destrutivel   = destroiLaserB update2  (l+1,c)
                      | find1 == Vazia               && find2 == Vazia               = destroiLaserB m        (l+1,c)
                      | otherwise                                                    = m

                where find1    = encontraPosicaoMatriz (l+1,c)   m
                      find2    = encontraPosicaoMatriz (l+1,c+1) m
                      update1  = atualizaPosicaoMatriz (l+1,c)   Vazia m 
                      update2  = atualizaPosicaoMatriz (l+1,c+1) Vazia m
                      update12 = atualizaPosicaoMatriz (l+1,c)   Vazia (atualizaPosicaoMatriz (l+1,c+1) Vazia m)
                      

-- | Destroi as peças destrutíveis afetadas por um disparo laser com direção E

destroiLaserE :: Mapa    -- ^ Mapa do estado anterior
              -> Posicao -- ^ Posição do disparo
              -> Mapa    -- ^ Mapa afetado pelo disparo

destroiLaserE m (l,c) | find1 == Bloco Destrutivel   && find2 == Bloco Indestrutivel = update1
                      | find1 == Bloco Indestrutivel && find2 == Bloco Destrutivel   = update2
                      | find1 == Bloco Destrutivel   && find2 == Bloco Destrutivel   = destroiLaserE update12 (l,c-1)
                      | find1 == Bloco Destrutivel   && find2 == Vazia               = destroiLaserE update1  (l,c-1)
                      | find1 == Vazia               && find2 == Bloco Destrutivel   = destroiLaserE update2  (l,c-1)
                      | find1 == Vazia               && find2 == Vazia               = destroiLaserE m        (l,c-1)
                      | otherwise                                                    = m

                where find1    = encontraPosicaoMatriz (l,c)   m
                      find2    = encontraPosicaoMatriz (l+1,c) m
                      update1  = atualizaPosicaoMatriz (l,c)   Vazia m 
                      update2  = atualizaPosicaoMatriz (l+1,c) Vazia m
                      update12 = atualizaPosicaoMatriz (l,c)   Vazia (atualizaPosicaoMatriz (l+1,c) Vazia m)


-- | Destroi as peças destrutíveis afetadas por todos os disparos laser

destroiLaser2 :: Mapa      -- ^ Mapa do estado anterior
              -> [Disparo] -- ^ Lista de disparos do estado anterior
              -> Mapa      -- ^ Mapa afetado pelos disparos

destroiLaser2 m [] = m
destroiLaser2 m (h:t) | tipoDisparo h == 'L' = destroiLaser2 (destroiLaser m h) t
                      | otherwise            = destroiLaser2 m t


-- | Diminui a vida de um jogador afetado por um disparo laser

colisaoLaser :: Mapa    -- ^ Mapa do estado anterior
             -> Disparo -- ^ Disparo em causa
             -> Jogador -- ^ Jogador em causa
             -> Jogador -- ^ Jogador atualizado

colisaoLaser m (DisparoLaser j (l,c) d) (Jogador (x,y) dir v ls ch) | d == C && l == x && (c == y-1 || c == y || c == y+1) && v > 0 = Jogador (x,y) dir (v-1) ls ch
                                                                    | d == D && c == y && (l == x-1 || l == x || l == x-1) && v > 0 = Jogador (x,y) dir (v-1) ls ch
                                                                    | d == B && l == x && (c == y-1 || c == y || c == y+1) && v > 0 = Jogador (x,y) dir (v-1) ls ch
                                                                    | d == E && c == y && (l == x-1 || l == x || l == x+1) && v > 0 = Jogador (x,y) dir (v-1) ls ch
                                                                    | d == C && (find1 == Bloco Indestrutivel || find2 == Bloco Indestrutivel) = Jogador (x,y) dir v ls ch
                                                                    | d == D && (find2 == Bloco Indestrutivel || find3 == Bloco Indestrutivel) = Jogador (x,y) dir v ls ch
                                                                    | d == B && (find4 == Bloco Indestrutivel || find3 == Bloco Indestrutivel) = Jogador (x,y) dir v ls ch
                                                                    | d == E && (find1 == Bloco Indestrutivel || find4 == Bloco Indestrutivel) = Jogador (x,y) dir v ls ch
                                                                    | d == C = colisaoLaser m (DisparoLaser j (l-1,c) d) (Jogador (x,y) dir v ls ch)
                                                                    | d == D = colisaoLaser m (DisparoLaser j (l,c+1) d) (Jogador (x,y) dir v ls ch)
                                                                    | d == B = colisaoLaser m (DisparoLaser j (l+1,c) d) (Jogador (x,y) dir v ls ch)
                                                                    | d == E = colisaoLaser m (DisparoLaser j (l,c-1) d) (Jogador (x,y) dir v ls ch)
                                                                    | otherwise = Jogador (x,y) dir v ls ch

                                                              where find1 = encontraPosicaoMatriz (l,c)     m
                                                                    find2 = encontraPosicaoMatriz (l,c+1)   m
                                                                    find3 = encontraPosicaoMatriz (l+1,c+1) m
                                                                    find4 = encontraPosicaoMatriz (l+1,c)   m 


-- | Diminui a vida de todos os jogadores afetados por um disparo laser 

colisaoLaser2 :: Mapa      -- ^ Mapa do estado anterior
              -> Disparo   -- ^ Disparo em causa
              -> [Jogador] -- ^ Lista de jogadores do estado anterior
              -> [Jogador] -- ^ Lista de jogadores afetada pelo disparo

colisaoLaser2 m d [] = []
colisaoLaser2 m d (j:js) = [colisaoLaser m d j] ++ colisaoLaser2 m d js


-- | Diminui a vida de todos os jogadores afetados por todos os disparo laser

colisaoLaser3 :: Mapa      -- ^ Mapa do estado anterior
              -> [Disparo] -- ^ Lista de disparos do estado anterior
              -> [Jogador] -- ^ Lista de jogadores do estado anterior
              -> [Jogador] -- ^ Lista de jogadores afetada pelos disparos

colisaoLaser3 m []     js = js 
colisaoLaser3 m (d:ds) js | tipoDisparo d == 'L' = colisaoLaser3 m ds (colisaoLaser2 m d js)  
                          | otherwise            = colisaoLaser3 m ds js 


-- | Destroi todas as balas de canhão afetadas por um disparo laser

laserDisparo :: Disparo   -- ^ Disparo em causa 
             -> [Disparo] -- ^ Lista de disparos não-laser
             -> [Disparo] -- ^ Lista de disparos não-laser afetada pelo disparo

laserDisparo _ [] = []
laserDisparo (DisparoLaser j (l,c) d) (h:t) = case tipoDisparo h == 'C' && d == C && l >= fst (posDisparo h) && c == snd (posDisparo h) 
                                                || tipoDisparo h == 'C' && d == D && c <= snd (posDisparo h) && l == fst (posDisparo h) 
                                                || tipoDisparo h == 'C' && d == B && l <= fst (posDisparo h) && c == snd (posDisparo h) 
                                                || tipoDisparo h == 'C' && d == E && c >= snd (posDisparo h) && l == fst (posDisparo h) of
                                                True  ->        laserDisparo (DisparoLaser j (l,c) d) t
                                                False -> [h] ++ laserDisparo (DisparoLaser j (l,c) d) t


-- | Destroi todas as balas de canhão afetadas por todos os disparos laser

laserDisparo2 :: [Disparo] -- ^ Lista de disparos laser
              -> [Disparo] -- ^ Lista de disparos não-laser
              -> [Disparo] -- ^ Lista de disparos não-laser afetada pelos disparos laser

laserDisparo2 []    d = d
laserDisparo2 (h:t) d = laserDisparo2 t (laserDisparo h d)   


-- | Destroi todas as balas de canhão afetadas por todos os disparos laser

laserDisparo3 :: [Disparo] -- ^ Lista de disparos do estado anterior
              -> [Disparo] -- ^ Lista de disparos atualizada

laserDisparo3 d = laserDisparo2 (removeNoLaser d) (removeLaser d)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- | Destroi as peças destrutíveis afetadas por um disparo canhão

destroiCanhao :: Mapa    -- ^ Mapa do estado anterior
              -> Disparo -- ^ Disparo canhão em causa
              -> Mapa    -- ^ Mapa afetado pelo disparo

destroiCanhao m (DisparoCanhao _ p d) = case d of
                                          C -> destroiCanhaoC m p
                                          D -> destroiCanhaoD m p
                                          B -> destroiCanhaoB m p
                                          E -> destroiCanhaoE m p


-- | Destroi as peças destrutíveis afetadas por um disparo canhão com direção C

destroiCanhaoC :: Mapa    -- ^ Mapa do estado anterior
               -> Posicao -- ^ Posição do disparo
               -> Mapa    -- ^ Mapa afetado pelo disparo

destroiCanhaoC m (l,c) | find1 == Bloco Destrutivel   && find2 == Bloco Indestrutivel || find1 == Bloco Destrutivel && find2 == Vazia             = update1
                       | find1 == Bloco Indestrutivel && find2 == Bloco Destrutivel   || find1 == Vazia             && find2 == Bloco Destrutivel = update2
                       | find1 == Bloco Destrutivel   && find2 == Bloco Destrutivel                                                               = update12 
                       | otherwise                                                                                                                = m

                 where find1    = encontraPosicaoMatriz (l,c)   m
                       find2    = encontraPosicaoMatriz (l,c+1) m
                       update1  = atualizaPosicaoMatriz (l,c)   Vazia m 
                       update2  = atualizaPosicaoMatriz (l,c+1) Vazia m
                       update12 = atualizaPosicaoMatriz (l,c)   Vazia (atualizaPosicaoMatriz (l,c+1) Vazia m)


-- | Destroi as peças destrutíveis afetadas por um disparo canhão com direção D

destroiCanhaoD :: Mapa    -- ^ Mapa do estado anterior
               -> Posicao -- ^ Posição do disparo
               -> Mapa    -- ^ Mapa afetado pelo disparo

destroiCanhaoD m (l,c) | find1 == Bloco Destrutivel   && find2 == Bloco Indestrutivel || find1 == Bloco Destrutivel && find2 == Vazia             = update1
                       | find1 == Bloco Indestrutivel && find2 == Bloco Destrutivel   || find1 == Vazia             && find2 == Bloco Destrutivel = update2
                       | find1 == Bloco Destrutivel   && find2 == Bloco Destrutivel                                                               = update12  
                       | otherwise                                                                                                                = m

                 where find1    = encontraPosicaoMatriz (l,c+1)   m
                       find2    = encontraPosicaoMatriz (l+1,c+1) m
                       update1  = atualizaPosicaoMatriz (l,c+1)   Vazia m 
                       update2  = atualizaPosicaoMatriz (l+1,c+1) Vazia m
                       update12 = atualizaPosicaoMatriz (l,c+1)   Vazia (atualizaPosicaoMatriz (l+1,c+1) Vazia m)


-- | Destroi as peças destrutíveis afetadas por um disparo canhão com direção B

destroiCanhaoB :: Mapa    -- ^ Mapa do estado anterior
               -> Posicao -- ^ Posição do disparo
               -> Mapa    -- ^ Mapa afetado pelo disparo

destroiCanhaoB m (l,c) | find1 == Bloco Destrutivel   && find2 == Bloco Indestrutivel || find1 == Bloco Destrutivel && find2 == Vazia             = update1
                       | find1 == Bloco Indestrutivel && find2 == Bloco Destrutivel   || find1 == Vazia             && find2 == Bloco Destrutivel = update2
                       | find1 == Bloco Destrutivel   && find2 == Bloco Destrutivel                                                               = update12
                       | otherwise                                                                                                                = m

                 where find1    = encontraPosicaoMatriz (l+1,c)   m
                       find2    = encontraPosicaoMatriz (l+1,c+1) m
                       update1  = atualizaPosicaoMatriz (l+1,c)   Vazia m 
                       update2  = atualizaPosicaoMatriz (l+1,c+1) Vazia m
                       update12 = atualizaPosicaoMatriz (l+1,c)   Vazia (atualizaPosicaoMatriz (l+1,c+1) Vazia m)


-- | Destroi as peças destrutíveis afetadas por um disparo canhão com direção E

destroiCanhaoE :: Mapa    -- ^ Mapa do estado anterior
               -> Posicao -- ^ Posição do disparo
               -> Mapa    -- ^ Mapa afetado pelo disparo

destroiCanhaoE m (l,c) | find1 == Bloco Destrutivel   && find2 == Bloco Indestrutivel || find1 == Bloco Destrutivel && find2 == Vazia             = update1
                       | find1 == Bloco Indestrutivel && find2 == Bloco Destrutivel   || find1 == Vazia             && find2 == Bloco Destrutivel = update2
                       | find1 == Bloco Destrutivel   && find2 == Bloco Destrutivel                                                               = update12
                       | otherwise                                                                                                                = m

                 where find1    = encontraPosicaoMatriz (l,c)   m
                       find2    = encontraPosicaoMatriz (l+1,c) m
                       update1  = atualizaPosicaoMatriz (l,c)   Vazia m 
                       update2  = atualizaPosicaoMatriz (l+1,c) Vazia m
                       update12 = atualizaPosicaoMatriz (l,c)   Vazia (atualizaPosicaoMatriz (l+1,c) Vazia m)


-- | Destroi as peças destrutíveis afetadas por todos os disparos canhão

destroiCanhao2 :: Mapa      -- ^ Mapa do estado anterior
               -> [Disparo] -- ^ Lista de disparos do estado anterior
               -> Mapa      -- ^ Mapa afetado pelos disparos

destroiCanhao2 m [] = m
destroiCanhao2 m (d:ds) | tipoDisparo d == 'C' = destroiCanhao2 (destroiCanhao m d) ds
                        | otherwise            = destroiCanhao2 m ds 


-- | Diminui a vida de um jogador afetado por um disparo canhão

colisaoCanhao :: Disparo -- ^ Disparo em causa
              -> Jogador -- ^ Jogador em causa
              -> Jogador -- ^ Jogador afetado pelo disparo

colisaoCanhao (DisparoCanhao _ (l,c) d) (Jogador (x,y) dir v ls ch) = case d == C && l-1 == x && (c == y-1 || c == y || c == y+1) && v > 0
                                                                        || d == D && c+1 == y && (l == x-1 || l == x || l == x+1) && v > 0
                                                                        || d == B && l+1 == x && (c == y-1 || c == y || c == y+1) && v > 0
                                                                        || d == E && c-1 == y && (l == x-1 || l == x || l == x+1) && v > 0 of
                                                                        True  -> Jogador (x,y) dir (v-1) ls ch
                                                                        False -> Jogador (x,y) dir  v    ls ch


-- | Diminui a vida de todos os jogadores afetados por um disparo canhão

colisaoCanhao2 :: Disparo   -- ^ Disparo em causa 
               -> [Jogador] -- ^ Lista de jogadores do estado anterior
               -> [Jogador] -- ^ Lista de jogadores afetada pelo disparo

colisaoCanhao2 d [] = []
colisaoCanhao2 d (h:t) | life h == life (colisaoCanhao d h) = [colisaoCanhao d h] ++ colisaoCanhao2 d t
                       | otherwise = [colisaoCanhao d h] ++ t 


-- | Diminui a vida de todos os jogadores afetados por todos os disparos laser

colisaoCanhao3 :: [Disparo] -- ^ Lista de disparos do estado anterior
               -> [Jogador] -- ^ Lista de jogadores do estado anterior
               -> [Jogador] -- ^ Lista de jogadores afetada pelos disparos

colisaoCanhao3 []     js = js
colisaoCanhao3 (d:ds) js | tipoDisparo d == 'C' = colisaoCanhao3 ds (colisaoCanhao2 d js)
                         | otherwise            = colisaoCanhao3 ds js 


-- | Destroi todas as balas de canhão afetadas por um disparo canhão

canhaoDisparo :: Disparo   -- ^ Disparo em causa
              -> [Disparo] -- ^ Lista de disparos do estado anterior
              -> [Disparo] -- ^ Lista de disparos afetada pelo disparo

canhaoDisparo _ []  = []
canhaoDisparo (DisparoCanhao j (l,c) d) (h:t) = case tipoDisparo h == 'C'                                && l   == fst (posDisparo h) && c   == snd (posDisparo h)
                                                  || tipoDisparo h == 'C' && d == C && dirDisparo h == B && l-1 == fst (posDisparo h) && c   == snd (posDisparo h)
                                                  || tipoDisparo h == 'C' && d == D && dirDisparo h == E && l   == fst (posDisparo h) && c+1 == snd (posDisparo h)
                                                  || tipoDisparo h == 'C' && d == B && dirDisparo h == C && l+1 == fst (posDisparo h) && c   == snd (posDisparo h)
                                                  || tipoDisparo h == 'C' && d == E && dirDisparo h == D && l   == fst (posDisparo h) && c-1 == snd (posDisparo h) of
                                                  True  -> t
                                                  False -> [h] ++ canhaoDisparo (DisparoCanhao j (l,c) d) t 


-- | Destroi todas as balas de canhão afetadas por todos os disparos canhão

canhaoDisparo2 :: [Disparo] -- ^ Lista de disparos do estado anterior
               -> [Disparo] -- ^ Lista de disparos atualizada

canhaoDisparo2 []  = []
canhaoDisparo2 (h:t) = case tipoDisparo h == 'C' && comparaListaD (h:t) ([h] ++ canhaoDisparo h t)
                         || tipoDisparo h /= 'C' of
                         True  -> [h] ++ canhaoDisparo2 t
                         False -> canhaoDisparo2 (canhaoDisparo h t)


-- | Remove os disparos canhão que colidiram

removeCanhao :: Estado    -- ^ Estado anterior 
             -> [Disparo] -- ^ Lista de disparos atualizada

removeCanhao (Estado m js []) = []
removeCanhao (Estado m js (d:ds)) = case tipoDisparo d == 'C' && comparaMapa m (destroiCanhao m d) && comparaVidasJ js (colisaoCanhao2 d js) && comparaListaD (d:ds) (canhaoDisparo2 (d:ds))
                                      || tipoDisparo d == 'L'
                                      || tipoDisparo d == 'X' of
                                      True  -> [d] ++ removeCanhao (Estado m js ds)
                                      False ->        removeCanhao (Estado m js ds)


-- | Remove os disparos canhão que colidiram

removeCanhao2 :: Estado    -- ^ Estado anterior
              -> [Disparo] -- ^ Lista de disparos atualizada

removeCanhao2 (Estado m js ds) = canhaoBorda (dimensaoMapa m) (removeCanhao (Estado m js ds))


-- | Remove os disparos canhão que colidiram

removeCanhao3 :: Estado    -- ^ Estado anterior
              -> [Disparo] -- ^ Lista de disparos atualizada

removeCanhao3 (Estado m js ds) = canhaoBloco m (removeCanhao2 (Estado m js ds))


-- | Remove os disparos canhão que colidiram com blocos indestrutíveis

canhaoBloco :: Mapa      -- ^ Mapa do estado anterior
            -> [Disparo] -- ^ Lista de disparos do estado anterior
            -> [Disparo] -- ^ Lista de disparos atualizada

canhaoBloco m []     = []
canhaoBloco m (d:ds) = case tipoDisparo d == 'C' && dirDisparo d == C && (find1 == Bloco Indestrutivel || find2 == Bloco Indestrutivel)
                         || tipoDisparo d == 'C' && dirDisparo d == D && (find2 == Bloco Indestrutivel || find3 == Bloco Indestrutivel)
                         || tipoDisparo d == 'C' && dirDisparo d == B && (find4 == Bloco Indestrutivel || find3 == Bloco Indestrutivel)
                         || tipoDisparo d == 'C' && dirDisparo d == E && (find1 == Bloco Indestrutivel || find4 == Bloco Indestrutivel) of
                         True  -> canhaoBloco m ds
                         False -> [d] ++ canhaoBloco m ds

                   where find1 = encontraPosicaoMatriz (posDisparo d)                         m
                         find2 = encontraPosicaoMatriz (linhaDisparo d   ,colunaDisparo d +1) m
                         find3 = encontraPosicaoMatriz (linhaDisparo d +1,colunaDisparo d +1) m
                         find4 = encontraPosicaoMatriz (linhaDisparo d +1,colunaDisparo d)    m


-- | Remove os disparos canhão que colidiram com a borda 

canhaoBorda :: Dimensao  -- ^ Dimensão do mapa
            -> [Disparo] -- ^ Lista de disparos do estado anterior
            -> [Disparo] -- ^ Lista de disparos atualizada

canhaoBorda _ [] = [] 
canhaoBorda (x,y) (d:ds) = case tipoDisparo d == 'C' && dirDisparo d == C && linhaDisparo  d <= 0
                             || tipoDisparo d == 'C' && dirDisparo d == D && colunaDisparo d >= y-2
                             || tipoDisparo d == 'C' && dirDisparo d == B && linhaDisparo  d >= x-2
                             || tipoDisparo d == 'C' && dirDisparo d == E && colunaDisparo d <= 0 of
                             True  -> canhaoBorda (x,y) ds
                             False -> [d] ++ canhaoBorda (x,y) ds


-- | Movimenta um disparos canhão  

moveCanhao :: Disparo -- ^ Disparo do estado anterior 
           -> Disparo -- ^ Disparo após um tick sem colisão

moveCanhao (DisparoCanhao j (l,c) d) = case d of
                                         C -> DisparoCanhao j (l-1,c) d
                                         D -> DisparoCanhao j (l,c+1) d
                                         B -> DisparoCanhao j (l+1,c) d
                                         E -> DisparoCanhao j (l,c-1) d


-- Movimenta todos os disparos canhão

moveCanhao2 :: [Disparo] -- ^ Lista de disparos do estado anterior
            -> [Disparo] -- ^ Lista de disparos atualizada

moveCanhao2 [] = []
moveCanhao2 (d:ds) | tipoDisparo d == 'C' = [moveCanhao d] ++ moveCanhao2 ds
                   | otherwise            = [d]            ++ moveCanhao2 ds 

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- | Decrementa o tempo dos disparos choque

sublTimeDisparo2 :: [Disparo] -- ^ Lista de disparos do estado anterior
                 -> [Disparo] -- ^ Lista de disparos atualizada

sublTimeDisparo2 [] = []
sublTimeDisparo2 (d:ds) | tipoDisparo d == 'X' = [sublTimeDisparo d] ++ sublTimeDisparo2 ds
                        | otherwise =                            [d] ++ sublTimeDisparo2 ds 


-- | Remove os disparos choque quando acaba o tempo 

removeChoque :: [Disparo] -- ^ Lista de disparos do estado anterior
             -> [Disparo] -- ^ Lista de disparos atualizada

removeChoque [] = []
removeChoque (d:ds) | tipoDisparo d == 'X' && timeDisparo d == -1 = removeChoque ds
                    | otherwise = [d] ++ removeChoque ds

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- | Retoma o tipo de um disparo

tipoDisparo :: Disparo -- ^ Disparo em causa
            -> Char    -- ^ Carater demostrativo do tipo do disparo

tipoDisparo (DisparoCanhao _ _ _) = 'C'
tipoDisparo (DisparoLaser  _ _ _) = 'L'
tipoDisparo (DisparoChoque   _ _) = 'X'


-- | Retoma o jogador de um disparo

jogDisparo :: Disparo -- ^ Disparo em causa
           -> Int     -- ^ Jogador do disparo

jogDisparo (DisparoCanhao j _ _) = j
jogDisparo (DisparoLaser  j _ _) = j
jogDisparo (DisparoChoque j   _) = j


-- | Retoma a posição de um disparo

posDisparo :: Disparo -- ^ Disparo em causa
           -> Posicao -- ^ Posição do disparo

posDisparo (DisparoCanhao _ p _) = p
posDisparo (DisparoLaser  _ p _) = p


-- | Retoma a linha de um disparo

linhaDisparo :: Disparo -- ^ Disparo em causa
             -> Int     -- ^ Linha do disparo

linhaDisparo (DisparoCanhao _ (l,c) _) = l
linhaDisparo (DisparoLaser  _ (l,c) _) = l


-- | Retoma a coluna de um disparo

colunaDisparo :: Disparo -- ^ Disparo em causa
              -> Int     -- ^ Coluna do disparo

colunaDisparo (DisparoCanhao _ (l,c) _) = c
colunaDisparo (DisparoLaser  _ (l,c) _) = c


-- | Retoma a direção de um disparo

dirDisparo :: Disparo -- ^ Disparo em causa
           -> Direcao -- ^ Direção do disparo

dirDisparo (DisparoCanhao _ _ d) = d
dirDisparo (DisparoLaser  _ _ d) = d


-- | Retoma o tempo restante de um disparo choque

timeDisparo :: Disparo -- ^ Disparo em causa
            -> Int     -- ^ Tempo do disparo

timeDisparo (DisparoChoque _ t) = t


-- | Decrementa o tempo de um disparo choque

sublTimeDisparo :: Disparo -- ^ Disparo em causa
                -> Disparo -- ^ Disparo atualizado

sublTimeDisparo (DisparoChoque j t) = DisparoChoque j (t-1)


-- | Retoma a posição de um jogador

posJogador :: Jogador -- ^ Jogador em causa
           -> Posicao -- ^ Posição do jogador

posJogador (Jogador p _ _ _ _) = p


-- | Retoma a vida de um Jogador

life :: Jogador -- ^ Jogador em causa
     -> Int     -- ^ Vida do jogador

life (Jogador _ _ v _ _) = v


-- | Remove todos os disparos não-lasers de uma lista de disparos

removeNoLaser :: [Disparo] -- ^ Lista de disparos
              -> [Disparo] -- ^ Lista de disparos laser
removeNoLaser [] = []
removeNoLaser (h:t) | tipoDisparo h == 'L' = [h] ++ removeNoLaser t
                    | otherwise                   = removeNoLaser t 


-- | Remove todos os disparos laser de uma lista de disparos

removeLaser :: [Disparo] -- ^ Lista de disparos
            -> [Disparo] -- ^ Lista de disparos não-laser

removeLaser [] = []
removeLaser (h:t) | tipoDisparo h == 'L' = removeLaser t
                  | otherwise     = [h] ++ removeLaser t


-- | Compara duas listas de peças

comparaListaP :: [Peca] -- ^ Lista 1
              -> [Peca] -- ^ Lista 2
              -> Bool   -- ^ Comparação

comparaListaP [] [] = True
comparaListaP [] p  = False
comparaListaP p  [] = False
comparaListaP (h1:t1) (h2:t2) | h1 == h2  = comparaListaP t1 t2
                              | otherwise = False  


-- | Compara dois mapas

comparaMapa :: Mapa -- ^ Mapa 1
            -> Mapa -- ^ Mapa 2
            -> Bool -- ^ Comparação

comparaMapa [] [] = True
comparaMapa (h1:t1) (h2:t2) | comparaListaP h1 h2 = comparaMapa t1 t2
                            | otherwise = False


-- | Compara duas listas de jogadores pelas suas vidas

comparaVidasJ :: [Jogador] -- ^ Lista 1
              -> [Jogador] -- ^ Lista 2
              -> Bool      -- ^ Comparação

comparaVidasJ [] [] = True
comparaVidasJ (h1:t1) (h2:t2) | life h1 == life h2 = comparaVidasJ t1 t2
                              | otherwise = False 


-- | Compara duas listas de disparos

comparaListaD :: [Disparo] -- ^ Lista 1
              -> [Disparo] -- ^ Lista 2
              -> Bool      -- ^ Comparação

comparaListaD [] [] = True
comparaListaD [] d  = False
comparaListaD d  [] = False
comparaListaD (h1:t1) (h2:t2) = case tipoDisparo h1 == 'C' && tipoDisparo h2 == 'C' && posDisparo h1 == posDisparo h2 && jogDisparo  h1 == jogDisparo  h2 && dirDisparo h1 == dirDisparo h2
                                  || tipoDisparo h1 == 'L' && tipoDisparo h2 == 'L' && posDisparo h1 == posDisparo h2 && jogDisparo  h1 == jogDisparo  h2 && dirDisparo h1 == dirDisparo h2
                                  || tipoDisparo h1 == 'X' && tipoDisparo h2 == 'X' && jogDisparo h1 == jogDisparo h2 && timeDisparo h1 == timeDisparo h2 of
                                  True  -> comparaListaD t1 t2
                                  False -> False


-- | Retoma a dimensão de um mapa

dimensaoMapa :: Mapa     -- ^ Mapa em causa
             -> Dimensao -- ^ Dimensão do mapa

dimensaoMapa (h:t) = (nLinhas (h:t),nColunas h)


-- | Retoma o número de linhas de um mapa

nLinhas :: Mapa -- ^ Mapa em causa
        -> Int  -- ^ Número de linhas

nLinhas [] = 0
nLinhas (h:t) = 1 + nLinhas t


-- | Retoma o número de colunas de uma linha de um mapa

nColunas :: [Peca] -- ^ Linha em causa
         -> Int    -- ^ Número de colunas 

nColunas [] = 0
nColunas (h:t) = 1 + (nColunas t) 





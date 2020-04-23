
{- |

= Introdução


Para esta tarefa foi nos pedido que trabalhessemos na parte gráfica do projeto/jogo e o desafio foi esse mesmo, trabalharmos com uma "ferramenta" que nunca usamos para colocar o jogo "funcionável".
No inicio custou a adequar à forma como se trabalhava com o Gloss mas conseguimos aprender o que precisavamos através de testes com imagens simples e com o exemplo dado pelos professores.
Os resultados, de uma forma resumida, foram bons e melhores do que estávamos à espera.

= Objetivos 

== Fase de aprendizagem

No inicio, tal como disse na Introdução, foi um pouco dificil sendo que nunca tinhamos utilizado esta ferramenta e a pouca utilização desta ferramenta também não ajudou muito quando se pesquisava por algo.
Mas, após testes básicos, decidimos começar pelo Menu para nos habituarmos melhor e termos uma melhor noção do que iamos fazer.
Sendo então o objetivo desta fase fazer um menu que fosse funcionável e que reagisse da forma que queriamos.
A estratégia que utilizamos para fazer o Menu foi através de imagens feitas por nós.

== Fase de Construção do Mapa

Esta fase foi a que nos mais espantou pelo motivo de termos conseguido fazer facilmente e estavamos à espera que fosse a pior fase da tarefa.
Começamos por desenhar só uma peça e tentar mudar de sitio e tamanho e só após disso avançamos com as linhas.
Tendo uma linha completa foi só repetir o processo para o resto do mapa.

== Fase de Construção do Estado

Esta foi a fase que mais trabalho deu em fazer, contudo foi a fase que nos ajudou a descobrir e a resolver erros que tinhamos nas tarefas anteriores já que tendo parte gráfica feita conseguimos ter uma noção de todos os casos possíveis.
A estratégia utilizada foi começar por desenhar os jogadores. Primeiro colocamos os jogadores nas suas posições escalando os no tamanho correto e só depois adicionamos teclas para que eles se pudessem movimentar.
Após ser possível movimentar os jogadores e com as colisões com os blocos a funcionar, seguimos para os disparos de canhão e choque e deixamos os lasers para último pois assumimos como o mais trabalhoso de fazer.
Seguidamente, tendo tudo a funcionar, decidimos tratar de colocar visível o número de vidas, lasers e choques de cada jogador.

== Fase de Detalhes

Esta fase foi aquela em que adicionamos as coisas minimais tais como pausa e tela final de vencedor.

= Conclusão

Concluindo, não achamos que os resultados desta tarefa fossem maus, pelo contrário, achamos que correu muito bem e que o obtido era o nosso objetivo final.
Como ponto positivo desta tarefa dizemos que é bastante útil para resolução de problemas que não conseguimos vizualizar tão facilmente com a plataforma de testes.


-}

module Main where

import LI11819
import Graphics.Gloss 
import Graphics.Gloss.Interface.Pure.Game 
import Graphics.Gloss.Data.Picture
import Tarefa0_2018li1g026
import Tarefa2_2018li1g026
import Tarefa4_2018li1g026
import AuxiliaresT2

-- | Estado da parte gráfica.
data EstadoG = EstadoG {    
    menu :: Int ,       -- ^ Menu em que está presente. 
    posMenu :: Int ,    -- ^ Posição do Menu em que está presente. 
    images :: Images ,  -- ^ Lista de 'Images'.
    jogo :: Estado      -- ^ 'Estado' do jogo.
 }

 -- | Lista de Images
data Images = Images 
    {
                        menu_1  :: Picture ,            -- ^ Posição 1 do Menu inicial.
                        menu_2  :: Picture ,            -- ^ Posição 2 do Menu inicial.
                        menu_3  :: Picture ,            -- ^ Posição 3 do Menu Inicial.
                        menu2_1 :: Picture ,            -- ^ Posição 1 do Menu Help.
                        menu2_2 :: Picture ,            -- ^ Posição 2 do Menu Help.
                        menu2_3 :: Picture ,            -- ^ Posição 3 do Menu Help.
                        menu2_4 :: Picture ,            -- ^ Posição 4 do Menu Help.
                        menu3   :: Picture ,            -- ^ Menu Credits.
                        menu_game :: Picture ,          -- ^ Imagem de fundo dentro do Jogo.
                        bD      :: Picture ,            -- ^ Bloco Destrutivel.
                        bI      :: Picture ,            -- ^ Bloco Indestrutível.
                        ch      :: Picture ,            -- ^ Bloco Vazia.
                        p1C     :: Picture ,            -- ^ Visão de trás do Jogador 1.
                        p1D     :: Picture ,            -- ^ Visão lateral direita do Jogador 1.
                        p1B     :: Picture ,            -- ^ Visão de frente do Jogador 1.
                        p1E     :: Picture ,            -- ^ Visão lateral esquerda do Jogador 1.
                        p2C     :: Picture ,            -- ^ Visão de trás do Jogador 2.
                        p2D     :: Picture ,            -- ^ Visão lateral direita do Jogador 2.
                        p2B     :: Picture ,            -- ^ Visão de frente do Jogador 2.
                        p2E     :: Picture ,            -- ^ Visão lateral esquerda do Jogador 2.
                        p3C     :: Picture ,            -- ^ Visão de trás do Jogador 3.
                        p3D     :: Picture ,            -- ^ Visão lateral direita do Jogador 3.
                        p3B     :: Picture ,            -- ^ Visão de frente do Jogador 3.
                        p3E     :: Picture ,            -- ^ Visão lateral esquerda do Jogador 3.
                        p4C     :: Picture ,            -- ^ Visão de trás do Jogador 4.
                        p4D     :: Picture ,            -- ^ Visão lateral direita do Jogador 4.
                        p4B     :: Picture ,            -- ^ Visão de frente do Jogador 3.
                        p4E     :: Picture ,            -- ^ Visão lateral esquerda do Jogador 4.
                        pausa   :: Picture ,            -- ^ Imagem de Pausa. 
                        canhao  :: Picture ,            -- ^ Imagem inicial de teste dos disparos.
                        disparo1 :: Picture ,           -- ^ Imagem do Disparo do Jogador 1.
                        disparo2 :: Picture ,           -- ^ Imagem do Disparo do Jogador 2.
                        disparo3 :: Picture ,           -- ^ Imagem do Disparo do Jogador 3.
                        disparo4 :: Picture ,           -- ^ Imagem do Disparo do Jogador 4.
                        laser1 :: Picture ,             -- ^ Imagem do Laser do Jogador 1.
                        laser2 :: Picture ,             -- ^ Imagem do Laser do Jogador 2.
                        laser3 :: Picture ,             -- ^ Imagem do Laser do Jogador 3.
                        laser4 :: Picture ,             -- ^ Imagem do Laser do Jogador 4.
                        laser1_final :: Picture ,       -- ^ Imagem do final do Laser do Jogador 1.
                        laser2_final :: Picture ,       -- ^ Imagem do final do Laser do Jogador 2.
                        laser3_final :: Picture ,       -- ^ Imagem do final do Laser do Jogador 3.
                        laser4_final :: Picture ,       -- ^ Imagem do final do Laser do Jogador 4.
                        choque1 :: Picture ,            -- ^ Imagem do Choque do Jogador 1.
                        choque2 :: Picture ,            -- ^ Imagem do Choque do Jogador 2.
                        choque3 :: Picture ,            -- ^ Imagem do Choque do Jogador 3.
                        choque4 :: Picture ,            -- ^ Imagem do Choque do Jogador 4.
                        p1winner :: Picture ,           -- ^ Imagem final de Vencedor do Jogador 1.
                        p2winner :: Picture ,           -- ^ Imagem final de Vencedor do Jogador 2.
                        p3winner :: Picture ,           -- ^ Imagem final de Vencedor do Jogador 3.
                        p4winner :: Picture             -- ^ Imagem final de Vencedor do Jogador 4.
}
-- | Função principal da Tarefa 5.
--
-- __NB:__ Esta Tarefa é completamente livre. Deve utilizar a biblioteca <http://hackage.haskell.org/package/gloss gloss> para animar o jogo, e reutilizar __de forma completa__ as funções das tarefas anteriores.
main :: IO ()
main = do inicio <- eI
          joga inicio

-- | Função que recebendo um Estado do Gloss representa-o gráficamente.
joga :: EstadoG -> IO ()
joga eI = play dw bg fr eI desenhaEstadoG reageEvento reageTempo

-- | Frame Rate
fr :: Int
fr = 1

-- | Cor de fundo
bg :: Color
bg = white

-- | Estado 1
jI :: Estado
jI = Estado mapa [Jogador (1,1) C 3 3 3,Jogador (9,1) D 3 3 3,Jogador (1,15) B 3 3 3,Jogador (9,15) E 3 3 3] []
    where
        mapa = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Bloco Destrutivel,Bloco Destrutivel,Vazia,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Bloco Indestrutivel,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]]

-- | Estado 2 
jI1 :: Estado
jI1 = Estado mapa [Jogador (1,1) C 3 3 3,Jogador (10,1) D 3 3 3,Jogador (1,10) B 3 3 3,Jogador (10,10) E 3 3 3] []
    where
        mapa = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]]

-- Estado 3
jI2 :: Estado
jI2 = Estado mapa [Jogador (1,1) D 3 3 3,Jogador (12,1) B 3 3 3,Jogador (1,10) D 3 3 3,Jogador (12,10) E 3 3 3] []
    where
        mapa = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]]



-- | Estado Inicial
eI :: IO EstadoG
eI = do menu_1  <- loadBMP "Imagens/Menu/Menu_1.bmp"
        menu_2  <- loadBMP "Imagens/Menu/Menu_2.bmp"
        menu_3  <- loadBMP "Imagens/Menu/Menu_3.bmp"
        menu2_1 <- loadBMP "Imagens/Menu/Menu2_1.bmp"
        menu2_2 <- loadBMP "Imagens/Menu/Menu2_2.bmp"
        menu2_3 <- loadBMP "Imagens/Menu/Menu2_3.bmp"
        menu2_4 <- loadBMP "Imagens/Menu/Menu2_4.bmp"
        menu3   <- loadBMP "Imagens/Menu/Menu3.bmp"
        menu_game <- loadBMP "Imagens/Menu/Menu_Game.bmp"
        bD      <- loadBMP "Imagens/Sprites/bD.bmp" -- Bloco Destrutitvel
        bI      <- loadBMP "Imagens/Sprites/bI.bmp" -- Bloco Indestrutivel
        ch      <- loadBMP "Imagens/Sprites/ch.bmp" -- Textura do chão
        p1C     <- loadBMP "Imagens/Sprites/p1C.bmp"
        p1D     <- loadBMP "Imagens/Sprites/p1D.bmp"
        p1B     <- loadBMP "Imagens/Sprites/p1B.bmp"
        p1E     <- loadBMP "Imagens/Sprites/p1E.bmp"
        p2C     <- loadBMP "Imagens/Sprites/p2C.bmp"
        p2D     <- loadBMP "Imagens/Sprites/p2D.bmp"
        p2B     <- loadBMP "Imagens/Sprites/p2B.bmp"
        p2E     <- loadBMP "Imagens/Sprites/p2E.bmp"
        p3C     <- loadBMP "Imagens/Sprites/p3C.bmp"
        p3D     <- loadBMP "Imagens/Sprites/p3D.bmp"
        p3B     <- loadBMP "Imagens/Sprites/p3B.bmp"
        p3E     <- loadBMP "Imagens/Sprites/p3E.bmp"
        p4C     <- loadBMP "Imagens/Sprites/p4C.bmp"
        p4D     <- loadBMP "Imagens/Sprites/p4D.bmp"
        p4B     <- loadBMP "Imagens/Sprites/p4B.bmp"
        p4E     <- loadBMP "Imagens/Sprites/p4E.bmp"
        pausa   <- loadBMP "Imagens/Menu/Pausa.bmp"
        canhao  <- loadBMP "Imagens/Sprites/canhao.bmp"
        disparo1 <- loadBMP "Imagens/Sprites/disparo1.bmp"
        disparo2 <- loadBMP "Imagens/Sprites/disparo2.bmp"
        disparo3 <- loadBMP "Imagens/Sprites/disparo3.bmp"
        disparo4 <- loadBMP "Imagens/Sprites/disparo4.bmp"
        laser1 <- loadBMP "Imagens/Sprites/laser1.bmp"
        laser2 <- loadBMP "Imagens/Sprites/laser2.bmp"
        laser3 <- loadBMP "Imagens/Sprites/laser3.bmp"
        laser4 <- loadBMP "Imagens/Sprites/laser4.bmp"
        laser1_final <- loadBMP "Imagens/Sprites/laser1_final.bmp"
        laser2_final <- loadBMP "Imagens/Sprites/laser2_final.bmp"
        laser3_final <- loadBMP "Imagens/Sprites/laser3_final.bmp"
        laser4_final <- loadBMP "Imagens/Sprites/laser4_final.bmp"
        choque1 <- loadBMP "Imagens/Sprites/choque1.bmp"
        choque2 <- loadBMP "Imagens/Sprites/choque2.bmp"
        choque3 <- loadBMP "Imagens/Sprites/choque3.bmp"
        choque4 <- loadBMP "Imagens/Sprites/choque4.bmp"
        p1winner <- loadBMP "Imagens/Menu/p1winner.bmp"
        p2winner <- loadBMP "Imagens/Menu/p2winner.bmp"
        p3winner <- loadBMP "Imagens/Menu/p3winner.bmp"
        p4winner <- loadBMP "Imagens/Menu/p4winner.bmp"
        let imList = Images menu_1 menu_2 menu_3 menu2_1 menu2_2 menu2_3 menu2_4 menu3 menu_game bD bI ch p1C p1D p1B p1E p2C p2D p2B p2E p3C p3D p3B p3E p4C p4D p4B p4E pausa canhao disparo1 disparo2 disparo3 disparo4 laser1 laser2 laser3 laser4 laser1_final laser2_final laser3_final laser4_final choque1 choque2 choque3 choque4 p1winner p2winner p3winner p4winner
            mapa = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Bloco Destrutivel,Bloco Destrutivel,Vazia,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Bloco Indestrutivel,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]]
            estado = Estado mapa [Jogador (1,1) C 3 3 3,Jogador (9,1) D 3 3 3,Jogador (1,15) B 3 3 3,Jogador (9,15) E 3 3 3] []
        return (EstadoG 0 1 imList estado)

-- | Tamanho da Janela
dw :: Display
dw = InWindow "Tanks 026" (1280,720) (0,0)

-- | Função que desenha o Estado como uma Picture.
desenhaEstadoG  :: EstadoG -- ^ Estado do Gloss a ser desenhado.
                -> Picture -- ^ Picture final do estado.
desenhaEstadoG (EstadoG 0 1 (Images menu_1 menu_2 menu_3 menu2_1 menu2_2 menu2_3 menu2_4 menu3 menu_game bD bI ch p1C p1D p1B p1E p2C p2D p2B p2E p3C p3D p3B p3E p4C p4D p4B p4E pausa canhao disparo1 disparo2 disparo3 disparo4 laser1 laser2 laser3 laser4 laser1_final laser2_final laser3_final laser4_final choque1 choque2 choque3 choque4 p1winner p2winner p3winner p4winner) e) = menu_1
desenhaEstadoG (EstadoG 0 2 (Images menu_1 menu_2 menu_3 menu2_1 menu2_2 menu2_3 menu2_4 menu3 menu_game bD bI ch p1C p1D p1B p1E p2C p2D p2B p2E p3C p3D p3B p3E p4C p4D p4B p4E pausa canhao disparo1 disparo2 disparo3 disparo4 laser1 laser2 laser3 laser4 laser1_final laser2_final laser3_final laser4_final choque1 choque2 choque3 choque4 p1winner p2winner p3winner p4winner) e) = menu_2
desenhaEstadoG (EstadoG 0 3 (Images menu_1 menu_2 menu_3 menu2_1 menu2_2 menu2_3 menu2_4 menu3 menu_game bD bI ch p1C p1D p1B p1E p2C p2D p2B p2E p3C p3D p3B p3E p4C p4D p4B p4E pausa canhao disparo1 disparo2 disparo3 disparo4 laser1 laser2 laser3 laser4 laser1_final laser2_final laser3_final laser4_final choque1 choque2 choque3 choque4 p1winner p2winner p3winner p4winner) e) = menu_3
desenhaEstadoG (EstadoG 2 1 (Images menu_1 menu_2 menu_3 menu2_1 menu2_2 menu2_3 menu2_4 menu3 menu_game bD bI ch p1C p1D p1B p1E p2C p2D p2B p2E p3C p3D p3B p3E p4C p4D p4B p4E pausa canhao disparo1 disparo2 disparo3 disparo4 laser1 laser2 laser3 laser4 laser1_final laser2_final laser3_final laser4_final choque1 choque2 choque3 choque4 p1winner p2winner p3winner p4winner) e) = menu2_1
desenhaEstadoG (EstadoG 2 2 (Images menu_1 menu_2 menu_3 menu2_1 menu2_2 menu2_3 menu2_4 menu3 menu_game bD bI ch p1C p1D p1B p1E p2C p2D p2B p2E p3C p3D p3B p3E p4C p4D p4B p4E pausa canhao disparo1 disparo2 disparo3 disparo4 laser1 laser2 laser3 laser4 laser1_final laser2_final laser3_final laser4_final choque1 choque2 choque3 choque4 p1winner p2winner p3winner p4winner) e) = menu2_2
desenhaEstadoG (EstadoG 2 3 (Images menu_1 menu_2 menu_3 menu2_1 menu2_2 menu2_3 menu2_4 menu3 menu_game bD bI ch p1C p1D p1B p1E p2C p2D p2B p2E p3C p3D p3B p3E p4C p4D p4B p4E pausa canhao disparo1 disparo2 disparo3 disparo4 laser1 laser2 laser3 laser4 laser1_final laser2_final laser3_final laser4_final choque1 choque2 choque3 choque4 p1winner p2winner p3winner p4winner) e) = menu2_3
desenhaEstadoG (EstadoG 2 4 (Images menu_1 menu_2 menu_3 menu2_1 menu2_2 menu2_3 menu2_4 menu3 menu_game bD bI ch p1C p1D p1B p1E p2C p2D p2B p2E p3C p3D p3B p3E p4C p4D p4B p4E pausa canhao disparo1 disparo2 disparo3 disparo4 laser1 laser2 laser3 laser4 laser1_final laser2_final laser3_final laser4_final choque1 choque2 choque3 choque4 p1winner p2winner p3winner p4winner) e) = menu2_4
desenhaEstadoG (EstadoG 3 1 (Images menu_1 menu_2 menu_3 menu2_1 menu2_2 menu2_3 menu2_4 menu3 menu_game bD bI ch p1C p1D p1B p1E p2C p2D p2B p2E p3C p3D p3B p3E p4C p4D p4B p4E pausa canhao disparo1 disparo2 disparo3 disparo4 laser1 laser2 laser3 laser4 laser1_final laser2_final laser3_final laser4_final choque1 choque2 choque3 choque4 p1winner p2winner p3winner p4winner) e) = menu3
desenhaEstadoG (EstadoG 4 _ (Images menu_1 menu_2 menu_3 menu2_1 menu2_2 menu2_3 menu2_4 menu3 menu_game bD bI ch p1C p1D p1B p1E p2C p2D p2B p2E p3C p3D p3B p3E p4C p4D p4B p4E pausa canhao disparo1 disparo2 disparo3 disparo4 laser1 laser2 laser3 laser4 laser1_final laser2_final laser3_final laser4_final choque1 choque2 choque3 choque4 p1winner p2winner p3winner p4winner) e) = pausa
desenhaEstadoG (EstadoG 5 1 (Images menu_1 menu_2 menu_3 menu2_1 menu2_2 menu2_3 menu2_4 menu3 menu_game bD bI ch p1C p1D p1B p1E p2C p2D p2B p2E p3C p3D p3B p3E p4C p4D p4B p4E pausa canhao disparo1 disparo2 disparo3 disparo4 laser1 laser2 laser3 laser4 laser1_final laser2_final laser3_final laser4_final choque1 choque2 choque3 choque4 p1winner p2winner p3winner p4winner) e) = p1winner
desenhaEstadoG (EstadoG 5 2 (Images menu_1 menu_2 menu_3 menu2_1 menu2_2 menu2_3 menu2_4 menu3 menu_game bD bI ch p1C p1D p1B p1E p2C p2D p2B p2E p3C p3D p3B p3E p4C p4D p4B p4E pausa canhao disparo1 disparo2 disparo3 disparo4 laser1 laser2 laser3 laser4 laser1_final laser2_final laser3_final laser4_final choque1 choque2 choque3 choque4 p1winner p2winner p3winner p4winner) e) = p2winner
desenhaEstadoG (EstadoG 5 3 (Images menu_1 menu_2 menu_3 menu2_1 menu2_2 menu2_3 menu2_4 menu3 menu_game bD bI ch p1C p1D p1B p1E p2C p2D p2B p2E p3C p3D p3B p3E p4C p4D p4B p4E pausa canhao disparo1 disparo2 disparo3 disparo4 laser1 laser2 laser3 laser4 laser1_final laser2_final laser3_final laser4_final choque1 choque2 choque3 choque4 p1winner p2winner p3winner p4winner) e) = p3winner
desenhaEstadoG (EstadoG 5 4 (Images menu_1 menu_2 menu_3 menu2_1 menu2_2 menu2_3 menu2_4 menu3 menu_game bD bI ch p1C p1D p1B p1E p2C p2D p2B p2E p3C p3D p3B p3E p4C p4D p4B p4E pausa canhao disparo1 disparo2 disparo3 disparo4 laser1 laser2 laser3 laser4 laser1_final laser2_final laser3_final laser4_final choque1 choque2 choque3 choque4 p1winner p2winner p3winner p4winner) e) = p4winner
desenhaEstadoG eLel@(EstadoG 1 n (Images menu_1 menu_2 menu_3 menu2_1 menu2_2 menu2_3 menu2_4 menu3 menu_game bD bI ch p1C p1D p1B p1E p2C p2D p2B p2E p3C p3D p3B p3E p4C p4D p4B p4E pausa canhao disparo1 disparo2 disparo3 disparo4 laser1 laser2 laser3 laser4 laser1_final laser2_final laser3_final laser4_final choque1 choque2 choque3 choque4 p1winner p2winner p3winner p4winner) e) = Pictures [menu_game , translate x y $ scale tam tam $ Pictures (desenhaMapa eLel ++ desenhaDisparos (disparosEstado (jogo eLel)) (jogadoresEstado (jogo eLel)) (images eLel) (mapaEstado (jogo eLel)) ++ desenhaTanks (jogadoresEstado (jogo eLel)) (images eLel) 1 ), Pictures (desenhaVidas (jogadoresEstado (jogo eLel)) (350,50) ++ desenhaNLasers (jogadoresEstado (jogo eLel)) (450,50) ++ desenhaNChoques (jogadoresEstado (jogo eLel)) (550,50)) ]
                                                                                                                                                                                                                                                                                                                                                                                                where
                                                                                                                                                                                                                                                                                                                                                                                                    (x,y) = translateMapa n
                                                                                                                                                                                                                                                                                                                                                                                                    tam = scaleMapa n


-- | Função que resulta no Float a que o Mapa dado deve ser escalado.                                                                                                                                                                                                                                                                                                                                                                                                    
scaleMapa   :: Int -- ^ Número do Mapa.
            -> Float -- ^ Float que vai ser usado para escalar o Mapa.
scaleMapa 0 = 0.73
scaleMapa 1 = 0.73
scaleMapa 2 = 0.63

-- | Função que resulta na posição em que o Mapa dado deve ser colocado.
translateMapa   :: Int -- ^ Número do Mapa.
                -> (Float, Float) -- ^ Posições em Float que vão ser usadas para reposicionar o Mapa.
translateMapa 0 = (-570, 230)
translateMapa 1 = (-460, 250)
translateMapa 2 = (-460, 250)

-- | Função que conforme um evento (teclas do teclado premidas) altera um Estado do Gloss.
reageEvento :: Event -- ^ Teclado que foi pressionada.
            -> EstadoG -- ^ Estado a ser alterado conforme a tecla pressionada. 
            -> EstadoG -- ^ Estado resultante do evento.
reageEvento (EventKey (SpecialKey KeyDown)      Down _ _) (EstadoG 0 3 img e) = EstadoG 0 3     img e
reageEvento (EventKey (SpecialKey KeyDown)      Down _ _) (EstadoG 2 4 img e) = EstadoG 2 4     img e
reageEvento (EventKey (SpecialKey KeyDown)      Down _ _) (EstadoG 0 n img e) = EstadoG 0 (n+1) img e
reageEvento (EventKey (SpecialKey KeyDown)      Down _ _) (EstadoG 2 n img e) = EstadoG 2 (n+1) img e
reageEvento (EventKey (SpecialKey KeyDown)      Down _ _) (EstadoG 2 n img e) = EstadoG 2 (n+1) img e
reageEvento (EventKey (SpecialKey KeyEnter)     Down _ _) (EstadoG 0 1 img e) = EstadoG 1 0     img e
reageEvento (EventKey (SpecialKey KeyEnter)     Down _ _) (EstadoG 0 2 img e) = EstadoG 2 1     img e
reageEvento (EventKey (SpecialKey KeyEnter)     Down _ _) (EstadoG 0 3 img e) = EstadoG 3 1     img e
reageEvento (EventKey (SpecialKey KeyUp)        Down _ _) (EstadoG 0 1 img e) = EstadoG 0 1     img e
reageEvento (EventKey (SpecialKey KeyUp)        Down _ _) (EstadoG 2 1 img e) = EstadoG 2 1     img e
reageEvento (EventKey (SpecialKey KeyUp)        Down _ _) (EstadoG 0 n img e) = EstadoG 0 (n-1) img e
reageEvento (EventKey (SpecialKey KeyUp)        Down _ _) (EstadoG 2 n img e) = EstadoG 2 (n-1) img e
reageEvento (EventKey (Char 's')                Down _ _) (EstadoG 0 3 img e) = EstadoG 0 3     img e
reageEvento (EventKey (Char 's')                Down _ _) (EstadoG 0 n img e) = EstadoG 0 (n+1) img e
reageEvento (EventKey (Char 'w')                Down _ _) (EstadoG 0 1 img e) = EstadoG 0 1     img e
reageEvento (EventKey (Char 'w')                Down _ _) (EstadoG 0 n img e) = EstadoG 0 (n-1) img e
reageEvento (EventKey (Char 'w')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 0 (Movimenta C) e)
reageEvento (EventKey (Char 'a')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 0 (Movimenta E) e)
reageEvento (EventKey (Char 's')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 0 (Movimenta B) e)
reageEvento (EventKey (Char 'd')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 0 (Movimenta D) e)
reageEvento (EventKey (SpecialKey KeyUp)        Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 1 (Movimenta C) e)
reageEvento (EventKey (SpecialKey KeyDown)      Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 1 (Movimenta B) e)
reageEvento (EventKey (SpecialKey KeyRight)     Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 1 (Movimenta D) e)
reageEvento (EventKey (SpecialKey KeyLeft)      Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 1 (Movimenta E) e)
reageEvento (EventKey (Char 't')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 2 (Movimenta C) e)
reageEvento (EventKey (Char 'f')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 2 (Movimenta E) e)
reageEvento (EventKey (Char 'g')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 2 (Movimenta B) e)
reageEvento (EventKey (Char 'h')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 2 (Movimenta D) e)
reageEvento (EventKey (Char 'i')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 3 (Movimenta C) e)
reageEvento (EventKey (Char 'j')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 3 (Movimenta E) e)
reageEvento (EventKey (Char 'k')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 3 (Movimenta B) e)
reageEvento (EventKey (Char 'l')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 3 (Movimenta D) e)
reageEvento (EventKey (Char 'p')                Down _ _) (EstadoG 1 n img e) = EstadoG 4 n     img e
reageEvento (EventKey (Char 'p')                Down _ _) (EstadoG 4 n img e) = EstadoG 1 n     img e
reageEvento (EventKey (Char '1')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 0 (Dispara Canhao) e)
reageEvento (EventKey (Char '2')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 0 (Dispara Laser) e)
reageEvento (EventKey (Char '3')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 0 (Dispara Choque) e)
reageEvento (EventKey (Char ',')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 1 (Dispara Canhao) e)
reageEvento (EventKey (Char '.')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 1 (Dispara Laser) e)
reageEvento (EventKey (Char '-')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 1 (Dispara Choque) e)
reageEvento (EventKey (Char '4')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 2 (Dispara Canhao) e)
reageEvento (EventKey (Char '5')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 2 (Dispara Laser) e)
reageEvento (EventKey (Char '6')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 2 (Dispara Choque) e)
reageEvento (EventKey (Char '7')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 3 (Dispara Canhao) e)
reageEvento (EventKey (Char '8')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 3 (Dispara Laser) e)
reageEvento (EventKey (Char '9')                Down _ _) (EstadoG 1 n img e) = EstadoG 1 n     img (jogada 3 (Dispara Choque) e)
reageEvento (EventKey (SpecialKey KeyTab)       Down _ _) (EstadoG _ _ img e) = EstadoG 0 1     img jI
reageEvento (EventKey (SpecialKey KeyEnter)        Down _ _) (EstadoG 1 0 img e) = EstadoG 1 1  img jI1
reageEvento (EventKey (SpecialKey KeyEnter)        Down _ _) (EstadoG 1 1 img e) = EstadoG 1 2  img jI2
reageEvento (EventKey (SpecialKey KeySpace)        Down _ _) (EstadoG 1 0 img e) = EstadoG 1 0  img jI
reageEvento (EventKey (SpecialKey KeySpace)        Down _ _) (EstadoG 1 1 img e) = EstadoG 1 1  img jI1
reageEvento (EventKey (SpecialKey KeySpace)        Down _ _) (EstadoG 1 2 img e) = EstadoG 1 2  img jI2
reageEvento _ s = s

-- | Função que ao decorrer do tempo vai alterando o Estado do Gloss.
reageTempo  :: Float -- ^ Segundos/Ticks do Jogo.
            -> EstadoG -- ^ Estado atual.
            -> EstadoG -- ^ Estado resultante passado um tick/segundo no jogo.
reageTempo n s  | jogoFinal (jogadoresEstado (jogo s)) 0 && vencedor (jogadoresEstado (jogo s)) 0 == 0 = s { menu = 5 , posMenu = 1}
                | jogoFinal (jogadoresEstado (jogo s)) 0 && vencedor (jogadoresEstado (jogo s)) 0 == 1 = s { menu = 5 , posMenu = 2}
                | jogoFinal (jogadoresEstado (jogo s)) 0 && vencedor (jogadoresEstado (jogo s)) 0 == 2 = s { menu = 5 , posMenu = 3}
                | jogoFinal (jogadoresEstado (jogo s)) 0 && vencedor (jogadoresEstado (jogo s)) 0 == 3 = s { menu = 5 , posMenu = 4}
                | otherwise = s {jogo = tick (jogo s)} 

-- | Função que desenha os Jogadores como uma lista de Pictures.
desenhaTanks    :: [Jogador] -- ^ Lista de jogadores do Jogo.
                -> Images -- ^ Lista de Imagens.
                -> Int -- ^ Indicador do Jogador.
                -> [Picture] -- ^ Lista de Pictures desenhadas.
desenhaTanks [] _ _ = []
desenhaTanks (h@(Jogador _ d v _ _):t) im n | n == 1 && d == C && v > 0 = translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) p1Cim : desenhaTanks t im (n+1)
                                            | n == 1 && d == D && v > 0 = translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) p1Dir : desenhaTanks t im (n+1)
                                            | n == 1 && d == B && v > 0 = translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) p1Bai : desenhaTanks t im (n+1)
                                            | n == 1 && d == E && v > 0 = translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) p1Esq : desenhaTanks t im (n+1)
                                            | n == 2 && d == C && v > 0 = translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) p2Cim : desenhaTanks t im (n+1)
                                            | n == 2 && d == D && v > 0 = translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) p2Dir : desenhaTanks t im (n+1)
                                            | n == 2 && d == B && v > 0 = translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) p2Bai : desenhaTanks t im (n+1)
                                            | n == 2 && d == E && v > 0 = translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) p2Esq : desenhaTanks t im (n+1)
                                            | n == 3 && d == C && v > 0 = translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) p3Cim : desenhaTanks t im (n+1)
                                            | n == 3 && d == D && v > 0 = translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) p3Dir : desenhaTanks t im (n+1)
                                            | n == 3 && d == B && v > 0 = translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) p3Bai : desenhaTanks t im (n+1)
                                            | n == 3 && d == E && v > 0 = translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) p3Esq : desenhaTanks t im (n+1)
                                            | n == 4 && d == C && v > 0 = [translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) p4Cim]
                                            | n == 4 && d == D && v > 0 = [translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) p4Dir]
                                            | n == 4 && d == B && v > 0 = [translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) p4Bai]
                                            | n == 4 && d == E && v > 0 = [translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) p4Esq]
                                            | v == 0                    = desenhaTanks t im (n+1)
    where
        p1Cim = scale 2 2 (p1C im)
        p1Dir = scale 2 2 (p1D im)
        p1Bai = scale 2 2 (p1B im)
        p1Esq = scale 2 2 (p1E im)
        p2Cim = scale 2 2 (p2C im)
        p2Dir = scale 2 2 (p2D im)
        p2Bai = scale 2 2 (p2B im)
        p2Esq = scale 2 2 (p2E im)
        p3Cim = scale 2 2 (p3C im)
        p3Dir = scale 2 2 (p3D im)
        p3Bai = scale 2 2 (p3B im)
        p3Esq = scale 2 2 (p3E im)
        p4Cim = scale 2 2 (p4C im)
        p4Dir = scale 2 2 (p4D im)
        p4Bai = scale 2 2 (p4B im)
        p4Esq = scale 2 2 (p4E im)
        (l,c) = posicaoJogador h

-- | Função que desenha os Disparos como uma lista de Pictures.        
desenhaDisparos :: [Disparo] -- ^ Lista de Disparos do Jogo.
                -> [Jogador] -- ^ Lista de Jogadores do Jogo.
                -> Images -- ^ Lista de Imagens.
                -> Mapa -- ^ Mapa do jogo.
                -> [Picture] -- ^ Lista de Pictures desenhadas.
desenhaDisparos [] _ _ _ = []
desenhaDisparos (d@(DisparoChoque n tick):t)        (p:ps)          im m = (translate (fromIntegral (pc*64 + 32)) (fromIntegral ((-pl)*64 - 32))  (choque n)) : desenhaDisparos t (p:ps) im m 
                                                                                                where
                                                                                                    posJr :: Jogador -> (Int,Int)
                                                                                                    posJr (Jogador (l,c) _ _ _ _) = (l,c)
                                                                                                    (pl,pc) = posJr (escolheJogador n (p:ps))

                                                                                                    choque :: Int -> Picture
                                                                                                    choque 0 = choque1 im
                                                                                                    choque 1 = choque2 im
                                                                                                    choque 2 = choque3 im
                                                                                                    choque 3 = choque4 im

desenhaDisparos (d@(DisparoCanhao n (l,c) dir):t)   (p@(Jogador (l2,c2) _ _ _ _):ps)        im m  = (translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32))  (rotate (rotateDis dir) $ disparo n)) : desenhaDisparos t (p:ps) im m
                                                                                                where
                                                                                                    disparo :: Int -> Picture
                                                                                                    disparo 0 = disparo1 im
                                                                                                    disparo 1 = disparo2 im
                                                                                                    disparo 2 = disparo3 im
                                                                                                    disparo 3 = disparo4 im

                                                                                                    rotateDis :: Direcao -> Float
                                                                                                    rotateDis C = -90
                                                                                                    rotateDis D = 0
                                                                                                    rotateDis B = 90
                                                                                                    rotateDis E = 180
desenhaDisparos (d@(DisparoLaser n  (l,c) dir):t)   (p@(Jogador (l2,c2) _ _ _ _):ps)        im m  = desenhaLaser d m im  ++ desenhaDisparos t (p:ps) im m

-- | Função que desenha os Lasers como uma lista de Pictures.
desenhaLaser    :: Disparo -- ^ Laser a ser desenhado.
                -> Mapa -- ^ Mapa do Jogo.
                -> Images -- ^ Lista de Imagens.
                -> [Picture] -- ^ Lista de Pictures do Laser completo.
desenhaLaser (DisparoLaser n (l,c) C) m im  | (l,c) == (1,1) && encontraPosicaoMatriz (l,c) m == Bloco Indestrutivel = [laserCFinal]
                                            | encontraPosicaoMatriz (l,c+1) m == Bloco Indestrutivel || encontraPosicaoMatriz (l,c) m == Bloco Indestrutivel = [laserCFinal]
                                            | otherwise = laserC : desenhaLaser (DisparoLaser n (l-1,c) C) m im
                                            where
                                                laserC = translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) (rotate (-90) $ laser n 1)
                                                laserCFinal = translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) (rotate (-90) $ laser n 2)
                                                    
                                                laser :: Int -> Int -> Picture
                                                laser 0 1 = laser1 im
                                                laser 1 1 = laser2 im
                                                laser 2 1 = laser3 im
                                                laser 3 1 = laser4 im
                                                laser 0 2 = laser1_final im  
                                                laser 1 2 = laser2_final im  
                                                laser 2 2 = laser3_final im  
                                                laser 3 2 = laser4_final im  

desenhaLaser (DisparoLaser n (l,c) D) m im  | (l,c) == (1,1) && encontraPosicaoMatriz (l,c) m == Bloco Indestrutivel = [laserDFinal]
                                            | encontraPosicaoMatriz (l+1,c+1) m == Bloco Indestrutivel || encontraPosicaoMatriz (l,c+1) m == Bloco Indestrutivel = [laserDFinal]
                                            | otherwise = laserD : desenhaLaser (DisparoLaser n (l,c+1) D) m im
                                            where
                                                laserD = translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) (laser n 1)
                                                laserDFinal = translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) (laser n 2)

                                                laser :: Int -> Int -> Picture
                                                laser 0 1 = laser1 im
                                                laser 1 1 = laser2 im
                                                laser 2 1 = laser3 im
                                                laser 3 1 = laser4 im
                                                laser 0 2 = laser1_final im  
                                                laser 1 2 = laser2_final im  
                                                laser 2 2 = laser3_final im  
                                                laser 3 2 = laser4_final im
desenhaLaser (DisparoLaser n (l,c) B) m im  | (l,c) == (1,1) && encontraPosicaoMatriz (l,c) m == Bloco Indestrutivel = [laserBFinal]
                                            | encontraPosicaoMatriz (l+1,c+1) m == Bloco Indestrutivel || encontraPosicaoMatriz (l+1,c) m == Bloco Indestrutivel = [laserBFinal]
                                            | otherwise = laserB : desenhaLaser (DisparoLaser n (l+1,c) B) m im
                                            where
                                                laserB = translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) (rotate 90 $ laser n 1)
                                                laserBFinal = translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) (rotate 90 $ laser n 2)

                                                laser :: Int -> Int -> Picture
                                                laser 0 1 = laser1 im
                                                laser 1 1 = laser2 im
                                                laser 2 1 = laser3 im
                                                laser 3 1 = laser4 im
                                                laser 0 2 = laser1_final im  
                                                laser 1 2 = laser2_final im  
                                                laser 2 2 = laser3_final im  
                                                laser 3 2 = laser4_final im
desenhaLaser (DisparoLaser n (l,c) E) m im  | (l,c) == (1,1) && encontraPosicaoMatriz (l,c) m == Bloco Indestrutivel = [laserEFinal]
                                            | encontraPosicaoMatriz (l,c) m == Bloco Indestrutivel || encontraPosicaoMatriz (l+1,c) m == Bloco Indestrutivel = [laserEFinal]
                                            | otherwise = laserE : desenhaLaser (DisparoLaser n (l,c-1) E) m im 
                                            where
                                                laserE = translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) (rotate (-180) $ laser n 1)
                                                laserEFinal = translate (fromIntegral (c*64 + 32)) (fromIntegral ((-l)*64 - 32)) (rotate (-180) $ laser n 2)

                                                laser :: Int -> Int -> Picture
                                                laser 0 1 = laser1 im
                                                laser 1 1 = laser2 im
                                                laser 2 1 = laser3 im
                                                laser 3 1 = laser4 im
                                                laser 0 2 = laser1_final im  
                                                laser 1 2 = laser2_final im  
                                                laser 2 2 = laser3_final im  
                                                laser 3 2 = laser4_final im

-- | Função que desenha o Mapa como uma lista de Pictures.                                                
desenhaMapa :: EstadoG -- ^ Estado do Gloss atual.
            -> [Picture] -- ^ Lista de ictures do Mapa desenhado.
desenhaMapa e = desenhaLinhasMapa (images e) (mapaEstado (jogo e)) (0,0)

-- | Função que desenha as linhas do Mapa como uma lista de Pictures.
desenhaLinhasMapa   :: Images -- ^ Lista de Imagens.
                    -> Mapa -- ^ Mapa do jogo a desenhar.
                    -> (Float,Float) -- ^ Posição da linha.
                    -> [Picture] -- ^ Lista de Pictures das Linhas do Mapa desenhada.
desenhaLinhasMapa _ [] _ = []
desenhaLinhasMapa im (h:t) (x,y) = desenhaLinhaMapa im h (x,y) ++ desenhaLinhasMapa im t (x,y-64)

-- | Funão que desenha uma linha do Mapa como uma lista de Pictures.
desenhaLinhaMapa    :: Images -- ^ Lista de imagens.
                    -> [Peca] -- ^ Lista de peças do Mapa.
                    -> (Float,Float) -- ^ Posição da peça.
                    -> [Picture] -- ^ Lista de Pictures da Linha do Mapa desenhada.
desenhaLinhaMapa _ [] _ = []
desenhaLinhaMapa im (h:t) (x,y)     | h == Vazia               = translate x y chao  : desenhaLinhaMapa im t (x+64,y)
                                    | h == Bloco Destrutivel   = translate x y des  : desenhaLinhaMapa im t (x+64,y)
                                    | h == Bloco Indestrutivel = translate x y ind   : desenhaLinhaMapa im t (x+64,y)
                            where 
                                chao        = ch im
                                des         = bD im
                                ind         = bI im


-- | Função que desenha os indicadores dos números de vidas dos jogadores na Tabela.
desenhaVidas    :: [Jogador] -- ^ Lista de Jogadores.
                -> (Float,Float) -- ^ Posição das vidas na tabela de Stats.
                -> [Picture] -- ^ Lista de Pictures dos indicadores do número de vidas na Tabela de Stats.
desenhaVidas [] _ = []
desenhaVidas (h@(Jogador _ _ v _ _):t) (x,y) = (translate x y $ scale 0.3 0.3 $ text (show v)) : desenhaVidas t (x,y-88)

-- | Função que desenha os indicadores dos números dos lasers dos jogadores na Tabela.
desenhaNLasers  :: [Jogador] -- ^ Lista de Jogadores.
                -> (Float,Float) -- ^ Posição dos Lasers na tabela de Stats.
                -> [Picture] -- ^ Lista de Pictures dos indicadores do número de lasers na Tabela de Stats.
desenhaNLasers [] _ = []
desenhaNLasers (h@(Jogador _ _ _ v _):t) (x,y) = (translate x y $ scale 0.3 0.3 $ text (show v)) : desenhaNLasers t (x,y-88)

-- | Função que desenha os indicadores dos números dos choques dos jogadores na Tabela.
desenhaNChoques :: [Jogador] -- ^ Lista de Jogadores.
                -> (Float,Float) -- ^ Posição dos choques na Tabela de Stats.
                -> [Picture] -- ^ Lista de Pictures dos indicadores do número de choques na Tabela de Stats.
desenhaNChoques [] _ = []
desenhaNChoques (h@(Jogador _ _ _ _ v):t) (x,y) = (translate x y $ scale 0.3 0.3 $ text (show v)) : desenhaNChoques t (x,y-88)

-- | Função que analisa se o Jogo já acabou ou não.
jogoFinal   :: [Jogador] -- ^ Lista de Jogadores.
            -> Int -- ^ Número de jogadores com vidas acima de 0.
            -> Bool -- ^ True caso tenha só um jogador vivo, False caso contrário.
jogoFinal [] 1 = True
jogoFinal [] _ = False
jogoFinal (Jogador _ _ v _ _ :t) n | v == 0 = jogoFinal t n
                                    | otherwise = jogoFinal t (n+1)

-- | Função que analisa qual dos Jogadores é o vencedor.                                    
vencedor    :: [Jogador] -- ^ Lista de Jogadores.
            -> Int -- ^ Número do Jogador vivo.
            -> Int -- ^ Número do jogador vencedor.
vencedor [] n = n
vencedor (Jogador _ _ v _ _ :t) n | v > 0 = n
                                   | otherwise = vencedor t (n+1)
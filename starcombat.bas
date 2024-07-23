' Star Combat, spectrum version
' (c) 2024 by Ginjol
' Language: ZX BASIC (BORIEL) compiled
' My first game by zx spectrum

#include <input.bas>

BORDER 0: PAPER 0: INK 7: CLS

Menu:
PRINT "STAR COMBAT"
PRINT "============"
PRINT "1. Iniciar Juego"
PRINT "2. Salir"
PRINT "Elige una opcion: ";
INPUT opcion

IF opcion = 1 THEN GOTO Juego
IF opcion = 2 THEN GOTO FIN

Juego:
' variables
LET playerX = 15
LET alienX = 10
LET alienY = 0
LET delayCounter = 0 
LET alienSpeed = 10 
LET score = 0 

Bucle:
PRINT AT 22, playerX; "A"
INK 3
PRINT AT alienY, alienX; "M"

' controles
IF INKEY$ = "o" AND playerX > 0 THEN LET playerX = playerX - 1
IF INKEY$ = "p" AND playerX < 31 THEN LET playerX = playerX + 1

' Incrementa el contador de retraso
LET delayCounter = delayCounter + 1

' Mueve el alienígena basado en alienSpeed
IF delayCounter >= alienSpeed THEN
    IF alienY = 21 THEN
        LET alienY = 0
        LET alienX = INT (RND * 32)
        LET score = score + 1 
        LET alienSpeed = alienSpeed - 1 
        IF alienSpeed < 1 THEN LET alienSpeed = 1 
        BEEP 0.2, -5 
    ELSE
        LET alienY = alienY + 1
    END IF
    LET delayCounter = 0 ' Restablece el contador
ENDIF

IF alienY = 21 AND alienX = playerX THEN
    LET score = score + 1: 
    LET alienSpeed = alienSpeed - 1 ' Hace que el alienígena se mueva más rápido después de cada colisión
    IF alienSpeed < 1 THEN LET alienSpeed = 1 ' Establece un límite mínimo para alienSpeed
    GOTO Bucle
ENDIF

IF alienY = 21 AND alienX <> playerX THEN GOTO FIN
 
CLS
 
GOTO Bucle
 
FIN:

PRINT " "
PRINT " "
PRINT "*****************"
PRINT "Puntuacion final: ",score
PRINT "*****************"
PRINT " "
PRINT " "
PRINT "Gracias por jugar Star Combat."
PRINT " "
PRINT " "
GOTO Menu



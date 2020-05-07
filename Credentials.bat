rem "ping -n 2" the "2" is the number of seconds to delay to changing color, you can edit this
rem if the text is not delaying (aka flashing at a rapid rate) then replace "127.0.0.1" with localhost

@echo off
title Credentials        
:1
cls
color 08
echo Your password is "public"
ping -n 1 127.0.0.1 > nul
goto 2
:2
cls
color 09
echo Your password is "public"
ping -n 1 127.0.0.1 > nul
goto 3
:3
cls
color 0a
echo Your password is "public"
ping -n 1 127.0.0.1 > nul
goto 4
:4
cls
color 0b
echo Your password is "public"
ping -n 1 127.0.0.1 > nul
goto 5
:5
cls
color 0c
echo Your password is "public"
ping -n 1 127.0.0.1 > nul
goto 6
:6
cls
color 0d
echo Your password is "public"
ping -n 1 127.0.0.1 > nul
goto 7
:7
cls
color 0e
echo Your password is "public"
ping -n 2 127.0.0.1 > nul
goto 1
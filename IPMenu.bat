rem if you see this, dont copy the code please
rem this took time
rem if your gonna copy this then credit me






@echo off
title Welcome!
color 5
cls
echo Welcome to SideEffected's IP Menu!
echo Discord: SideEffected#4527
echo Press any key to continue
pause > nul
goto login

title Login
:login 
cls
color B
set /p login= Password :
IF '%login%' == 'public' GOTO main_menu
If not '%login%' == 'public' goto loginwrong
:loginwrong
echo wrong password buddy
pause > nul
goto login
:main_menu
cls
color C

ECHO                          __    _                                   
ECHO                     _wr""        "-q__                             
ECHO                  _dP                 9m_     
ECHO                _#P                     9#_                         
ECHO               d#@       Main Menu        9#m                        
ECHO              d##                         ###                       
ECHO             J###                         ###L                      
ECHO             {###K                       J###K                      
ECHO             ]####K      ___aaa___      J####F                      
ECHO         __gmM######_  w#P""   ""9#m  _d#####Mmw__                  
ECHO      _g##############mZ_         __g##############m_               
ECHO    _d####M@PPPP@@M#######Mmp gm#########@@PPP9@M####m_             
ECHO   a###""          ,Z"#####@" '######"\g          ""M##m            
ECHO  J#@"             0L  "*##     ##@"  J#              *#K           
ECHO  #"    by:           `#    "_gmwgm_~  dF  discord:      `#_          
ECHO 7      SideEffected  "#_   ]#####F   dK   SideEffected    JE          
ECHO                        *m__ ##### __g@"    #4527            F          
ECHO                        "PJ#####LP"                                 
ECHO                          0######_                                 
ECHO                        _0########_                                   
ECHO      .               _d#####^#####m__              ,              
ECHO       "*w_________am#####P"   ~9#####mw_________w*"                  
ECHO           ""9@#####@M""           ""P@#####@M""                    


ECHO [0] Main Menu
ECHO [1] Pinger
ECHO [2] Weak DDoSer
ECHO [3] Skype Resolver
ECHO [4] View Your IP
ECHO [5] IP Lookup
ECHO [6] Grabify Link
ECHO [7] Log Out
set /p var=Command :
IF '%var%' == '0' GOTO main_menu
IF '%var%' == '1' GOTO pinger
IF '%var%' == '2' GOTO weak_ddoser
IF '%var%' == '3' GOTO skype_resolver
IF '%var%' == '4' GOTO lookup
IF '%var%' == '5' GOTO lookup2
IF '%var%' == '6' GOTO grabify
IF '%var%' == '7' GOTO logoff
IF '%var%' == 'secret' GOTO secret_menu
goto main_menu

:lookup
cls
title Find your IP
color 7
@ipconfig/all | find "Subnet Mask"
@ipconfig/all | find "IPv4" 
@ipconfig/all | find "Default Gateway"
@ipconfig/all | find "Host Name"
echo When you are ready to leave press any key
pause>nul
goto main_menu


:grabify
title Grabify Link
cls
set /p grab= Are you sure you want to open "grabify.link"? (Y/N)
IF '%grab%' == 'N' GOTO main_menu
IF '%grab%' == 'Y' GOTO explorer
IF '%grab%' == 'n' GOTO main_menu
IF '%grab%' == 'y' GOTO explorer
pause
goto main_menu


:explorer
 explorer "http:://www.grabify.link"

echo When you are ready to go back to the menu press any key
pause>nul

goto main_menu

:lookup2
cls
set /p pre_ip=What is the ip you want to track?

 explorer "http://www.ip-tracker.org/locator/ip-lookup.php?ip="%pre_ip%

echo When you are ready to go back to the menu press any key
pause>nul

goto main_menu

:secret_menu
cls
title Secret Menu
color 2
echo Press Any Key to Proceed
pause > nul
goto hide
:logoff
set /p LOC=msg Are you sure you want to log off? (Y/N)
IF '%LOC%' == 'N' GOTO back
IF '%LOC%' == 'Y' GOTO end
IF '%LOC%' == 'n' GOTO back
IF '%LOC%' == 'y' GOTO end
pause
goto main_menu

:skype_resolver
set param=%~1
cls
::When 0, it will act as Netstat.
::When 1, it will grab Skype IP's.
set skype=1

setlocal enabledelayedexpansion

::Used to convert PID to process names.
for /f "tokens=1 delims=" %%A in ('tasklist') do call :PID %%A
echo.
echo Skype Resolver (Must be in call or sending file to victim)
echo.
echo [Program:PID] LocalIP:Port - RemoteIP:Port
echo.
for /f "tokens=1-27 delims=: " %%A in ('netstat -ano') do call :netstat %%A %%B %%C %%D %%E %%F %%G %%H %%I %%J %%K %%L %%M %%N %%O %%P %%Q %%R %%S %%T %%U
if "%param%"=="-log" exit /b
echo.
echo The Skype Resolver has finished its process. Press any key to go back to the main menu.
pause>nul
goto main_menu

:PID
set pid_%2=%1
exit /b

:netstat
set type=%1
set srcIP=%2
set srcPort=%3
set dstIP=%4
set dstPort=%5
set state=%6
set pid=%7
set name=!pid_%pid%!

::Filter local connections away.
if "%state%"=="" exit /b
if not "%type%"=="TCP" exit /b
if "%srcIP%"=="Local" exit /b
if "%dstIP%"=="*" exit /b
if "%srcIP%"=="%dstIP%" exit /b
if "%pid%"=="" exit /b

if "%dstPort%"=="[" (
set state=LISTENING
set srcPort=%dstIP%
set pid=%9
)
if "%dstPort%"=="[" set name=!pid_%pid%!

if "%name%"=="" set name=Unknown

::Skype filter
if "%skype%"=="1" (
if /I not "%name%"=="skype.exe" exit /b
if not "%state%"=="ESTABLISHED" exit /b
if "%dstPort%"=="443" exit /b
if "%dstPort%"=="12350" exit /b)

::Formatting \tabs
set srcPortTab= %srcPort%
set namePidTab=[%name%:%pid%] 
set srcIpPortTab=%srcIP%:%srcPort% 
set dstIpPortTab=%dstIP%:%dstPort% 
set stateTab=%state% 
set namePidTab=%namePidTab:~0,20%
set srcIpPortTab=%srcIpPortTab:~0,21%
set dstIpPortTab=%dstIpPortTab:~0,21%
set stateTab=%stateTab:~0,12%
set srcPortTab=%srcPortTab:~-5%

if not "%state%"=="LISTENING" echo.%namePidTab% %srcIPPortTab% %dstIPPortTab% %stateTab%
if "%state%"=="LISTENING" echo.%namePidTab% Listening on: %srcPortTab%
exit /b


:back
goto main_menu


:weak_ddoser
cls
color D 

echo                             ...
echo                           ;::::;
echo                         ;::::; :;
echo                       ;:::::'   :;
echo                      ;:::::;     ;.
echo                     ,:::::'       ;           OOO\
echo                      ::::::; DDoS/Pinger     OOOOO\
echo                     ;:::::;       ;         OOOOOOOO
echo                    ,;::::::;     ;'         / OOOOOOO
echo                  ;:::::::::`. ,,,;.        /  / DOOOOOO
echo                .';:::::::::::::::::;,     /  /     DOOOO
echo               ,::::::;::::::;;;;::::;,   /  /        DOOO
echo              ;`::::::`'::::::;;;::::: ,#/  /          DOOO
echo              : `:::::::`;::::::;;::: ;::# /            DOOO
echo              ::`:::::::`;:::::::: ;::::# /              DOO
echo              `:`:::::::`;:::::: ;::::::#/               DOO
echo               :::`:::::::`;; ;:::::::::##                OO
echo               ::::`:::::::`;::::::::;:::#                OO
echo               `:::::`::::::::::::;'`:;::#                O
echo                `:::::`::::::::;' /  / `:#
echo                 ::::::`:::::;'  /  /   `#

set /p host="Target>"
set /p pings="PINGS>"
set /p bytes="BYTES>"
goto ping1
:ping1
ping %host% -l %bytes% -n %pings%
echo Press Any Key to Continue...
pause > nul
goto main_menu

:pinger
cls
echo                             ...
echo                           ;::::;
echo                         ;::::; :;
echo                       ;:::::'   :;
echo                      ;:::::;     ;.
echo                     ,:::::'       ;           OOO\
echo                      ::::::; DDoS/Pinger     OOOOO\
echo                     ;:::::;       ;         OOOOOOOO
echo                    ,;::::::;     ;'         / OOOOOOO
echo                  ;:::::::::`. ,,,;.        /  / DOOOOOO
echo                .';:::::::::::::::::;,     /  /     DOOOO
echo               ,::::::;::::::;;;;::::;,   /  /        DOOO
echo              ;`::::::`'::::::;;;::::: ,#/  /          DOOO
echo              : `:::::::`;::::::;;::: ;::# /            DOOO
echo              ::`:::::::`;:::::::: ;::::# /              DOO
echo              `:`:::::::`;:::::: ;::::::#/               DOO
echo               :::`:::::::`;; ;:::::::::##                OO
echo               ::::`:::::::`;::::::::;:::#                OO
echo               `:::::`::::::::::::;'`:;::#                O
echo                `:::::`::::::::;' /  / `:#
echo                 ::::::`:::::;'  /  /   `#

set /p IP=Enter Target:
:top
PING -n 1 %IP% | Find "TTL="
title :: Pinging: %IP% ::
IF ERRORLEVEL 1 (SET in=0b & echo either u put the wrong ip or its down.)
set /a num=(%Random%%%9)+1
color %nun%
:rainbow
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...)
ping -t 2 0 10 127.0.0.1 >nul

color a
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...)
ping -t 2 0 10 127.0.0.1 >nul
color 02
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...) 
ping -t 2 0 10 127.0.0.1 >nul
color 03
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...) 
ping -t 2 0 10 127.0.0.1 >nul
color 04
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...)
ping -t 2 0 10 127.0.0.1 >nul
color 05
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...) 
ping -t 2 0 10 127.0.0.1 >nul
color 06
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...) 
ping -t 2 0 10 127.0.0.1 >nul
color 07
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...) 
ping -t 2 0 10 127.0.0.1 >nul
color 08
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...) 
ping -t 2 0 10 127.0.0.1 >nul
color 09
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...)
ping -t 2 0 10 127.0.0.1 >nul
color 0a
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...)
ping -t 2 0 10 127.0.0.1 >nul
color 0b
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...) 
ping -t 2 0 10 127.0.0.1 >nul
color 0c
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...) 
ping -t 2 0 10 127.0.0.1 >nul
color 0d
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...)
ping -t 2 0 10 127.0.0.1 >nul
color 0e
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...)
ping -t 2 0 10 127.0.0.1 >nul
color 0f
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...)
ping -t 2 0 10 127.0.0.1 >nul
goto rainbow
echo Press Any Key to go back to the menu
pause > nul
goto main_menu

:secret_menu
cls
echo Coming Soon!

:logoff
goto login



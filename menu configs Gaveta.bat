@echo off
:menu
cls

echo .......................MENU LIXO - GAVETA .......................
echo SELECIONE DE 1-5 PARA ESCOLHER A TAREFA, OU E PARA SAIR
echo .......................................................


echo 1 - Copiar programas info
echo 2 - Instalar programas info
echo 3 - Backup para gaveta externa
echo 4 - Backup arquivos do C para gaveta externa
echo 5 - Restaura backup da info para gaveta externa


set /p M=Digite a sua escolha: 

if %m%==1 goto :programas 
if %m%==2 goto :iprogramas 
if %m%==3 goto :bkp 
if %m%==4 goto :bkpc 
if %m%==5 goto :rbkp 








:programas
		cls
	echo .......................MENU LIXO - GAVETA  1.............
	echo Informe o seu usuario atual
	echo .........................................................
		dir c:\Users
		set /p M=Digite o usuario:
		cls
	echo .......................MENU LIXO - GAVETA  2.............
	echo Informe a unidade da Gaveta
    wmic logicaldisk get caption
    set /p G=Digite a unidade da gaveta :
    dir %g%:\
	echo .......................MENU LIXO - GAVETA  3.............
		runas /user:pmu\tecnico pause & robocopy %g%:\PROGRAMAS c:\Users\%m%\desktop /E /Z /XF p:\ .DS_STORE Copia_de_Controle_de_IP_Novo.xlsx FoxitReader615.0624_prom_L10N_Setup.exe windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe *.xlsx# /XD p:\ Antigos Office /R:5 /W:5 /TBD /ETA /MT:8
		pause
cls
goto :menu

:iprogramas
			cls
	echo .......................MENU LIXO - GAVETA  1 Instalar Programas.......
	echo Informe o seu usuario atual
	echo ............................................................
		set /p A=Digite seu usuario atual :
		:iprogramasmenu
		echo .......................MENU LIXO - GAVETA  1 Instalar Programas.......
		echo Informe o programa que deseja intalar
		echo ............................................................

		echo 1 Chrome
		echo 2 Firefox
		echo 3 Restaura Visualizador Imagem
		echo 4 WinRar
		echo 5 NetTime
		echo 6 Gov BR
		echo 7 Office
		echo 8 Foxit
		echo 9 Remove todos instaladores
		echo 10 Voltar Menu

			set /p O=Digite a sua escolha: 

			if %o%==1 goto :chrome 
			if %o%==2 goto :firefox
			if %o%==3 goto :resfoto 
			if %o%==4 goto :winrar 
			if %o%==5 goto :nettime 
			if %o%==6 goto :govbr 
			if %o%==7 goto :office
			if %o%==8 goto :foxit 
			if %o%==9 goto :remove
			if %o%==10 goto :menu 

			:chrome
				c:\Users\%a%\Desktop\ChromeSetup.exe
				cls
				goto :iprogramasmenu
			:firefox
				"c:\Users\%a%\Desktop\Firefox Setup 120.0.exe"
				
				goto :iprogramasmenu
			:resfoto
				c:\Users\%a%\Desktop\Restore_Windows_Photo_Viewer_CURRENT_USER.reg
				cls
				goto :iprogramasmenu
			:winrar
				c:\Users\%a%\Desktop\winrar-x64-501br.exe
				cls
				goto :iprogramasmenu
			:nettime
				c:\Users\%a%\Desktop\NetTimeSetup-314.exe
				cls
				goto :iprogramasmenu
			:govbr
				c:\Users\%a%\Desktop\INSTALAR_GOV_BR\GOV.AppController.exe
				copy c:\Users\%a%\Desktop\INSTALAR_GOV_BR\Iconegov.ico c:\
				copy "C:\Users\%a%\Desktop\INSTALAR_GOV_BR\GOV ATALHO.lnk" C:\Users\%a%\Desktop
				pause
				goto :iprogramasmenu
			:office
				echo Desabilitando defender
				powershell.exe Set-MpPreference -DisableRealtimeMonitoring 1
				echo Extraindo office
				powershell.exe Expand-Archive -Force C:\Users\%a%\Desktop\AActOFFICE.zip C:\Users\%a%\Desktop\OFFICE
				echo Rodando office
				"c:\Users\%a%\Desktop\OFFICE\KMSTools - GUSTAVO ROCHA\KMSTools - Ativador\KMSTools Gustavo\KMSTools.exe"
				pause
				cls
				goto :iprogramasmenu
			:foxit
				c:\Users\%a%\Desktop\FoxitReader941_enu_Setup_Prom.exe
				cls
				goto :iprogramasmenu
			:remove
				del c:\Users\%a%\Desktop\ChromeSetup.exe
				del c:\Users\%a%\Desktop\"Firefox Setup 120.0.exe"
				del c:\Users\%a%\Desktop\Restore_Windows_Photo_Viewer_CURRENT_USER.reg
				del c:\Users\%a%\Desktop\winrar-x64-501br.exe
				del c:\Users\%a%\Desktop\NetTimeSetup-314.exe
				del c:\Users\%a%\Desktop\FoxitReader941_enu_Setup_Prom.exe
				rmdir /s c:\Users\%a%\Desktop\INSTALAR_GOV_BR
				rmdir /s c:\Users\%a%\Desktop\OFFICE
				del c:\Users\%a%\Desktop\AActOFFICE.zip
				goto :iprogramasmenu
cls
goto :iprogramas

:bkp
		cls
	echo .......................MENU LIXO - GAVETA  1 REALIZAR BACKUP.......
	echo Informe o patrimonio da maquina
	echo .........................................................
		set /p P=Digite o patrimonio:
		cls
	echo .......................MENU LIXO - GAVETA  2.......................
	echo Informe a letra da unidade que será feito o backup
	echo .........................................................
		wmic logicaldisk get caption
		set /p U=Digite unidade:
		cls
	echo .......................MENU LIXO - GAVETA  3.......................
	echo Informe a matricula
	echo .........................................................
		dir %u%:\Users
		set /p M=Digite a matricula:
		cls
	echo .......................MENU LIXO - GAVETA  4.......................
	echo Informe a data
	echo .........................................................
		set /p D=Digite a data sem / (barra) com - (traco) 01-01-1999  :
		cls
	echo .......................MENU LIXO - GAVETA  5.......................
	echo Informe a unidade da GAVETA
	echo .........................................................
        wmic logicaldisk get caption
		set /p G=Digite a unidade da gaveta
		cls
		runas /user:pmu\tecnico info020 pause & robocopy %u%:\Users\%m% %g%:\%p%\%m%-%d% /E /Z /XF %u%:\Users\%m%\ NTUSER.DAT /XD %u%:\Users\%m%\ .irpf .rfb AppData .receitanet /R:5 /W:5 /TBD /R:3 /W:3 /ETA /MT:16
		pause
cls
goto :menu

:bkpc
		cls
	echo .......................MENU LIXO - GAVETA  1 BACKUP SOLTOS NO C....
	echo Informe o patrimonio da maquina
	echo .........................................................
		set /p P=Digite o patrimonio:
		cls
	echo .......................MENU LIXO - GAVETA  2.......................
	echo Informe a letra da unidade, deve ser diferente
	echo da unidade C
	echo .........................................................
		wmic logicaldisk get caption
		set /p U=Digite unidade:
		cls
	echo .......................MENU LIXO - GAVETA  3.......................
	echo Informe a data
	echo .........................................................
		set /p D=Digite a data sem / (barra) com - (traco) 01-01-1999  :
		cls
	echo .......................MENU LIXO - GAVETA  5.......................
	echo Mapeando unidade de backup
	echo .........................................................
		net use B: \\100.100.0.30\info\backup /user:pmu\tecnico info020
		pause
		cls
		runas /user:pmu\tecnico pause & robocopy %u%:\ 	b:\%p%\soltosc-%d% /E /Z /XF hiberfil.sys pagefile.sys /XD d:\ "Program Files" "Program Files (x86)" $Recycle.Bin PerfLogs ProgramData Users Windows Intel temp /R:5 /W:5 /TBD /R:3 /W:3 /ETA /MT:8
		pause


cls
goto :menu



:rbkp
		cls
	echo .......................MENU LIXO - GAVETA  1 RESTAURA BACKUP.........
    echo Informe a unidade da gaveta
	echo .........................................................
        wmic logicaldisk get caption
		set /p G=Digite a unidade da gaveta
		cls
	echo .......................MENU LIXO - GAVETA  2.........................
	echo Informe o patrimonio da maquina
	echo ...........................................................
		set /p P=Digite o patrimonio:
		cls
	echo .......................MENU LIXO - GAVETA  3.........................
	echo Informe a matricula
	echo Backups encontrados na matricula
	echo ...........................................................
		dir %g%:\%p%\
		set /p M=Digite a matricula:
		cls
	echo .......................MENU LIXO - GAVETA  4.........................
	echo Informe a data
	echo ...........................................................
		dir b:\%p%\
		set /p d=Digite a data sem / (barra) apenas - (traco):
		cls
		runas /user:pmu\tecnico pause & robocopy %g%:\%p%\%m%-%d%  c:\Users\%m% /E /Z /R:5 /W:5 /TBD /ETA /MT:8
		pause
cls
goto :menu
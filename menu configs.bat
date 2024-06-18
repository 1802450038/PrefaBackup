@echo off
:menu
cls

echo .......................MENU LIXO.......................
echo SELECIONE DE 1-3 PARA ESCOLHER A TAREFA, OU E PARA SAIR
echo .......................................................

echo 1 - Configurar rede
echo 2 - Configura DNS
echo 3 - Colocar dominio e tecnico
echo 4 - Limpar config rede
echo 5 - Copiar programas info
echo 6 - Instalar programas info
echo 7 - Backup
echo 8 - Backup arquivos do C
echo 9 - Restaura Backup

set /p M=Digite a sua escolha: 

if %m%==1 goto :rede 
if %m%==2 goto :dns
if %m%==3 goto :dominio 
if %m%==4 goto :limpar 
if %m%==5 goto :programas 
if %m%==6 goto :iprogramas 
if %m%==7 goto :bkp 
if %m%==8 goto :bkpc 
if %m%==9 goto :rbkp 

:rede
	netsh interface ipv4 show config
	set /p n= Qual o nome da rede ? 
	set /p r= Qual o range do ip ? 
	set /p i= Qual o final do ip ? 
	netsh interface ipv4 set address name="%n%" static 100.100.%r%.%i% 255.255.0.0 100.100.1.6
	netsh interface ipv4 set dns name="%n%" static 100.100.0.5
	netsh interface ipv4 add dns name="%n%" 8.8.8.8 index=2
	pause
	cls
goto :menu

:dns
	netsh interface ipv4 show config
	set /p n= Qual o nome da rede ? 
	netsh interface ipv4 set dns name="%n%" static 100.100.0.5
	netsh interface ipv4 add dns name="%n%" 8.8.8.8 index=2
	pause
	cls
goto :menu

:dominio
	powershell.exe  add-computer -domainname pmu.local -Credential AD\tecnico
	net localgroup Administradores pmu.local\tecnico /add
	pause
	cls
goto :menu

:limpar
	netsh interface ipv4 show config
	set /p n= Qual o nome da rede ? 
	netsh interface ipv4 set address name="%n%" dhcp    
	netsh interface ipv4 set dns name="%n%" dhcp
pause
cls
goto :menu

:programas
		cls
	echo .......................MENU LIXO 1 Copia Programas........
	echo Mapeando unidade de backup
	echo .........................................................
		net use P: \\100.100.0.30\info\Utilitarios_windows10 /user:pmu\tecnico info020
		echo Caso avise que a unidade ja esta em uso, basta prosseguir
		pause
	echo .......................MENU LIXO 2.......................
	echo Informe o seu usuario atual
	echo .........................................................
		dir c:\Users
		set /p M=Digite a matricula:
		cls
	echo .......................MENU LIXO 3.......................
		runas /user:pmu\tecnico pause & robocopy p:\ c:\Users\%m%\desktop /E /Z /XF p:\ .DS_STORE Copia_de_Controle_de_IP_Novo.xlsx FoxitReader615.0624_prom_L10N_Setup.exe windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe *.xlsx# /XD p:\ Antigos Office /R:5 /W:5 /TBD /ETA /MT:8
		pause
cls
goto :menu

:iprogramas
			cls
	echo .......................MENU LIXO 1 Instalar Programas.......
	echo Informe o seu usuario atual
	echo ............................................................
		set /p A=Digite seu usuario atual :
		:iprogramasmenu
		echo .......................MENU LIXO 1 Instalar Programas.......
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
	echo .......................MENU LIXO 1 REALIZAR BACKUP.......
	echo Informe o patrimonio da maquina
	echo .........................................................
		set /p P=Digite o patrimonio:
		cls
	echo .......................MENU LIXO 2.......................
	echo Informe a letra da unidade, deve ser diferente
	echo da unidade C
	echo .........................................................
		wmic logicaldisk get caption
		set /p U=Digite unidade:
		cls
	echo .......................MENU LIXO 3.......................
	echo Informe a matricula
	echo .........................................................
		dir %u%:\Users
		set /p M=Digite a matricula:
		cls
	echo .......................MENU LIXO 4.......................
	echo Informe a data
	echo .........................................................
		set /p D=Digite a data sem / (barra) com - (traco) 01-01-1999  :
		cls
	echo .......................MENU LIXO 5.......................
	echo Mapeando unidade de backup
	echo .........................................................
		net use B: \\100.100.0.30\info\backup /user:pmu\tecnico info020
		pause
		cls
		runas /user:pmu\tecnico info020 pause & robocopy %u%:\Users\%m% b:\%p%\%m%-%d% /E /Z /XF %u%:\Users\%m%\ NTUSER.DAT /XD %u%:\Users\%m%\ .irpf .rfb AppData .receitanet /R:5 /W:5 /TBD /R:3 /W:3 /ETA /MT:16
		pause
cls
goto :menu

:bkpc
		cls
	echo .......................MENU LIXO 1 BACKUP SOLTOS NO C....
	echo Informe o patrimonio da maquina
	echo .........................................................
		set /p P=Digite o patrimonio:
		cls
	echo .......................MENU LIXO 2.......................
	echo Informe a letra da unidade, deve ser diferente
	echo da unidade C
	echo .........................................................
		wmic logicaldisk get caption
		set /p U=Digite unidade:
		cls
	echo .......................MENU LIXO 3.......................
	echo Informe a data
	echo .........................................................
		set /p D=Digite a data sem / (barra) com - (traco) 01-01-1999  :
		cls
	echo .......................MENU LIXO 5.......................
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
	echo .......................MENU LIXO 1 RESTAURA BACKUP.........
	echo Informe o patrimonio da maquina
	echo ...........................................................
		set /p P=Digite o patrimonio:
		cls
	echo .......................MENU LIXO 2.........................
	echo Mapeando unidade de backup
	echo ...........................................................
		net use B: \\100.100.0.30\info\backup /user:pmu\tecnico info020
		echo Caso avise que a unidade ja esta em uso, basta prosseguir
		pause
	echo .......................MENU LIXO 3.........................
	echo Informe a matricula
	echo Backups encontrados na matricula
	echo ...........................................................
		dir b:\%p%\
		set /p M=Digite a matricula:
		cls
	echo .......................MENU LIXO 4.........................
	echo Informe a data
	echo ...........................................................
		dir b:\%p%\
		set /p d=Digite a data sem / (barra) apenas - (traco):
		cls
		runas /user:pmu\tecnico pause & robocopy b:\%p%\%m%-%d%  c:\Users\%m% /E /Z /R:5 /W:5 /TBD /ETA /MT:8
		pause
cls
goto :menu
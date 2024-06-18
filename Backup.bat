@echo off
:menu
		cls
	echo .......................MENU LIXO 1.......................
	echo Informe o patrimonio da maquina
	echo .......................................................
		set /p P=Digite o patrimonio:
		cls
	echo .......................MENU LIXO 2.......................
	echo Informe a letra da unidade, deve ser diferente
	echo da unidade C
	echo .......................................................
		wmic logicaldisk get caption
		set /p U=Digite unidade:
		cls
	echo .......................MENU LIXO 3.......................
	echo Informe a matricula
	echo .......................................................
		dir %u%:\Users
		set /p M=Digite a matricula:
		cls
	echo .......................MENU LIXO 4.......................
	echo Informe a data
	echo .......................................................
		set /p D=Digite a data sem / (barra) com - (traco) 01-01-1999  :
		cls
	echo .......................MENU LIXO 5.......................
	echo Mapeando unidade de backup
	echo .......................................................
		net use B: \\100.100.0.30\info\backup /user:pmu\tecnico info020
		pause
		cls
		runas /user:pmu\tecnico info020 pause & robocopy %u%:\Users\%m% b:\%p%\%m%-%d% /E /Z /XF %u%:\Users\%m%\ NTUSER.DAT /XD %u%:\Users\%m%\ .irpf .rfb AppData /R:5 /W:5 /TBD /R:3 /W:3 /ETA /MT:8
		pause
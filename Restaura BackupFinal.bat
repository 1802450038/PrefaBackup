@echo off
:menu
		cls
	echo .......................MENU LIXO 1.......................
	echo Informe o patrimonio da maquina
	echo .......................................................
		set /p P=Digite o patrimonio:
		cls
	echo .......................MENU LIXO 2.......................
	echo Mapeando unidade de backup
	echo .......................................................
		net use B: \\100.100.0.30\info\backup /user:pmu\tecnico info020
		echo Caso avise que a unidade ja esta em uso, basta prosseguir
		pause
	echo .......................MENU LIXO 3.......................
	echo Informe a matricula
	echo Backups encontrados na matricula
	echo .......................................................
		dir b:\%p%\
		set /p M=Digite a matricula:
		cls
	echo .......................MENU LIXO 4.......................
	echo Informe a data
	echo .......................................................
		dir b:\%p%\
		set /p d=Digite a data sem / (barra) apenas - (traco):
		cls
		runas /user:pmu\tecnico pause & robocopy b:\%p%\%m%-%d%  c:\Users\%m% /E /Z /R:5 /W:5 /TBD /ETA /MT:8
		pause
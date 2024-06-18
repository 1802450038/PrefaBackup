@echo off
:menu
cls
@REM X Z Q
echo .......................MENU LIXO.......................
echo SELECIONE DE 1-2 PARA ESCOLHER A TAREFA, OU E PARA SAIR
echo .......................................................

echo 1 - Adicionar Mapeamentos
echo 2 - Remover Mapeamentos
echo 3 - Remover Mapeamentos AUTO


set /p M=Digite a sua escolha: 

if %m%==1 goto :mapeamentos 
if %m%==2 goto :remover
if %m%==3 goto :removetodos
if %m%=="E" goto :sair


:mapeamentos

set /p q= Endereco LETRA ?
set /p z= Endereco CAMINHO ?

	net use "%q%": \\srvfile"%z%"$ /user:tecnico info020$ /savecred

cls
goto :menu

:remover
net use
set /p d= Qual o disco  ? 

net use "%d%": /delete

cls
goto :menu

:removetodos
net use X: /delete
net use Z: /delete
net use Q: /delete

cls
goto :menu

:sair
	exit
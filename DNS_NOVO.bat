netsh interface ipv4 show config

	set /p n= Qual o nome da rede ? 


	netsh interface ipv4 set dns name="%n%" static 100.100.0.5

	netsh interface ipv4 add dns name="%n%" 8.8.8.8 index=2



pause

ipconfig /all

pause
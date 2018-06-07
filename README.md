
Abramos consola y nos colocaremos en la carpeta donde deseamosn clonar el proyecto.

Despues clonaremosn este proyecto.

-->git clone https://github.com/dgpeCurso06/prueba1.git

Despues nos colocaremos dentro de la carpeta del proyecto y ejecutamosn los siguiente: 

-->docker run -it dgpecurso06/examen bash

-->docker build . -t examen/calculadora

-->docker run -e PBA=primero -p 6081:8080 -d examen/calculadora 

-->docker run -e PBA=segundo -p 6082:8080 -d examen/calculadora 

-->docker run -e PBA=tercero -p 6083:8080 -d examen/calculadora 


Despues modificamocn el archivo haproxy.cfg


-->sudo nano /etc/haproxy/haproxy.cfg 


Añadiendo despues de default el frontend y backend como esta a continuacion:


-----------------------------------------------------------------------------------------------------------

frontend www

        bind localhost:9090
	
	default_backend site-backend
	

backend site-backend

	mode http
	
	stats enable
	
	stats uri /haproxy?stats
	
	balance roundrobin
	
	server lamp1 localhost:6081 check
	
	server lamp2 localhost:6082 check
	
	server lamp3 localhost:6083 check
	
-----------------------------------------------------------------------------------------------------------

Despues modificaremosn de haproxy


--> sudo nano /etc/default/haproxy


Descomentando la linea de CONFIG


CONFIG="/etc/haproxy/haproxy.cfg"


Y añadiendo

ENABLED = 1 


Continuaremos ejecutando


-->sudo service haproxy stop

-->sudo service haproxy start

Para probarlo en el browser ingresaremos la siguiente URL segun desee realizar la operacion.

Contemplando lo siguinete:

op.- Tipo de operacion 

	1:Suma
	2:Resta
	3:Multiplicacion
	4:Division

var1.-Primer nùmero que se desea operar

var2.-Segundo nùmero que se desea operar

Ejemplos

/*SUMA*/

-->http://localhost:9090/api/calculadora?op=1&var1=1&var2=2

/*RESTA*/

-->http://localhost:9090/api/calculadora?op=2&var1=1&var2=2

/*MULTIPLICACION*/

-->http://localhost:9090/api/calculadora?op=3&var1=1&var2=2

/*DIVISION*/

-->http://localhost:9090/api/calculadora?op=3&var1=1&var2=2

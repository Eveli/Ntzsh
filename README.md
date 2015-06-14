Ntzsh
-

![Ntsh - SU](https://github.com/ntrrg/Ntzsh/blob/master/capturas/su.png)

![Ntsh - Ntrrg](https://github.com/ntrrg/Ntzsh/blob/master/capturas/ntrrg.png)

Es necesario tener instalado Zsh (>= 4.3.17-1)

	# apt-get install zsh

#### Instalación:

	$ wget -qO - https://raw.githubusercontent.com/ntrrg/Ntzsh/master/.zshrc > ~/.zshrc && chsh -s /bin/zsh && zsh

#### Caracteristicas:

* Prompt:
	* Privilegios:

		☮: Sin privilegios.
    
        ☢: Con privilegios.

	* Git:

		╞ master ╡: Rama activa.

        ✔: Cambios por confirmar.

        ✘: Cambios por preparar.

* Historial:
	* Evita que se guarden lineas repetidas en el HISTFILE.
	* No guarda en el historial comandos que empiecen con un espacio en blanco.

			☮›  ls

	* Elimina los espacios innecesarios de los comandos antes de guardarlos en el HISTFILE.

    		☮› ls     Descargas  # Guardará "ls Descargas"

* Autocompletación:
	* Agrega los caracteres "^", "~" y "#" a los patrones GLOB.
	* Permite que los patrones GLOB reconozcan archivos ocultos sin tener que anteponer el ".".
	* Ordena de manera horizontal las sugerencias.
	* Actualiza automáticamente la lista de binarios para la autocompletación.

* Comportamiento de comandos:
	* No es necesario escribir el comando "cd".
			
            ☮› Descargas  # Equivale a "cd Descargas"

	* Permite que Zsh ejecute comandos con comentarios.
	 	
        	☮› ls  # Comentario
		
	* Evita que ">" sobrescriba archivos y que ">>" los cree si no existen.

			☮› touch Archivo
            ☮› echo "Prueba" > Archivo  # Incorrecto
            ☮› echo "Prueba" >! Archivo  # Correcto

            ☮› echo "Prueba" >> otroArchivo  # Incorrecto
            ☮› echo "Prueba" >>! otroArchivo  # Correcto

* Atajos del teclado:
	
    Ctrl + R: Busca en el historial de comandos.
    
    Ctrl + U: Borra todo detras del cursor.
    
    Ctrl + K: Borra todo delante del cursor.
    
    Supr: Borra el caracter en el cursor.
    
    Re Pág: Busca hacia arriba en el historial según lo que esté escrito.
    
    Av Pág: Busca hacia abajo en el historial según lo que esté escrito.
    
    Inicio: Va al inicio de la línea.
    
    Fin: Va al final de la línea.
    
&nbsp;
### Wiki

#### Prompt:
---
    PROMPT=""  # Prompt
    RPROMPT=""  # Prompt izquierdo

##### Componentes:

* %l: TTY activa.
* %M: Nombre del equipo.
* %n: Nombre del usuario.
* %#: Privilegios.
* %?: Estado del último comando ejecutado.
* %h: Número de elementos en el HISTFILE.
* %j: Cantidad de trabajos activos.
* %\<índice\>v: Muestra el valor del arreglo "psvar".
* %\<número\>~: Ruta actual, 
	* 0 o sin especificar mostrará la ruta completa.
	* Positivo mostrará la cantidad de carpetas indicada a partir de la actual.
	* Negativo mostrará la cantidad de carpetas indicada a partir de la raiz.

##### Estilos:

* %B\<cadena\>%b: Negrita.
* %U\<cadena\>%u: Subrayado.
* %S\<cadena\>%s: Resaltar (Invertir colores).
* %\<longitud\>{\<cadena\>%}: Segmentos.
* %F{\<color\>}\<cadena\>%f: Color de fuente.
* %K{\<color\>}\<cadena\>%k: Color de fondo.
  * 0, black: Negro.
  * 1, red: Rojo.
  * 2, green: Verde.
  * 3, yellow: Amarillo.
  * 4, blue: Azul.
  * 5, magenta: Morado.
  * 6, cyan: Turquesa.
  * 7, white: Blanco.

##### Condiciones:
	PROMPT="%\<número\>(\<operador\>.\<salidaVerdadero\>.\<salidaFalso\>)"

* !: Retorna verdadero si el shell se ejecuta con privilegios de superusuario.
* ?: Retorna verdadero si el estado del ultimo comando es \<número\>.
* ~: Retorma verdadero si la ruta actual tiene al menos \<número\> de ancestros sin contar "/".
* j: Retorna verdadero si la cantidad de trabajos actuales es al menos \<número\>.
* v: Retorna verdadero si el arreglo "psvar" tiene al menos \<número\> elementos.
* V: Retorna verdadero si el elemento \<número\> del arreglo "psvar" no esta vacío.
* D: Retorna verdadero si el mes actual es \<número\>, teniendo Enero como 0.
* d: Retorna verdadero si el dia del mes es \<número\>.
* w: Retorna verdadero si el dia de la semana es \<número\>, teniendo Domingo como 0.
* T: Retorna verdadero si la hora es \<número\>.
* t: Retorna verdadero si los minutos son \<número\>.

##### Fecha y hora:
	PROMPT="%D{\<formato\>}"

* %c: Formato recomendado por localidad.
* %x: Formato recomendado por localidad sin hora.
* %X: Formato recomendado por localidad sin fecha.
* Escape:
	* %t: Tabulación.
	* %n: Salto de línea.
	* %%: Caracter %.
* Dia:
	* %u: Número del dia de la semana.
	* %w: Número del dia de la semana, teniendo Domingo como 0.
	* %A: Nombre del dia de la semana.
	* %a: Nombre del dia de la semana abreviado.
	* %f: Número del dia del mes.
	* %d: Número del dia del mes con 0.
	* %e: Número del dia del mes con " " en lugar de 0.
	* %j: Número del dia del año con 0.
* Semana:
	* %U: Número de la semana del año.
* Mes:
	* %B: Nombre del mes.
	* %b: Nombre del mes abreviado.
	* %m: Número del mes con 0.
* Año:
	* %Y: Año.
	* %y: Ultimos dos números del año.
* Hora:
	* %K: Hora en formato 24h.
	* %H: Hora en formato 24h con 0.
	* %L: Hora en formato 12h.
	* %I: Hora en formato 12h con 0.
* Minuto:
	* %M: Minuto con 0.
* Segundo:
	* %s: Segundo UNIX.
	* %S: Segundo con 0.
* Zona horaria:
	* %z: Zona horaria.
	* %Z: Nombre de la zona horaria.

##### Git:
* %s: Nombre del vcs.
* %b: Rama.
* %c: Cambios en el áre de preparación.
* %u: Cambios fuera del área de preparación.
* %r: Nombre de la carpeta raiz del repositorio.
* %S: Ruta actual relativa al repositorio.

&nbsp;

[Manual: Expansión del Prompt](http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html)

#### Configuración del teclado:
---
	bindkey "<tecla>" <ZLEWidget>

##### Lista de teclas:
* ^\<tecla\>: Ctrl + \<tecla\>.
* ^[\<tecla\>: Alt + \<tecla\>.
* ${terminfo[kich1]}: Insert.
* ${terminfo[kdch1]}: Supr.
* ${terminfo[khome]}: Inicio.
* ${terminfo[kend]}: Fin.
* ${terminfo[kpp]}: Re Pág.
* ${terminfo[knp]}: Av Pág.

##### Widgets del usuario:
	<función> ()
	{
		<sentencias>
	}

	zle -N <función>

&nbsp;

[Manual: Configuración del teclado y resaltado sintaxis de Zsh](http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html)

[Manual: Definición de funciones en Zsh](http://zsh.sourceforge.net/Doc/Release/Functions.html)

#### Patrones GLOB:
---

* *: Cualquier cadena.
* ?: Cualquier caracter.
* \[\<clase\>\]: Cualquier caracter, rango o clase especificada.
	* \[:ascii:\]: Caracter ASCII.
	* \[:digit:\]: Numérico.
	* \[:xdigit:\]: Hexadecimal.
	* \[:space:\]: Espacio, tabulación, salto de línea, etc...
	* \[:blank:\]: Espacio en blanco o tabulación.
	* \[:alnum:\]: Alfanumérico.
	* \[:alpha:\]: Alfabético.
	* \[:cntrl:\]: Caracter de control.
	* \[:upper:\]: Mayúscula.
	* \[:lower:\]: Minúscula.
	* \[:print:\]: Caracter imprimible.
	* \[:graph:\]: Caracter imprimible que no sea un espacio en blanco.
	* \[:punct:\]: Caracter imprimible que no sea un espacio en blanco o un caracter alfanumérico.
	* \[\[\<clase\>\]\]: Evalua solo un caracter.
	* \[\[\<clase\>\]\<otraClase\>\]: Clases anidadas.
	* \[!\<clase\>\]: Negación.
* \<\<número\>-\<número\>\>: Rangos numéricos.
* (\<patrón\>): Agrupar.
* |: Operador lógico OR, es el operador con menor precedencia por lo que se recomienda usar con parentesis

		☮› ls -d /home/ntrrg/(D*|P*)  # Mostrará todos los archivos y carpetas que empiecen con "P" o "D"

* ^: Negación, tiene más precedencia que "/" por lo que solo negará un elemento.
		
		☮› ls /home/^ntrrg/Descargas/  # Mostrará el contenido de todas las carpetas de descargas de los usuarios que no sean "ntrrg"

* \<patrón\>~\<otroPatrón\>: Busca coincidencias con \<patrón\> y que no coincidan con \<otroPatrón\>, solo tiene mas precedencia que "|", pueden especificarse mas patrones sepradandolos con "~". 

		☮› ls -d /home/*/(*~Descargas~*.png)  # Mostrará todos los archivos y carpetas que no sean "Descargas" ni terminen en ".png"

&nbsp;

[Manual: Expansión de patrones GLOB](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Glob-Operators)

#### Referencias:
---

* [Manual de Zsh](http://zsh.sourceforge.net/Doc/Release/zsh.html#Top)
* [Lista de opciones de Zsh](http://linux.die.net/man/1/zshoptions)
* [Manual de Zsh, ArchLinux](https://wiki.archlinux.org/index.php/Zsh)
* [Manual de Zsh, Gentoo](https://wiki.gentoo.org/wiki/Zsh/Guide)
* [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
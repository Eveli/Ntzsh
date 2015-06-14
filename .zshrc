# Ntzsh, Miguel Angel Rivera Notararigo <ntrrgx@gmail.com>
# https://github.com/ntrrg/Ntzsh

echo "
▗▄ ▗▖               ▗▖
▐█ ▐▌ ▐▌            ▐▌   
▐▛▌▐▌▐███ ▐███▌▗▟██▖▐▙██▖
▐▌█▐▌ ▐▌    ▗▛ ▐▙▄▖▘▐▛ ▐▌              $(hostname) ($(uname -m))
▐▌▐▟▌ ▐▌   ▗▛   ▀▀█▖▐▌ ▐▌              IP: $(hostname -I)
▐▌ █▌ ▐▙▄ ▗█▄▄▖▐▄▄▟▌▐▌ ▐▌  █    █
▝▘ ▀▘  ▀▀ ▝▀▀▀▘ ▀▀▀ ▝▘ ▝▘  ▀    ▀
"



# ╔════════╗
# ║ PROMPT ║
# ╚════════╝
	autoload -U promptinit
	promptinit

#	setopt promptsubst  # Mejoras para el PROMPT como evaluación de expresiones aritmeticas, ejecución de funciones, etc..

#	┌─────┐
#	│ Git │
#	└─────┘
		autoload -U vcs_info
		zstyle ':vcs_info:*' enable git
		zstyle ':vcs_info:*' check-for-changes true  # Para habilitar %c y %u
		zstyle ':vcs_info:*' stagedstr ' ✔'
		zstyle ':vcs_info:*' unstagedstr ' ✘'
		zstyle ':vcs_info:*' formats "╞ %b%c%u ╡"

		function precmd() # Función predefinida de Zsh que ejecuta las sentencias antes de mostrar el PROMPT
		{
			vcs_info
			psvar=$vcs_info_msg_0_
		}

	PROMPT="%B%n %(!.%F{red}☢%f.%F{green}☮%f)›%b "
	RPROMPT="%B%v╞ %F{green}%1~%f ╡%b"



# ╔═══════════════════════╗
# ║ Historial de comandos ║
# ╚═══════════════════════╝
	HISTFILE=~/.histfile
	HISTSIZE=1000
	SAVEHIST=1000



# ╔══════════════════╗
# ║ Autocompletación ║
# ╚══════════════════╝
	autoload -U compinit
	compinit

	zstyle ':completion:*' menu select  # Habilitar navegación entre las sugerencias, soporta el uso de las flechas
	zstyle ':completion:*:descriptions' format '%SCoincidencias:%s'
	zstyle ':completion:*:warnings' format '%SNo se encuentran coincidencias..%s'



#	┌─────────┐
#	│ Colores │
#	└─────────┘
		LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'
		export LS_COLORS

		zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}  # Color de las sugerencias



# ╔═══════════════════════════╗
# ║ Configuración del teclado ║
# ╚═══════════════════════════╝
	bindkey "^r" history-incremental-search-backward  # Buscar en el historial
	bindkey "^u" backward-kill-line  # Borrar todo lo que este detras del cursor
	bindkey "^k" kill-line  # Borrar todo lo que esta delante del cursor
	bindkey "${terminfo[kdch1]}" delete-char  # Borrar caracter en el cursor
	bindkey "${terminfo[kpp]}" up-line-or-search  # Busca hacia arriba en el historial según lo que esté escrito
	bindkey "${terminfo[knp]}" down-line-or-search  # Busca hacia abajo en el historial según lo que esté escrito
	bindkey "${terminfo[khome]}" beginning-of-line  # Ir al inicio de la línea
	bindkey "${terminfo[kend]}" end-of-line  # Ir al final de la línea



# ╔═══════╗
# ║ Alias ║
# ╚═══════╝
	alias ls="ls --color=auto"  # Para habilitar los colores en el comando "ls"



# ╔════════╗
# ║ Extras ║
# ╚════════╝
#	┌───────────┐
#	│ Historial │
#	└───────────┘
		setopt histignorealldups  # Evita que se guarden lineas repetidas en el HISTFILE
		setopt histignorespace  # No guarda en el historial comandos que empiecen con un espacio en blanco
		setopt histreduceblanks  # Elimina los espacios innecesarios de los comandos antes de guardarlo en el HISTFILE

#	┌──────────────────┐
#	│ Autocompletación │
#	└──────────────────┘
#		setopt correctall  # Muestra posibles correciones a errores de sintaxis en comandos y parametros
		setopt extendedglob  # Agrega los caracteres "^", "~" y "#" a los patrones GLOB
		setopt globdots  # Permite que los patrones GLOB reconozcan archivos ocultos sin tener que anteponer el "."
		setopt listrowsfirst  # Ordena de manera horizontal las sugerencias
#		setopt globcomplete  # En lugar de añadir todas las coincidencias con el patrón GLOB, muestra el menú de sugerencias

#		setopt nocaseglob  # Evita la sensibilidad a mayusculas en patrones GLOB
		setopt nohashdirs  # Actualiza automáticamente la lista de binarios para la autocompletación
		setopt nohashcmds  # Cumple la misma función que la opción anterior

#	┌────────────────────────────┐
#	│ Comportamiento de comandos │
#	└────────────────────────────┘
		setopt autocd  # No es necesario escribir el comando "cd"
		setopt interactivecomments  # Permite que Zsh ejecute comandos con comentarios
		
		setopt noclobber  # Evita que ">" sobrescriba archivos y que ">>" los cree si no existen

#	┌───────────────────────────┐
#	│ Configuración del teclado │
#	└───────────────────────────┘
#		setopt ignoreeof  # Evita la salida con "Ctrl + D"
#!/bin/bash
# v 1.0
# 8 NOV 2024
cat << 'EOF'
    ,'
    _.----.        ____         ,'  _\   ___    ___     ____
_,-'       `.     |    |  /`.   \,-'    |   \  /   |   |    \  |`.
\      __    \    '-.  | /   `.  ___    |    \/    |   '-.   \ |  |
 \.    \ \   |  __  |  |/    ,','_  `.  |          | __  |    \|  |
   \    \/   /,' _`.|      ,' / / / /   |          ,' _`.|     |  |
    \     ,-'/  /   \    ,'   | \/ / ,`.|         /  /   \  |     |
     \    \ |   \_/  |   `-.  \    `'  /|  |    ||   \_/  | |\    |
      \    \ \      /       `-.`.___,-' |  |\  /| \      /  | |   |
       \    \ `.__,'|  |`-._    `|      |__| \/ |  `.__,'|  | |   |
        \_.-'       |__|    `-._ |              '-.|     '-.| |   |
                                `'                            '-._

			         .-~~~-.
			  .- ~ ~-(       )_ _
			 /                     ~ -.
			|       Edición Juan        \
			 \                         .'
			   ~- . _____________ . -~ 
EOF

directorio_partida="${HOME}/pokemon_juan"

echo "¡Bienvenido!"
read press_button
echo "Estás jugando en la sesión de $(whoami)."
read press_button

if [ ! -e $directorio_partida ]; then
	echo "No se encontró ninguna partida guardada, los datos de partida se crearán en $directorio_partida."
	mkdir -p ${directorio_partida}
	touch "${directorio_partida}/evento.txt"
	echo 0 > "${directorio_partida}/evento.txt"
	cd "${directorio_partida}"
else
	echo "Ya existe una partida guardada; continuarás tu aventura desde donde la dejaste."
	cd "${directorio_partida}"
fi

evento_actual=`cat "${directorio_partida}/evento.txt"`

echo "Evento actual: ${evento_actual}"

if [ $evento_actual == 0 ]; then
	echo "Bienvenido al muy buen mundo de Pokémon, un mundo muy bueno la verdad."
	read press_button
	echo "Tú, Cazabichos Juan, vas a comenzar tu aventura!"
	read press_button
	echo "Pero antes, dime...¿Eres un chico o una chica?"
	printf "Chico (1)\nChica (2)\nNo lo sé... (3)\n"
	evento_chique=0
	while [ $evento_chique == 0 ]; do
		read -p ":" sexo
		if [[ $sexo -eq 1 ]]; then
			echo "Lo sospeché desde un principio..."
			evento_chique=1
		elif [[ $sexo -eq 2 ]]; then
			echo "Pero qué cojones dices, Juan,¿estás borracho?"
			evento_chique=1
		elif [[ $sexo -eq 3 ]]; then
			echo "Na si empezamos con esta mierda dejamos el juego."
			exit 0
		else
			echo "Tienes que elegir 1, 2 o 3."
		fi
	done
fi

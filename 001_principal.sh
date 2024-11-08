#!/bin/bash
# v 1.0
# 8 NOV 2024

funcion_mision_inicial() {

	echo

	echo "Prof. Oak: Bueno, la verdad que me da igual, no creo que te vuelva a ver después de mandarte esta misión."
	read -p "__________________________________________________" press_button
	echo "Prof. Oak: Escucha, esto es una Pokédex, hay muchos Pokémon y necesito que los encuentres a todos."
	read -p "__________________________________________________" press_button
	echo "Prof. Oak: Te daría un Pokémon mío para ayudarte con tu misión, pero son míos..."
	read -p "__________________________________________________" press_button
	echo "Prof. Oak: ¿Por qué no capturas uno tú mismo?"
	echo
	echo "1) Hombre, es que sin Pokémon me da algo de miedo yo qué se..."
	echo "2) Va, pero dime dónde hay Pokémon por aquí..."
	echo "3) No voy a hacer tu misión, quiero estudiar ASIR y convertirme en un técnico en administración de sistemas informáticas en red."


	evento_mision_inicial=0

	while [ $evento_mision_inicial -eq 0 ]; do
		read -p ":"  respuesta_mision_inicial
		if [ $respuesta_mision_inicial -eq 1 ]; then
			echo "Prof. Oak: ¿Y para qué tienes los puños?"
			read -p "__________________________________________________" press_button
			echo "Prof. Oak: Ven, salgamos del laboratorio y vayamos al Bosque Negreira, está aquí al lado."
			read -p "__________________________________________________" press_button
			evento_mision_inicial=1
		elif [ $respuesta_mision_inicial -eq 2 ]; then
			echo "Prof. Oak: Así me gusta, pues mira, aquí al lado tienes el Bosque Negreira, está lleno de Pokémon, vamos..."
			read -p "__________________________________________________" press_button
			evento_mision_inicial=1
		elif [ $respuesta_mision_inicial -eq 3 ]; then
			echo "Prof. Oak: Eso es de tontos, deja de decir tonterías y salgamos del laboratorio, vamos al Bosque Negreira, está aquí al lado."
			read -p "__________________________________________________" press_button
			evento_mision_inicial=1
		else
			echo "Prof. Oak: Quieres hacer el favor de escoger una opción de las que te doy?"
		fi
	done

	echo "1" > "${directorio_partida}/evento.txt"
	./002_capitulo_uno.sh
}



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
read -p "__________________________________________________" press_button
echo "Estás jugando en la sesión de $(whoami)."
read -p "__________________________________________________" press_button

if [ ! -e $directorio_partida ]; then
	echo "No se encontró ninguna partida guardada, los datos de partida se crearán en $directorio_partida."
	mkdir -p ${directorio_partida}
	touch "${directorio_partida}/evento.txt"
	echo 0 > "${directorio_partida}/evento.txt"
	read -p "__________________________________________________" press_button
else
	echo "Ya existe una partida guardada; continuarás tu aventura desde donde la dejaste."
	read -p "__________________________________________________" press_button
fi

evento_actual=`cat "${directorio_partida}/evento.txt"`



if [ $evento_actual -eq 0 ]; then

cat << 'EOF'
	 +-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+
	 |P|u|e|b|l|o| |N|e|g|r|e|i|r|a|
	 +-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+
EOF
	echo "Prof. Oak: Bienvenido al muy buen mundo de Pokémon, un mundo muy bueno la verdad."
	read press_button
	echo "Prof. Oak: Tú, Cazabichos Juan, vas a comenzar tu aventura!"
	read -p "__________________________________________________" press_button
	echo "Prof. Oak: Pero antes, dime...¿Eres un chico o una chica?"
	printf "Chico (1)\nChica (2)\nNo lo sé... (3)\n"
	evento_chique=0
	while [ $evento_chique -eq 0 ]; do
		read -p ":" sexo
		if [[ $sexo -eq 1 ]]; then
			echo "Prof. Oak: Lo sospeché desde un principio..."
			evento_chique=1
			funcion_mision_inicial
		elif [[ $sexo -eq 2 ]]; then
			echo "Prof. Oak: Pero qué cojones dices, Juan,¿estás borracho?"
			evento_chique=1
			funcion_mision_inicial
		elif [[ $sexo -eq 3 ]]; then
			echo "Prof. Oak: Na si empezamos con esta mierda dejamos el juego."
			exit 0
		else
			echo "Prof. Oak: Tienes que elegir 1, 2 o 3."
		fi
		read -p "__________________________________________________" press_button
	done
# aqui los elif para los demas eventos y que ejecute los scripts de otros capitulos	
elif [ $evento_actual -eq 1 ]; then
	./002_capitulo_uno.sh
fi


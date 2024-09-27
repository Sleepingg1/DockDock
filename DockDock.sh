#!/bin/bash

#Authon: Sleepingg

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


# Variables Globales

maquina=$1
user=$2
crear=/home/$2/$2/maquinas
crear2=/home/$2/$2/maquinas/dockerlabs
dir=/home/$2/$2/maquinas/dockerlabs
dir2=/home/$2/$2/maquinas/dockerlabs/$1

function ctrl_c(){

  echo -e "[!] Saliendo..."
  exit 1
  tput cnorm
}

# Ctrl_c
trap ctrl_c SIGINT


function helppanel(){

  echo -e "\t${grayColour}[!]${endColour} ${turquoiseColour}Uso:${endColour}"
  echo -e "\n${grayColour}[+]${endColour} ${grayColour}Modo de uso:${endColour}${yellowColour}./dockdock.sh (maquina) (usuario)${endColour}\n"

  echo -e "${grayColour}[+]${endColour} ${grayColour}Ejemplo:${endColour}${yellowColour}./dockdock.sh debugme sleeping (no es necesario poner la extencion del archivo)${endColour}\n"
  echo -e "${grayColour}[+]${endColour} ${grayColour}En caso que no tengas los directorios de trabajo ${yellowColour}\"/home/user/user/maquinas/dockerlabs\"${endColour} ${grayColour}el script lo creara por ti :D${endColour}"
  echo -e "${grayColour}[+]${endColour} "

}

# mostrar panel de ayuda

if [ "$*" = "help" ]; then

  helppanel
  exit 1

fi

# Validar si se a proporcionado argumentos al script
if [ "$#" -eq 0 ]; then

  helppanel
  exit 1

fi

# Validar si han puesto la palabra help
if [ "$1" = "help"  ]; then &>/dev/null

  helppanel
  exit 1

fi

# Función para crear directorios:
function mkt(){
    mkdir $dir2/{nmap,content,exploits,scripts} 
}

function machinne_name(){

  tput civis
  echo -e "\n${grayColour}[+]${endColour} ${greenColour}Descomprimiendo la maquina:${endColour}${yellowColour}\"$maquina\"\n${endColour}"
  sleep 0.3
  7z x $maquina.zip -y &>/dev/null
  if [ $? = 0 ]; then
    echo -e "${grayColour}[+]${endColour} ${greenColour}Se han descomprimido los archivos con exito :D${endColour}\n"
    tput cnorm
  else
    echo -e "${grayColour}[!]${endColour} ${redColour}A ocurrido un error o la maquina${endColour} ${yellowColour}\"$maquina\"${endColour} ${redColour}no existe :c${endColour}\n"
    tput cnorm
    exit 1
  fi
}

function mover(){
  
  tput civis
  echo -e "\n${grayColour}[+]${endColour} ${greenColour}Moviendo todos los archivos al directorio${endColour} ${yellowColour}\"$dir/$maquina\"${endColour}\n"
  sleep 0.3

  if [ -d $dir ]; then
   mkdir $dir2 &>/dev/null
   mv $maquina.tar $dir2 &>/dev/null
   mv auto_deploy.sh $dir2 &>/dev/null
   sleep 0.5
   echo -e "${grayColour}[+]${endColour}${greenColour}Creando los directorios${endColour} ${yellowColour}\"nmap,content,exploit,scripts\"${endColour}\n"
   mkt &>/dev/null
   echo -e "${grayColour}[+]${endColour} ${greenColour}Se han movido y creado todos los archivos y directorios correctamente${endColour}\n"
   echo -e "${grayColour}[+]${endColour} ${greenColour}Ahora solo haz${endColour} ${yellowColour}\"cd $dir/$maquina\"${endColour} ${greenColour}y happing hacking${endColour}\n"
   tput cnorm
  else
    echo -e "\n${grayColour}[!]${endColour} ${redColour}Hmmn el directorio${endColour} ${yellowColour}\"maquinas\"${endColour} ${redColour}no existe :c,${endColour} ${greenColour}pero chill lo crearer por ti rey :D${endColour}\n"
    mkdir $crear
    sleep 0.3
    mkdir $crear2
    sleep 0.3
    mkdir $dir2
    sleep 0.3
    mv $maquina.tar $dir2 &>/dev/null
    mv auto_deploy.sh $dir2 &>/dev/null
    sleep 0.5
    echo -e "${grayColour}[+]${endColour}${greenColour}Creando los directorios${endColour} ${yellowColour}\"nmap,content,exploit,scripts\"${endColour}\n"
    mkt &>/dev/null
    echo -e "${grayColour}[+]${endColour} ${greenColour}Se han creado y movidos los archivos y directorios con exito${endColour}\n"
    echo -e "${grayColour}[+]${endColour} ${greenColour}Ahora solo haz ${yellowColour}\"cd $dir/$maquina\"${endColour} ${greenColour}y happing hacking${endColour}\n"
    tput cnorm
  fi

}

# Llamada a las funciones
machinne_name
mover

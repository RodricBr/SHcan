#!/usr/bin/bash

VERMELHO='\033[31;1m'
VERDE='\033[32;1m'
AMARELO='\033[33;1m'
FIM='\033[m'

VER_="1.2"

banner_(){
  echo -e "${VERDE}
  ######  ##     ##  ######     ###    ##    ##
 ##    ## ##     ## ##    ##   ## ##   ###   ##
 ##       ##     ## ##        ##   ##  ####  ##
  ######  ######### ##       ##     ## ## ## ##
       ## ##     ## ##       ######### ##  ####
 ##    ## ##     ## ##    ## ##     ## ##   ###
  ######  ##     ##  ######  ##     ## ##    ##${FIM}\n\t-: basic nmap scanner :-\n\n"
}

case $ajuda in
  "-v") echo -e "Versão: " ; VER_ ;;
esac

if [[ -z "$*" ]] || [[ "$*" == -h ]]; then # usando o * ao invés de @
  echo -e "\n${AMARELO}Como usar:${FIM}
\tshcan.sh -h   : Modo de uso\n
\tshcan.sh -v   : Versão do programa\n
\tshcan.sh <IP/Domnínio> <Range de portas> <A (Agressivo) | P (Passivo) | T (Todas as portas)>\n\
\tIdentificações: Portas, serviços, sistemas operacionais, varreduras TCP SYN .. UDP
  "
  if [[ -n $(command -v nmap) ]]; then
      echo -e "${VERDE}NMAP instalado!${FIM}"
      echo -e "${VERDE}Versão:${FIM} $(nmap --version)"
      exit 0
  else
      echo -e "${VERMELHO}NMAP não encontrado!${FIM}"
      echo -e "Para baixar, execute esse comando:"
      echo -e "sudo apt-get install nmap -y\n"
      exit 1
  fi
fi

if [[ "${*: -1}" == "A" ]]; then # Usando -n ao invés de ! -z
  banner_
  nmap -Pn -sV -T5 -p "$2" "$1" -sS -traceroute # -iR 0 --open to locate random web servers for browsing
elif [ "${*: -1}" '==' "P" ]; then # *: -1 == último caractere
  banner_
  nmap -Pn -sV -T2 -p "$2" "$1" -sS -traceroute
#elif [ "${*: -1}" '==' "T" ]; then
  # Todas as portas
fi

# Fazer um scan com as portas mais famosas (-p-)
# Adicionar a opção -A (to enable OS and version detection, script scanning, and traceroute)

# Agressivo:
# nmap -Pn -sV --version-intensity 5 -p $2 $1

# Passivo:
# nmap -Pn -sV --version-intensity 0 -p $2 $1
#

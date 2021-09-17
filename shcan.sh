#!/usr/bin/bash

VERMELHO='\033[31;1m'
VERDE='\033[32;1m'
AMARELO='\033[33;1m'
FIM='\033[m'

banner_(){
  cat <<-EOF${VERDE}
     _
    | |
 ___| |__   ___ __ _ _ __
/ __| '_ \ / __/ _` | '_ \
\__ \ | | | (_| (_| | | | |
|___/_| |_|\___\__,_|_| |_|${FIM}
EOF
  echo -e "${VERDE}
  ######  ##     ##  ######     ###    ##    ##
 ##    ## ##     ## ##    ##   ## ##   ###   ##
 ##       ##     ## ##        ##   ##  ####  ##
  ######  ######### ##       ##     ## ## ## ##
       ## ##     ## ##       ######### ##  ####
 ##    ## ##     ## ##    ## ##     ## ##   ###
  ######  ##     ##  ######  ##     ## ##    ##${FIM}\n\tbasic nmap scanner\n\n"
}

if [[ -z "$*" ]] || [[ "$*" == -h ]]; then # usando o * ao invés de @
  echo -e "\n${AMARELO}Como usar:${FIM}
\tshcan.sh -h   : Modo de uso\n
\tshcan.sh <IP/Domnínio> <Range de portas> <-A (Agressivo) | -P (Passivo)>\n\
\tEx: shcan.sh 192.168.1.4 80-443 -A\n\
\tEx: shcan.sh 192.168.1.4 80,443,1337,22 -P
\tIdentificações: Portas, serviços, sistemas operacionais, varreduras TCP SYN .. UDP
  "
  if [[ -n $(command -v nmap) ]]; then
      echo -e "${VERDE}NMAP instalado!${FIM}"
      echo -e "${VERDE}Versão:${FIM} $(nmap --version)"
      exit 0
  else
      echo -e "${VERMELHO}NMAP não encontrado!${FIM}"
      echo -e "Para baixar, execute esse comando:"
      echo -e "sudo apt-get install nmap\n"
      exit 1
  fi
fi

if [[ -n "$1" ]] || [[ "${*: -1}" == "A" ]]; then # Usando -n ao invés de ! -z
  banner_
  nmap -Pn -sV -T5 -p "$2" "$1" -sS -traceroute
elif [ "${*: -1}" '==' "P" ]; then # *: -1 == último caractere
  banner_
  nmap -Pn -sV -T2 -p "$2" "$1" -sS -traceroute
fi

# Fazer um scan com as portas mais famosas (-p-)
# Adicionar a opção -A (to enable OS and version detection, script scanning, and traceroute)

# Agressivo:
# nmap -Pn -sV --version-intensity 5 -p $2 $1

# Passivo:
# nmap -Pn -sV --version-intensity 0 -p $2 $1
#

#!/usr/bin/bash

VERMELHO='\033[31;1m'
VERDE='\033[32;1m'
AMARELO='\033[33;1m'
FIM='\033[m'

if [[ -z "$@" ]]; then
  echo -e "\n${AMARELO}Como usar:${FIM}
$0 <IP/Domnínio> <Range de portas> <-A (Agressivo) | -P (Passivo)>\n\
Ex: $0 192.168.1.4 80-443\n\
Identificações: Portas, serviços, sistemas operacionais
  "
  if command -v nmap >/dev/null 2>&1; then
      echo -e "${VERDE}NMAP instalado!${FIM}"
      echo "Versão: $(nmap -v)"
      exit 0
  else
      echo -e "${VERMELHO}NMAP não encontrado!${FIM}"
      echo -e "Para baixar, execute esse comando:\n"
      echo -e "sudo apt-get install nmap\n"
      exit 1
  fi
fi

if [[ ! -z "$1" ]] || [[ "${@: -1}" == "-A" ]]; then
  nmap -Pn -sV --version-intensity 5 -p $2 $1
elif "${@: -1}" == "-P"; then
  nmap -Pn -sV --version-intensity 0 -p $2 $1
fi

# Agressivo:
# nmap -Pn -sV --version-intensity 5 -p $2 $1

# Passivo:
# nmap -Pn -sV --version-intensity 0 -p $2 $1

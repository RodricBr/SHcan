#!/usr/bin/env bash

VERMELHO='\033[31;1m' # '\033[31m' = Vermelho ';' concatena o Vermelho com o '\033[1m' é Negrito
VERDE='\033[32;1m'    # '\033[32m' = Verde
AZUL='\033[34;1m'     # '\033[34m' = Azul
AMARELO='\033[33;1m'  # '\033[33' = Amarelo
CYANO='\033[0;36m'    # '\033[0;36m' = Cyano
FIM='\033[m'          # Reseta a cor


if [[ -z "$@" ]]; then
  echo -e "\n${AMARELO}Como usar:${FIM} $0 <IP/Domnínio> <Range de portas>\n\
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

if [[ ! -z "$1" ]] || [[ "$@" == "-A" ]]; then
  nmap -Pn -sV --version-intensity 5 -p $2 $1
fi

if [[ "$@" == "-I" ]]; then
  read -rp "Scan agrassivo[A] | Scan passivo[P]: " resposta_1

  case "$resposta_1" in
    "A") nmap -Pn -sV --version-intensity 5 -p $2 $1 ;;
    "P") nmap -Pn -sV --version-intensity 0 -p $2 $1 ;;
  esac
fi

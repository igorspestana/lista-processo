#!/bin/bash

#########################################################################
#                                                                       #
# RelatorioMaquina.sh - Relatório da máquina atual                      #
#                                                                       #
# Autor: Igor Pestana (igorspestana@gmail.com)                          #
# Data Criação: 09/07/2022                                              #
#                                                                       #
# Descrição: Script que gera um relatório de algumas informações        #
#            da máquina atual                                           #
#                                                                       #
# Exemplo de uso: ./RelatorioMaquina.sh                                 #
#                                                                       #
#########################################################################

MAQUINA=$(hostname)
DATA=$(date)
DATAATIVA=$(uptime -s)
KERNEL=$(uname -r)
CPUCORES=$(cat /proc/cpuinfo | grep "cpu cores" | cut -d":" -f2 | head -1)
MODELNAME=$(cat /proc/cpuinfo | grep "model name" | cut -d":" -f2 | head -1)
MEMORIACPU=$(expr $(cat /proc/meminfo | grep MemTotal | cut -d":" -f2 | tr -d ' ' | tr -d kB) / 1024)
FILESYS=$(df -h | egrep -v '(tmpfs|udev)')

clear
echo "==============================================="
echo "Relatório da Máquina: $MAQUINA"
echo "Data/Hora: $DATA"
echo "==============================================="
echo
echo "Máquina ativa desde: $DATAATIVA"
echo
echo "Versão do Kernel: $KERNEL"
echo
echo "CPUs:"
echo "Quantidade de CPUs/Core: $CPUCORES"
echo "Modelo da CPU: $MODELNAME"
echo
echo "Memória Total: $MEMORIACPU MB"
echo
echo "Partições: "
echo "$FILESYS"
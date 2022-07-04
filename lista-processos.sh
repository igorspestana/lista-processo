#!/bin/bash

echo "Digite o diretório."
read log

if [ ! -d $log ]
then
    mkdir $log
fi

processosMemoria() {
processos=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])
for pid in $processos
do
    nomeProcesso=$(ps -p $pid -o comm=)
    echo -n $(date +%F,%H:%M:%S,) >> $log/$nomeProcesso.log
    tamanhoProcesso=$(ps -p $pid -o size | grep [0-9])
    echo "$(bc <<< "scale=2;$tamanhoProcesso/1024") MB" >> $log/$nomeProcesso.log
done
}

processosMemoria

if [ $? -eq 0 ]
then
	echo "Sucesso"
else
	echo "Erro"
fi


#!/bin/bash

#=========================================================================
#                                                                       
# GeraBackupHome.sh  - Script que cria um backup do dirétório home
#                                                                       
# Autor: Igor Pestana (igorspestana@gmail.com)
# Data Criação: 11/07/2022
#                                                                       
# Descrição: Faz um backup compactado do diretório home do usuário 
#            que estiver executando o script                                        
#                                                                       
# Exemplo de uso: ./GeraBackupHome.sh                                
#                                                                       
#=========================================================================

USER=$(whoami)
#DIRHOME=/home/$USER
DIRHOME=/home/$USER/scriptbkpteste
DIRBKP=/home/$USER/Backup
DATA=$(date +%Y%m%e%H%M)
BKPNAME=backup_home_$DATA.tgz


#Validação do usuário
ls $DIRHOME > /dev/null 2>&1 || { echo "Usuário Inexistente" ; exit 1; }

#Conferir e criar a pasta backup
if [ ! -d /$DIRBKP ]
then
    mkdir -p $DIRBKP
fi

#Conferir se o último backup tem menos de 7 dias

DAYS7=$(find $DIRBKP -ctime -7 -name backup_home\*tgz)

if [ "$DAYS7" ]
then
	echo "Já foi gerado um backup do diretório "$DIRHOME" nos últimos 7 dias."
	echo -n "Deseja continuar? (N/S): "
	read -n1 CONT
	echo
	if [ "$CONT" = N -o "$CONT" = n -o "$CONT" = "" ]
	then
		echo "Backup Abortado!"
		exit 1
	elif [ "$CONT" = S -o "$CONT" = s ]
	then
		echo "Será criado mais um backup para a mesma semana"
	else
		echo "Opção Inválida"
		exit 2
	fi
fi

#Criar backup
echo
echo "Criando Backup..."
sleep 1
tar zcvpf $DIRBKP/$BKPNAME --absolute-names --exclude="$DIRBKP" "$DIRHOME" > /dev/null
echo
echo "O backup de nome \""$BKPNAME"\" foi criado em "$DIRBKP"" 
echo
echo "Backup Concluído!"
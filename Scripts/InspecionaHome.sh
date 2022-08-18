#!/bin/bash

#=========================================================================
#                                                                       
# InspecionaHome.sh  - Script de relatório de arquivos de usuários 
#                                                                       
# Autor: Igor Pestana (igorspestana@gmail.com)
# Data Criação: 15/07/2022
#                                                                       
# Descrição: Script que faz um relatório de arquivos JPG, MP3 e MP4
#			 de cada usuário                                     
#                                                                       
# Exemplo de uso: ./InspecionaHome.sh                        
#                                                                       
#=========================================================================


for i in $(ls -1 /home)
do
	JPG=$(find /home/$i -name '*.jpg' | wc -l)
	MP3=$(find /home/$i -name '*.mp3' | wc -l)
	MP4=$(find /home/$i -name '*.mp4' | wc -l)

	echo "Usuário: $i"
	echo "Arquivos JPG: $JPG"
	echo "Arquivos MP3: $MP3"
	echo "Arquivos MP4: $MP4"
	echo

done
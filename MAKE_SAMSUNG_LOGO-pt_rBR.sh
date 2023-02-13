#!/usr/bin/env bash

# chmod a+x *
# chmod a+x scripts/*

mkdir /sdcard/#LOGO;cd /sdcard/#LOGO;clear

x="teste"
menu ()
{
while true $x != "teste"
do
echo ""
echo ""
echo "#====================================================#"
echo "#                      = Menu =                      #"
echo "#====================================================#"
echo "# CRIADOR DE LOGOS PARA DISPOSITIVOS SAMSUNG M62/F62 #"
echo "# FERRAMENTA SOMENTE PARA USO EM CELULARES ANDROID   #"
echo "# Feito por @allexwin50                              #"
echo "#====================================================#"
echo "#  [1] Extrair LOGO do sistema                       #"
echo "#  [2] Descompactar LOGO                             #"
echo "#  [3] Descompactar LOGO a partir de outra LOGO      #"
echo "#  [4] Compactar LOGO                                #"
echo "#  [5] Substituir LOGO do sistema                    #"
echo "#  [6] Reiniciar sistema                             #"
echo "#  [7] Limpar (Apaga todas as subpastas de '#LOGO')  #"
echo "#  [8] Sair                                          #"
echo "#====================================================#"
echo "# Digite a opcao desejada:                           #"
echo "#====================================================#"
read x
echo "# Opcao informada ($x)"
echo "#====================================================#"

case "$x" in

1) clear;echo 1;mkdir /sdcard/#LOGO/logo_backup;cat /dev/block/by-name/up_param > /sdcard/#LOGO/logo_backup/logo.img;echo "Backup realizado!";;
2) clear;echo 2;[ ! -e "logo_backup" ] && echo "Execute o comando '1' primeiro." && menu;cd /sdcard/#LOGO;mkdir /sdcard/#LOGO/logo_extracted;cd /sdcard/#LOGO/logo_extracted;mv /sdcard/#LOGO/logo_backup/logo.img /sdcard/#LOGO/logo_extracted/logo.bin;tar xf /sdcard/#LOGO/logo_extracted/logo.bin;mv /sdcard/#LOGO/logo_extracted/logo.bin /sdcard/#LOGO/logo_backup/logo.img;echo "LOGO extraída na memória interna na pasta /#LOGO/logo_extracted, substitua as imagens que deseja, a imagem substituida não deve exceder +-400kb";;
3) clear;echo 3;[ ! -e "logo.img" ] && echo "Está faltando o arquivo logo.img, renomeie sua LOGO para 'logo.img' e adicione ela na pasta '#LOGO' que está localizada na memória interna do dispositivo, assim poderemos prosseguir..." && menu;cd /sdcard/#LOGO;mkdir /sdcard/#LOGO/logo_backup;mkdir /sdcard/#LOGO/logo_extracted;cd /sdcard/#LOGO/logo_extracted;mv /sdcard/#LOGO/logo.img /sdcard/#LOGO/logo_extracted/logo.bin;tar xf /sdcard/#LOGO/logo_extracted/logo.bin;mv /sdcard/#LOGO/logo_extracted/logo.bin /sdcard/#LOGO/logo_backup/logo.img;echo "LOGO extraída na memória interna na pasta /#LOGO/logo_extracted, substitua as imagens que deseja, a imagem substituida não deve exceder +-400kb";;
4) clear;echo 4;[ ! -e "logo_extracted" ] && echo "É necessário ter uma logo extraída para executar este comando." && menu;cd /sdcard/#LOGO/logo_extracted;tar cf - `ls | sort -t.` > /sdcard/#LOGO/logo_extracted/logo.bin;mv /sdcard/#LOGO/logo_extracted/logo.bin /sdcard/#LOGO/logo.img;cd /sdcard/#LOGO;echo "Logo recriada com sucesso na memória interna na pasta /#LOGO!";;
5) clear;echo 5;[ ! -e "logo_backup" ] && echo "É necessário que o arquivo 'logo.img' esteja na pasta #LOGO na memória interna para prosseguir." && menu;cat /sdcard/#LOGO/logo.img > /dev/block/by-name/up_param;echo "Logo atualizada!";;
6) clear;echo 6;echo "Reinciando...";reboot;;
7) clear;echo 7;rm -rf /sdcard/#LOGO/logo_backup;rm -rf /sdcard/#LOGO/logo_extracted;echo "Tudo limpo!";;
8) clear;echo "Saindo...";clear;exit;;
*) clear;echo "Opção inválida!";esac done };menu


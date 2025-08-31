# TL866CS-AppImage
<h2>Unofficial Build<h2/>

<br>This is an appimage version from the open source software for tl866a/cs<br/>

  read the bios chip

./minipro-x86_64.AppImage -p W25Q64FV@SOIC8 -r lucas.rom -y

erase the bios  chip

./minipro-x86_64.AppImage -p W25Q64FV@SOIC8 -E

record the  bios chip

./minipro-x86_64.AppImage -p W25Q64FV@SOIC8 -w lucas.rom -y

list avaible chips

./minipro-x86_64.AppImage -l | grep W25Q

./minipro-x86_64.AppImage -l | grep name_of_chip

All Thanks to David Griffith for making this software possible
https://gitlab.com/DavidGriffith/minipro/

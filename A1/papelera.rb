#!/usr/bin/ruby
# encoding: utf-8

#Creamos los  parametros que necesitaremos
PARAM1=ARGV[0] || ""
PARAM2=ARGV[1] || ""
PARAM3=ARGV[2] || ""

var1 = `ls -a $HOME | grep .papelera`
var2 = var1.chomp


case PARAM1
when "--help"
        puts "Recuperar el archivo -r (nombrearchivo) [rutadonderecuperarlo]"
        puts "Muestra el informe del contenido --info"
        puts "Elimina el contenido --clean"
        puts "Menu de la papelera -i"
        puts "Nombre del fichero que deseamos eliminar file"

when "-r"
        if PARAM2 == "" then
                puts "Debe introducir nombre del archivo a recuperar"
        else
                if PARAM3 == "" then
                        PARAM3 = `pwd`
                        system ("mv $HOME/.papelera/#{PARAM2} #{PARAM3}")
                        puts "Archivo recuperado"
                else
                        system ("mv $HOME/.papelera/#{PARAM2} #{PARAM3}")
                        puts "Archivo recuperado"
                end
        end

when "--info"
        if var2 == "" then
                puts "No existe papelera en su home"
        else
                numArchivos =`ls -A $HOME/.papelera  | wc -l`
                puts "Numero de archivos: " + numArchivos
                numcarpetas =  `ls -d $HOME/.papelera  | wc -l`
                puts "Numero de carpetas: " + numcarpetas
        end

when "--clean"
        if var2 == ".papelera" then
                puts "¿Esta seguro de querer borrar de forma permanente la papelera? [Si|No]"
                respuesta = $stdin.gets.chomp
                if respuesta == "si" then
                        system ('rm -r $HOME/.papelera/*')
                        puts "Archivos eliminados"
                end
        end

when "-i"
        puts "Muestra el menu que permite vaciar la papelera"
        puts "Para ver el Informe teclear '--info'"
        puts "Para vaciar la papelera teclear '--clean'"
        s=$stdin.gets.chomp
        if (s=="--info")
                if var2 == "" then
                        puts "No existe papelera en su home"
                else
                        numArchivos =`ls -A $HOME/.papelera  | wc -l`
                        puts "Numero de archivos: " + numArchivos
                        numcarpetas =  `ls -d $HOME/.papelera  | wc -l`
                        puts "Numero de carpetas: " + numcarpetas
                end
        end
        if (s=="--clean")
                if var2 == ".papelera" then
                        puts "¿Esta seguro de querer borrar de forma permanente la papelera? [Si|No]"
                        respuesta = $stdin.gets.chomp
                        if respuesta == "si" then
                                system ('rm -r $HOME/.papelera/*')
                                puts "Archivos eliminados"
                        end
                end
        end
        
when "file"
        system ("ls $HOME/.papelera")
else
        puts "Introduzca algun parametro utilize '--help' para mas ayuda"
end

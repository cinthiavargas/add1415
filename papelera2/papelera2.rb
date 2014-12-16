#!/usr/bin/ruby
# encoding: utf-8

#Creamos los  parametros que necesitaremos
PARAM1=ARGV[0] || ""
PARAM2=ARGV[1] || ""
PARAM3=ARGV[2] || ""


case PARAM1
when "--help"
		
		puts "1. Muestra el total de archivos --info"
		puts ""		
		puts "2. Menu de la papelera -i"
		puts ""
		puts "3. Enviar un archivo a la papelera: ./papelera.rb nombreFichero"
		puts ""
        puts "4. Recuperar el archivo -r (nombrearchivo) [rutadonderecuperarlo]"
        puts ""
        puts "5. Elimina todos los arvhivos que se encuentran en la papelera  --clean"
      
 #-----------------------------------------------------------------------------------------  


when "--info"

              numArchivos =`ls  /home/ubuntu1/Escritorio/.papelera  | wc -l `
                puts "Numero de archivos: " + numArchivos
                
       	


when "-r"
		
			`mv /home/ubuntu1/Escritorio/.papelera/#{PARAM2} #{PARAM3}`
			puts "Archivo recuperado"
		
		
	
when "--clean"
	
                puts "¿Esta seguro de querer borrar de forma permanente la papelera? [s|n]"
                respuesta = $stdin.gets.chomp
                if respuesta == "s" then
                        system ('rm -r /home/ubuntu1/Escritorio/.papelera/*')
                        puts "Archivos eliminados"
                end
        	


when "-i"

		puts "MENÚ DE PAPELERA"
		puts ""
		puts "1. Teclee `i` para que nos muestre el contenido de la papelera"
		puts "2. Teclee `v` para vaciar completamente la papelera"
		respuesta = $stdin.gets.chomp
		if (respuesta == "i")
			system ("tree /home/ubuntu1/Escritorio/.papelera")
			puts "Contenido de la papelera"
			
			elsif (respuesta == "v")
				system  ('rm -r /home/ubuntu1/Escritorio/.papelera/*')
				puts "Papelera vacia"
			
		
		end
	
	


			
when ""
	puts " Utilice --help , como guía para usar el script "


 else 
          `mv #{PARAM1} /home/ubuntu1/Escritorio/.papelera/`
               puts "Archivo enviado a la papelera"    

end

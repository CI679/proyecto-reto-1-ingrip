#!/bin/bash

# Verificar el parámetro
if [ "$1" = "-a" ]; then  #Verifica que el parametro si sea -a
    METHODOLOGY="agil"    #Asigna a la variable la clave "Agil"
elif [ "$1" = "-t" ]; then #Verifica que el parametro si sea -t
    METHODOLOGY="tradicional"   #Asigna a la variable la clave "Tradicional"
elif [ -z "$1" ]; then #Es la verificacion por si dejan un espacio vacio"
    echo "Error: Debe proporcionar un parámetro: '-a' para metodologías ágiles o '-t' para metodologías tradicionales"
    exit 1
else
    echo "Error: Parámetro inválido. Use '-a' para metodologías ágiles o '-t' para metodologías tradicionales"
    exit 1
fi

# Colores para la interfaz
GREEN='\033[0;32m'   #Verde para mensajes exitosos"
BLUE='\033[0;34m'    #Azul para informacion
RED='\033[0;31m'     #Rojo para los erroes
YELLOW='\033[1;33m'  #Amarillo Para los titulos
NC='\033[0m'         #Resetea al color predeterminado

# limpiar la pantalla
clear_screen() {
    clear
}

# mostrar errores
show_error() {
    echo -e "${RED}Error: $1${NC}"
    sleep 2
}

# mensajes de existosos
show_success() {
    echo -e "${GREEN}$1${NC}"
    sleep 2
}

# mostrar informacion cuando se lea en la funcion deleer archivo
show_info() {
    echo -e "${BLUE}$1${NC}"
}

#  mostrar títulos
show_title() {
    echo -e "${YELLOW}$1${NC}"
    echo "------------------------------------------------------"
}

# git commit -m "se añadieron todos los menús,y lo relacionado para su funcionamiento, funcion para validar archivos, agregar info, buscar info, y se dejó lista para completar la funcion 'borrar' y 'leer' el archivo. Y se añadió tambien la funcion main. no faltan mas funciones por definir"



#MENU METODOLOGIAS AGILES
show_agile_menu() {
    while true; do
        clear_screen #Llama la funcion para que haga un clear
        show_title "Metodologías Ágiles"   #POne en amarillo el titulo, para eso son las funciones de los colores
        echo "Metodologías Ágiles, seleccione un tema:"
        echo   #no se pone nada en el echo para que se hagan saltos de linea
        echo "1. SCRUM"
        echo "2. XP (Programación Extrema)"
        echo "3. Kanban"
        echo "4. Crystal"
        echo "5. Volver al menú principal"
        echo "6. Salir"
        echo
        read -p "Ingrese su opción: " agile_option
        
        case $agile_option in
            1)
                show_methodology_submenu "SCRUM"
                ;;
            2)
                show_methodology_submenu "XP"
                ;;
            3)
                show_methodology_submenu "Kanban"
                ;;
            4)
                show_methodology_submenu "Crystal"
                ;;
            5)
                return
                ;;
            6)
                exit 0
                ;;
            *)
                show_error "Opción inválida"
                ;;
        esac
    done
}

#MENU METODOLOGIAS TRADICIONALES
show_traditional_menu() {
    while true; do
        clear_screen #Llama la funcion para que haga un clear
        show_title "Metodologías Tradicionales" #POne en amarillo el titulo, para eso son las funciones de los colores
        echo "Metodologías tradicionales, seleccione un tema:"
        echo  
        echo "1. Cascada"
        echo "2. Espiral"
        echo "3. Modelo V"
        echo "4. Volver al menú principal"
        echo "5. Salir"
        echo
        read -p "Ingrese su opción: " traditional_option
        
        case $traditional_option in
            1)
                show_methodology_submenu "Cascada"
                ;;
            2)
                show_methodology_submenu "Espiral"
                ;;
            3)
                show_methodology_submenu "ModeloV"
                ;;
    
            4)    return
                ;;
            5)
                exit 0
                ;;
            *)
                show_error "Opción inválida"
                ;;
        esac
    done
}

#SUBMENU DE SUBCATEGORIAS
show_methodology_submenu() {
    local methodology=$1   #Almacena el nombre de la metodologia pasada como parametro
    local file="$methodology.inf" #crea el nombre del archivo basandose en la metodologia que se haya escogido
    
    # crea un archivo si no existe
    touch "$file"
    
    while true; do
        clear_screen
        show_title "Submenú de $methodology"
        show_info "Está en la sección $methodology, seleccione la opción a utilizar:"
        echo
        echo "1. Agregar información"
        echo "2. Buscar información"
        echo "3. Eliminar información"
        echo "4. Leer base de información"
        echo "5. Volver al menú anterior"
        echo "6. Salir"
        echo
        read -p "Ingrese su opción: " submenu_option
        
        case $submenu_option in
            1)
                add_info "$file"
                ;;
            2)
                search_info "$file"
                ;;
            3)
                delete_info "$file"
                ;;
            4)
                read_database "$file"
                ;;
            5)
                return #regresa al anterior nemu
                ;;
            6)
                exit 0 #Acaba el programa
                ;;
            *)
                show_error "Opción inválida"
                ;;
        esac
    done
}

# funcion de agregar info a un archivo
add_info() {
    local file=$1  #Almacena el nombre del archivo en una variable local
    
    clear_screen
    show_title "Agregar Información"
    echo "Ingrese el concepto (sin espacios al inicio o final):"
    read concept
    #Valida que no se pasen de graciosos poniendo algo vacio
    if [ -z "$concept" ]; then
        show_error "El concepto no puede estar vacío"
        return
    fi
    
    echo "Ingrese la definición:"
    read definition
    
    if [ -z "$definition" ]; then
        show_error "La definición no puede estar vacía"
        return
    fi
    
    echo "[$concept] - $definition" >> "$file"  #Añade la informacion en el formato que pidio el profe [concepto(1)] .- Definición. ylo añade ahsta el final de l archivo
    sort -o "$file" "$file"  # ordena el archivo
    show_success "Información agregada correctamente"
}

# Función para buscar información en un archivo
search_info() {
    local file=$1
    
    clear_screen
    show_title "Buscar Información"
    echo "Ingrese el concepto o patrón a buscar:"
    read pattern
    
    if [ -z "$pattern" ]; then
        show_error "El patrón de búsqueda no puede estar vacío"
        return
    fi
    
    echo "Resultados de la búsqueda:"
    echo "------------------------------------------------------"
    if grep -i "$pattern" "$file"; then   #Busca el patron en el archivo
        echo "------------------------------------------------------"
    else
        echo "No se encontraron resultados para '$pattern'"
    fi
    # Usa grep para buscar el patron ingresado por el usuario dentro del archivo especificado
    # la opción -i permite que la busqueda ignore mayusculas y minsculas
    # si grep encuentra coincidencias, las imprime  en pantalla
    # el 'if' evalua si grep tuvo jaló
    # si hay resultados, se imprime una linea separador a
    # si no hay coincidencias imprime que no se encontraron resultados

}

#funcion para borrar
delete_info() {
  local file=$1
  clear_screen
  show_title "Eliminar Información"
  
  #verificar que no este vacio
  if [ ! -s "$file" ]; then
      show_error "NO hay información en el archivo."
      return
  fi

  #Mostrar el contenido del archivo
  echo "Información del archivo:"
  cat "$file"
  echo "------------------------------------------------------"
  
  #bucle para la linea a eliminar
  while true; do
    #el usuario pone que linea quiere eliminar
    echo "Ingrese la línea que desea eliminar (número de línea):"
    echo "Ingrese 0 para salir"
    read line
    total_lines=$(wc -l < "$file")

    #se checa que no sea un decimal o un string
    if ! [[ "$line" =~ ^[0-9]+$ ]]; then
      show_error "Debe ingresar un número entero válido."
      continue
    fi

    #en caso de que ingrese 0 se sale del bucle(por si puso la opcion equivocada)
    if [ "$line" -eq 0 ]; then
      show_info "Saliendo sin eliminar ninguna línea..."
      break  #Salir del bucle sin eliminar
    fi

    #verificar si el número de línea es válido
    if [ "$line" -lt 1 ] || [ "$line" -gt "$total_lines" ]; then
      show_error "Debe ingresar un número válido dentro del rango de líneas. Total líneas: $total_lines"
      continue
    fi

    # Eliminar la línea seleccionada
    sed -i "${line}d" "$file"
    show_success "Línea eliminada correctamente"
    break  # Salir del bucle
  done
}

#funcion para leer la "base de datos" de la info, que es el archivo de texto (nomas es poner un cat y una validacion si no está vacio el archivo)
read_database() {
    local file=$1
    clear_screen
    show_title "Base de Información de $file" #Se muestra el nombre del archivo
    
    #Aqui se hace la validación para ver que el archivo no este vacio o que no exista
    if [ ! -s "$file" ]; then
        #en caso de que el archivo este vacio o no exista se muestra el siguiente mensaje
        show_error "El archivo $file está vacío o no existe."
    else
        #Si el archivo existe y tiene contenido entonces se puede leer
        echo "------------------------------------------------------"
        show_info "Contenido de $file:"
        cat "$file" | while read -r line; do
            echo "  $line" #Espacios para que den mejor estetica
        done
        echo "------------------------------------------------------"
    fi
    
}







#FUNCION MAIN
main() {
    case $METHODOLOGY in
        agil)
            show_agile_menu
            ;;
        tradicional)
            show_traditional_menu
            ;;
    esac
}

# Iniciar la aplicación
main 

# git commit -m "se añadieron todos los menús,y lo relacionado para su funcionamiento, funciona para validar archivos, agregar info, buscar info, y se dejó lista para completar la funcion 'borrar' y 'leer' el archivo. Y se añadió tambien la funcion main.


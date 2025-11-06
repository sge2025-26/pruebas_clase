
#!/bin/bash

# Ruta al fichero con los datos
input_file="alumnos.txt"

# Leer cada línea del fichero
while IFS="," read -r nombre github_url; do
  # Eliminar espacios en blanco
  nombre=$(echo "$nombre" | xargs)
  github_url=$(echo "$github_url" | xargs)

  # Crear carpeta si no existe
  if [ ! -d "$nombre" ]; then
    # mkdir "$nombre"
    echo "Creando carpeta para $nombre"
    git clone $github_url $nombre
  else
    echo "La carpeta de $nombre ya existe. Haciendo git pull..."
    cd $nombre && git pull && cd - > /dev/null
  fi

done < "$input_file"

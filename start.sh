#!/bin/bash

# Verificar si el archivo .env existe
if [ ! -f .env ]; then
    echo "Error: El archivo .env no existe"
    echo "Por favor, crea un archivo .env con las variables necesarias"
    exit 1
fi

# Verificar si docker-compose está instalado
if ! command -v docker-compose &> /dev/null; then
    echo "Error: docker-compose no está instalado"
    echo "Por favor, instala docker-compose primero"
    exit 1
fi

# Verificar si Docker está en ejecución
if ! docker info > /dev/null 2>&1; then
    echo "Error: Docker no está en ejecución"
    echo "Por favor, inicia Docker primero"
    exit 1
fi

# Función para limpiar al salir
cleanup() {
    echo "Deteniendo los contenedores..."
    docker-compose down
    exit 0
}

# Registrar la función de limpieza para que se ejecute al salir
trap cleanup SIGINT SIGTERM

# Iniciar los contenedores
echo "Iniciando los servicios..."
docker-compose --env-file .env up -d

# Verificar si los contenedores se iniciaron correctamente
if [ $? -eq 0 ]; then
    echo "Servicios iniciados correctamente"
    echo "N8N está disponible en: https://${N8N_HOST}"
    echo "Adminer está disponible en: http://localhost:8080"
    echo "Nginx Proxy Manager está disponible en: http://localhost:81"
else
    echo "Error al iniciar los servicios"
    exit 1
fi 
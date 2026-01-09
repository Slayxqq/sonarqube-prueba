#!/bin/bash

# Script para levantar SonarQube en Docker
# Requiere: Docker y Docker Compose instalados

echo "======================================"
echo "Levantando SonarQube con Docker"
echo "======================================"
echo ""

# Verificar si Docker está instalado
if ! command -v docker &> /dev/null; then
    echo "[!] Docker no está instalado"
    exit 1
fi

# Verificar si Docker Compose está instalado
if ! command -v docker-compose &> /dev/null; then
    echo "[!] Docker Compose no está instalado"
    exit 1
fi

echo "[*] Iniciando contenedores..."
docker-compose up -d

echo ""
echo "[+] SonarQube se está iniciando..."
echo "[*] Esperando a que SonarQube esté listo (esto puede tomar 1-2 minutos)..."
sleep 5

# Esperar a que SonarQube esté listo
for i in {1..30}; do
    if curl -s http://localhost:9000 > /dev/null; then
        echo "[+] SonarQube está listo"
        break
    fi
    echo "[*] Intento $i/30..."
    sleep 2
done

echo ""
echo "======================================"
echo "SonarQube disponible en: http://localhost:9000"
echo "Credenciales por defecto:"
echo "  Usuario: admin"
echo "  Contraseña: admin"
echo "======================================"

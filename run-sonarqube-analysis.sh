#!/bin/bash

# Script para ejecutar análisis SonarQube local
# Este script configura y ejecuta un análisis SAST con SonarQube

echo "======================================"
echo "Análisis SonarQube - Herramienta SAST"
echo "======================================"
echo ""

# Variables
SONAR_HOST="${SONAR_HOST:-http://localhost:9000}"
SONAR_LOGIN="${SONAR_LOGIN:-admin}"
SONAR_PASSWORD="${SONAR_PASSWORD:-admin}"
PROJECT_KEY="sonarqube-prueba"

echo "[*] SonarQube Host: $SONAR_HOST"
echo "[*] Proyecto: $PROJECT_KEY"
echo ""

# Verificar si sonar-scanner está instalado
if ! command -v sonar-scanner &> /dev/null; then
    echo "[!] sonar-scanner no encontrado. Instalando..."
    # Descargar e instalar sonar-scanner
    wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.10.0.2635-linux.zip
    unzip sonar-scanner-cli-4.10.0.2635-linux.zip
    export PATH=$PATH:$(pwd)/sonar-scanner-4.10.0.2635-linux/bin
fi

# Ejecutar análisis
echo "[*] Iniciando análisis..."
sonar-scanner \
  -Dsonar.projectKey=$PROJECT_KEY \
  -Dsonar.sources=vulnerable-code,src \
  -Dsonar.host.url=$SONAR_HOST \
  -Dsonar.login=$SONAR_LOGIN \
  -Dsonar.password=$SONAR_PASSWORD

echo ""
echo "[+] Análisis completado"
echo "[*] Resultados disponibles en: $SONAR_HOST/projects"

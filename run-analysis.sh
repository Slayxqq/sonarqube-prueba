#!/bin/bash

# Script para analizar código con múltiples herramientas
# Incluye: SonarQube, SpotBugs (Java), Bandit (Python)

echo "======================================"
echo "Análisis Integral de Seguridad"
echo "======================================"
echo ""

# ANÁLISIS CON SPOTBUGS (JAVA)
echo "[*] Analizando código Java con SpotBugs..."
if command -v spotbugs &> /dev/null; then
    spotbugs -textui -medium vulnerable-code/VulnerableJava.java
else
    echo "[!] SpotBugs no instalado"
fi

echo ""

# ANÁLISIS CON BANDIT (PYTHON)
echo "[*] Analizando código Python con Bandit..."
if command -v bandit &> /dev/null; then
    bandit -r vulnerable-code/VulnerablePython.py
else
    echo "[!] Bandit no instalado"
fi

echo ""

# ANÁLISIS CON SONARQUBE
echo "[*] Analizando con SonarQube..."
echo "Para ejecutar SonarQube, use: ./run-sonarqube-analysis.sh"

echo ""
echo "======================================"
echo "Análisis completado"
echo "======================================"

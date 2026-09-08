#!/bin/bash

# Script de instalación automatizada de GNU Smalltalk para Codespaces
# Uso: bash install-smalltalk.sh

echo "🚀 Instalando GNU Smalltalk en Codespaces..."
echo "=================================================="

# Detectar el SO
OS_TYPE=$(uname -s)
echo "Sistema detectado: $OS_TYPE"

# Instalar dependencias
echo -e "\n📦 Instalando dependencias..."
if [[ "$OS_TYPE" == "Linux" ]]; then
    sudo apt-get update -qq
    sudo apt-get install -y build-essential libgmp-dev libltdl-dev wget > /dev/null 2>&1
    echo "✅ Dependencias instaladas"
elif [[ "$OS_TYPE" == "Darwin" ]]; then
    echo "macOS detectado. Usa: brew install gnu-smalltalk"
    exit 0
fi

# Descargar GNU Smalltalk
echo -e "\n⬇️  Descargando GNU Smalltalk 3.2.5..."
cd /tmp
if [ ! -f "smalltalk-3.2.5.tar.gz" ]; then
    wget -q https://ftpmirror.gnu.org/gnu/smalltalk/smalltalk-3.2.5.tar.gz
    if [ $? -ne 0 ]; then
        echo "❌ Error descargando. Intenta manualmente:"
        echo "   cd /tmp"
        echo "   wget https://ftpmirror.gnu.org/gnu/smalltalk/smalltalk-3.2.5.tar.gz"
        exit 1
    fi
    echo "✅ Descarga completada"
else
    echo "✅ Archivo ya existe"
fi

# Extraer
echo -e "\n📁 Extrayendo archivos..."
tar xzf smalltalk-3.2.5.tar.gz
cd smalltalk-3.2.5

# Configurar
echo -e "\n⚙️  Configurando..."
./configure --prefix=/usr/local > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "❌ Error en configure. Verifica las dependencias."
    exit 1
fi
echo "✅ Configuración completada"

# Compilar
echo -e "\n🔨 Compilando (esto tarda ~3-5 minutos, espera...)..."
make -j4 > /tmp/smalltalk-make.log 2>&1
if [ $? -ne 0 ]; then
    echo "❌ Error compilando. Ver log:"
    tail -20 /tmp/smalltalk-make.log
    exit 1
fi
echo "✅ Compilación completada"

# Instalar
echo -e "\n💾 Instalando..."
sudo make install > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "❌ Error instalando"
    exit 1
fi
echo "✅ Instalación completada"

# Verificar
echo -e "\n✔️  Verificando instalación..."
GST_VERSION=$(gst --version 2>&1 | head -1)
if [ -n "$GST_VERSION" ]; then
    echo "✅ GNU Smalltalk instalado correctamente"
    echo "   Versión: $GST_VERSION"
else
    echo "⚠️  No se pudo verificar la versión"
fi

# Instrucciones finales
echo -e "\n=================================================="
echo "🎉 ¡Instalación completada!"
echo -e "\n📝 Próximos pasos:"
echo "   1. Ejecutar ejemplo básico:"
echo "      gst /workspaces/Lenguages-de-programacion-Y-Paradigmas-de-programacion/Smalltalk/ejemplos_basicos.st"
echo ""
echo "   2. Ejecutar ejemplo OOP:"
echo "      gst /workspaces/Lenguages-de-programacion-Y-Paradigmas-de-programacion/Smalltalk/ejemplos_oop.st"
echo ""
echo "   3. Modo interactivo:"
echo "      gst"
echo "      # Luego escribe: 'Hola Mundo' displayNl. !"
echo "      # Escribe: quit"
echo -e "\n=================================================="

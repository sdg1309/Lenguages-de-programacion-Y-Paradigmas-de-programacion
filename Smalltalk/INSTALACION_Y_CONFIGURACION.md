# Instalación y Configuración de Smalltalk

## Resumen de Opciones

| Opción | SO | Tipo | Ventajas |
|--------|----|----|----------|
| **Pharo** | Win/Mac/Linux | GUI | Moderno, intuitivo, mejor soporte |
| **GNU Smalltalk** | Mac/Linux | CLI | Ligero, funciona sin GUI |
| **TinyImageII** | Todos (Online) | Web | Sin instalar, funciona en navegador |
| **Squeak** | Todos | GUI | Clásico, educativo |

---

## 🚀 Opción 1: TinyImageII (Recomendado para principiantes)

**Ventajas:**
- ✅ No requiere instalación
- ✅ Funciona en cualquier navegador
- ✅ Perfecto para aprender
- ✅ Sandbox seguro

**Cómo usar:**
1. Ve a [http://tinyimage.org](http://tinyimage.org)
2. Abre la consola
3. Copia y pega el código de los ejemplos

**Ejemplo:**
```smalltalk
'Hola Mundo' displayNl.
1 to: 5 do: [ :i | i displayNl ].
```

---

## 🔧 Opción 2: Pharo (Recomendado para desarrollo)

### Instalación en Windows/macOS
1. Descarga desde [pharo.org](https://pharo.org/)
2. Extrae el archivo
3. Ejecuta `pharo-ui` o `pharo.exe`

### Instalación en Linux

```bash
# Crear carpeta
mkdir -p ~/pharo-dev
cd ~/pharo-dev

# Descargar la última versión
curl -L https://files.pharo.org/get-pharo/latest.zip -o pharo.zip
unzip pharo.zip

# Ejecutar
./pharo-ui Pharo.image
```

### Usar archivos .st en Pharo

```bash
# Ejecutar un script Smalltalk
./pharo Pharo.image "ejemplos_basicos.st"

# O en interactivo
./pharo-ui Pharo.image
# Luego: File > Open > selecciona .st
```

---

## 💻 Opción 3: GNU Smalltalk (CLI, para scripts)

### macOS
```bash
brew install gnu-smalltalk
```

### Ubuntu/Debian

Si `apt-get install gnu-smalltalk` no funciona, compila desde fuente:

```bash
# Instalar dependencias
sudo apt-get update
sudo apt-get install -y build-essential libgmp-dev libltdl-dev

# Descargar
cd /tmp
wget https://ftpmirror.gnu.org/gnu/smalltalk/smalltalk-3.2.5.tar.gz

# Compilar
tar xzf smalltalk-3.2.5.tar.gz
cd smalltalk-3.2.5
./configure
make
sudo make install
```

### Usar GNU Smalltalk

```bash
# Ejecutar un archivo .st
gst ejemplos_basicos.st

# Modo interactivo
gst

# Dentro de gst, escribe:
'Hola Mundo' displayNl. !
quit
```

---

## 🐳 Opción 4: Docker (Mejor para dev containers)

Si estás en un dev container sin GUI, usa Docker:

```bash
# Crear archivo Dockerfile
cat > Dockerfile << 'EOF'
FROM ubuntu:22.04
RUN apt-get update && apt-get install -y gnu-smalltalk
WORKDIR /app
COPY . .
CMD ["gst"]
EOF

# Construir
docker build -t smalltalk-env .

# Ejecutar
docker run -it -v $(pwd):/app smalltalk-env gst ejemplos_basicos.st
```

---

## ✏️ Editores recomendados

### VSCode + Extensión Smalltalk

1. Instala la extensión `Smalltalk` (leocamello)
2. Abre un archivo `.st`
3. Disfruta del resaltado de sintaxis

### Pharo IDE (Mejor opción)

- IDE completo integrado
- Navegador de código
- Inspectors y debuggers
- Sistema de versionado

### Vim + Syntax Highlighting

```bash
# Instalar plugin para vim
git clone https://github.com/vim-scripts/smalltalk.vim ~/.vim/bundle/smalltalk.vim
```

---

## 🧪 Prueba tu instalación

### Con Pharo

```bash
pharo Pharo.image
# En la ventana que abre, ve a: Tools > Playground
# Escribe: 'Funciona!' displayNl.
# Presiona Ctrl+P para ejecutar
```

### Con GNU Smalltalk

```bash
gst << 'EOF'
'Funciona!' displayNl.
quit
EOF
```

### Con TinyImageII

1. Ve a http://tinyimage.org
2. En la consola, escribe:
```smalltalk
'Funciona!' displayNl.
```
3. Presiona Ctrl+D (cmd+D en Mac)

---

## 📝 Estructura de archivos

```
Smalltalk/
├── Smalltalk.md (esta guía)
├── INSTALACION_Y_CONFIGURACION.md (este archivo)
├── ejemplos_basicos.st (15 ejemplos fundamentales)
└── ejemplos_oop.st (ejemplos de OOP)
```

---

## 🔗 Recursos útiles

- **Pharo oficial:** https://pharo.org
- **Pharo by Example:** http://pharo.gforge.inria.fr/PBE1/
- **GNU Smalltalk Docs:** http://smalltalk.gnu.org/
- **TinyImageII:** http://tinyimage.org
- **Stack Overflow:** [Tag: smalltalk](https://stackoverflow.com/questions/tagged/smalltalk)
- **Reddit:** r/smalltalk

---

## ❓ Solución de problemas

### "No se encontró el paquete gnu-smalltalk"
→ Usa Pharo o TinyImageII en su lugar

### "Error: could not find any display driver"
→ Estás en un entorno sin GUI. Usa GNU Smalltalk (CLI) o TinyImageII (web)

### "gst: command not found"
→ Compila desde fuente o usa Pharo/TinyImageII

### Los ejemplos .st no funcionan
→ Abre en TinyImageII o usa: `gst ejemplos_basicos.st`

---

**¡Elige la opción que mejor se adapte a tu entorno y comienza a programar en Smalltalk!** 🎉

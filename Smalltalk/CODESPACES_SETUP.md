# Smalltalk en GitHub Codespaces

## 🌐 Opción 1: TinyImageII Online (Recomendado para Codespaces)

**Mejor opción para Codespaces** - No requiere instalar nada.

### Pasos:
1. En tu Codespace, abre el **Terminal** integrado
2. Abre el navegador Firefox/Chrome integrado (o accede desde tu navegador)
3. Ve a: **[http://tinyimage.org](http://tinyimage.org)**
4. Copia-pega el código Smalltalk en la consola
5. Ejecuta con `Ctrl+D` (o `Cmd+D` en Mac)

### Ejemplo en TinyImageII:
```smalltalk
" Comentario "
'Hola desde Codespaces' displayNl.
1 to: 5 do: [ :i | i displayNl ].
```

---

## 💻 Opción 2: GNU Smalltalk CLI (Sin interfaz gráfica)

Funciona perfecto en Codespaces sin GUI.

### Instalación rápida:

```bash
# Opción A: Compilar desde fuente (más confiable)
cd /tmp
sudo apt-get update
sudo apt-get install -y build-essential libgmp-dev libltdl-dev
wget https://ftpmirror.gnu.org/gnu/smalltalk/smalltalk-3.2.5.tar.gz
tar xzf smalltalk-3.2.5.tar.gz
cd smalltalk-3.2.5
./configure
make -j4
sudo make install

# Verificar instalación
gst --version
```

### Usar Smalltalk en Codespaces:

```bash
# Opción 1: Ejecutar un archivo .st
gst ejemplos_basicos.st

# Opción 2: Modo interactivo
gst
# Luego escribe tu código:
# 'Hola' displayNl. !
# quit
```

---

## 🐳 Opción 3: Usar Docker en Codespaces

Para más control, crea un contenedor Docker:

### 1. Crear `devcontainer.json`

Copia esto a `.devcontainer/devcontainer.json`:

```json
{
  "name": "Smalltalk Dev",
  "image": "ubuntu:22.04",
  "features": {},
  "postCreateCommand": "apt-get update && apt-get install -y build-essential libgmp-dev libltdl-dev wget && cd /tmp && wget https://ftpmirror.gnu.org/gnu/smalltalk/smalltalk-3.2.5.tar.gz && tar xzf smalltalk-3.2.5.tar.gz && cd smalltalk-3.2.5 && ./configure && make -j4 && sudo make install",
  "customizations": {
    "vscode": {
      "extensions": [
        "leocamello.vscode-smalltalk"
      ]
    }
  }
}
```

### 2. Reconstruir Codespace

- Click en `Codespaces` en la esquina inferior izquierda
- Selecciona `Rebuild Container`

### 3. Usar GNU Smalltalk

```bash
gst ejemplos_basicos.st
```

---

## 📊 Comparación de opciones en Codespaces

| Opción | Instalación | GUI | Velocidad | Recomendación |
|--------|------------|-----|-----------|---------------|
| **TinyImageII** | ❌ No | ✅ Sí (web) | ⚡ Instantánea | ⭐⭐⭐ Ideal para aprender |
| **GNU Smalltalk** | ✅ Sí (~5 min) | ❌ No | ⚡ Rápido | ⭐⭐ Para scripts |
| **Docker + GST** | ✅ Sí (~10 min) | ❌ No | ⚡ Rápido | ⭐ Para proyectos grandes |

---

## ⚡ Inicio rápido en Codespaces

### Paso 1: Abrir Codespace
```bash
# Ya estás adentro si ves: @github-username ➜ /workspaces/...
```

### Paso 2: Elegir método

**Método A - Más fácil (TinyImageII):**
1. Abre navegador: http://tinyimage.org
2. Copia-pega este código:
```smalltalk
" Prueba en Codespaces "
'🎉 Smalltalk funciona en Codespaces!' displayNl.
numeros := #(1 2 3 4 5).
numeros do: [ :n | (n * 2) displayNl ].
```
3. Presiona `Ctrl+D`

**Método B - Instalando GNU Smalltalk:**
```bash
# Esto tarda unos 5 minutos
cd /tmp
sudo apt-get update && sudo apt-get install -y build-essential libgmp-dev libltdl-dev
wget https://ftpmirror.gnu.org/gnu/smalltalk/smalltalk-3.2.5.tar.gz
tar xzf smalltalk-3.2.5.tar.gz
cd smalltalk-3.2.5
./configure && make -j4 && sudo make install

# Después, ejecuta los ejemplos
cd /workspaces/Lenguages-de-programacion-Y-Paradigmas-de-programacion/Smalltalk
gst ejemplos_basicos.st
```

---

## 🔧 Usar la extensión VSCode en Codespaces

1. Abre VSCode en tu navegador (ya está instalada)
2. Abre un archivo `.st` desde la carpeta `Smalltalk/`
3. Tendrás resaltado de sintaxis automáticamente
4. Para ejecutar: abre terminal y escribe `gst nombrearchivo.st`

---

## 📚 Archivos disponibles en Codespaces

En `Smalltalk/` tienes:
- `ejemplos_basicos.st` - 15 ejemplos básicos
- `ejemplos_oop.st` - OOP y clases
- `Smalltalk.md` - Conceptos teóricos
- `INSTALACION_Y_CONFIGURACION.md` - Todas las opciones

---

## 🚀 Mi recomendación para Codespaces:

**Para aprender:** TinyImageII (http://tinyimage.org)
- ✅ Sin instalación
- ✅ Interfaz visual
- ✅ Funciona ya

**Para practicar:** GNU Smalltalk CLI (ver Método B)
- ✅ Instalación fácil
- ✅ Ejecuta tus propios archivos .st
- ✅ Perfecto para el workspace

---

## 💡 Tips para Codespaces

### Port Forwarding (si necesitas servir web)
```bash
# Codespaces automáticamente expone puertos
# Si ejecutas un servidor en puerto 3000:
python3 -m http.server 3000

# Accede en: https://tu-codespace-url:3000
```

### Guardar cambios
```bash
# Los cambios se guardan automáticamente
# Pero puedes hacer commit:
git add .
git commit -m "Ejemplos de Smalltalk"
git push
```

### Terminal dividida
- `Ctrl+Shift+5` abre nueva terminal
- Útil para tener editor + ejecución

---

**¡Listo! Elige TinyImageII para empezar YA o instala GNU Smalltalk si prefieres trabajar localmente.** 🎯

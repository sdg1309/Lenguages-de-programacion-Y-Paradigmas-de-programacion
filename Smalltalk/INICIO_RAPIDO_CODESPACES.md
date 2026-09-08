# ⚡ Smalltalk en Codespaces - Guía Paso a Paso

Sigue esta guía si estás en GitHub Codespaces ahora mismo.

---

## 🎯 Opción 1: Empezar INMEDIATAMENTE (SIN instalar nada)

### ✅ Paso 1: Abre TinyImageII

```
1. En tu navegador, ve a: http://tinyimage.org
2. Deberías ver una ventana con código Smalltalk
3. ¡Listo! Ya tienes Smalltalk funcionando
```

### ✅ Paso 2: Prueba tu primer código

En TinyImageII, copia esto en el editor:

```smalltalk
'🎉 Hola desde Codespaces!' displayNl.
```

Presiona: **Ctrl+D** (o **Cmd+D** en Mac)

**Resultado:**
```
🎉 Hola desde Codespaces!
```

### ✅ Paso 3: Intenta más ejemplos

Copia esto en TinyImageII:

```smalltalk
" Crear un array "
numeros := #(1 2 3 4 5).

" Multiplicar cada número por 2 "
resultado := numeros collect: [ :n | n * 2 ].

" Mostrar resultado "
resultado displayNl.
```

Presiona: **Ctrl+D**

**Resultado:**
```
#(2 4 6 8 10)
```

### ✅ Paso 4: Aprender más

- Ve a [REFERENCIA_RAPIDA.md](REFERENCIA_RAPIDA.md) para ver más sintaxis
- Lee [Smalltalk.md](Smalltalk.md) para conceptos
- Abre [ejemplos_basicos.st](ejemplos_basicos.st) para inspiración

---

## 🔧 Opción 2: Instalar GNU Smalltalk en Codespaces (5 minutos)

### ✅ Paso 1: Abre la terminal integrada

En VSCode (dentro de Codespaces):
- **Ctrl+`** (backtick, abre terminal)

O:
- Menú → Terminal → New Terminal

### ✅ Paso 2: Ejecuta el script de instalación

Copia esto en la terminal:

```bash
cd /workspaces/Lenguages-de-programacion-Y-Paradigmas-de-programacion/Smalltalk
bash install-smalltalk.sh
```

**Esto tardará 3-5 minutos**. Verás algo como:

```
🚀 Instalando GNU Smalltalk en Codespaces...
==================================================
Sistema detectado: Linux
📦 Instalando dependencias...
✅ Dependencias instaladas
⬇️  Descargando GNU Smalltalk 3.2.5...
✅ Descarga completada
📁 Extrayendo archivos...
⚙️  Configurando...
✅ Configuración completada
🔨 Compilando (esto tarda ~3-5 minutos, espera...)...
✅ Compilación completada
💾 Instalando...
✅ Instalación completada
✔️  Verificando instalación...
✅ GNU Smalltalk instalado correctamente
   Versión: ...

🎉 ¡Instalación completada!
```

### ✅ Paso 3: Ejecuta un ejemplo

En la terminal, escribe:

```bash
gst /workspaces/Lenguages-de-programacion-Y-Paradigmas-de-programacion/Smalltalk/ejemplos_basicos.st
```

**Verás la salida:**
```
Hola Mundo
42
Juan
...
```

### ✅ Paso 4: Modo interactivo

En la terminal:

```bash
gst
```

Esto abre Smalltalk interactivo. Puedes escribir:

```smalltalk
'Prueba interactiva' displayNl.
1 to: 3 do: [ :i | i displayNl ].
quit
```

Presiona **Enter** después de cada línea.

Para salir, escribe: `quit`

---

## 📂 Gestiona tus archivos

### Crear un nuevo archivo .st

```bash
# En terminal, dentro de la carpeta Smalltalk
nano mi_programa.st
```

Escribe tu código y presiona **Ctrl+O** para guardar, **Ctrl+X** para salir.

Ejecuta:
```bash
gst mi_programa.st
```

### Editar en VSCode

1. En el Explorador (izquierda), navega a `Smalltalk/`
2. Haz click en un archivo `.st`
3. Edítalo en el editor
4. En terminal, ejecuta: `gst nombrearchivo.st`

---

## 🎓 Rutas de aprendizaje

### Ruta A: Principiante (30 minutos)

```
1. Lee primero 5 minutos: README_ES.md
2. Abre TinyImageII: http://tinyimage.org
3. Copia ejemplos de: ejemplos_basicos.st (líneas 1-30)
4. Experimenta en TinyImageII
5. Ve a REFERENCIA_RAPIDA.md para más sintaxis
```

### Ruta B: Intermedio (1 hora)

```
1. Instala GNU Smalltalk (bash install-smalltalk.sh)
2. Lee: Smalltalk.md (conceptos básicos)
3. Ejecuta: gst ejemplos_basicos.st
4. Ejecuta: gst ejemplos_oop.st
5. Modifica los ejemplos y experimenta
```

### Ruta C: Avanzado (2-3 horas)

```
1. Instala: GNU Smalltalk
2. Lee todo: Smalltalk.md
3. Crea un archivo: mi_proyecto.st
4. Implementa: una clase personalizada
5. Consulta: REFERENCIA_RAPIDA.md según necesites
```

---

## ✅ Checklist - Verifica tu instalación

### Si usas TinyImageII:
- [ ] Puedo acceder a http://tinyimage.org
- [ ] Puedo escribir código en el editor
- [ ] Puedo ejecutar código (Ctrl+D)
- [ ] Los ejemplos funcionan

### Si instalaste GNU Smalltalk:
- [ ] Ejecuté: `bash install-smalltalk.sh`
- [ ] La instalación terminó sin errores
- [ ] Ejecuté: `gst ejemplos_basicos.st`
- [ ] Obtuve salida en la terminal

---

## 🐛 Solución de problemas

### "No puedo acceder a http://tinyimage.org"
→ Comprueba tu conexión a internet
→ Si estás en Codespaces, debería funcionar siempre

### "Error durante install-smalltalk.sh"
→ Verifica que tienes 2 GB libres: `df -h`
→ Intenta: `sudo apt-get update` primero
→ Si persiste, usa TinyImageII

### "gst: command not found"
→ No completó la instalación correctamente
→ Intenta: `which gst`
→ Si no está, reinstala: `bash install-smalltalk.sh`

### "El código en TinyImageII no funciona"
→ Verifica el formato: `'texto' displayNl. ` (con espacios)
→ Presiona **Ctrl+D**, no Enter

---

## 💾 Guarda tu trabajo

### En Codespaces con Git:

```bash
# Tras modificar archivos
git add Smalltalk/
git commit -m "Mis ejemplos de Smalltalk"
git push
```

### Sin Git:

Los cambios se guardan automáticamente en Codespaces.

---

## 🔗 Recursos rápidos

| Recurso | Enlace |
|---------|--------|
| TinyImageII Online | http://tinyimage.org |
| Guía Completa | [Smalltalk.md](Smalltalk.md) |
| Referencia Rápida | [REFERENCIA_RAPIDA.md](REFERENCIA_RAPIDA.md) |
| Ejemplos Básicos | [ejemplos_basicos.st](ejemplos_basicos.st) |
| Ejemplos OOP | [ejemplos_oop.st](ejemplos_oop.st) |

---

## 🎯 Próximo paso

Elige una opción:

- **Opción 1 (TinyImageII):** Accede a http://tinyimage.org AHORA
- **Opción 2 (GNU Smalltalk):** Ejecuta `bash install-smalltalk.sh` en terminal

---

**¡Empezemos! 🚀**

Si tienes dudas, consulta:
1. [README_ES.md](README_ES.md) - Índice principal
2. [REFERENCIA_RAPIDA.md](REFERENCIA_RAPIDA.md) - Sintaxis
3. [Smalltalk.md](Smalltalk.md) - Conceptos

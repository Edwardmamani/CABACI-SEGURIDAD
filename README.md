# Trabajo Final — Seguridad en Sistemas Informáticos

Proyecto del trabajo final basado en el **framework CABACI**, redactado en LaTeX y organizado por secciones modulares.

## Requisitos previos

Necesitas una distribución de LaTeX con `pdflatex` y `bibtex` instalados.

### Linux

**Arch Linux:**

```bash
sudo pacman -S texlive-most
```

**Ubuntu / Debian:**

```bash
sudo apt install texlive-latex-base texlive-latex-recommended texlive-lang-spanish
```

Comprueba que las herramientas estén disponibles:

```bash
pdflatex --version
bibtex --version
```

### Windows

Instala una de estas distribuciones (recomendado: **MiKTeX** por su instalador gráfico):

| Distribución | Enlace |
|--------------|--------|
| MiKTeX | https://miktex.org/download |
| TeX Live | https://tug.org/texlive/acquire-netinstall.html |

Durante la instalación de MiKTeX, deja activada la opción **“Install missing packages on-the-fly”** para que descargue paquetes automáticamente la primera vez que compiles.

Tras instalar, abre **PowerShell** o **Símbolo del sistema** y verifica:

```powershell
pdflatex --version
bibtex --version
```

Si el comando no se reconoce, cierra y vuelve a abrir la terminal, o reinicia el equipo para que se actualice el `PATH`.

**Alternativas en Windows:**

- **Git Bash** o **WSL**: puedes usar `./compiler.sh` igual que en Linux.
- **TeXstudio** o **TeXworks**: editores con botón de compilación; abre `proyecto-latex/main.tex` y compila con `pdflatex`.

## Estructura del proyecto

```
TRABAJO-FINAL/
├── framework cabaci.pdf          # Documento de referencia del framework
├── README.md
└── proyecto-latex/
    ├── main.tex                  # Punto de entrada: une todas las secciones
    ├── preamble.tex              # Clase del documento y configuración global
    ├── compiler.sh               # Script de compilación (Linux / macOS / Git Bash)
    ├── compiler.bat              # Script de compilación (Windows)
    ├── config/
    │   ├── packages.tex          # Paquetes LaTeX (\usepackage{...})
    │   ├── settings.tex          # Márgenes, espaciado, etc.
    │   └── commands.tex          # Comandos personalizados
    ├── sections/                 # Contenido del documento (una sección por archivo)
    │   ├── 01_caratula.tex
    │   ├── 02_organizacion.tex
    │   ├── ...
    │   └── 14_anexos.tex
    ├── bibliografia/
    │   └── referencias.bib       # Referencias bibliográficas
    └── output/                   # PDF y archivos auxiliares generados
        └── main.pdf              # Documento compilado
```

## Compilar el documento

El PDF resultante siempre queda en:

```
proyecto-latex/output/main.pdf
```

Los scripts (`compiler.sh` / `compiler.bat`) realizan automáticamente:

1. Primera pasada de `pdflatex`
2. `bibtex` (solo si hay citas en el documento)
3. Pasadas adicionales para resolver referencias cruzadas y bibliografía

### Linux / macOS / Git Bash

Desde la raíz del repositorio:

```bash
cd proyecto-latex
./compiler.sh
```

O en un solo paso:

```bash
./proyecto-latex/compiler.sh
```

### Windows (PowerShell o CMD)

Desde la raíz del repositorio:

```powershell
cd proyecto-latex
.\compiler.bat
```

O en un solo paso:

```powershell
.\proyecto-latex\compiler.bat
```

También puedes hacer doble clic en `compiler.bat` dentro de la carpeta `proyecto-latex` (se abrirá una ventana de consola y mostrará el resultado).

## Cómo modificar el contenido

### Editar una sección existente

Cada capítulo del trabajo vive en `proyecto-latex/sections/`. Abre el archivo correspondiente y edita el texto en LaTeX:

| Archivo | Contenido |
|---------|-----------|
| `01_caratula.tex` | Carátula |
| `02_organizacion.tex` | Organización |
| `03_descripcion.tex` | Descripción |
| `04_controles.tex` | Controles |
| `05_defensas.tex` | Defensas |
| `06_pregunta_madurez.tex` | Pregunta de madurez |
| `07_instrumento.tex` | Instrumento |
| `08_diagnostico.tex` | Diagnóstico |
| `09_evidencias.tex` | Evidencias |
| `10_problemas.tex` | Problemas |
| `11_riesgos.tex` | Riesgos |
| `12_propuesta.tex` | Propuesta |
| `13_conclusiones.tex` | Conclusiones |
| `14_anexos.tex` | Anexos |

Ejemplo básico de una sección:

```latex
\section{Título de la sección}

Texto del párrafo. Puedes usar \textbf{negrita}, \textit{cursiva}
y listas:

\begin{itemize}
  \item Primer ítem
  \item Segundo ítem
\end{itemize}
```

Después de guardar los cambios, vuelve a compilar (`./compiler.sh` en Linux o `.\compiler.bat` en Windows) para ver el PDF actualizado.

### Agregar una nueva sección

1. Crea el archivo en `proyecto-latex/sections/`, por ejemplo `15_nueva_seccion.tex`.
2. Añade la línea `\input{sections/15_nueva_seccion}` en `main.tex`, en el orden deseado.

### Bibliografía y citas

1. Agrega entradas en `proyecto-latex/bibliografia/referencias.bib`:

```bibtex
@book{autor2024,
  author    = {Apellido, Nombre},
  title     = {Título del libro},
  publisher = {Editorial},
  year      = {2024}
}
```

2. Cita en el texto con `\cite{autor2024}`.
3. Recompila con el script de tu sistema para que aparezcan las referencias.

### Configuración global

| Archivo | Qué modificar |
|---------|---------------|
| `config/packages.tex` | Paquetes adicionales (tablas, figuras, etc.) |
| `config/settings.tex` | Márgenes, interlineado, idioma |
| `config/commands.tex` | Macros reutilizables (`\newcommand`) |

No es necesario tocar `preamble.tex` salvo que cambies la clase del documento (`article`, `report`, etc.).

### Insertar imágenes

Coloca las imágenes en una carpeta dentro de `proyecto-latex/` (por ejemplo `figures/`) y úsalas así:

```latex
\begin{figure}[H]
  \centering
  \includegraphics[width=0.8\textwidth]{figures/mi-imagen.png}
  \caption{Descripción de la figura}
  \label{fig:mi-imagen}
\end{figure}
```

Referencia cruzada: `ver Figura~\ref{fig:mi-imagen}`.

## Archivos generados al compilar

La carpeta `output/` contiene el PDF y archivos auxiliares (`.aux`, `.log`, `.out`, etc.). Estos archivos se regeneran en cada compilación; no los edites manualmente.

Solo `main.pdf` es el entregable; el resto son artefactos de compilación.

## Solución de problemas

### Linux / macOS

**Error: `pdflatex: command not found`**  
Instala TeX Live (ver sección de requisitos).

**Error: `Permission denied` al ejecutar `compiler.sh`**  
```bash
chmod +x proyecto-latex/compiler.sh
```

### Windows

**Error: `'pdflatex' no se reconoce como comando interno o externo`**  
Instala MiKTeX o TeX Live, reinicia la terminal y comprueba el `PATH`. En MiKTeX, abre *MiKTeX Console* → *Settings* → *Directories* si los binarios no se detectan.

**MiKTeX pide instalar paquetes al compilar**  
Acepta la instalación automática o instálalos desde *MiKTeX Console* → *Packages* (busca `babel-spanish`, `geometry`, `hyperref`, etc.).

**`compiler.bat` se cierra al instante sin mostrar el error**  
Abre PowerShell, navega a `proyecto-latex` y ejecuta `.\compiler.bat` manualmente para ver el mensaje de error completo.

**Rutas con espacios** (por ejemplo `Disco local`)  
Los scripts ya usan rutas relativas; evita mover solo `main.tex` fuera de su carpeta. Si compilas a mano, trabaja siempre desde `proyecto-latex`.

### Todos los sistemas

**Las referencias aparecen como `??` en el PDF**  
Vuelve a compilar con el script. LaTeX suele necesitar varias pasadas para resolver citas y referencias cruzadas.

**Error de codificación con tildes o ñ**  
El proyecto usa `utf8` y `babel` en español. Guarda los archivos `.tex` con codificación UTF-8 (en VS Code/Cursor: barra inferior → *UTF-8*).

**Revisar el detalle de un error de compilación**  
Consulta el log en `proyecto-latex/output/main.log`; busca líneas que empiecen con `!`.

## Flujo de trabajo recomendado

1. Edita la sección correspondiente en `proyecto-latex/sections/`.
2. Compila el documento:
   - **Linux / macOS:** `./proyecto-latex/compiler.sh`
   - **Windows:** `.\proyecto-latex\compiler.bat`
3. Abre `proyecto-latex/output/main.pdf` y revisa el resultado.
4. Repite hasta completar el documento.

Para consultar la estructura y criterios del framework, usa `framework cabaci.pdf` en la raíz del proyecto.

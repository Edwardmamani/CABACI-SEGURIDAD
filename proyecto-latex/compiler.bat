@echo off
setlocal EnableExtensions

cd /d "%~dp0"
if not exist output mkdir output

echo ==^> Compilando main.tex...
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=output main.tex
if errorlevel 1 exit /b 1

if exist output\main.aux (
  findstr /C:"\citation{" output\main.aux >nul 2>&1
  if not errorlevel 1 (
    echo ==^> Procesando bibliografia...
    bibtex output\main
    if errorlevel 1 exit /b 1
    pdflatex -interaction=nonstopmode -halt-on-error -output-directory=output main.tex
    if errorlevel 1 exit /b 1
  )
)

echo ==^> Segunda pasada (referencias cruzadas)...
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=output main.tex
if errorlevel 1 exit /b 1

echo ==^> Listo: %~dp0output\main.pdf

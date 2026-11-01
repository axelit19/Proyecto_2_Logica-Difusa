# Intuitionistic Fuzzy Sets (IFS) in Haskell

Este repositorio contiene una implementación en **Haskell** para el modelado y evaluación de **Conjuntos Difusos Intuicionistas (IFS - Intuitionistic Fuzzy Sets)**, incluyendo operaciones algebraicas, funciones de pertenencia y la verificación experimental de propiedades modales (Teorema 2).

---

##  Características

- **Representación de IFS:** Estructura de datos `IFS a` basada en funciones de membresía ($\mu$) y no membresía ($\nu$).
- **Validación e Indeterminación:** 
  - `evaluateIFS`: Verifica que $\mu(x) \ge 0$, $\nu(x) \ge 0$ y $\mu(x) + \nu(x) \le 1$.
  - `indeterminacion`: Calcula el grado de incertidumbre $\pi(x) = 1 - \mu(x) - \nu(x)$.
- **Operaciones de Conjuntos:** Intersección, Unión, Suma y Producto entre IFS.
- **Operadores Modales:**
  - Necesidad ($\Box A$)
  - Posibilidad ($\Diamond A$)
- **Verificación de Teoremas:** Comprobación automatizada de las identidades del Teorema 2:
  - (d) $\Box(\Box A) = \Box A$
  - (e) $\Box(\Diamond A) = \Diamond A$
  - (f) $\Diamond(\Box A) = \Box A$
  - (g) $\Diamond(\Diamond A) = \Diamond A$
- **Funciones de Membresía:** Soporte para funciones Triangular, Hombro Izquierdo y Hombro Derecho.

---

## 📁 Estructura del Proyecto

```text
.
├── Lid.hs      # Módulo principal con la lógica y estructuras del modelo IFS
└── Main.hs     # Módulo ejecutable con casos de prueba y verificación de teoremas
```

## 🛠️ Requisitos Previos

Para ejecutar o compilar este proyecto necesitas tener instalado el entorno de desarrollo de **Haskell** ( el compilador **GHC**).

### 1. Verificar si ya tienes GHC instalado
Abre tu terminal o línea de comandos y ejecuta:

```bash
ghc --version
```
### Instalacion de Haskell
Mac/linux
```bash
curl --proto '=https' --tlsv1.2 -sSf [https://get-ghcup.haskell.org](https://get-ghcup.haskell.org) | sh
```
Window
```bash
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -or [System.Net.SecurityProtocolType]::Tls12; iex ((New-Object System.Net.WebClient).DownloadString('[https://www.ghcup.haskell.org/install.ps1](https://www.ghcup.haskell.org/install.ps1)'))
```
### Compilación y Ejecucion

```bash
ghc Main.hs -o ejecutable_ifs
```
Mac/linux
```bash
./ejecutable_ifs
```
Window
```bash
.\ejecutable_ifs.exe
```




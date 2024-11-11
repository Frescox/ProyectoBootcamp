# Sistema de Quejas en Motoko

Este proyecto implementa un sistema de gestión de quejas en **Motoko**, el lenguaje de programación para el **Internet Computer**. El sistema permite registrar, mostrar, actualizar y eliminar quejas de manera sencilla. Está diseñado para mostrar cómo interactuar con los **canisters** usando Motoko.

## Requisitos

Para poder ejecutar este proyecto, necesitarás tener los siguientes requisitos:

1. **Instalar Dfinity SDK (dfx)**: Necesitarás el entorno de desarrollo de Dfinity para interactuar con el Internet Computer localmente. Puedes instalarlo siguiendo los pasos de la [documentación oficial](https://sdk.dfinity.org/docs/developers-guide/install-upgrade-remove.html).

2. **Clonar el repositorio**: Necesitarás clonar el repositorio con el código fuente del proyecto.

3. **Ejecutar el proyecto en local y desplegar los canisters**: El proyecto se ejecutará en tu máquina local utilizando el entorno de Dfinity.

## Pasos para ejecutar el código

### 1. Instalar Dfinity SDK (dfx)

Primero, debes instalar Dfinity SDK (dfx). Si no lo tienes instalado, puedes hacerlo ejecutando el siguiente comando:

- **En macOS/Linux**:

sh -ci "$(curl -fsSL https://internetcomputer.org/install.sh)"

### 2. Clonar el repositorio

git clone https://github.com/Frescox/ProyectoBootcamp.git

cd proyectoBootmcap

### 3. Iniciar el entorno de Dfinity
dfx start --background --clean

### 4. Desplegar los canisters
dfx deploy

### 5. Ingresa al link del backend del proyectoBootamp generado



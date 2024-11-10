%% Sistema de Quejas en Motoko

% Este proyecto implementa un sistema de gestión de quejas en **Motoko**, 
% el lenguaje de programación para el **Internet Computer**. El sistema 
% permite registrar, mostrar, actualizar y eliminar quejas de manera sencilla. 
% Está diseñado para mostrar cómo interactuar con los **canisters** 
% usando Motoko.

% Requisitos
% Para poder ejecutar este proyecto, necesitarás tener los siguientes requisitos:

% 1. **Instalar Dfinity SDK (dfx)**: Necesitarás el entorno de desarrollo de Dfinity 
%    para interactuar con el Internet Computer localmente. Puedes instalarlo 
%    siguiendo los pasos de la [documentación oficial](https://sdk.dfinity.org/docs/developers-guide/install-upgrade-remove.html).

% 2. **Clonar el repositorio**: Necesitarás clonar el repositorio con el código fuente del proyecto.

% 3. **Ejecutar el proyecto en local y desplegar los canisters**: 
%    El proyecto se ejecutará en tu máquina local utilizando el entorno de Dfinity.

%% Pasos para ejecutar el código

% 1. Instalar Dfinity SDK (dfx)

% Primero, debes instalar Dfinity SDK (dfx). Si no lo tienes instalado, 
% puedes hacerlo ejecutando el siguiente comando:

% - **En macOS/Linux**:

% sh -ci "$(curl -fsSL https://internetcomputer.org/install.sh)"

% 2. Clonar el repositorio

% Clona el repositorio del proyecto a tu máquina local:

% git clone https://github.com/tu_usuario/sistema_quejas_motoko.git
% cd sistema_quejas_motoko

% 3. Iniciar el entorno de Dfinity

% Para iniciar el entorno de Dfinity y lanzar el nodo local, ejecuta el siguiente comando:

% dfx start --background

% Este comando arranca un nodo local del Internet Computer en segundo plano 
% para poder desplegar y ejecutar los canisters en tu máquina.

% 4. Desplegar los canisters

% Despliega el canister al entorno local de Dfinity:

% dfx deploy

% Este comando ejecuta el despliegue del canister, lo que permite interactuar con 
% el sistema de quejas desde tu entorno local.



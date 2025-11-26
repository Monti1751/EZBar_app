<p align="center">
  <img src="https://raw.githubusercontent.com/Monti1751/EZBar_Frontend/MJS/logo_bueno_fondo.png" alt="Logo EZBar" width="200"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/MariaDB-003545?logo=mariadb&logoColor=white" />
  <img src="https://img.shields.io/badge/Java-ED8B00?logo=java&logoColor=white" />
  <img src="https://img.shields.io/badge/GitHub-181717?logo=github&logoColor=white" />
  <img src="https://img.shields.io/badge/Azure_DevOps-0078D7?logo=azuredevops&logoColor=white" />
  <img src="https://img.shields.io/badge/Versión-Alpha-orange" />
</p>

---
## 📑 Índice

1. [Arquitectura del Proyecto](#arquitectura-del-proyecto)
2. [Instalación y Configuración](#instalación-y-configuración)
3. [Funcionamiento y Uso de la Aplicación](#funcionamiento-y-uso-de-la-aplicación)
4. [Estado del Proyecto](#estado-del-proyecto)
5. [Autores](#autores)

---
## Arquitectura del Proyecto

EZBar es un ERP orientado a la gestión de bares y restaurantes.  
La estructura del proyecto está dividida en dos módulos principales: **Frontend (Flutter)** y **Backend (Java)**, conectados a una base de datos **MariaDB**.

   | Flutter App (Frontend) | <----> (HTTP) |  Backend Java (Lógica del ERP)  | <----> (JDBC) | MariaDB (Base de Datos) |
   
### Estructura General
/EZBar
-│
-├── EZBar_Frontend/ # Aplicación Flutter (UI y lógica del cliente)
-├── EZBar_Backend/ # Backend Java (servicios, endpoints, conexión a DB)
-└── docs/ # Documentación del proyecto

### Descripción de los Módulos

- **Frontend (Flutter)**  
  Se encarga de la interfaz de usuario, navegación y comunicación HTTP con el backend.

- **Backend (Java)**  
  Contiene la lógica del ERP:
  - Gestión de mesas y zonas  
  - Gestión de productos e inventario  
  - Sistema de pedidos  
  - Autenticación de usuarios  
  - Conexión con la base de datos mediante JDBC

- **Base de Datos (MariaDB)**  
  Almacena la información esencial del sistema: usuarios, roles, productos, mesas, zonas, pedidos, etc.

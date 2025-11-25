<p align="center">
  <img src="https://raw.githubusercontent.com/Monti1751/EZBar_Frontend/MJS/logo_bueno_fondo.png" alt="Logo" width="200"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/MariaDB-003545?logo=mariadb&logoColor=white" />
  <img src="https://img.shields.io/badge/Java-ED8B00?logo=java&logoColor=white" />
  <img src="https://img.shields.io/badge/GitHub-181717?logo=github&logoColor=white" />
  <img src="https://img.shields.io/badge/Azure_DevOps-0078D7?logo=azuredevops&logoColor=white" />
  <img src="https://img.shields.io/badge/Version-Alpha-orange" />
</p>

## Instalación y Ejecución del Proyecto

El proyecto EZBar está dividido en dos módulos principales:

- **Frontend — Flutter**  
- **Backend — Java puro + MariaDB**  

---

## Requisitos Previos

### Frontend
- Flutter SDK  
- VS Code  
- Dart SDK  

### Backend
- Java JDK 17+  
- MariaDB local  
- JDBC Driver `mariadb-java-client`  

---

## Configuración de la Base de Datos (MariaDB)

```sql
CREATE DATABASE ezbar;

CREATE USER 'ezbar'@'localhost' IDENTIFIED BY 'tu_password';
GRANT ALL PRIVILEGES ON ezbar.* TO 'ezbar'@'localhost';
FLUSH PRIVILEGES;
```
## Arquitectura del Proyecto

EZBar se compone de dos módulos principales: Frontend y Backend, comunicándose con una base de datos MariaDB.

  
   |  Flutter App (Frontend)  | <-----> (HTTP) | Backend Java  (Lógica del ERP)  | <-----> (JDBC) |   MariaDB (Base de Datos)  |      

### Estructura General

/EZBar
│
├── EZBar_Frontend/      # Aplicación Flutter (UI y lógica de cliente)
│
├── EZBar_Backend/       # Backend en Java (servicios, endpoints, conexión DB)
│
└── docs/                # Documentación del proyecto

### Descripción de los Módulos

Frontend (Flutter)
- Interfaz de usuario.
- Navegación.
- Peticiones HTTP hacia el backend.

Backend (Java Puro)
- Autenticación.
- Gestión de zonas.
- Gestión de mesas.
- Gestión de productos.
- Conexión con MariaDB mediante JDBC.

Base de Datos (MariaDB)
- Almacenamiento de todas las entidades del ERP.



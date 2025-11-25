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
- │
- ├── EZBar_Frontend/      # Aplicación Flutter (UI y lógica de cliente)
- │
- ├── EZBar_Backend/       # Backend en Java (servicios, endpoints, conexión DB)
- │
- └── docs/                # Documentación del proyecto

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
  
## Instalación y Configuración

A continuación se detallan los pasos necesarios para ejecutar EZBar tanto en el **Frontend (Flutter)** como en el **Backend (Java)**, junto con la configuración de MariaDB.

---

### 1. Requisitos Previos

* **Flutter 3.x**
* **Java 17 o superior**
* **MariaDB 10.x o superior**
* **IDE recomendado:**
    * Frontend → Android Studio o VS Code
    * Backend → IntelliJ IDEA o Eclipse

---

### 2. Configuración de la Base de Datos (MariaDB)

1.  **Crear la base de datos:**
    ```sql
    CREATE DATABASE ezbar;
    ```
2.  **Crear usuario y permisos:**
    ```sql
    CREATE USER 'ezbar'@'localhost' IDENTIFIED BY 'tu_contraseña';
    GRANT ALL PRIVILEGES ON ezbar.* TO 'ezbar'@'localhost';
    FLUSH PRIVILEGES;
    ```
3.  **Importar las tablas del proyecto (si existe un script SQL):**
    ```sql
    SOURCE ruta_al_script/ezbar_schema.sql;
    ```

---

### 3. Configuración del Backend (Java)

1.  **Clonar o abrir el proyecto:**
    ```bash
    cd /EZBar/EZBar_Backend
    ```
2.  **Configurar el archivo de conexión JDBC** (ejemplo: `config.properties`):
    ```properties
    db.url=jdbc:mariadb://localhost:3306/ezbar
    db.user=ezbar
    db.password=tu_contraseña
    ```
3.  **Compilar y ejecutar:**
    ```bash
    mvn clean package
    java -jar target/EZBar_Backend.jar
    ```

---

### 4. Configuración del Frontend (Flutter)

1.  **Abrir el proyecto:**
    ```bash
    cd /EZBar/EZBar_Frontend
    ```
2.  **Actualizar el endpoint del backend** en el archivo de configuración:
    ```dart
    const String apiUrl = "http://localhost:8080";
    ```
3.  **Instalar dependencias:**
    ```bash
    flutter pub get
    ```
4.  **Ejecutar la aplicación:**
    ```bash
    flutter run
    ```

---

### 5. Estructura del Entorno de Desarrollo

Una vez ejecutados los pasos anteriores, el entorno debería estar configurado de la siguiente manera:

* **Backend activo en:** `http://localhost:8080`
* **Flutter** ejecutándose en dispositivo/emulador.
* **MariaDB** funcionando en local con el usuario configurado.

Con esto, el proyecto queda funcionando en local.



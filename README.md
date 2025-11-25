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

---

## Instalación y Configuración

A continuación se detallan los pasos necesarios para ejecutar EZBar en un entorno de desarrollo local.

### 1. Requisitos Previos

Asegúrate de tener instalado el siguiente software:

* **Flutter 3.x**
* **Java 17 o superior**
* **MariaDB 10.x o superior**
* **IDE recomendado:** Android Studio/VS Code (Frontend), IntelliJ IDEA/Eclipse (Backend).

### 2. Configuración de la Base de Datos (MariaDB)

1.  **Crear la base de datos y el usuario:**
    ```sql
    CREATE DATABASE ezbar;

    CREATE USER 'ezbar'@'localhost' IDENTIFIED BY 'tu_contraseña';
    GRANT ALL PRIVILEGES ON ezbar.* TO 'ezbar'@'localhost';
    FLUSH PRIVILEGES;
    ```
2.  **Importar las tablas del proyecto** (si existe un script SQL con el esquema):
    ```sql
    SOURCE ruta_al_script/ezbar_schema.sql;
    ```

### 3. Configuración del Backend (Java)

1.  **Clonar y configurar la conexión JDBC** (ejemplo: `config.properties`):
    ```bash
    cd /EZBar/EZBar_Backend
    ```
    ```properties
    db.url=jdbc:mariadb://localhost:3306/ezbar
    db.user=ezbar
    db.password=tu_contraseña
    ```
2.  **Compilar y ejecutar el servidor:**
    ```bash
    mvn clean package
    java -jar target/EZBar_Backend.jar
    ```
    *El Backend estará disponible en: `http://localhost:8080`*

### 4. Configuración del Frontend (Flutter)

1.  **Navegar al proyecto:**
    ```bash
    cd /EZBar/EZBar_Frontend
    ```
2.  **Verificar el endpoint del backend** en el archivo de configuración (ejemplo: `config.dart`):
    ```dart
    const String apiUrl = "http://localhost:8080";
    ```
3.  **Instalar dependencias y ejecutar la aplicación:**
    ```bash
    flutter pub get
    flutter run
    ```
    *La aplicación se ejecutará en el dispositivo o emulador configurado.*
    ---

## Funcionamiento y Uso de la Aplicación

EZBar está diseñado para optimizar el flujo de trabajo en la hostelería, permitiendo a los camareros gestionar pedidos, mesas y zonas de manera eficiente a través de la interfaz de Flutter.

---

### 1. Flujo Operacional (Roles de Usuario)

El sistema se enfoca en dos flujos principales:

1.  **Administración (Backend):** Gestión de productos, precios y zonas, a través de la configuración directa en la base de datos o herramientas de gestión.
2.  **Camarero (Frontend):** Uso diario de la aplicación móvil para la toma y gestión de pedidos.

### 2. Características Clave del Frontend

La aplicación móvil (Flutter) centraliza las siguientes funcionalidades:

* **Gestión de Zonas y Mesas:** Visualización clara de todas las zonas del local (ej. Terraza, Barra, Comedor) y el estado de cada mesa (ocupada, libre, pendiente de pago).
* **Creación y Edición de Pedidos:** Capacidad para crear un pedido, añadir productos al ticket, modificar cantidades y añadir notas especiales antes de enviarlo a cocina/barra.
* **Cierre de Mesa:** Permite la liquidación del pedido y el marcado de la mesa como libre.

### 3. Interfaz de Usuario y Conexión

Una vez que el **Backend (Java)** está activo en `http://localhost:8080`, la aplicación Flutter establece la conexión al iniciar.

| Pantalla | Descripción | Acciones Principales |
| :--- | :--- | :--- |
| **Inicio/Login** | Autenticación de usuarios con roles definidos (ej. Camarero, Gerente). | `Login` / `Selección de Turno` |
| **Mapa de Mesas** | Vista principal que muestra el estado en tiempo real de las zonas. | `Seleccionar Mesa` / `Cambiar Zona` |
| **Toma de Pedido** | Interfaz para seleccionar productos del menú y configurar el ticket. | `Añadir Producto` / `Enviar a Cocina` / `Cerrar Cuenta` |

> **Nota de Conexión:** Si el Backend no está corriendo, la aplicación Frontend mostrará un error de conexión y no permitirá la autenticación. Asegúrese de que el JAR de Java está en ejecución.

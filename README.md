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
## Índice

1. [Arquitectura del Proyecto](#arquitectura-del-proyecto)
2. [Instalación y Configuración](#instalación-y-configuración)
3. [Funcionamiento y Uso de la Aplicación](#funcionamiento-y-uso-de-la-aplicación)
4. [Estado del Proyecto](#estado-del-proyecto)
5. [Autores](#autores)

## 1. Arquitectura del Proyecto

EZBar se organiza en una arquitectura **cliente-servidor** compuesta por tres elementos principales:

- **Backend (Java):** Encargado de la lógica de negocio, la gestión de pedidos y la conexión con la base de datos.  
  👉 [Ver documentación del Backend](./EZBar_Backend/README.md)

- **Frontend (Flutter):** Aplicación móvil utilizada por camareros y personal de hostelería para la gestión diaria.  
  👉 [Ver documentación del Frontend](./EZBar_Frontend/README.md)

- **Base de Datos (MariaDB):** Almacena la información de productos, mesas, pedidos y usuarios.

La comunicación entre el **Frontend** y el **Backend** se realiza mediante **servicios REST**, garantizando una integración sencilla y escalable.

## 2. Instalación y Configuración

### Requisitos Previos

Asegúrate de tener instalado:

- **Flutter 3.x**
- **Java 17 o superior**
- **MariaDB 10.x o superior**
- IDE recomendado: Android Studio/VS Code (Frontend), IntelliJ IDEA/Eclipse (Backend)

### Configuración de la Base de Datos

```sql
CREATE DATABASE ezbar;

CREATE USER 'ezbar'@'localhost' IDENTIFIED BY 'tu_contraseña';
GRANT ALL PRIVILEGES ON ezbar.* TO 'ezbar'@'localhost';
FLUSH PRIVILEGES;
```
### Configuración del Proyecto

Para más detalles sobre la instalación y ejecución de cada módulo, consulta sus respectivos README:

- **Backend:** [EZBar_Backend](https://github.com/Monti1751/EZBar_Backend/tree/87085fbad2fe236fadd91ced6935b192882cd938)
- **Frontend:** [EZBar_Frontend](https://github.com/Monti1751/EZBar_Frontend/tree/276e500ff0acafbd51ccb77c555db25a7351f76e)
## 3. Funcionamiento y Uso de la Aplicación

EZBar está diseñado para optimizar el flujo de trabajo en hostelería, permitiendo a los camareros gestionar pedidos, mesas y zonas de manera eficiente.

### Roles de Usuario

- **Administración (Backend):** Gestión de productos, precios y zonas directamente desde la base de datos o herramientas de gestión.  
- **Camarero (Frontend):** Uso diario de la aplicación móvil para la toma y gestión de pedidos.

### Funcionalidades Clave

- **Gestión de Zonas y Mesas:** Visualización clara de todas las zonas del local (ej. Terraza, Barra, Comedor) y el estado de cada mesa (ocupada, libre, pendiente de pago).  
- **Creación y Edición de Pedidos:** Capacidad para crear un pedido, añadir productos al ticket, modificar cantidades y añadir notas especiales antes de enviarlo a cocina/barra.  
- **Cierre de Mesa:** Permite la liquidación del pedido y el marcado de la mesa como libre.

### Interfaz de Usuario y Conexión

Una vez que el **Backend (Java)** está activo en `http://localhost:8080`, la aplicación **Frontend (Flutter)** establece la conexión al iniciar.

| Pantalla        | Descripción                                               | Acciones Principales                          |
|-----------------|-----------------------------------------------------------|-----------------------------------------------|
| **Inicio/Login** | Autenticación de usuarios con roles definidos.            | `Login` / `Selección de Turno`                |
| **Mapa de Mesas** | Vista principal que muestra el estado en tiempo real.    | `Seleccionar Mesa` / `Cambiar Zona`           |
| **Toma de Pedido** | Interfaz para seleccionar productos y configurar tickets.| `Añadir Producto` / `Enviar a Cocina` / `Cerrar Cuenta` |

> **Nota:** Si el Backend no está corriendo, la aplicación Frontend mostrará un error de conexión y no permitirá la autenticación.
## 4. Estado del Proyecto

El proyecto **EZBar** se encuentra actualmente en **versión Alpha**, lo que significa que está en fase de pruebas iniciales.  
Durante esta etapa se están validando las funcionalidades principales:

- Conexión entre **Frontend (Flutter)** y **Backend (Java)** mediante servicios REST.  
- Gestión básica de zonas, mesas y pedidos.  
- Integración con la base de datos **MariaDB**.  

> Próximas fases incluirán mejoras de rendimiento, ampliación de funcionalidades y preparación para una versión Beta.
## 5. Autores

Este proyecto ha sido desarrollado por:

- **Miguel Tomás**  
  - [Tommy23-has](https://github.com/Tommy23-has)  
  - [ismigue23](https://github.com/ismigue23)

- **Francisco Montesinos**  
  - [FranMontesinos](https://github.com/FranMontesinos)  
  - [Monti1751](https://github.com/Monti1751)

- **Miguel Jiménez**  
  - [MiguelJimenezSerrano](https://github.com/MiguelJimenezSerrano)

- **Miguel Duque**  
  - [El-Mig](https://github.com/El-Mig)  
  - [Mig56](https://github.com/Mig56)


<p align="center">
  <img src="https://raw.githubusercontent.com/Monti1751/EZBar_Frontend/MJS/logo_bueno_fondo.png" alt="Logo EZBar" width="200"/>
</p>

<h1 align="center">EZBar - Sistema de Gestión de Hostelería</h1>

<p align="center">
  Una solución integral para la gestión de pedidos, mesas y operaciones diarias en locales de hostelería
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/C%23%20.NET-239120?logo=.net&logoColor=white" />
  <img src="https://img.shields.io/badge/Java-ED8B00?logo=java&logoColor=white" />
  <img src="https://img.shields.io/badge/MariaDB-003545?logo=mariadb&logoColor=white" />
  <img src="https://img.shields.io/badge/Node.js-339933?logo=node.js&logoColor=white" />
  <img src="https://img.shields.io/badge/GitHub-181717?logo=github&logoColor=white" />
  <img src="https://img.shields.io/badge/Azure_DevOps-0078D7?logo=azuredevops&logoColor=white" />
  <img src="https://img.shields.io/badge/Versión-Alpha-orange" />
</p>

---

## 📋 Índice
1. [Descripción General](#descripción-general)
2. [Arquitectura del Proyecto](#1-arquitectura-del-proyecto)  
3. [Estructura de Componentes](#2-estructura-de-componentes)
4. [Instalación y Configuración](#3-instalación-y-configuración)  
5. [Funcionamiento y Uso de la Aplicación](#4-funcionamiento-y-uso-de-la-aplicación)  
6. [Estado del Proyecto](#5-estado-del-proyecto)  
7. [Autores](#6-autores)

---

## Descripción General

**EZBar** es una solución completa de software para la gestión moderna de establecimientos de hostelería. El sistema permite optimizar procesos de toma de pedidos, gestión de mesas, control de zonas y operaciones administrativas a través de múltiples interfaces especializadas.

La plataforma está diseñada con una arquitectura escalable y modular que separa las responsabilidades entre tres aplicaciones principales, cada una adaptada a su función específica.  


## 1. Arquitectura del Proyecto

EZBar implementa una **arquitectura cliente-servidor de tres capas** que separa las responsabilidades entre múltiples aplicaciones especializadas:

```
┌─────────────────────────────────────────────────────────────────┐
│                     CAPA DE PRESENTACIÓN                         │
├─────────────────────────────────────────────────────────────────┤
│  Frontend Flutter      │  App Escritorio (.NET WPF)              │
│  (Móvil - Camareros)   │  (Desktop - Gestión)                    │
└──────────────┬─────────┴──────────────┬──────────────────────────┘
               │                        │
               └────────────┬───────────┘
                            │ HTTP/REST API
        ┌───────────────────▼─────────────────────┐
        │   CAPA DE LÓGICA DE NEGOCIO             │
        ├─────────────────────────────────────────┤
        │  Backend Java (Spring Boot)             │
        │  - Gestión de Pedidos                   │
        │  - Autenticación                        │
        │  - Lógica de Negocio                    │
        └────────────────────┬────────────────────┘
                             │ JDBC/SQL
        ┌────────────────────▼─────────────────┐
        │   CAPA DE DATOS                      │
        ├──────────────────────────────────────┤
        │  Base de Datos MariaDB                │
        │  - Productos, Mesas, Pedidos, Usuarios│
        └──────────────────────────────────────┘
```

### 📱 **Componentes Principales**

#### 1. **Frontend Móvil (Flutter)**
- **Propósito:** Aplicación móvil para camareros y personal de hostelería
- **Plataformas:** Android, iOS
- **Características:**
  - Gestión en tiempo real de mesas y pedidos
  - Interfaz intuitiva y rápida
  - Sincronización con el backend
  - Autenticación de usuarios

#### 2. **Aplicación de Escritorio (C# .NET WPF)**
- **Propósito:** Herramienta de gestión administrativa y generación de reportes
- **Target Framework:** .NET 9.0
- **Características:**
  - Gestión avanzada de pedidos y pagos
  - Exportación de datos (Excel con ClosedXML)
  - Interfaz gráfica moderna (WPF)
  - Arquitectura MVVM
  - Inyección de dependencias

**Stack Tecnológico (EZBar-escritorio):**
```
.NET 9.0-Windows
├── CommunityToolkit.Mvvm (8.4.0) - Patrón MVVM
├── ClosedXML (0.104.2) - Exportación Excel
├── Microsoft.Extensions.DependencyInjection (9.0.2)
├── Microsoft.Extensions.Http (9.0.2)
└── Microsoft.Extensions.Configuration (9.0.2)
```

**Estructura de Carpetas:**
```
EZBar-escritorio/
├── Domain/
│   └── Models/
│       ├── Pago.cs          # Modelo de pagos
│       └── Pedido.cs        # Modelo de pedidos
├── Infrastructure/
│   ├── Converters/          # Convertidores WPF
│   └── Network/
│       ├── AuthInterceptor.cs   # Interceptor de autenticación
│       └── IApiService.cs      # Servicio de API
├── Repositories/            # Acceso a datos
├── Services/                # Servicios de negocio
├── ViewModels/              # Lógica de presentación (MVVM)
├── App.xaml                 # Configuración de aplicación
├── MainWindow.xaml          # Ventana principal
└── appsettings.json         # Configuración
```

#### 3. **Backend (Java)**
- **Propósito:** Servidor de lógica de negocio y gestión de datos
- **Stack:** Spring Boot, Java 17+
- **Responsabilidades:**
  - API REST para Frontend y App de Escritorio
  - Autenticación y autorización
  - Gestión de pedidos, mesas y pagos
  - Conexión con base de datos
  - Validaciones de negocio

#### 4. **Base de Datos (MariaDB)**
- **Propósito:** Almacenamiento persistente de datos
- **Versión:** 10.x o superior
- **Entidades principales:**
  - Usuarios (con roles: Admin, Camarero)
  - Productos y categorías
  - Mesas y zonas
  - Pedidos y líneas de pedido
  - Pagos

---

## 3. Instalación y Configuración

### ⚙️ Requisitos Previos Generales

Asegúrate de tener instalado:

- **Java 17 o superior** (para el Backend)
- **Flutter 3.x** (para el Frontend móvil)
- **MariaDB 10.x o superior** (base de datos)
- **.NET 9.0 SDK** (para la aplicación de escritorio)
- **Node.js y npm** (opcional, para herramientas de desarrollo)
- **Git** (control de versiones)

**IDEs Recomendados:**
- Frontend Flutter: Android Studio, VS Code
- Backend Java: IntelliJ IDEA, Eclipse, VS Code
- Escritorio .NET: Visual Studio 2022, VS Code
- Base de Datos: MySQL Workbench, DBeaver

### 🗄️ Configuración de la Base de Datos

#### Instalación de MariaDB

1. **Descargar e instalar MariaDB** desde https://mariadb.org/download/

2. **Crear la base de datos y usuario:**

```sql
-- Conexión como administrador
CREATE DATABASE IF NOT EXISTS ezbar CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Crear usuario con contraseña segura
CREATE USER IF NOT EXISTS 'ezbar_user'@'localhost' IDENTIFIED BY 'tu_contraseña_segura';

-- Otorgar permisos
GRANT ALL PRIVILEGES ON ezbar.* TO 'ezbar_user'@'localhost';
FLUSH PRIVILEGES;

-- Verificar
SELECT user, host FROM mysql.user WHERE user='ezbar_user';
```

3. **Ejecutar scripts de inicialización** (proporcionados por el Backend)

---

### 🚀 Instalación de Cada Componente

#### **1. Backend (Java - Spring Boot)**

```bash
# Clonar o navegar al directorio del backend
cd EZBar_Backend

# Configurar propiedades de conexión a BD
# Editar: src/main/resources/application.properties
# Valores requeridos:
# spring.datasource.url=jdbc:mysql://localhost:3306/ezbar
# spring.datasource.username=ezbar_user
# spring.datasource.password=tu_contraseña_segura
# server.port=8080

# Compilar y ejecutar (Maven)
mvn clean install
mvn spring-boot:run

# O compilar con Gradle
gradle build
gradle bootRun
```

**Verificación:**
- Acceder a: `http://localhost:8080/swagger-ui.html` (si está disponible)
- O probar: `http://localhost:8080/api/health`

---

#### **2. Frontend Móvil (Flutter)**

```bash
# Navegar al directorio del frontend
cd EZBar_Frontend

# Obtener dependencias
flutter pub get

# Configurar URL del backend
# Editar: lib/config/api_config.dart
# backend_url = 'http://tu-ip-backend:8080'

# Compilar y ejecutar para Android
flutter run -d android

# O para iOS
flutter run -d ios

# Compilar APK de producción
flutter build apk --release
```

**Requisitos adicionales:**
- Android SDK 21+ para Android
- Xcode y CocoaPods para iOS
- Emulador de Android o dispositivo conectado

---

#### **3. Aplicación de Escritorio (.NET WPF)**

```bash
# Navegar al directorio de escritorio
cd EZBar-escritorio

# Restaurar dependencias NuGet
dotnet restore

# Configurar conexión a Backend
# Editar: appsettings.json
# "ApiSettings": {
#   "BaseUrl": "http://localhost:8080",
#   "Timeout": 30
# }

# Compilar en modo Debug
dotnet build

# Ejecutar
dotnet run

# Compilar release
dotnet publish -c Release -o ./bin/Release/net9.0-windows
```

**Requisitos:**
- Visual Studio 2022 o VS Code con extensiones C#
- .NET 9.0 SDK instalado
- Windows 10 o superior

---

### 🔑 Configuración de Seguridad

#### Autenticación

Cada cliente debe incluir credenciales en los headers HTTP:

```
Authorization: Bearer <token>
```

El token se obtiene al hacer login en el endpoint:
```
POST /api/auth/login
Content-Type: application/json

{
  "usuario": "nombre_usuario",
  "contraseña": "contraseña"
}
```

#### Variables de Entorno (.NET)

Crear archivo `.env` o usar `appsettings.json`:

```json
{
  "ApiSettings": {
    "BaseUrl": "http://localhost:8080",
    "ApiKey": "tu_clave_api",
    "Timeout": 30
  },
  "DatabaseSettings": {
    "ConnectionString": "Server=localhost;Database=ezbar;User=ezbar_user;Password=tu_contraseña;"
  }
}
```

---

### 👥 Roles de Usuario

El sistema implementa dos roles principales:

| Rol | Permisos | Acceso |
|-----|----------|--------|
| **Administrador** | Gestión completa de productos, precios, zonas, usuarios y reportes | Backend + App Escritorio |
| **Camarero** | Toma de pedidos, gestión de mesas, cierre de cuentas | Frontend Móvil |

---

### ✨ Funcionalidades Clave

- **Gestión de Zonas y Mesas:** Visualización clara de todas las zonas del local (ej. Terraza, Barra, Comedor) y el estado de cada mesa (ocupada, libre, pendiente de pago).  
- **Creación y Edición de Pedidos:** Capacidad para crear un pedido, añadir productos al ticket, modificar cantidades y añadir notas especiales antes de enviarlo a cocina/barra.  
- **Cierre de Mesa:** Permite la liquidación del pedido y el marcado de la mesa como libre.
- **Exportación de Datos:** Generación de reportes en Excel desde la aplicación de escritorio.
- **Control de Inventario:** Gestión de productos y disponibilidad.
- **Reportes y Estadísticas:** Análisis de ventas y rendimiento.

---

## 4. Funcionamiento y Uso de la Aplicación

### 🏪 Flujo General de Operación

EZBar está diseñado para agilizar el trabajo en hostelería, permitiendo gestionar mesas, pedidos y zonas de forma rápida e intuitiva:

```
┌─────────────┐
│   CAMARERO  │
└──────┬──────┘
       │ (1) Login en App Móvil (Flutter)
       │
┌──────▼──────────────────────────────────────────┐
│  Frontend Móvil (Flutter)                        │
│  - Selecciona zona (Terraza, Barra, Comedor)    │
│  - Visualiza mapa de mesas                       │
│  - Selecciona mesa                               │
└──────┬──────────────────────────────────────────┘
       │ (2) Solicita datos de mesa
       │
┌──────▼──────────────────────────────────────────┐
│  Backend (Java - Spring Boot)                    │
│  - Valida token de autenticación                 │
│  - Procesa solicitud                             │
│  - Accede a datos en base de datos               │
└──────┬──────────────────────────────────────────┘
       │ (3) Consulta datos
       │
┌──────▼──────────────────────────────────────────┐
│  Base de Datos (MariaDB)                         │
│  - Almacena estado de mesas                      │
│  - Registra pedidos                              │
│  - Guarda transacciones de pago                  │
└──────────────────────────────────────────────────┘
```

### 📱 Uso del Frontend Móvil (Flutter)

**Pantallas Principales:**

| Pantalla | Función | Acciones |
|----------|---------|----------|
| **Login** | Autenticación de usuario | Ingresar credenciales, seleccionar turno |
| **Zonas** | Seleccionar área del local | Cambiar entre Terraza, Barra, Comedor |
| **Mapa de Mesas** | Vista del estado de mesas | Seleccionar mesa, ver pedidos pendientes |
| **Toma de Pedido** | Crear nuevo pedido | Buscar productos, agregar cantidades |
| **Edición de Pedido** | Modificar pedido existente | Cambiar cantidades, agregar notas |
| **Cierre de Cuenta** | Procesar pago | Calcular total, registrar pago |

**Estados de Mesa:**
- 🟢 **Libre:** Mesa disponible para ocupar
- 🔵 **Ocupada:** Mesa con cliente, pedido en progreso
- 🟠 **Pendiente Pago:** Pedido listo, esperando cobro
- 🔴 **Bloqueada:** Mesa no disponible (mantenimiento)

---

### 💻 Uso de la Aplicación de Escritorio (.NET WPF)

**Funcionalidades de Administración:**

1. **Gestión de Productos**
   - Crear, editar y eliminar productos
   - Asignar categorías y precios
   - Controlar disponibilidad

2. **Gestión de Mesas y Zonas**
   - Configurar distribución del local
   - Asignar capacidad de mesas
   - Definir zonas de servicio

3. **Reportes**
   - Exportar pedidos a Excel (ClosedXML)
   - Análisis de ventas por período
   - Estadísticas de productos más vendidos
   - Reportes de pagos

4. **Configuración del Sistema**
   - Gestión de usuarios y roles
   - Configuración de servidores
   - Parámetros de operación

**Ejemplo de Exportación Excel:**
```csharp
// Desde el código, usando ClosedXML
using (var workbook = new XLWorkbook())
{
    var worksheet = workbook.Worksheets.Add("Pedidos");
    // Llenar datos de pedidos
    worksheet.Cell("A1").Value = "ID Pedido";
    worksheet.Cell("B1").Value = "Mesa";
    worksheet.Cell("C1").Value = "Total";
    
    workbook.SaveAs("Reporte_Pedidos.xlsx");
}
```

---

### 🔗 Integración Backend - Base de Datos

**API REST del Backend (Java):**

```
POST   /api/auth/login              - Autenticar usuario
GET    /api/mesas                   - Obtener estado de mesas
GET    /api/mesas/{id}/pedidos      - Obtener pedidos de una mesa
POST   /api/pedidos                 - Crear nuevo pedido
PATCH  /api/pedidos/{id}            - Actualizar pedido
POST   /api/pagos                   - Registrar pago
GET    /api/productos               - Listar productos disponibles
GET    /api/reportes/ventas         - Generar reportes de ventas
```

**Modelos de Datos Principales:**

```
Usuarios
├── id_usuario
├── nombre
├── email
├── contraseña (hash)
├── rol (Admin, Camarero)
└── estado

Mesas
├── id_mesa
├── número_mesa
├── id_zona
├── capacidad
├── estado (libre, ocupada, pendiente_pago)
└── última_actualización

Pedidos
├── id_pedido
├── id_mesa
├── id_usuario
├── fecha_hora
├── estado (pendiente, preparando, listo, servido, pagado)
├── total
└── notas

Líneas_Pedido
├── id_línea
├── id_pedido
├── id_producto
├── cantidad
└── subtotal

Pagos
├── id_pago
├── id_pedido
├── monto
├── método_pago (efectivo, tarjeta, etc.)
└── fecha_hora_pago
```

---

### 🔄 Flujo Detallado de Pedido

```
1. INICIO DE SESIÓN
   ├─ Usuario abre app
   └─ Ingresa credenciales
        │
2. AUTENTICACIÓN
   ├─ Backend valida usuario
   ├─ Genera token JWT
   └─ Frontend almacena token
        │
3. SELECCIÓN DE MESA
   ├─ Frontend obtiene mesas disponibles
   ├─ Usuario selecciona mesa
   └─ Marca mesa como "ocupada"
        │
4. TOMA DE PEDIDO
   ├─ Frontend lista productos
   ├─ Usuario selecciona productos y cantidades
   ├─ Agrega notas especiales (sin picante, sin cebolla, etc.)
   └─ Revisa total
        │
5. ENVÍO A COCINA/BARRA
   ├─ Pedido se marca como "preparando"
   ├─ Cocina/Barra recibe notificación
   └─ Comienza preparación
        │
6. SERVICIO
   ├─ Pedido se marca como "listo"
   ├─ Camarero entrega a cliente
   └─ Marca como "servido"
        │
7. CIERRE DE CUENTA
   ├─ Calcula total final
   ├─ Selecciona método de pago
   ├─ Backend registra pago
   └─ Marca mesa como "libre"
```

---

### ⚡ Optimizaciones y Ventajas

- **Tiempo Real:** Sincronización instantánea de cambios
- **Offline-Ready:** (en desarrollo) Funcionalidad parcial sin conexión
- **Responsive:** UI adaptativa para diferentes tamaños de pantalla
- **Seguridad:** Autenticación JWT y encriptación de datos sensibles
- **Escalabilidad:** Arquitectura modular preparada para crecimiento

---

## 5. Estado del Proyecto

El proyecto **EZBar** se encuentra actualmente en **versión Alpha**, lo que significa que está en fase de pruebas iniciales.

**Componentes Completados:**
- ✅ Arquitectura de proyecto base
- ✅ Modelos de dominio (Pedidos, Pagos, Mesas)
- ✅ Conexión a Base de Datos
- ✅ Autenticación JWT
- ✅ API REST (endpoints básicos)
- ✅ Interfaz WPF (app de escritorio)
- ✅ Inyección de dependencias

**En Desarrollo:**
- 🔄 Frontend Flutter completo
- 🔄 Sincronización en tiempo real
- 🔄 Sistema de notificaciones
- 🔄 Reportes avanzados

**Planificado para Futuras Versiones:**
- 📋 Modo offline
- 📋 Integración con sistemas de pago (Stripe, PayPal)
- 📋 Aplicación web (React/Angular)
- 📋 Análisis predictivo con IA
- 📋 Sistema de reservas
- 📋 Programa de fidelización

---

## 6. Autores

Este proyecto ha sido desarrollado por:

- **Miguel Tomás**   
  - [ismigue23](https://github.com/ismigue23)

- **Francisco Montesinos**    
  - [Monti1751](https://github.com/Monti1751)

- **Miguel Jiménez**  
  - [MiguelJimenezSerrano](https://github.com/MiguelJimenezSerrano)

- **Miguel Duque**  
  - [El-Mig](https://github.com/El-Mig)

---

## 📚 Recursos Adicionales

### Documentación Oficial
- [Flutter Documentation](https://flutter.dev/docs)
- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
- [.NET Documentation](https://docs.microsoft.com/en-us/dotnet/)
- [MariaDB Documentation](https://mariadb.com/docs/)

### Stack Tecnológico Detallado

**Frontend (Flutter)**
- Framework: Flutter 3.x
- Lenguaje: Dart
- Gestión de estado: Provider / Riverpod
- Persistencia local: Hive / Sqflite

**Backend (Java)**
- Framework: Spring Boot 3.x
- Lenguaje: Java 17+
- ORM: JPA/Hibernate
- Seguridad: Spring Security + JWT

**Desktop (.NET)**
- Framework: .NET 9.0
- Patrón: MVVM
- UI: WPF
- Librerías clave:
  - CommunityToolkit.Mvvm
  - ClosedXML (reportes Excel)
  - Microsoft.Extensions.* (DI, Config)

**Base de Datos**
- Sistema: MariaDB 10.x+
- Lenguaje: SQL
- Herramientas: MySQL Workbench, DBeaver

---

## 🐛 Solución de Problemas

### El Frontend no se conecta al Backend

**Síntomas:** Error de conexión al intentar hacer login

**Soluciones:**
1. Verificar que el Backend está ejecutándose en `http://localhost:8080`
2. Comprobar la URL configurada en `api_config.dart` (Frontend)
3. Verificar firewall y puertos abiertos
4. Revisar logs del Backend en `logs/` o consola

```bash
# Comprobar que el puerto está en uso
netstat -ano | findstr :8080  # Windows
lsof -i :8080                  # macOS/Linux
```

### Error de autenticación

**Síntomas:** "Invalid credentials" o token expirado

**Soluciones:**
1. Verificar credenciales de usuario en BD
2. Comprobar que el usuario tiene rol asignado
3. Limpiar cache de tokens: borrar carpeta `shared_preferences` (Flutter)

### Problemas con la base de datos

**Síntomas:** "Connection refused" o "Access denied"

**Soluciones:**
1. Verificar que MariaDB está en ejecución
2. Comprobar credenciales en `application.properties`
3. Verificar permisos del usuario en MariaDB

```sql
-- Verificar usuario y permisos
SELECT user, host, authentication_string FROM mysql.user WHERE user='ezbar_user';
SHOW GRANTS FOR 'ezbar_user'@'localhost';
```

### Problemas de rendimiento

**Síntomas:** Aplicación lenta, demoras en cargas

**Soluciones:**
1. Revisar tamaño de tabla de pedidos (archivar datos antiguos)
2. Agregar índices en columnas frecuentemente consultadas
3. Optimizar consultas SQL
4. Aumentar memoria JVM del Backend

---

## 🤝 Contribuciones

Para contribuir al proyecto:

1. Fork el repositorio
2. Crear una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abrir un Pull Request

---

## 📝 Licencia

Este proyecto está bajo licencia [Especificar licencia: MIT, Apache 2.0, etc.]

Para más información, consulta el archivo `LICENSE`.

---

## 📞 Contacto y Soporte

- **Issues:** Reportar problemas en [GitHub Issues](https://github.com/Monti1751/EZBar_app/issues)
- **Discussiones:** Participar en [GitHub Discussions](https://github.com/Monti1751/EZBar_app/discussions)
- **Email:** [Especificar contacto]

---

**Última actualización:** Mayo 2026  
**Versión:** 1.0.0


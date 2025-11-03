# EZ BAR

## Descripción general
EZ BAR es una aplicación diseñada para facilitar la gestión de negocios gastronómicos de pequeña y mediana escala, como bares y restaurantes locales.  
Su objetivo principal es optimizar las operaciones diarias, incluyendo el control de productos, la gestión de cobros y la organización del servicio, mediante una interfaz sencilla y accesible.

## Objetivos
**Objetivo general:**
- Digitalizar y simplificar la gestión interna de bares y restaurantes.

**Objetivos específicos:**
- Controlar y actualizar el inventario en tiempo real.
- Registrar ventas y cobros de forma rápida y segura.
- Gestionar usuarios y roles (administrador, camarero, cajero).
- Ofrecer una interfaz intuitiva y adaptada al entorno hostelero.

## Alcance del proyecto
La versión inicial de EZ BAR incluye:
- Módulo de gestión de productos e inventario.
- Módulo de cobros y pagos.
- Organización del servicio (mesas y pedidos).
- Control de usuarios y permisos.

No se incluye en esta primera versión:
- Informes avanzados de ventas.
- Integración con TPV externos.
- Funcionalidades web.

## Requisitos funcionales
- RF1: Registro, modificación y eliminación de productos.
- RF2: Actualización de inventario en tiempo real.
- RF3: Registro de cobros y pagos con diferentes métodos de pago.
- RF4: Gestión de mesas y pedidos.
- RF5: Creación y administración de roles de usuario (administrador, camarero, cajero).

## Requisitos no funcionales
- RNF1: La aplicación debe cargar en menos de 3 segundos.
- RNF2: Interfaz intuitiva, con navegación sencilla y adaptable a distintos tamaños de pantalla.
- RNF3: Capacidad de funcionar parcialmente sin conexión a internet.
- RNF4: Garantizar la seguridad y privacidad de los datos de los usuarios.
- RNF5: Código mantenible y documentado.

## Tecnologías utilizadas
- **Lenguajes:** Java, Flutter, SQL
- **Base de datos:** PostgreSQL
- **Metodología:** Scrum

## Planificación del proyecto
| Fase | Descripción | 
|------|--------------|
| Análisis y planificación | Definición de requisitos y estructura del proyecto
| Diseño | Estructura de la base de datos, algoritmo y diseño UI/UX
| Desarrollo | Implementación del frontend y backend
| Pruebas y control de calidad | Verificación del funcionamiento y corrección de errores 
| Lanzamiento | Publicación de la primera versión 

## Metodología de trabajo
El desarrollo de EZ BAR se realiza bajo la metodología ágil **Scrum**, estructurada en sprints semanales que permiten una entrega continua de funcionalidades, retroalimentación frecuente y mejora iterativa del producto.

## Product Backlog (historias de usuario)
1. Como administrador, quiero registrar y actualizar productos para tener el inventario al día.
2. Como camarero, quiero registrar pedidos y asignarlos a mesas para agilizar el servicio.
3. Como cajero, quiero registrar cobros y generar tickets para llevar un control de caja.
4. Como propietario, quiero ver un resumen diario de ventas para conocer el rendimiento del negocio.

## Plan de calidad y pruebas
**Tipos de pruebas:**
- Pruebas unitarias: Validación de cada módulo principal.
- Pruebas de integración: Comunicación entre frontend, backend y base de datos.
- Pruebas de usabilidad: Test con usuarios reales.
- Pruebas de rendimiento: Tiempo de carga y estabilidad del sistema.

**Criterios de calidad:**
- Código legible y documentado.
- Sin errores críticos.
- Interfaz clara y usable.
- Cumplimiento de los requisitos funcionales y no funcionales definidos.



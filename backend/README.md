# Cafetería Digital - Backend API

API REST construida con Node.js, Express y TypeScript para gestionar la cafetería escolar.

## 🚀 Características

- ✅ API RESTful con Express.js
- ✅ Base de datos PostgreSQL
- ✅ Autenticación JWT
- ✅ Validación de datos con Joi
- ✅ Integración con Stripe
- ✅ Sistema de caché con Redis
- ✅ Logging y auditoría
- ✅ Documentación Swagger
- ✅ Tests unitarios e integración
- ✅ Rate limiting
- ✅ CORS seguro

## 📋 Requisitos

- Node.js 20+
- PostgreSQL 15+
- Redis 7+
- npm o yarn

## 🛠️ Instalación

### 1. Instalar dependencias
```bash
npm install
```

### 2. Configurar variables de entorno
```bash
cp .env.example .env
# Editar .env con tus valores
```

### 3. Ejecutar migraciones de base de datos
```bash
npm run migrate
```

### 4. Cargar datos iniciales (seed)
```bash
npm run seed
```

### 5. Iniciar en desarrollo
```bash
npm run dev
```

El servidor estará disponible en `http://localhost:3000`

## 📁 Estructura de Carpetas

```
src/
├── config/           # Configuración (BD, Stripe, etc)
├── controllers/      # Controladores (lógica de rutas)
├── middleware/       # Middleware (auth, validación, etc)
├── models/          # Modelos y tipos de datos
├── routes/          # Definición de rutas
├── services/        # Lógica de negocios
├── utils/           # Utilidades y helpers
├── types/           # Tipos TypeScript
├── database/        # Migraciones y seeds
└── app.ts           # Punto de entrada
```

## 🔌 Endpoints Principales

### Autenticación
```
POST   /api/auth/register        - Registrar usuario
POST   /api/auth/login           - Login
POST   /api/auth/refresh         - Renovar token JWT
POST   /api/auth/logout          - Logout
GET    /api/auth/me              - Obtener perfil actual
```

### Productos
```
GET    /api/products             - Listar todos
GET    /api/products/:id         - Obtener uno
GET    /api/products/category/:id - Productos por categoría
POST   /api/products             - Crear (Admin)
PUT    /api/products/:id         - Actualizar (Admin)
DELETE /api/products/:id         - Eliminar (Admin)
```

### Categorías
```
GET    /api/categories           - Listar categorías
POST   /api/categories           - Crear (Admin)
PUT    /api/categories/:id       - Actualizar (Admin)
DELETE /api/categories/:id       - Eliminar (Admin)
```

### Pedidos
```
GET    /api/orders               - Listar pedidos del usuario
GET    /api/orders/:id           - Obtener detalles
POST   /api/orders               - Crear nuevo pedido
PUT    /api/orders/:id           - Actualizar estado
DELETE /api/orders/:id/cancel    - Cancelar pedido
```

### Pagos
```
POST   /api/payments/intent      - Crear intención de pago (Stripe)
POST   /api/payments/confirm     - Confirmar pago
GET    /api/payments/history     - Historial de pagos
```

### Inventario (Admin)
```
GET    /api/inventory            - Ver todo
GET    /api/inventory/:id        - Ver uno
PUT    /api/inventory/:id        - Actualizar stock
GET    /api/inventory/low-stock  - Productos con bajo stock
```

### Puntos
```
GET    /api/points/balance       - Saldo actual
GET    /api/points/history       - Historial
POST   /api/points/redeem        - Canjear puntos
```

### Reportes (Admin)
```
GET    /api/reports/sales        - Ventas
GET    /api/reports/products     - Productos más vendidos
GET    /api/reports/revenue      - Ingresos
GET    /api/reports/users        - Usuarios activos
```

## 🔐 Autenticación

El sistema usa JWT (JSON Web Tokens). Después de login, incluye el token en el header:

```
Authorization: Bearer <token_aqui>
```

### Roles
- **student** - Acceso básico
- **vendor** - Gestión de pedidos
- **admin** - Acceso total

## 📊 Base de Datos

### Migraciones
```bash
npm run migrate
```

### Seed (datos iniciales)
```bash
npm run seed
```

Esto carga:
- Categorías de productos
- Productos de ejemplo
- Usuarios de prueba
- Inventario inicial

## 🧪 Tests

### Ejecutar tests
```bash
npm test
```

### Con cobertura
```bash
npm run test:coverage
```

## 🔍 Validación

Todos los endpoints validan automáticamente:
- Tipos de datos
- Campos requeridos
- Longitudes máximas/mínimas
- Emails válidos
- Errores 400 si hay problemas

## 📝 Ejemplos de Uso

### Registrar usuario
```bash
curl -X POST http://localhost:3000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "estudiante@escuela.com",
    "password": "password123",
    "full_name": "Juan Pérez"
  }'
```

### Hacer login
```bash
curl -X POST http://localhost:3000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "estudiante@escuela.com",
    "password": "password123"
  }'
```

### Crear pedido
```bash
curl -X POST http://localhost:3000/api/orders \
  -H "Authorization: Bearer <token>" \
  -H "Content-Type: application/json" \
  -d '{
    "items": [
      {"product_id": "uuid-aqui", "quantity": 2}
    ],
    "notes": "Sin cebolla"
  }'
```

## 🔄 Variables de Entorno

```
NODE_ENV=development
PORT=3000
DB_HOST=localhost
DB_PORT=5432
DB_USER=cafeteria_user
DB_PASSWORD=cafeteria_pass_123
DB_NAME=cafeteria_db
JWT_SECRET=tu_secreto_aqui
STRIPE_SECRET_KEY=sk_test_...
```

## 🐛 Logging

Los logs se guardan en `logs/` y se imprimen en consola. Niveles:
- error
- warn
- info
- debug

## 🚀 Deployment

### Con Docker
```bash
docker build -t cafeteria-api .
docker run -p 3000:3000 cafeteria-api
```

### A producción
1. Usar `NODE_ENV=production`
2. Cambiar `JWT_SECRET` a valor seguro
3. Cambiar credenciales de BD
4. Activar HTTPS
5. Configurar variables CORS

## 📚 Documentación API

La documentación Swagger está disponible en:
```
http://localhost:3000/api-docs
```

## 🤝 Contribución

1. Crear rama: `git checkout -b feature/nueva-feature`
2. Commitear: `git commit -m "Add nueva feature"`
3. Push: `git push origin feature/nueva-feature`
4. Abrir Pull Request

## 📞 Soporte

Para problemas, abre un issue en GitHub.

---

Construido con ❤️ por alcaor1721-web

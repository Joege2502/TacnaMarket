# TacnaMarket API - Tests with Bruno

Tests para las APIs de TacnaMarket usando Bruno.

## Configuración

### Variables de Entorno

En Bruno, usa las siguientes variables en el entorno (Environment):

- `url`: URL base de la API (ej: `http://localhost:3000`)
- `token`: JWT token obtenido del login
- `userId`: ID del usuario (UUID) para operaciones específicas

### Configuración Local

1. Configura el entorno a `local` con la URL: `http://localhost:3000`
2. Obtén un token ejecutando primero `auth/Register.bru` y luego `auth/Login.bru`
3. Copia el token del response en la variable `token`

## Estructura de Tests

### Auth Module (`/auth`)

- **Register.bru** - POST `/auth/register`
  - Registra un nuevo usuario
  - No requiere autenticación

- **Login.bru** - POST `/auth/login`
  - Autentica al usuario y retorna JWT
  - No requiere autenticación
  - Retorna el token a usar en las demás peticiones

- **GetProfile.bru** - GET `/auth/profile`
  - Obtiene el perfil del usuario autenticado
  - Requiere JWT token

### User Module (`/user`)

Todos los endpoints requieren autenticación JWT en el header `Authorization: Bearer {token}`

- **ListAllUsers.bru** - GET `/user`
  - Lista todos los usuarios

- **GetUserById.bru** - GET `/user/{id}`
  - Obtiene un usuario específico por UUID

- **CreateUser.bru** - POST `/user`
  - Crea un nuevo usuario

- **UpdateUser.bru** - PATCH `/user/{id}`
  - Actualiza los datos de un usuario

- **DeleteUser.bru** - DELETE `/user/{id}`
  - Elimina un usuario

## Flujo Recomendado de Tests

1. `auth/Register.bru` - Registra un usuario de prueba
2. `auth/Login.bru` - Obtiene el JWT token
3. Guarda el token en la variable de entorno
4. Ejecuta los tests del módulo user

## Notas

- Asegúrate de que el servidor esté corriendo en `http://localhost:3000`
- Los UUID deben ser válidos en todos los endpoints
- El email debe ser único para cada nuevo usuario
- El password debe tener mínimo 8 caracteres al registrar

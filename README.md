# Pokedex – iOS App

Aplicación iOS desarrollada en **SwiftUI** que consume la **PokéAPI** para listar Pokémon, mostrar su detalle y gestionar favoritos, con foco en arquitectura clara, rendimiento y manejo predecible del estado.

---

## 📱 Funcionalidades

- Listado de Pokémon con scroll fluido
- Carga incremental (paginación)
- Visualización de información básica (nombre e imagen)
- Pantalla de detalle con:
  - Tipos
  - Estadísticas base
  - Descripción
- Agregar y quitar Pokémon de favoritos
- Persistencia local de favoritos
- Autenticación local simulada
- Flujo Splash → Login → Home
- Filtro entre todos los Pokémon y favoritos

---

## 🏗️ Arquitectura

La aplicación utiliza **MVVM**, con separación clara entre vista, estado y lógica de negocio.

- ViewModels desacoplados de la UI
- Lógica de negocio encapsulada en casos de uso
- Creación de módulos mediante Wireframes
- Manejo de estado con `@StateObject` y `@Published`
- Flujo de datos unidireccional

No se utilizan librerías externas.

---

## 🌐 Networking

- API: https://pokeapi.co/
- Cliente HTTP nativo usando `URLSession`
- Implementación con `async/await`
- Decodificación con `Codable`

---

## 💾 Persistencia

- Persistencia local utilizando **SwiftData**
- Almacenamiento de sesión de usuario
- Almacenamiento de Pokémon favoritos

---

## 🔐 Autenticación

Se implementa **autenticación local simulada**, tal como se sugiere en los extras del enunciado.

### Credenciales
- Usuario: `admin`
- Contraseña: `1234`

La sesión se persiste localmente y se valida al iniciar la aplicación.

> OAuth no fue implementado, ya que el enunciado lo define como opcional.

---

## ▶️ Cómo ejecutar el proyecto

1. Clonar el repositorio
2. Abrir el proyecto en Xcode
3. Ejecutar en simulador o dispositivo físico
4. Ingresar con las credenciales indicadas

No se requiere configuración adicional ni dependencias externas.

---

## 🚧 Posibles mejoras

- Consumo de estilos e implementación consistente con el diseño https://www.figma.com/design/pFG8ymYDeuRKDVFkzgPF7v/Pok%C3%A9dex--Community-?node-id=1016-1461&t=tq5iWSfzYl2MCesq-0
- Búsqueda de Pokémon por nombre
- Manejo de errores visible para el usuario
- Estados de carga y empty states más detallados
- Autenticación OAuth
- Tests unitarios

---

## 🧑‍💻 Autor
CAMILO LILLO

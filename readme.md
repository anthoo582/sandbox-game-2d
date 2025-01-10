# Juego Sandbox 2D

> Trabajo final de Programación de Videojuegos - UTU 2025

Juego sandbox 2D estilo Minecraft desarrollado en **GameMaker**. Explora un mundo generado proceduralmente, mina recursos y construye lo que quieras.

---

## Controles

| Acción | Tecla |
|--------|-------|
| Mover izquierda | `A` |
| Mover derecha | `D` |
| Correr | `Shift` + dirección |
| Saltar | `Espacio` |
| Romper bloque | `Click izquierdo` |
| Colocar bloque | `Click derecho` |

---

## Sistema de Generación

### Terreno
- **Altura variable**: El terreno se genera con curvas aleatorias usando ruido semi-aleatorio
- **Estructura por columnas**: Cada columna X tiene un bloque de pasto, 5 bloques de tierra, y piedra hasta el fondo
- **Capa base**: Última capa de piedra indestructible

### Minerales (por profundidad)
| Mineral | Profundidad | Rarezas |
|-----------|-------------|---------|
| Carbón | ~32-900 bloques | 18% |
| Hierro | ~64-500 bloques | 10% |
| Oro | ~64-320 bloques | 4% |
| Diamante | ~32-160 bloques | 2% |

### Vegetación
- **25%** de probabilidad de flor (14 tipos diferentes)
- **25%** de probabilidad de helecho
- **20%** de probabilidad de pasto alto
- Árboles generados aleatoriamente

---

## Arquitectura

```
objects/
├── object_player/      # Control del jugador (movimiento, animaciones)
├── object_generate/    # Generador del mundo
├── obj_DayNights/     # Ciclo día/noche
├── object_block/      # Bloques rompibles
├── object_grass/      # Superficie
├── object_dirt/       # Tierra
├── object_stone/      # Piedra
├── object_ore_*/      # Minerales (coal, iron, gold, diamond)
└── object_flower_*/   # Vegetación

scripts/
├── generate.gml       # Algoritmo de generación procedural
├── render.gml         # Sistema de renderizado
└── instance_create/   # Helpers de instanciación

sprites/
├── spr_player_*/      # Sprites del jugador
├── sprite_ore_*/      # Sprites de minerales
└── sprite_flower_*/   # Sprites de vegetación
```

---

## Sistemas Principales

### Jugador (`object_player`)
- Gravedad escalada por FPS
- Animaciones por estado: quieto, caminar, correr, saltar
- Detección de colisión con bloques sólidos

### Generador (`generate.gml`)
- Generación por chunks en tiempo real
- Sistema de dirección de terreno (sube/baja/recto) con longitud variable
- Clamping de altura para evitar picos extremos

### Render (`render.gml`)
- **Depth sorting**: `depth = y + offset` para orden de capas
- Vegetación por encima del terreno (`-25000`)
- Pasto en nivel medio (`-20000`)
- Tierra base (`-10000`)

---

## Ejecutar

1. Abrir en **GameMaker Studio 2**
2. Ejecutar room `rm_world`
3. El mundo se genera automáticamente al inicio

---

## Notas

- Motor: GameMaker Studio 2 (versión 2024.13.1.193)
- Resolución: adaptable
- FPS: 30/60 (con escalado de tiempo)

# 🎮 Accelerometer Maze Game

Juego móvil desarrollado en Flutter utilizando Flame, donde el jugador controla un personaje inclinando el dispositivo para esquivar trampas y llegar a la meta.

---

## 📱 Descripción

Este proyecto es un juego tipo **arcade basado en sensores**, en el cual el movimiento del jugador depende del **acelerómetro del dispositivo móvil**.

El objetivo es simple pero desafiante:

- 🎯 Llegar a la meta  
- ⚠️ Evitar trampas  
- 🎮 Controlar el movimiento inclinando el teléfono  

Cada nivel incrementa la dificultad, poniendo a prueba la precisión y control del jugador.

---

## 🚀 Características

- Control mediante **acelerómetro**
- Sistema de **niveles**
- Detección de colisiones
- Pantallas de:
  - 🏆 Victoria
  - 💀 Game Over
- Uso de **animaciones (sprites)**
- Interfaz simple e intuitiva

---

## 🛠️ Tecnologías utilizadas

- **Flutter** → Framework principal para desarrollo móvil  
- **Flame** → Motor de videojuegos 2D  
- **Dart** → Lenguaje de programación  
- **sensors_plus** → Acceso al acelerómetro del dispositivo  
- **Material Design** → UI básica para menús  

---

## 📂 Estructura del proyecto

lib/
│
├── game/
│ ├── my_game.dart # Lógica principal del juego
│ ├── level_data.dart # Definición de niveles
│ └── components/
│ ├── player.dart
│ ├── goal.dart
│ └── trap.dart
│
├── ui/
│ ├── menu_screen.dart
│ ├── game_screen.dart
│ ├── victory_overlay.dart
│ └── game_over_overlay.dart


---

## 🎮 Cómo jugar

1. Inicia el juego
2. Selecciona un nivel
3. Inclina tu dispositivo para mover al jugador
4. Evita las trampas
5. Llega a la meta para ganar

---

## ⚙️ Instalación

```bash
git clone https://github.com/tu-usuario/tu-repositorio.git
cd tu-repositorio
flutter pub get
flutter run

# AlertaYA - Personal Security App

AlertaYA es una aplicación móvil de seguridad personal construida en Flutter. Su objetivo principal es ofrecer a los usuarios una forma rápida e intuitiva de notificar a sus contactos de emergencia en situaciones de peligro, gestionar contactos y revisar el historial de alertas.

## Estructura del Proyecto

text
lib/
├── main.dart                   # Punto de entrada y configuración global (Theme)
├── models/                     # Clases de datos (Entidades)
│   ├── alert_event.dart        # Modelo para eventos del historial (Panic, Motion, etc.)
│   └── contact.dart            # Modelo para los contactos de emergencia
├── services/                   # Lógica de negocio y manejo de datos externos
│   └── contact_service.dart    # Servicio para leer y procesar JSON de forma asíncrona
├── theme/                      # Diseño y Estilos globales
│   └── app_theme.dart          # Paleta de colores (AppColors) y ThemeData oscuro
├── screens/                    # Vistas completas de la aplicación agrupadas por flujos
│   ├── auth/                   # Flujo de Autenticación
│   │   ├── login_screen.dart
│   │   └── register_screen.dart
│   ├── onboarding/             # Flujo de Configuración Inicial (Nuevos Usuarios)
│   │   ├── permissions_screen.dart
│   │   ├── add_contacts_screen.dart
│   │   └── voice_setup_screen.dart
│   ├── main/                   # Flujo Principal (Navegación Inferior)
│   │   ├── main_layout.dart    # Scaffold principal con BottomNavigationBar
│   │   ├── home_screen.dart    # Pantalla principal (Botón SOS)
│   │   ├── contacts_screen.dart# Gestión de contactos con swipe-to-delete
│   │   ├── history_screen.dart # Línea de tiempo de eventos pasados
│   │   └── settings_screen.dart# Ajustes y configuración del usuario
│   ├── alert/                  # Flujo de Emergencia
│   │   └── active_alert_screen.dart # Pantalla de alerta en vivo
│   └── splash_screen.dart      # Pantalla inicial de carga
└── widgets/                    # Componentes UI reutilizables
    └── contact_card.dart       # Tarjeta individual para mostrar un contacto

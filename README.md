# 🎯 Pulseboard Analytics Dashboard

A Flutter web application that showcases an interactive analytics dashboard for monitoring sensor data with custom bubble charts and real-time visualization.

## 📸 Screenshots

### Dashboard View
![Dashboard View](https://raw.githubusercontent.com/viralkachhadiya/pulseboard/main/screenshots/dashboard.png)
*Overview of all sensors with interactive bubble chart*

### Details View
![Details View](https://raw.githubusercontent.com/viralkachhadiya/pulseboard/main/screenshots/details.png)
*Detailed view of a specific sensor's metrics*

### Settings View
![Settings View](https://raw.githubusercontent.com/viralkachhadiya/pulseboard/main/screenshots/settings.png)
*Configuration options for simulation and display*

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Chrome browser (for web development)

### Installation
1. Clone the repository
```bash
git clone [repository-url]
```

2. Install dependencies
```bash
flutter pub get
```

3. Generate Freezed and AutoRoute files
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Run the application
```bash
flutter run -d chrome
```

## 📊 Features

- **Interactive Bubble Chart**
  - X-axis: Time (08:00-18:00) or Sensor Location
  - Y-axis: Temperature
  - Bubble Size: Humidity or Pressure (toggleable)
  - Bubble Color: Anomaly Level
    - 0% → Green
    - 1-50% → Yellow
    - 51-100% → Red
    - Offline → Gray

- **Multiple Screens**
  - Dashboard: High-level sensor overview
  - Details: Advanced charts for selected sensor/facility
  - Settings: Simulation toggles for offline sensors and error states

- **Data Ranges**
  - Temperature: 0°C - 100°C (typical: 22°C - 40°C)
  - Humidity: 0% - 100% (typical: 45% - 60%)
  - Pressure: 900 hPa - 1100 hPa (typical: ~1013 hPa)
  - Anomaly: 0-100% or offline (-1)

## 🏗️ Architecture

The project follows a domain-driven design with clear separation of concerns:

```
lib/
  core/
    constants/           # App-wide constants
    theme/              # Theme configuration
    utils/              # Utility functions
    widgets/            # Reusable widgets
  features/
    dashboard/
      data/
        datasources/    # Data sources
        models/         # Data models
        repositories/   # Repository implementations
      domain/
        entities/       # Business entities
        repositories/   # Repository interfaces
        usecases/       # Business logic
      presentation/
        bloc/          # State management
        pages/         # Screen pages
        widgets/       # Feature-specific widgets
    details/
      ...
    settings/
      ...
  l10n/                # Localization files
  routes/
    app_router.dart    # Navigation configuration
  main.dart            # App entry point
  bootstrap.dart       # App initialization
```

## 🛠️ Tech Stack

- **State Management**: Riverpod
- **Routing**: AutoRoute
- **Data Modeling**: Freezed
- **Charts**: Custom implementation with Flutter's CustomPaint
- **Testing**: flutter_test, mockito

## 🧪 Testing

Run tests using:
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/unit/sensor_data_test.dart
```

## 🧪 Run App using:

Run using:
```bash
# Run all tests
flutter run -d chrome
```

## 📝 Coding Guidelines

### General Practices
- Null safety implementation
- Error handling with Either type
- Clean architecture principles
- Proper widget composition
- AutoRouter for navigation
- Riverpod for state management
- GetIt for dependency injection

### Widget Guidelines
- Small, focused widgets
- Const constructors where possible
- Proper widget keys
- Responsive layouts
- Error boundaries
- Accessibility support

### Performance Optimization
- Image caching
- List view optimization
- Build method optimization
- Memory management
- Platform-specific optimizations

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

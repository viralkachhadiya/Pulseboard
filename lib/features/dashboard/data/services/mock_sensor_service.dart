import 'dart:async';
import 'package:pulseboard/features/dashboard/domain/models/sensor_data.dart';

class MockSensorService {
  final _controller = StreamController<List<SensorData>>.broadcast();
  Timer? _timer;
  final List<SensorData> _mockData = [];

  MockSensorService() {
    _initializeMockData();
    _startDataStream();
  }

  void _initializeMockData() {
    final locations = ['Room A', 'Room B', 'Room C', 'Room D'];
    final now = DateTime.now();

    for (var i = 0; i < locations.length; i++) {
      _mockData.add(
        SensorData(
          temperature: 20.0 + (i * 2.0),
          humidity: 50.0 + (i * 5.0),
          pressure: 1013.0 + (i * 2.0),
          anomaly: i == 2 ? 75 : 0, // Room C has an anomaly
          timestamp: now,
          location: locations[i],
        ),
      );
    }
  }

  void _startDataStream() {
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      final updatedData = _mockData.map((data) {
        return data.copyWith(
          temperature: data.temperature + (0.1 * (data.anomaly > 0 ? 2 : 1)),
          humidity: data.humidity + (0.5 * (data.anomaly > 0 ? 2 : 1)),
          pressure: data.pressure + (0.1 * (data.anomaly > 0 ? 2 : 1)),
          timestamp: DateTime.now(),
        );
      }).toList();

      _controller.add(updatedData);
    });
  }

  Stream<List<SensorData>> getSensorData() {
    return _controller.stream;
  }

  void dispose() {
    _timer?.cancel();
    _controller.close();
  }
}

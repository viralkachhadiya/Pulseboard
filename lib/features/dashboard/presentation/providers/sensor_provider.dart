import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulseboard/features/dashboard/data/services/mock_sensor_service.dart';
import 'package:pulseboard/features/dashboard/domain/models/sensor_data.dart';

final sensorServiceProvider = Provider<MockSensorService>((ref) {
  final service = MockSensorService();
  ref.onDispose(() => service.dispose());
  return service;
});

final sensorDataProvider = StreamProvider<List<SensorData>>((ref) {
  final service = ref.watch(sensorServiceProvider);
  return service.getSensorData();
});

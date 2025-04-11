import 'package:flutter_test/flutter_test.dart';
import 'package:pulseboard/features/dashboard/domain/entities/sensor_data.dart';
import 'package:pulseboard/features/dashboard/domain/entities/sensor_status.dart';

void main() {
  group('SensorData Tests', () {
    late SensorData sensorData;

    setUp(() {
      sensorData = SensorData(
        temperature: 25.0,
        humidity: 55.0,
        pressure: 1013.0,
        anomaly: 0,
        timestamp: DateTime.now(),
        location: 'Line A',
        status: SensorStatus.online,
      );
    });

    test('should create valid SensorData instance', () {
      expect(sensorData, isA<SensorData>());
      expect(sensorData.temperature, equals(25.0));
      expect(sensorData.humidity, equals(55.0));
      expect(sensorData.pressure, equals(1013.0));
      expect(sensorData.anomaly, equals(0));
      expect(sensorData.location, equals('Line A'));
      expect(sensorData.status, equals(SensorStatus.online));
    });

    test('should handle offline sensor status', () {
      final offlineSensor = sensorData.copyWith(
        status: SensorStatus.offline,
        anomaly: -1,
      );

      expect(offlineSensor.status, equals(SensorStatus.offline));
      expect(offlineSensor.anomaly, equals(-1));
    });

    test('should validate temperature range', () {
      expect(() => sensorData.copyWith(temperature: -1.0), throwsArgumentError);
      expect(() => sensorData.copyWith(temperature: 101.0), throwsArgumentError);
    });

    test('should validate humidity range', () {
      expect(() => sensorData.copyWith(humidity: -1.0), throwsArgumentError);
      expect(() => sensorData.copyWith(humidity: 101.0), throwsArgumentError);
    });

    test('should validate pressure range', () {
      expect(() => sensorData.copyWith(pressure: 899.0), throwsArgumentError);
      expect(() => sensorData.copyWith(pressure: 1101.0), throwsArgumentError);
    });

    test('should validate anomaly range', () {
      expect(() => sensorData.copyWith(anomaly: -2), throwsArgumentError);
      expect(() => sensorData.copyWith(anomaly: 101), throwsArgumentError);
    });

    test('should handle missing data', () {
      final sensorWithMissingData = sensorData.copyWith(
        temperature: null,
        humidity: null,
      );

      expect(sensorWithMissingData.temperature, isNull);
      expect(sensorWithMissingData.humidity, isNull);
    });

    test('should calculate anomaly level correctly', () {
      final lowAnomaly = sensorData.copyWith(anomaly: 25);
      final mediumAnomaly = sensorData.copyWith(anomaly: 50);
      final highAnomaly = sensorData.copyWith(anomaly: 75);

      expect(lowAnomaly.getAnomalyLevel(), equals(AnomalyLevel.low));
      expect(mediumAnomaly.getAnomalyLevel(), equals(AnomalyLevel.medium));
      expect(highAnomaly.getAnomalyLevel(), equals(AnomalyLevel.high));
    });
  });
}

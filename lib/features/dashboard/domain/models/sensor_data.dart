import 'package:freezed_annotation/freezed_annotation.dart';

part 'sensor_data.freezed.dart';
part 'sensor_data.g.dart';

@freezed
class SensorData with _$SensorData {
  const factory SensorData({
    required double temperature,
    required double humidity,
    required double pressure,
    required int anomaly,
    required DateTime timestamp,
    required String location,
  }) = _SensorData;

  factory SensorData.fromJson(Map<String, dynamic> json) =>
      _$SensorDataFromJson(json);
}

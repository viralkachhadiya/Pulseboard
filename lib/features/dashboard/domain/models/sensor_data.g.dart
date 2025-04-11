// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SensorDataImpl _$$SensorDataImplFromJson(Map<String, dynamic> json) =>
    _$SensorDataImpl(
      temperature: (json['temperature'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      pressure: (json['pressure'] as num).toDouble(),
      anomaly: (json['anomaly'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      location: json['location'] as String,
    );

Map<String, dynamic> _$$SensorDataImplToJson(_$SensorDataImpl instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'anomaly': instance.anomaly,
      'timestamp': instance.timestamp.toIso8601String(),
      'location': instance.location,
    };

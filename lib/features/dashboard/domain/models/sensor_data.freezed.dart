// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SensorData _$SensorDataFromJson(Map<String, dynamic> json) {
  return _SensorData.fromJson(json);
}

/// @nodoc
mixin _$SensorData {
  double get temperature => throw _privateConstructorUsedError;
  double get humidity => throw _privateConstructorUsedError;
  double get pressure => throw _privateConstructorUsedError;
  int get anomaly => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;

  /// Serializes this SensorData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SensorData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SensorDataCopyWith<SensorData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SensorDataCopyWith<$Res> {
  factory $SensorDataCopyWith(
          SensorData value, $Res Function(SensorData) then) =
      _$SensorDataCopyWithImpl<$Res, SensorData>;
  @useResult
  $Res call(
      {double temperature,
      double humidity,
      double pressure,
      int anomaly,
      DateTime timestamp,
      String location});
}

/// @nodoc
class _$SensorDataCopyWithImpl<$Res, $Val extends SensorData>
    implements $SensorDataCopyWith<$Res> {
  _$SensorDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SensorData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? humidity = null,
    Object? pressure = null,
    Object? anomaly = null,
    Object? timestamp = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: null == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as double,
      anomaly: null == anomaly
          ? _value.anomaly
          : anomaly // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SensorDataImplCopyWith<$Res>
    implements $SensorDataCopyWith<$Res> {
  factory _$$SensorDataImplCopyWith(
          _$SensorDataImpl value, $Res Function(_$SensorDataImpl) then) =
      __$$SensorDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double temperature,
      double humidity,
      double pressure,
      int anomaly,
      DateTime timestamp,
      String location});
}

/// @nodoc
class __$$SensorDataImplCopyWithImpl<$Res>
    extends _$SensorDataCopyWithImpl<$Res, _$SensorDataImpl>
    implements _$$SensorDataImplCopyWith<$Res> {
  __$$SensorDataImplCopyWithImpl(
      _$SensorDataImpl _value, $Res Function(_$SensorDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of SensorData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? humidity = null,
    Object? pressure = null,
    Object? anomaly = null,
    Object? timestamp = null,
    Object? location = null,
  }) {
    return _then(_$SensorDataImpl(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: null == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as double,
      anomaly: null == anomaly
          ? _value.anomaly
          : anomaly // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SensorDataImpl implements _SensorData {
  const _$SensorDataImpl(
      {required this.temperature,
      required this.humidity,
      required this.pressure,
      required this.anomaly,
      required this.timestamp,
      required this.location});

  factory _$SensorDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SensorDataImplFromJson(json);

  @override
  final double temperature;
  @override
  final double humidity;
  @override
  final double pressure;
  @override
  final int anomaly;
  @override
  final DateTime timestamp;
  @override
  final String location;

  @override
  String toString() {
    return 'SensorData(temperature: $temperature, humidity: $humidity, pressure: $pressure, anomaly: $anomaly, timestamp: $timestamp, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SensorDataImpl &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.pressure, pressure) ||
                other.pressure == pressure) &&
            (identical(other.anomaly, anomaly) || other.anomaly == anomaly) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, temperature, humidity, pressure,
      anomaly, timestamp, location);

  /// Create a copy of SensorData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SensorDataImplCopyWith<_$SensorDataImpl> get copyWith =>
      __$$SensorDataImplCopyWithImpl<_$SensorDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SensorDataImplToJson(
      this,
    );
  }
}

abstract class _SensorData implements SensorData {
  const factory _SensorData(
      {required final double temperature,
      required final double humidity,
      required final double pressure,
      required final int anomaly,
      required final DateTime timestamp,
      required final String location}) = _$SensorDataImpl;

  factory _SensorData.fromJson(Map<String, dynamic> json) =
      _$SensorDataImpl.fromJson;

  @override
  double get temperature;
  @override
  double get humidity;
  @override
  double get pressure;
  @override
  int get anomaly;
  @override
  DateTime get timestamp;
  @override
  String get location;

  /// Create a copy of SensorData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SensorDataImplCopyWith<_$SensorDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

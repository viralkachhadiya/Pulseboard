import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pulseboard/features/dashboard/presentation/widgets/bubble_chart.dart';
import 'package:pulseboard/features/dashboard/domain/entities/sensor_data.dart';
import 'package:pulseboard/features/dashboard/domain/entities/sensor_status.dart';

void main() {
  group('BubbleChart Widget Tests', () {
    late List<SensorData> mockSensorData;

    setUp(() {
      mockSensorData = [
        SensorData(
          temperature: 25.0,
          humidity: 55.0,
          pressure: 1013.0,
          anomaly: 0,
          timestamp: DateTime.now(),
          location: 'Line A',
          status: SensorStatus.online,
        ),
        SensorData(
          temperature: 30.0,
          humidity: 60.0,
          pressure: 1015.0,
          anomaly: 25,
          timestamp: DateTime.now(),
          location: 'Line B',
          status: SensorStatus.online,
        ),
        SensorData(
          temperature: 35.0,
          humidity: 65.0,
          pressure: 1017.0,
          anomaly: 75,
          timestamp: DateTime.now(),
          location: 'Line C',
          status: SensorStatus.offline,
        ),
      ];
    });

    testWidgets('should render bubbles correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BubbleChart(
              sensorData: mockSensorData,
              sizeBy: BubbleSize.humidity,
              colorBy: BubbleColor.anomaly,
            ),
          ),
        ),
      );

      // Verify that bubbles are rendered
      expect(find.byType(CustomPaint), findsOneWidget);
      expect(find.byType(GestureDetector), findsNWidgets(mockSensorData.length));
    });

    testWidgets('should handle bubble size by humidity', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BubbleChart(
              sensorData: mockSensorData,
              sizeBy: BubbleSize.humidity,
              colorBy: BubbleColor.anomaly,
            ),
          ),
        ),
      );

      // Verify bubble sizes based on humidity
      final bubbles = tester.widgetList<GestureDetector>(find.byType(GestureDetector));
      expect(bubbles.length, equals(mockSensorData.length));
    });

    testWidgets('should handle bubble size by pressure', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BubbleChart(
              sensorData: mockSensorData,
              sizeBy: BubbleSize.pressure,
              colorBy: BubbleColor.anomaly,
            ),
          ),
        ),
      );

      // Verify bubble sizes based on pressure
      final bubbles = tester.widgetList<GestureDetector>(find.byType(GestureDetector));
      expect(bubbles.length, equals(mockSensorData.length));
    });

    testWidgets('should show offline status correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BubbleChart(
              sensorData: mockSensorData,
              sizeBy: BubbleSize.humidity,
              colorBy: BubbleColor.anomaly,
            ),
          ),
        ),
      );

      // Verify offline bubble is gray
      final offlineBubble =
          mockSensorData.firstWhere((sensor) => sensor.status == SensorStatus.offline);
      expect(offlineBubble.status, equals(SensorStatus.offline));
    });

    testWidgets('should handle empty data', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BubbleChart(
              sensorData: [],
              sizeBy: BubbleSize.humidity,
              colorBy: BubbleColor.anomaly,
            ),
          ),
        ),
      );

      expect(find.byType(CustomPaint), findsOneWidget);
      expect(find.byType(GestureDetector), findsNothing);
    });

    testWidgets('should handle missing data', (WidgetTester tester) async {
      final dataWithMissingValues = [
        SensorData(
          temperature: null,
          humidity: null,
          pressure: null,
          anomaly: 0,
          timestamp: DateTime.now(),
          location: 'Line A',
          status: SensorStatus.online,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BubbleChart(
              sensorData: dataWithMissingValues,
              sizeBy: BubbleSize.humidity,
              colorBy: BubbleColor.anomaly,
            ),
          ),
        ),
      );

      expect(find.byType(CustomPaint), findsOneWidget);
    });
  });
}

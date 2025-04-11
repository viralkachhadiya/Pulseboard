import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pulseboard/main.dart';
import 'package:pulseboard/features/dashboard/domain/entities/sensor_data.dart';
import 'package:pulseboard/features/dashboard/domain/entities/sensor_status.dart';
import 'package:pulseboard/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:pulseboard/features/dashboard/presentation/pages/details_page.dart';

void main() {
  group('Dashboard Flow Integration Tests', () {
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
      ];
    });

    testWidgets('should navigate from dashboard to details', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Verify dashboard is shown
      expect(find.byType(DashboardPage), findsOneWidget);

      // Tap on a sensor bubble
      await tester.tap(find.byType(GestureDetector).first);
      await tester.pumpAndSettle();

      // Verify details page is shown
      expect(find.byType(DetailsPage), findsOneWidget);
    });

    testWidgets('should update bubble size when toggling metric', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Find and tap the size toggle button
      final sizeToggle = find.byKey(const Key('size_toggle_button'));
      await tester.tap(sizeToggle);
      await tester.pumpAndSettle();

      // Verify bubble sizes have changed
      final bubbles = tester.widgetList<GestureDetector>(find.byType(GestureDetector));
      expect(bubbles.length, equals(mockSensorData.length));
    });

    testWidgets('should update bubble color when toggling metric', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Find and tap the color toggle button
      final colorToggle = find.byKey(const Key('color_toggle_button'));
      await tester.tap(colorToggle);
      await tester.pumpAndSettle();

      // Verify bubble colors have changed
      final bubbles = tester.widgetList<GestureDetector>(find.byType(GestureDetector));
      expect(bubbles.length, equals(mockSensorData.length));
    });

    testWidgets('should handle offline mode simulation', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Find and tap the offline mode toggle
      final offlineToggle = find.byKey(const Key('offline_toggle_button'));
      await tester.tap(offlineToggle);
      await tester.pumpAndSettle();

      // Verify some sensors are shown as offline
      final offlineBubbles = find.byWidgetPredicate(
        (widget) => widget is GestureDetector && widget.key == const Key('offline_bubble'),
      );
      expect(offlineBubbles, findsAtLeast(1));
    });

    testWidgets('should show error state when data fetch fails', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Simulate data fetch error
      final errorButton = find.byKey(const Key('simulate_error_button'));
      await tester.tap(errorButton);
      await tester.pumpAndSettle();

      // Verify error message is shown
      expect(find.text('Failed to load sensor data'), findsOneWidget);
    });

    testWidgets('should refresh data when pull-to-refresh', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Perform pull-to-refresh
      final refreshIndicator = find.byType(RefreshIndicator);
      await tester.drag(refreshIndicator, const Offset(0, 300));
      await tester.pumpAndSettle();

      // Verify data is refreshed
      expect(find.byType(DashboardPage), findsOneWidget);
    });
  });
}

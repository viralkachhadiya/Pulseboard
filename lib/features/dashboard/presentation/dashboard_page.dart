import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulseboard/features/dashboard/presentation/providers/sensor_provider.dart';


@RoutePage()
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sensorDataAsync = ref.watch(sensorDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensor Dashboard'),
      ),
      body: sensorDataAsync.when(
        data: (sensorData) {
          return ListView.builder(
            itemCount: sensorData.length,
            itemBuilder: (context, index) {
              final data = sensorData[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(data.location),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Temperature: ${data.temperature.toStringAsFixed(1)}°C'),
                      Text('Humidity: ${data.humidity.toStringAsFixed(1)}%'),
                      Text('Pressure: ${data.pressure.toStringAsFixed(1)} hPa'),
                      if (data.anomaly > 0)
                        Text(
                          'Anomaly: ${data.anomaly}%',
                          style: const TextStyle(color: Colors.red),
                        ),
                    ],
                  ),
                  trailing: Text(
                    '${data.timestamp.hour}:${data.timestamp.minute.toString().padLeft(2, '0')}',
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}

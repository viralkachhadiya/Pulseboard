import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pulseboard/features/details/providers/bubble_chart_providers.dart';
import 'package:pulseboard/features/details/data/models/bubble_chart_model.dart';
import 'package:pulseboard/features/details/presentation/widgets/bubble_chart_widget.dart';

@RoutePage()
class DetailsPage extends ConsumerStatefulWidget {
  const DetailsPage({super.key});

  @override
  ConsumerState<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends ConsumerState<DetailsPage> {
  @override
  void initState() {
    super.initState();
    // Initialize with some sample data
    Future.microtask(() {
      final notifier = ref.read(bubbleChartProvider.notifier);
      notifier.addBubbleChartData(BubbleChartModel(
        id: '1',
        title: 'Temperature',
        value: 25.5,
        size: 30,
        color: '#FF5733',
        timestamp: DateTime.now(),
      ));
      notifier.addBubbleChartData(BubbleChartModel(
        id: '2',
        title: 'Humidity',
        value: 65.0,
        size: 40,
        color: '#33A1FF',
        timestamp: DateTime.now(),
      ));
      notifier.addBubbleChartData(BubbleChartModel(
        id: '3',
        title: 'Pressure',
        value: 1013.25,
        size: 35,
        color: '#33FF57',
        timestamp: DateTime.now(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensor Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                final titles = ['Temperature', 'Humidity', 'Pressure'];
                final icons = [Icons.thermostat, Icons.water_drop, Icons.speed];
                final colors = ['#FF5733', '#33A1FF', '#33FF57'];

                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: Icon(
                      icons[index],
                      color: Color(int.parse(colors[index].replaceAll('#', '0xFF'))),
                    ),
                    title: Text(titles[index]),
                    subtitle: Text('Click to view detailed chart'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigate to bubble chart with specific data
                      //context.router.push(
                      //   BubbleChartRoute(
                      //     title: titles[index],
                      //     color: colors[index],
                      //   ),
                      // );
                    },
                  ),
                );
              },
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Live Sensor Data Visualization',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Expanded(
            flex: 2,
            child: BubbleChartWidget(),
          ),
        ],
      ),
    );
  }
}

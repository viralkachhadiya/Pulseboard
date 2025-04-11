import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulseboard/features/details/providers/bubble_chart_providers.dart';
import 'package:pulseboard/features/details/data/models/bubble_chart_model.dart';

class BubbleChartWidget extends ConsumerWidget {
  const BubbleChartWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bubbleChartState = ref.watch(bubbleChartProvider);

    return Container(
      height: 400,
      padding: const EdgeInsets.all(16),
      child: bubbleChartState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : bubbleChartState.error != null
              ? Center(child: Text('Error: ${bubbleChartState.error}'))
              : _buildBubbleChart(context, bubbleChartState.bubbleData),
    );
  }

  Widget _buildBubbleChart(BuildContext context, List<BubbleChartModel> data) {
    if (data.isEmpty) {
      return const Center(child: Text('No data available'));
    }

    return CustomPaint(
      size: const Size(double.infinity, double.infinity),
      painter: BubbleChartPainter(data),
    );
  }
}

class BubbleChartPainter extends CustomPainter {
  final List<BubbleChartModel> data;

  BubbleChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width * 0.4;

    for (var i = 0; i < data.length; i++) {
      final item = data[i];
      final radius = (item.size / 100) * maxRadius;
      final angle = (i * 2 * pi) / data.length;
      final x = center.dx + (maxRadius * 0.8 * cos(angle));
      final y = center.dy + (maxRadius * 0.8 * sin(angle));

      final paint = Paint()
        ..color = Color(int.parse(item.color.replaceAll('#', '0xFF')))
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(x, y), radius, paint);

      // Draw text
      final textPainter = TextPainter(
        text: TextSpan(
          text: item.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, y - textPainter.height / 2),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

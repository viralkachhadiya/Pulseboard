import 'package:pulseboard/features/details/data/models/bubble_chart_model.dart';

abstract class BubbleChartRepository {
  Future<List<BubbleChartModel>> getBubbleChartData();
  Future<void> addBubbleChartData(BubbleChartModel data);
  Future<void> updateBubbleChartData(BubbleChartModel data);
  Future<void> deleteBubbleChartData(String id);
}

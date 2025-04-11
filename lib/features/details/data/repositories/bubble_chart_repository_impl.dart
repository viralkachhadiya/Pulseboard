import 'package:pulseboard/features/details/data/models/bubble_chart_model.dart';
import 'package:pulseboard/features/details/domain/repositories/bubble_chart_repository.dart';

class BubbleChartRepositoryImpl implements BubbleChartRepository {
  // TODO: Replace with actual API calls
  final List<BubbleChartModel> _bubbleData = [];

  @override
  Future<List<BubbleChartModel>> getBubbleChartData() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    return _bubbleData;
  }

  @override
  Future<void> addBubbleChartData(BubbleChartModel data) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    _bubbleData.add(data);
  }

  @override
  Future<void> updateBubbleChartData(BubbleChartModel data) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    final index = _bubbleData.indexWhere((d) => d.id == data.id);
    if (index != -1) {
      _bubbleData[index] = data;
    }
  }

  @override
  Future<void> deleteBubbleChartData(String id) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    _bubbleData.removeWhere((d) => d.id == id);
  }
}

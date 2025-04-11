import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulseboard/features/details/data/models/bubble_chart_model.dart';
import 'package:pulseboard/features/details/data/repositories/bubble_chart_repository_impl.dart';
import 'package:pulseboard/features/details/domain/repositories/bubble_chart_repository.dart';

// Repository Provider
final bubbleChartRepositoryProvider = Provider<BubbleChartRepository>((ref) {
  return BubbleChartRepositoryImpl();
});

// Bubble Chart State
class BubbleChartState {
  final bool isLoading;
  final List<BubbleChartModel> bubbleData;
  final String? error;

  BubbleChartState({
    this.isLoading = false,
    this.bubbleData = const [],
    this.error,
  });

  BubbleChartState copyWith({
    bool? isLoading,
    List<BubbleChartModel>? bubbleData,
    String? error,
  }) {
    return BubbleChartState(
      isLoading: isLoading ?? this.isLoading,
      bubbleData: bubbleData ?? this.bubbleData,
      error: error,
    );
  }
}

// Bubble Chart Notifier
class BubbleChartNotifier extends StateNotifier<BubbleChartState> {
  final BubbleChartRepository _repository;

  BubbleChartNotifier(this._repository) : super(BubbleChartState());

  Future<void> fetchBubbleChartData() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final data = await _repository.getBubbleChartData();
      state = state.copyWith(
        isLoading: false,
        bubbleData: data,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> addBubbleChartData(BubbleChartModel data) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.addBubbleChartData(data);
      await fetchBubbleChartData();
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> updateBubbleChartData(BubbleChartModel data) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.updateBubbleChartData(data);
      await fetchBubbleChartData();
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> deleteBubbleChartData(String id) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.deleteBubbleChartData(id);
      await fetchBubbleChartData();
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}

// Bubble Chart Provider
final bubbleChartProvider = StateNotifierProvider<BubbleChartNotifier, BubbleChartState>((ref) {
  final repository = ref.watch(bubbleChartRepositoryProvider);
  return BubbleChartNotifier(repository);
});

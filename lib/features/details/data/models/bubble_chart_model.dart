class BubbleChartModel {
  final String id;
  final String title;
  final double value;
  final double size;
  final String color;
  final DateTime timestamp;

  BubbleChartModel({
    required this.id,
    required this.title,
    required this.value,
    required this.size,
    required this.color,
    required this.timestamp,
  });

  factory BubbleChartModel.fromJson(Map<String, dynamic> json) {
    return BubbleChartModel(
      id: json['id'] as String,
      title: json['title'] as String,
      value: json['value'] as double,
      size: json['size'] as double,
      color: json['color'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'value': value,
      'size': size,
      'color': color,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

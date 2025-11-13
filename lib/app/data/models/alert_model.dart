class AlertModel {
  final String id;
  final String title;
  final String description;
  final String severity;
  final DateTime timestamp;
  final String location;

  AlertModel({
    required this.id,
    required this.title,
    required this.description,
    required this.severity,
    required this.timestamp,
    required this.location,
  });

  factory AlertModel.fromJson(Map<String, dynamic> json) {
    return AlertModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      severity: json['severity'],
      timestamp: DateTime.parse(json['timestamp']),
      location: json['location'],
    );
  }
}
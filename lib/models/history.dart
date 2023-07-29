

class HistoryModel {
  String initialStatus;
  String dateOn;
  String finalStatus;
  String dateOf;
  String duration;

  HistoryModel({
    required this.initialStatus,
    required this.dateOn,
    required this.finalStatus,
    required this.dateOf,
    required this.duration,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      initialStatus: json['initialStatus'] ?? "",
      dateOn: json['dateOn'] ?? "",
      finalStatus: json['finalStatus'] ?? "",
      dateOf: json['dateOf'] ?? "",
      duration: json['duration'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'initialStatus': initialStatus,
      'dateOn': dateOn,
      'finalStatus': finalStatus,
      'dateOf': dateOf,
      'duration': duration,
    };
  }
}

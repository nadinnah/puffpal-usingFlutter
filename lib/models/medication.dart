class Medication {
  final String name;
  final DateTime startTime;
  final int repeatHours;

  Medication({
    required this.name,
    required this.startTime,
    required this.repeatHours,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'startTime': startTime.toIso8601String(),
      'repeatHours': repeatHours,
    };
  }

  factory Medication.fromMap(Map<String, dynamic> map) {
    return Medication(
      name: map['name'],
      startTime: DateTime.parse(map['startTime']),
      repeatHours: map['repeatHours'],
    );
  }
}

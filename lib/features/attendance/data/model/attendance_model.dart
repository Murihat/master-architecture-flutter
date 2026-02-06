class AttendanceModel {
  final String imagePath;
  final DateTime time;

  AttendanceModel({required this.imagePath, required this.time});

  Map<String, dynamic> toJson() => {'image_path': imagePath, 'time': time.toIso8601String()};
}

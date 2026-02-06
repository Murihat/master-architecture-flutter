abstract class AttendanceState {}

class AttendanceInitial extends AttendanceState {}

class AttendanceLoading extends AttendanceState {}

class AttendanceReady extends AttendanceState {
  final String imagePath;
  AttendanceReady(this.imagePath);
}

class AttendanceError extends AttendanceState {
  final String message;
  AttendanceError(this.message);
}

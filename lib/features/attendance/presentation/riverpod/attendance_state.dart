abstract class AttendanceState {
  const AttendanceState();
}

class AttendanceInitial extends AttendanceState {
  const AttendanceInitial();
}

class AttendanceLoading extends AttendanceState {
  const AttendanceLoading();
}

class AttendanceReady extends AttendanceState {
  final String imagePath;
  const AttendanceReady(this.imagePath);
}

class AttendanceError extends AttendanceState {
  final String message;
  const AttendanceError(this.message);
}

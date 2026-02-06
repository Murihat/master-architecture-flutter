import '../model/attendance_model.dart';

class AttendanceRemoteDatasource {
  Future<void> submitAttendance(AttendanceModel model) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}

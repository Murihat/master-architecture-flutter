import '../../../../app/core/result/result.dart';
import '../entity/attendance_entity.dart';

abstract class AttendanceRepository {
  Future<Result<void>> submitAttendance(AttendanceEntity attendance);
}

import '../../../../app/core/error/failure.dart';
import '../../../../app/core/result/result.dart';
import '../../domain/entity/attendance_entity.dart';
import '../../domain/repository/attendance_repository.dart';
import '../datasource/attendance_remote_datasource.dart';
import '../model/attendance_model.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceRemoteDatasource remote;

  AttendanceRepositoryImpl(this.remote);

  @override
  Future<Result<void>> submitAttendance(AttendanceEntity attendance) async {
    try {
      final model = AttendanceModel(imagePath: attendance.imagePath, time: attendance.time);

      await remote.submitAttendance(model);
      return const Success(null);
    } catch (_) {
      return const FailureResult(NetworkFailure('Failed to submit attendance'));
    }
  }
}

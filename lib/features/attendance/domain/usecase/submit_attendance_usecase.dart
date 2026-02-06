import '../../../../app/core/result/result.dart';
import '../../../../app/core/usecase/usecase.dart';
import '../entity/attendance_entity.dart';
import '../repository/attendance_repository.dart';

class SubmitAttendanceUseCase extends UseCase<void, AttendanceEntity> {
  final AttendanceRepository repository;

  SubmitAttendanceUseCase(this.repository);

  @override
  Future<Result<void>> call(AttendanceEntity params) {
    return repository.submitAttendance(params);
  }
}

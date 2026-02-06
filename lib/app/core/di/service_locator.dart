import 'package:get_it/get_it.dart';
import '../../../features/attendance/data/datasource/attendance_remote_datasource.dart';
import '../../../features/attendance/data/repository/attendance_repository_impl.dart';
import '../../../features/attendance/domain/repository/attendance_repository.dart';
import '../../../features/attendance/domain/usecase/submit_attendance_usecase.dart';
import '../../../features/attendance/domain/usecase/take_photo_usecase.dart';

final sl = GetIt.instance;

/// panggil sekali di bootstrap()
Future<void> initDI() async {
  // ========================
  // DATASOURCE
  // ========================
  sl.registerLazySingleton<AttendanceRemoteDatasource>(() => AttendanceRemoteDatasource());

  // ========================
  // REPOSITORY
  // ========================
  sl.registerLazySingleton<AttendanceRepository>(
    () => AttendanceRepositoryImpl(sl<AttendanceRemoteDatasource>()),
  );

  // ========================
  // USE CASE
  // ========================
  sl.registerLazySingleton<TakePhotoUseCase>(() => TakePhotoUseCase());

  sl.registerLazySingleton<SubmitAttendanceUseCase>(
    () => SubmitAttendanceUseCase(sl<AttendanceRepository>()),
  );
}

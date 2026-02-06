import 'package:flutter_riverpod/legacy.dart';
import '../../../../app/core/di/service_locator.dart';
import '../../domain/usecase/submit_attendance_usecase.dart';
import '../../domain/usecase/take_photo_usecase.dart';
import 'attendance_notifier.dart';
import 'attendance_state.dart';

final attendanceProvider = StateNotifierProvider<AttendanceNotifier, AttendanceState>((ref) {
  return AttendanceNotifier(sl<TakePhotoUseCase>(), sl<SubmitAttendanceUseCase>());
});

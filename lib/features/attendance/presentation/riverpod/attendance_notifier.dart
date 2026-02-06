import 'package:flutter_riverpod/legacy.dart';
import '../../../../app/core/result/result.dart';
import '../../../../app/core/usecase/usecase.dart';
import '../../domain/entity/attendance_entity.dart';
import '../../domain/usecase/submit_attendance_usecase.dart';
import '../../domain/usecase/take_photo_usecase.dart';
import 'attendance_state.dart';

class AttendanceNotifier extends StateNotifier<AttendanceState> {
  final TakePhotoUseCase takePhoto;
  final SubmitAttendanceUseCase submitAttendance;

  String? _imagePath;

  AttendanceNotifier(this.takePhoto, this.submitAttendance) : super(const AttendanceInitial());

  Future<void> takePhotoAction() async {
    final result = await takePhoto(NoParams());

    switch (result) {
      case Success(data: final path):
        _imagePath = path;
        state = AttendanceReady(path);
      case FailureResult(failure: final failure):
        state = AttendanceError(failure.message);
    }
  }

  Future<void> submit() async {
    if (_imagePath == null) return;

    state = const AttendanceLoading();

    final result = await submitAttendance(
      AttendanceEntity(imagePath: _imagePath!, time: DateTime.now()),
    );

    switch (result) {
      case Success():
        // tetap di ready / bisa bikin SuccessState
        state = AttendanceReady(_imagePath!);
      case FailureResult(failure: final failure):
        state = AttendanceError(failure.message);
    }
  }
}

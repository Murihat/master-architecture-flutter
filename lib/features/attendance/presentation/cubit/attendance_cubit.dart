import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/core/result/result.dart';
import '../../../../app/core/usecase/usecase.dart';
import '../../domain/entity/attendance_entity.dart';
import '../../domain/usecase/submit_attendance_usecase.dart';
import '../../domain/usecase/take_photo_usecase.dart';
import '../bloc/attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  final TakePhotoUseCase takePhoto;
  final SubmitAttendanceUseCase submitAttendance;

  String? _imagePath;

  AttendanceCubit(this.takePhoto, this.submitAttendance) : super(AttendanceInitial());

  Future<void> takePhotoAction() async {
    final result = await takePhoto(NoParams());
    if (result is Success<String>) {
      _imagePath = result.data;
      emit(AttendanceReady(result.data));
    } else if (result is FailureResult<String>) {
      emit(AttendanceError(result.failure.message));
    }
  }

  Future<void> submit() async {
    emit(AttendanceLoading());

    final result = await submitAttendance(
      AttendanceEntity(imagePath: _imagePath!, time: DateTime.now()),
    );

    if (result is FailureResult) {
      emit(AttendanceError(result.failure.message));
    }
  }
}

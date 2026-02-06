import 'package:architecturemaster/features/attendance/domain/entity/attendance_entity.dart';
import 'package:get/get.dart';
import '../../../../app/core/result/result.dart';
import '../../../../app/core/usecase/usecase.dart';
import '../../domain/usecase/submit_attendance_usecase.dart';
import '../../domain/usecase/take_photo_usecase.dart';

class AttendanceGetxController extends GetxController {
  final TakePhotoUseCase takePhoto;
  final SubmitAttendanceUseCase submitAttendance;

  AttendanceGetxController(this.takePhoto, this.submitAttendance);

  final imagePath = ''.obs;
  final loading = false.obs;
  final error = ''.obs;

  Future<void> takePhotoAction() async {
    final result = await takePhoto(NoParams());
    if (result is Success<String>) {
      imagePath.value = result.data;
    } else if (result is FailureResult<String>) {
      error.value = result.failure.message;
    }
  }

  Future<void> submit() async {
    loading.value = true;

    final result = await submitAttendance(
      AttendanceEntity(imagePath: imagePath.value, time: DateTime.now()),
    );

    loading.value = false;

    if (result is FailureResult) {
      error.value = result.failure.message;
    }
  }
}

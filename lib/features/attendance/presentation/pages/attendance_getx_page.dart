import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/core/di/service_locator.dart';
import '../../domain/usecase/take_photo_usecase.dart';
import '../../domain/usecase/submit_attendance_usecase.dart';
import '../getx/attendance_getx_controller.dart';

class AttendanceGetxPage extends StatelessWidget {
  const AttendanceGetxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceGetxController>(
      init: AttendanceGetxController(sl<TakePhotoUseCase>(), sl<SubmitAttendanceUseCase>()),
      builder: (c) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => c.loading.value
                    ? const CircularProgressIndicator()
                    : Text(
                        c.imagePath.value.isEmpty ? 'Belum ada foto' : 'Foto: ${c.imagePath.value}',
                      ),
              ),
              ElevatedButton(onPressed: c.takePhotoAction, child: const Text('Ambil Foto')),
              ElevatedButton(onPressed: c.submit, child: const Text('Submit')),
            ],
          ),
        );
      },
    );
  }
}

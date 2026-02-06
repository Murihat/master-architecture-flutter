import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/core/di/service_locator.dart';
import '../../domain/usecase/take_photo_usecase.dart';
import '../../domain/usecase/submit_attendance_usecase.dart';
import '../bloc/attendance_state.dart';
import '../cubit/attendance_cubit.dart';

class AttendanceCubitPage extends StatelessWidget {
  const AttendanceCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AttendanceCubit(sl<TakePhotoUseCase>(), sl<SubmitAttendanceUseCase>()),
      child: const AttendanceCubitView(),
    );
  }
}

class AttendanceCubitView extends StatelessWidget {
  const AttendanceCubitView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceCubit, AttendanceState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state is AttendanceLoading) const CircularProgressIndicator(),

              if (state is AttendanceReady) Text('Foto: ${state.imagePath}'),

              ElevatedButton(
                onPressed: context.read<AttendanceCubit>().takePhotoAction,
                child: const Text('Ambil Foto'),
              ),
              ElevatedButton(
                onPressed: context.read<AttendanceCubit>().submit,
                child: const Text('Submit'),
              ),
            ],
          ),
        );
      },
    );
  }
}

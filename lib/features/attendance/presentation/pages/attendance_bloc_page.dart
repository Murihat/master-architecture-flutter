import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/core/di/service_locator.dart';
import '../../domain/usecase/take_photo_usecase.dart';
import '../../domain/usecase/submit_attendance_usecase.dart';
import '../bloc/attendance_bloc.dart';
import '../bloc/attendance_event.dart';
import '../bloc/attendance_state.dart';

class AttendanceBlocPage extends StatelessWidget {
  const AttendanceBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AttendanceBloc(sl<TakePhotoUseCase>(), sl<SubmitAttendanceUseCase>()),
      child: const AttendanceBlocView(),
    );
  }
}

class AttendanceBlocView extends StatelessWidget {
  const AttendanceBlocView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AttendanceBloc(sl<TakePhotoUseCase>(), sl<SubmitAttendanceUseCase>()),
      child: BlocBuilder<AttendanceBloc, AttendanceState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state is AttendanceLoading) const CircularProgressIndicator(),
                if (state is AttendanceReady) Text('Foto: ${state.imagePath}'),
                if (state is AttendanceError)
                  Text(state.message, style: const TextStyle(color: Colors.red)),
                ElevatedButton(
                  onPressed: () => context.read<AttendanceBloc>().add(TakePhotoEvent()),
                  child: const Text('Ambil Foto'),
                ),
                ElevatedButton(
                  onPressed: () => context.read<AttendanceBloc>().add(SubmitAttendanceEvent()),
                  child: const Text('Submit'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

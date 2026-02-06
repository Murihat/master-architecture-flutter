import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../riverpod/attendance_provider.dart';
import '../riverpod/attendance_state.dart';

class AttendanceRiverpodPage extends ConsumerWidget {
  const AttendanceRiverpodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(attendanceProvider);
    final notifier = ref.read(attendanceProvider.notifier);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (state is AttendanceLoading) const CircularProgressIndicator(),
          if (state is AttendanceReady) Text('Foto: ${state.imagePath}'),
          if (state is AttendanceError)
            Text(state.message, style: const TextStyle(color: Colors.red)),
          ElevatedButton(onPressed: notifier.takePhotoAction, child: const Text('Ambil Foto')),
          ElevatedButton(onPressed: notifier.submit, child: const Text('Submit')),
        ],
      ),
    );
  }
}

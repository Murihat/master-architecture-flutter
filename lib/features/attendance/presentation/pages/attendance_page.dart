import 'package:flutter/material.dart';

import 'attendance_bloc_page.dart';
import 'attendance_cubit_page.dart';
import 'attendance_getx_page.dart';
import 'attendance_riverpod_page.dart';

enum AttendanceStateType { getx, bloc, cubit, riverpod }

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  AttendanceStateType _type = AttendanceStateType.riverpod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
        actions: [
          DropdownButton<AttendanceStateType>(
            value: _type,
            underline: const SizedBox(),
            items: AttendanceStateType.values.map((e) {
              return DropdownMenuItem(value: e, child: Text(e.name.toUpperCase()));
            }).toList(),
            onChanged: (v) => setState(() => _type = v!),
          ),
        ],
      ),
      body: _buildPage(),
    );
  }

  Widget _buildPage() {
    switch (_type) {
      case AttendanceStateType.getx:
        return const AttendanceGetxPage();
      case AttendanceStateType.bloc:
        return const AttendanceBlocPage();
      case AttendanceStateType.cubit:
        return const AttendanceCubitPage();
      case AttendanceStateType.riverpod:
        return const AttendanceRiverpodPage();
    }
  }
}

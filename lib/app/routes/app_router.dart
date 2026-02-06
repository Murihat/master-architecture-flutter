import 'package:go_router/go_router.dart';
import '../../features/attendance/presentation/pages/attendance_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/attendance',
    routes: [
      GoRoute(
        path: '/attendance',
        builder: (context, state) {
          return const AttendancePage();
        },
      ),
    ],
  );
}

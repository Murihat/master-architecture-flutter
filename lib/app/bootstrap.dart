import 'package:flutter/material.dart';

import 'core/di/service_locator.dart';

Future<void> bootstrap(Future<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load();
  // await Supabase.initialize(
  //   url: dotenv.env['SUPABASE_URL']!,
  //   anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  // );
  await initDI();
  runApp(await builder());
}

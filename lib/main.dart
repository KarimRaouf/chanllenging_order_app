import 'package:chanllenging_order_app/core/routing/app_router.dart';
import 'package:chanllenging_order_app/order_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ScreenUtil.e
  await Supabase.initialize(
    url: 'https://bqsbarxgiycgmvghhvvt.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJxc2JhcnhnaXljZ212Z2hodnZ0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzkzMDQ2MzksImV4cCI6MjA1NDg4MDYzOX0.LLed3J5p8ZavAODYey7kJDEmz725ftYYfLLkQDuSrrM',
  );
  runApp(OrderApp(appRouter: AppRouter()));
}

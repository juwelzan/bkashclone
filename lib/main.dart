import 'package:bkashclone/app/app_config.dart';
import 'package:bkashclone/core/theme/theme_data.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemesData.light,
      title: "Bkash",
      home: AppConfig(),
    );
  }
}

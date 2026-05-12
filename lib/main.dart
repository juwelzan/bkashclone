import 'package:bkashclone/app/app_config.dart';
import 'package:bkashclone/core/provider/language_provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SchedulerBinding.instance.endOfFrame;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider()..init()),
      ],
      child: AppConfig(),
    );
  }
}

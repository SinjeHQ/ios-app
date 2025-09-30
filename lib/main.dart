import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/prospect.dart';
import 'screens/home_screen.dart';
import 'screens/form_screen.dart';
import 'screens/history_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProspectAdapter());
  await Hive.openBox<Prospect>('prospects');

  runApp(const ProspectApp());
}

class ProspectApp extends StatelessWidget {
  const ProspectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UIMM Occitanie – Collecte de prospects',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/form': (context) => const FormScreen(),
        '/history': (context) => const HistoryScreen(),
      },
    );
  }
} // test

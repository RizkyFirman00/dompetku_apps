import 'package:dompetku_apps/ui/add_transactions_page.dart';
import 'package:dompetku_apps/ui/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddTransactionsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

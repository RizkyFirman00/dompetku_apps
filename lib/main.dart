import 'package:dompetku_apps/LoanPage/loan_page.dart';
import 'package:dompetku_apps/ReportPage/report_page.dart';
import 'package:dompetku_apps/SettingPage/setting_page.dart';
import 'package:dompetku_apps/TransactionPage/add_transactions_page.dart';
import 'package:dompetku_apps/TransactionPage/home_page.dart';
import 'package:dompetku_apps/WalletPage/wallet_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        WalletPage.routeName: (context) => WalletPage(),
        AddTransactionsPage.routeName: (context) => AddTransactionsPage(),
        ReportPage.routeName: (context) => ReportPage(),
        LoanPage.routeName: (context) => LoanPage(),
        SettingPage.routeName: (context) => SettingPage()
      },
    );
  }
}

import 'package:dompetku_apps/LoanPage/loan_page.dart';
import 'package:dompetku_apps/TransactionPage/home_page.dart';
import 'package:dompetku_apps/WalletPage/wallet_page.dart';
import 'package:dompetku_apps/ReportPage/report_page.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});
  static const String routeName = "/setting";

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF2396F3),
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
              fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

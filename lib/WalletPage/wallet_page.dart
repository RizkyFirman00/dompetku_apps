import 'package:dompetku_apps/LoanPage/loan_page.dart';
import 'package:dompetku_apps/SettingPage/setting_page.dart';
import 'package:dompetku_apps/TransactionPage/home_page.dart';
import 'package:dompetku_apps/ReportPage/report_page.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});
  static const String routeName = '/wallet';

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        if (ModalRoute.of(context)?.settings.name != HomePage.routeName) {
          Navigator.pushNamed(context, HomePage.routeName);
        }
      } else if (_selectedIndex == 2) {
        if (ModalRoute.of(context)?.settings.name != ReportPage.routeName) {
          Navigator.pushNamed(context, ReportPage.routeName);
        }
      } else if (_selectedIndex == 3) {
        if (ModalRoute.of(context)?.settings.name != LoanPage.routeName) {
          Navigator.pushNamed(context, LoanPage.routeName);
        }
      } else if (_selectedIndex == 4) {
        if (ModalRoute.of(context)?.settings.name != SettingPage.routeName) {
          Navigator.pushNamed(context, SettingPage.routeName);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF2396F3),
        centerTitle: true,
        title: Text(
          "Wallets",
          style: TextStyle(
              fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF2396F3),
        shape: const CircleBorder(side: BorderSide.none),
        child: const Icon(Icons.add),
        foregroundColor: Colors.white,
      ),
    );
  }
}

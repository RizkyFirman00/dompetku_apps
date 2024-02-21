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
  int _selectedIndex = 4;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        if (ModalRoute.of(context)?.settings.name != HomePage.routeName) {
          Navigator.pushNamed(context, HomePage.routeName);
        }
      } else if (_selectedIndex == 1) {
        if (ModalRoute.of(context)?.settings.name != WalletPage.routeName) {
          Navigator.pushNamed(context, WalletPage.routeName);
        }
      } else if (_selectedIndex == 2) {
        if (ModalRoute.of(context)?.settings.name != ReportPage.routeName) {
          Navigator.pushNamed(context, ReportPage.routeName);
        }
      } else if (_selectedIndex == 3) {
        if (ModalRoute.of(context)?.settings.name != LoanPage.routeName) {
          Navigator.pushNamed(context, LoanPage.routeName);
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
          "Settings",
          style: TextStyle(
              fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: "Transactions",
            backgroundColor: Color(0xFF2396F3),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: "Wallet",
            backgroundColor: Color(0xFF2396F3),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq),
            label: "Report",
            backgroundColor: Color(0xFF2396F3),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sticky_note_2),
            label: "Loan",
            backgroundColor: Color(0xFF2396F3),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
            backgroundColor: Color(0xFF2396F3),
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
      ),
    );
  }
}

import 'package:dompetku_apps/LoanPage/loan_page.dart';
import 'package:dompetku_apps/ReportPage/report_page.dart';
import 'package:dompetku_apps/SettingPage/setting_page.dart';
import 'package:dompetku_apps/TransactionPage/add_transactions_page.dart';
import 'package:dompetku_apps/TransactionPage/home_page.dart';
import 'package:dompetku_apps/WalletPage/add_wallet_page.dart';
import 'package:dompetku_apps/WalletPage/edit_wallet_page.dart';
import 'package:dompetku_apps/WalletPage/wallet_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    WalletPage(),
    ReportPage(),
    LoanPage(),
    SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return CupertinoTheme(
          data: const CupertinoThemeData(
            textTheme: CupertinoTextThemeData(
              navTitleTextStyle: TextStyle(
                  fontFamily: '.SF UI Display',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          child: child!,
        );
      },
      home: Scaffold(
        body: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded),
              label: "Transaction",
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
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        AddTransactionsPage.routeName: (context) => AddTransactionsPage(),
        WalletPage.routeName: (context) => const WalletPage(),
        AddWalletPage.routeName: (context) => const AddWalletPage(),
        EditWalletPage.routeName: (context) => const EditWalletPage(),
        ReportPage.routeName: (context) => const ReportPage(),
        LoanPage.routeName: (context) => const LoanPage(),
        SettingPage.routeName: (context) => const SettingPage()
      },
    );
  }
}

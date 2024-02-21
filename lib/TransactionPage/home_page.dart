import 'package:dompetku_apps/LoanPage/loan_page.dart';
import 'package:dompetku_apps/SettingPage/setting_page.dart';
import 'package:dompetku_apps/TransactionPage/add_transactions_page.dart';
import 'package:dompetku_apps/WalletPage/wallet_page.dart';
import 'package:dompetku_apps/ReportPage/report_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = '/transaction';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
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
      } else if (_selectedIndex == 4) {
        if (ModalRoute.of(context)?.settings.name != SettingPage.routeName) {
          Navigator.pushNamed(context, SettingPage.routeName);
        }
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF2396F3),
        title: const SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back_ios,
                size: 18,
                color: Colors.white,
              ),
              Text("Tue, 20 Feb 2024",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.white,
              ),
            ],
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.history_rounded,
              size: 20,
              color: Colors.white,
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 8)),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 50,
                  decoration: const BoxDecoration(color: Color(0xFF2396F3)),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Income",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "0",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF2396F3),
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Expenses",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "0",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Balance",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "0",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (ModalRoute.of(context)?.settings.name !=
              AddTransactionsPage.routeName) {
            Navigator.pushNamed(context, AddTransactionsPage.routeName);
          }
        },
        backgroundColor: const Color(0xFF2396F3),
        shape: const CircleBorder(side: BorderSide.none),
        child: const Icon(Icons.add),
        foregroundColor: Colors.white,
      ),
    );
  }
}

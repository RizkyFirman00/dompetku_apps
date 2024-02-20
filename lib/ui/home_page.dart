import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF9F9F9),
        appBar: AppBar(
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
                    decoration: BoxDecoration(color: Color(0xFF2396F3)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
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
              label: "Settings",
              backgroundColor: Color(0xFF2396F3),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xFF2396F3),
          shape: CircleBorder(side: BorderSide.none),
          child: Icon(Icons.add),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

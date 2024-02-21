import 'package:dompetku_apps/WalletPage/add_wallet_page.dart';
import 'package:dompetku_apps/WalletPage/edit_wallet_page.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});
  static const String routeName = '/wallet';

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  List<Map<String, dynamic>> walletList = [];
  double totalBalance = 0;

  void addItem(String walletName, double balance) {
    Map<String, dynamic> walletInfo = {
      'walletName': walletName,
      'balance': balance,
    };

    setState(() {
      walletList.add(walletInfo);
    });
  }

  @override
  Widget build(BuildContext context) {
    addItem('BCA', 154890000);
    addItem('Shopeepay', 15329);
    addItem('Gopay', 90230);
    addItem('E-money', 215902);

    totalBalance =
        walletList.fold(0, (prev, current) => prev + current['balance']);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF2396F3),
        centerTitle: true,
        title: const Text(
          "Wallets",
          style: TextStyle(
              fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Balance",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          totalBalance
                              .toString()
                              .split('.')[0]
                              .replaceAllMapped(
                                RegExp(r'(\d{1,3})(?=\d{3})'),
                                (match) => '${match[0]}.',
                              ),
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: walletList.length,
                itemBuilder: (context, index) {
                  String walletName = walletList[index]['walletName'];
                  double balance = walletList[index]['balance'];
                  return GestureDetector(
                    onTap: () {
                      if (ModalRoute.of(context)?.settings.name !=
                          EditWalletPage.routeName) {
                        Navigator.pushNamed(context, EditWalletPage.routeName,
                            arguments: {
                              'walletName': walletName,
                              'balance': balance,
                            });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                walletName,
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    balance
                                        .toString()
                                        .split('.')[0]
                                        .replaceAllMapped(
                                          RegExp(r'(\d{1,3})(?=\d{3})'),
                                          (match) => '${match[0]}.',
                                        ),
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (ModalRoute.of(context)?.settings.name !=
              AddWalletPage.routeName) {
            Navigator.pushNamed(context, AddWalletPage.routeName);
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

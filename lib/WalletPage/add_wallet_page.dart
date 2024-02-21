import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AddWalletPage extends StatefulWidget {
  const AddWalletPage({super.key});
  static const String routeName = '/add_wallet';

  @override
  State<AddWalletPage> createState() => _AddWalletPageState();
}

class _AddWalletPageState extends State<AddWalletPage> {
  late TextEditingController amountController;

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController();
    amountController.addListener(() {
      _formatCurrency();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: const Color(0xFF2396F3),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 18,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Add Wallet",
          style: TextStyle(
              fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 12, top: 15),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Tittle",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: TextFormField(
                controller: amountController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Amount",
                  prefixText: "Rp. ",
                  suffixIcon: Icon(
                    Icons.calculate_rounded,
                    size: 30,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 100,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Save"),
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      backgroundColor: const Color(0xFF2396F3),
                      primary: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _formatCurrency() {
    final amountText = amountController.text.replaceAll(RegExp('[^0-9]'), '');

    try {
      final formattedAmount = NumberFormat.currency(
        locale: 'id_ID',
        decimalDigits: 0,
        symbol: '',
      ).format(int.parse(amountText));

      // Remove any trailing ".00" from the formatted amount
      final trimmedAmount = formattedAmount.replaceAll(RegExp(r'\.00$'), '');

      if (trimmedAmount != amountController.text) {
        amountController.value = amountController.value.copyWith(
          text: trimmedAmount,
          selection: TextSelection.collapsed(offset: trimmedAmount.length),
        );
      }
    } catch (e) {
      // Handle the case when parsing fails
      print('Error: $e');
    }
  }
}

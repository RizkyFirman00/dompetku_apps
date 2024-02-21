import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AddTransactionsPage extends StatefulWidget {
  AddTransactionsPage({super.key});
  static const String routeName = '/addTransactions';

  @override
  _AddTransactionsPageState createState() => _AddTransactionsPageState();
}

class _AddTransactionsPageState extends State<AddTransactionsPage> {
  // Dummy list of wallets
  final List<String> wallets = ['Wallet 1', 'Wallet 2', 'Wallet 3'];
  String selectedWallet = 'Wallet 1'; // Set an initial value

  late TextEditingController dateController;
  late TextEditingController amountController;

  @override
  void initState() {
    super.initState();
    // Set initial date to today
    dateController = TextEditingController(text: _getCurrentDate());
    // Initialize amount controller
    amountController = TextEditingController();
    amountController.addListener(() {
      _formatCurrency();
    });
  }

  String _getCurrentDate() {
    return DateFormat('E, d MMM y').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: const Color(0xFF2396F3),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 18,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Add Transaction",
          style: TextStyle(
              fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 12, top: 15),
                child: TextFormField(
                  controller: dateController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Date",
                    suffixIcon: Icon(
                      Icons.calendar_month_rounded,
                      size: 30,
                    ),
                  ),
                  onTap: () {
                    _selectDate(context);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: DropdownButtonFormField<String>(
                  value: selectedWallet,
                  items: wallets.map((String wallet) {
                    return DropdownMenuItem<String>(
                      value: wallet,
                      child: Text(wallet),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectedWallet = value!;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Wallet",
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
              Container(
                margin: const EdgeInsets.only(bottom: 12),
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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Category",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Description (Optional)",
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
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      dateController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
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

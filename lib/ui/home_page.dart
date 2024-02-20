import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 27, 115, 222),
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
                Text("Tanggal",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    )),
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
          child: const Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

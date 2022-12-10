import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SEMAS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const Expanded(
            child: SingleChildScrollView(
              child: Text("Hello World!"),
            ),
          ),
          Container(
            height: 100,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: Color(0xff0056a3),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 100,
                  child: Text(
                    "SECRETARIA DE ESTADO DE DESENVOLVIMENTO ECONÔMICO E SOCIAL - SEDESE",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Image.asset(
                  'images/logo-pa.png',
                  height: 80,
                  width: 80,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "GOVERNO",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "DO ESTADO",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "DO PARÁ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

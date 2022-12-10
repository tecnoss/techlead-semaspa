import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List _itens = [
    {
      "icon": Icons.compost,
      "title": "Conheça a SEMAS",
    },
    {
      "icon": Icons.sunny,
      "title": "Previsão do Tempo",
    },
    {
      "icon": Icons.connect_without_contact,
      "title": "Redes Sociais",
    },
    {
      "icon": Icons.library_books,
      "title": "Consultar Processos SIMLAM",
    },
    {
      "icon": Icons.manage_search,
      "title": "Consultar Portal da Transparência",
    },
    {
      "icon": Icons.language,
      "title": "Acessar Links Úteis",
    },
    {
      "icon": Icons.announcement,
      "title": "Realizar Denúncias na Ouvidoria",
    },
    {
      "icon": Icons.support_agent,
      "title": "Solicitar Chamados no CATIS",
    },
    {
      "icon": Icons.quiz,
      "title": "FAQs",
    },
  ];

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          16.height,
          const Text(
            "SEMAS",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          16.height,
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              "Clique no ícone que você deseja acessar",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 30,
              ),
              itemCount: _itens.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Icon(
                        _itens[index]["icon"],
                        size: 40,
                        color: const Color(0xff0056a3),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      _itens[index]["title"],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                );
              },
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

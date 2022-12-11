import 'package:flutter/material.dart';
import 'package:semasma/widgets/bottom_bar.dart';
import 'package:semasma/widgets/screen_title.dart';
import 'package:semasma/widgets/title_app_bar.dart';

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
      "route": "/conheca_semas",
    },
    {
      "icon": Icons.sunny,
      "title": "Previsão do Tempo",
      "route": "/previsao_tempo",
    },
    {
      "icon": Icons.connect_without_contact,
      "title": "Redes Sociais",
      "route": "/redes_sociais",
    },
    {
      "icon": Icons.library_books,
      "title": "Consultar Processos SIMLAM",
      "route": "/consultar_processos_simlam",
    },
    {
      "icon": Icons.manage_search,
      "title": "Consultar Portal da Transparência",
      "route": "/consultar_portal_transparencia",
    },
    {
      "icon": Icons.language,
      "title": "Acessar Links Úteis",
      "route": "/acessar_links_uteis",
    },
    {
      "icon": Icons.announcement,
      "title": "Realizar Denúncias na Ouvidoria",
      "route": "/realizar_denuncias_ouvidoria",
    },
    {
      "icon": Icons.support_agent,
      "title": "Solicitar Chamados no CATIS",
      "route": "/solicitar_chamados_catis",
    },
    {
      "icon": Icons.quiz,
      "title": "FAQs",
      "route": "/faqs",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleAppBar(),
        centerTitle: true,
      ),
      bottomNavigationBar: const BottomBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ScreenTitle(title: "SEMAS"),
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
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, _itens[index]["route"]);
                  },
                  child: Column(
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

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
      "icon": "assets/icons/home/semas.png",
      "title": "Conheça a SEMAS",
      "route": "/conheca_semas",
    },
    {
      "icon": "assets/icons/home/previsao_tempo.png",
      "title": "Previsão do Tempo",
      "route": "/previsao_tempo",
    },
    {
      "icon": "assets/icons/home/redes_sociais.png",
      "title": "Redes Sociais",
      "route": "/redes_sociais",
    },
    {
      "icon": "assets/icons/home/simlam.png",
      "title": "Consultar Processos SIMLAM",
      "route": "/consultar_processos_simlam",
    },
    {
      "icon": "assets/icons/home/portal_transparencia.png",
      "title": "Consultar Portal da Transparência",
      "route": "/consultar_portal_transparencia",
    },
    {
      "icon": "assets/icons/home/links_uteis.png",
      "title": "Acessar Links Úteis",
      "route": "/acessar_links_uteis",
    },
    {
      "icon": "assets/icons/home/denuncia_ouvidoria.png",
      "title": "Realizar Denúncias na Ouvidoria",
      "route": "/realizar_denuncias_ouvidoria",
    },
    {
      "icon": "assets/icons/home/catis.png",
      "title": "Solicitar Chamados no CATIS",
      "route": "/solicitar_chamados_catis",
    },
    {
      "icon": "assets/icons/home/faqs.png",
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
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            _itens[index]["icon"],
                            fit: BoxFit.fitHeight,
                          ),
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

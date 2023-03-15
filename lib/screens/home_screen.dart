import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:semasma/widgets/bottom_bar.dart';
import 'package:semasma/widgets/screen_title.dart';
import 'package:semasma/widgets/title_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List _itens = [
    {
      "id": "conheca-semas",
      "icon": "assets/icons/home/semas.png",
      "title": "Conheça a SEMAS",
      "route": "/about_semas",
    },
    {
      "id": "previsao-tempo",
      "icon": "assets/icons/home/previsao_tempo.png",
      "title": "Previsão do Tempo",
      "route": "/previsao_tempo",
    },
    {
      "id": "redes-sociais",
      "icon": "assets/icons/home/redes_sociais.png",
      "title": "Redes Sociais",
      "route": "/redes_sociais",
    },
    {
      "id": "processo-simlam",
      "icon": "assets/icons/home/simlam.png",
      "title": "Consultar Processos SIMLAM",
      "route": "/processo_simlam",
    },
    {
      "id": "portal-transparencia",
      "icon": "assets/icons/home/portal_transparencia.png",
      "title": "Consultar Portal da Transparência",
      "route": "/portal_transparencia",
    },
    {
      "id": "links-uteis",
      "icon": "assets/icons/home/links_uteis.png",
      "title": "Acessar Links Úteis",
      "route": "/links_uteis",
    },
    {
      "id": "denuncia-ouvidoria",
      "icon": "assets/icons/home/denuncia_ouvidoria.png",
      "title": "Realizar Denúncias na Ouvidoria",
      "route": "/denuncia_ouvidoria",
    },
    {
      "id": "portal-atos-autorizativos",
      "icon": "assets/icons/home/portal_atos_autorizativos.png",
      "title": "Portal dos Atos Autorizativos",
      "route": "/",
    },
    // {
    //   "icon": "assets/icons/home/catis.png",
    //   "title": "Solicitar Chamados no CATIS",
    //   "route": "/chamado_catis",
    // },
    {
      "id": "faqs",
      "icon": "assets/icons/home/faqs.png",
      "title": "FAQs",
      "route": "/faqs",
    },
  ];
  Future<void> _launchURL(String target) async {
    final Uri url = Uri.parse(target);
    if (!await launchUrl(url)) {
      debugPrint('Could not launch $url');
    }
  }

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
          const ScreenTitle(title: "Área Inicial"),
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
          24.height,
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
                    if (_itens[index]["id"] == "processo-simlam") {
                      _launchURL(
                          "https://monitoramento.semas.pa.gov.br/simlam/index.htm");
                    } else if (_itens[index]["id"] == "faqs") {
                      _launchURL(
                          "https://www.semas.pa.gov.br/transparencia-publica/perguntas-frequentes/");
                    } else if (_itens[index]["id"] ==
                        "portal-atos-autorizativos") {
                      _launchURL(
                          "https://portal-dos-atos-autorizativos.semas.pa.gov.br/");
                    } else if (_itens[index]["id"] == "portal-transparencia") {
                      _launchURL(
                          "http://portaldatransparencia.semas.pa.gov.br/#/visao-publica");
                    } else {
                      Navigator.pushNamed(context, _itens[index]["route"]);
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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

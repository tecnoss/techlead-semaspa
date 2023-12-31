import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:semasma/widgets/bottom_bar.dart';
import 'package:semasma/widgets/leading.dart';
import 'package:semasma/widgets/screen_title.dart';
import 'package:semasma/widgets/title_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class LinksUteisScreen extends StatefulWidget {
  const LinksUteisScreen({super.key});

  @override
  State<LinksUteisScreen> createState() => _LinksUteisScreenState();
}

class _LinksUteisScreenState extends State<LinksUteisScreen> {
  Future<void> _launchURL(String target) async {
    final Uri url = Uri.parse(target);
    if (!await launchUrl(url)) {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleAppBar(),
        leading: const Leading(),
      ),
      bottomNavigationBar: const BottomBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ScreenTitle(title: 'Acessar Links Úteis'),
              const Text(
                'Escolha o sistema que deseja acessar:',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              16.height,
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: InkWell(
                      onTap: () => _launchURL(
                        'https://www.semas.pa.gov.br/',
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          'assets/icons/links_uteis/brasao-semas.png',
                          width: 100.0,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: InkWell(
                      onTap: () => _launchURL(
                        'https://www.semas.pa.gov.br/seloverde/',
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          'assets/icons/links_uteis/selo-verde.png',
                          width: 100.0,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: InkWell(
                      onTap: () => _launchURL(
                        'https://sislam.pa.gov.br/',
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          'assets/icons/links_uteis/sislam.png',
                          width: 100.0,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: InkWell(
                      onTap: () => _launchURL(
                        'http://car.semas.pa.gov.br/#/',
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          'assets/icons/links_uteis/car.png',
                          width: 100.0,
                        ),
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
}

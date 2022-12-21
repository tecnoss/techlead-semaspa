import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:semasma/widgets/bottom_bar.dart';
import 'package:semasma/widgets/leading.dart';
import 'package:semasma/widgets/screen_title.dart';
import 'package:semasma/widgets/title_app_bar.dart';

class DenunciaOuvidoriaScreen extends StatefulWidget {
  const DenunciaOuvidoriaScreen({super.key});

  @override
  State<DenunciaOuvidoriaScreen> createState() =>
      _DenunciaOuvidoriaScreenState();
}

class _DenunciaOuvidoriaScreenState extends State<DenunciaOuvidoriaScreen> {
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
              const ScreenTitle(title: 'Canal de Denúncias'),
              const Text(
                'Selecione o tipo de denúncia que gostaria de fazer',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                shrinkWrap: true,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                children: [
                  _buildCard(
                    icon: Icons.clean_hands,
                    color: Colors.green.shade700,
                    title: 'Crimes Ambientais',
                  ),
                  _buildCard(
                    icon: Icons.factory,
                    color: Colors.yellow.shade800,
                    title: 'Irregularidade de Empreendimentos',
                  ),
                  _buildCard(
                    icon: Icons.home_work,
                    color: Colors.blue.shade900,
                    title: 'Irregularidade no Serviço Público',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required Color color,
    required String title,
    required IconData icon,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  size: 56,
                  color: Colors.white,
                ),
                const Icon(
                  Icons.more_vert,
                  size: 32,
                  color: Colors.white,
                ),
              ],
            ),
            16.height,
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:semasma/widgets/bottom_bar.dart';
import 'package:semasma/widgets/leading.dart';
import 'package:semasma/widgets/screen_title.dart';
import 'package:semasma/widgets/title_app_bar.dart';

import 'select_denuncia_screen.dart';

class DenunciaOuvidoriaScreen extends StatefulWidget {
  const DenunciaOuvidoriaScreen({super.key});

  @override
  State<DenunciaOuvidoriaScreen> createState() =>
      _DenunciaOuvidoriaScreenState();
}

class _DenunciaOuvidoriaScreenState extends State<DenunciaOuvidoriaScreen> {
  final List<String> _crimesAmbientaisList = [
    'Desmatamento',
    'Poluição do Rio',
    'Queimada',
    'Poluição do Ar',
    'Poluição Sonora',
    'Assoreamento',
    'Desmatamento e Aterramento das Nascentes',
    'Poluição Hídrica',
    'Extração Minerária Ilegal',
    'Extração de Madeira Ilegal',
    'Extração de Area Ilegal',
    'Descarte Inadequado de Resíduos',
  ];

  final List<String> _irregularidadesEmpreendimentos = [
    'Empreendimento Atuando sem CEPROF',
    'Empresa Atuando sem Licença Ambiental',
    'Serraria Clandestina',
    'Carvoaria Irregular',
    'Terreno Abandonado',
    'Abastecimento de Balsa em Local Inadequado',
    'Instalação Irregular de Subestação de Energia Elétrica',
    'Armazenamento Irregular de Caroço de Açaí',
    'Comércio Ilegal de Carne Animal',
    'CAR Irregular',
    'Sobreposição de CAR',
  ];

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
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/denuncia_ouvidoria/select_denuncia',
                      arguments: SelectDenunciaScreenArguments(
                        titleScreen: 'Crimes Ambientais',
                        listOptions: _crimesAmbientaisList,
                      ),
                    ),
                  ),
                  _buildCard(
                    icon: Icons.factory,
                    color: Colors.yellow.shade800,
                    title: 'Irregularidade de Empreendimentos',
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/denuncia_ouvidoria/select_denuncia',
                      arguments: SelectDenunciaScreenArguments(
                        titleScreen: 'Irregularidade de Empreendimentos',
                        listOptions: _irregularidadesEmpreendimentos,
                      ),
                    ),
                  ),
                  _buildCard(
                    icon: Icons.home_work,
                    color: Colors.blue.shade900,
                    title: 'Irregularidade no Serviço Público',
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/denuncia_ouvidoria/select_denuncia',
                      arguments: SelectDenunciaScreenArguments(
                        titleScreen: 'Irregularidade no Serviço Público',
                        listOptions: _crimesAmbientaisList,
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

  Widget _buildCard({
    required Color color,
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      color: color,
      child: InkWell(
        onTap: onTap,
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:semasma/screens/denuncia_ouvidoria/repository/report_provider.dart';
import 'package:semasma/widgets/bottom_bar.dart';
import 'package:semasma/widgets/custom_button.dart';
import 'package:semasma/widgets/leading.dart';
import 'package:semasma/widgets/screen_title.dart';
import 'package:semasma/widgets/title_app_bar.dart';

import 'screens/select_denuncia_screen.dart';

class DenunciaOuvidoriaScreen extends StatefulWidget {
  const DenunciaOuvidoriaScreen({super.key});

  @override
  State<DenunciaOuvidoriaScreen> createState() =>
      _DenunciaOuvidoriaScreenState();
}

class _DenunciaOuvidoriaScreenState extends State<DenunciaOuvidoriaScreen> {
  Future<void> checkOfflineReports() async {
    bool? isAnyReport =
        await context.read<ReportProvider>().isAnyOfflineReport();

    if (isAnyReport == null || isAnyReport == false) {
      debugPrint('Não nenhuma denúncia offline');
    } else {
      _showOfflineReportsDialog();
      debugPrint('Existe denúncia offline');
    }
  }

  _showDialogOffline() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.warning,
              color: Colors.orange,
              size: 40,
            ),
            16.height,
            const Text(
              'Você está sem conexão com a internet. Por favor, tente novamente mais tarde.',
              textAlign: TextAlign.center,
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'Ok',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showOfflineReportsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.warning,
              color: Colors.orange,
              size: 40,
            ),
            16.height,
            const Text(
              'Você possui denúncia(s) não enviada(s)! Deseja enviá-la(s) agora ou mais tarde?',
              textAlign: TextAlign.center,
            ),
            16.height,
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (!await _checkConnection()) {
                      _showDialogOffline();
                      return;
                    }
                    if (context.mounted) {
                      context.read<ReportProvider>().sendOfflineReports();
                      Navigator.pop(context);
                      _showDialogStatus();
                    }
                  },
                  child: const Text('Enviar já'),
                ),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text(
                      'Enviar mais\n tarde',
                      textAlign: TextAlign.center,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showDialogStatus() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Consumer<ReportProvider>(
          builder: (context, reportProvider, child) {
            bool isError = reportProvider.errorOffline;
            bool isSending = reportProvider.sendingOffline;

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isError) ...[
                  const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 40,
                  ),
                  16.height,
                  const Text(
                    'Ocorreu um erro ao enviar a(s) denúncia(s). Por favor, tente novamente mais tarde.',
                    textAlign: TextAlign.center,
                  ),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: 'Ok',
                      ),
                    ],
                  )
                ] else if (isSending) ...[
                  const SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(),
                  ),
                  16.height,
                  const Text(
                    'Enviando denúncia(s)...',
                    textAlign: TextAlign.center,
                  ),
                ] else ...[
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 40,
                  ),
                  16.height,
                  const Text(
                    'Denúncia(s) enviada(s) com sucesso!',
                    textAlign: TextAlign.center,
                  ),
                  16.height,
                  CustomButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: 'Ok',
                  )
                ],
              ],
            );
          },
        ),
      ),
    );
  }

  Future<bool> _checkConnection() async {
    ConnectivityResult isConnected = await Connectivity().checkConnectivity();

    if (isConnected == ConnectivityResult.none) {
      return false;
    }
    return true;
  }

  @override
  void initState() {
    checkOfflineReports();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleAppBar(),
        leading: const Leading(),
        centerTitle: true,
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
                      ),
                    ),
                  ),
                  _buildCard(
                    icon: Icons.factory,
                    color: const Color(0xffA81010),
                    title: 'Irregularidade de Empreendimentos',
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/denuncia_ouvidoria/select_denuncia',
                      arguments: SelectDenunciaScreenArguments(
                        titleScreen: 'Irregularidade de Empreendimentos',
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

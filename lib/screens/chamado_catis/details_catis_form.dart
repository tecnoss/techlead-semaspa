import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:semasma/widgets/bottom_bar.dart';
import 'package:semasma/widgets/custom_button.dart';
import 'package:semasma/widgets/leading.dart';
import 'package:semasma/widgets/screen_title.dart';
import 'package:semasma/widgets/texfield_with_label.dart';
import 'package:semasma/widgets/title_app_bar.dart';

class DetailCatisForm extends StatefulWidget {
  const DetailCatisForm({super.key});

  @override
  State<DetailCatisForm> createState() => _DetailCatisFormState();
}

class _DetailCatisFormState extends State<DetailCatisForm> {
  void _showConfirmationDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                size: 64,
                color: Colors.green,
              ),
              16.height,
              const Text(
                'Seu chamado foi enviado com sucesso!!!',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              48.height,
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.pop(context),
                    Navigator.pushReplacementNamed(
                      context,
                      '/chamado_catis',
                    )
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleAppBar(title: 'SEMAS'),
        leading: const Leading(),
      ),
      bottomNavigationBar: const BottomBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ScreenTitle(title: 'Solicitar chamados CATIS'),
              16.height,
              const Text(
                'Formulário',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              16.height,
              const TextFieldWithLabel(
                label: 'E-mail:',
                isRequired: true,
                hintText: 'Digite o seu e-mail',
              ),
              16.height,
              const TextFieldWithLabel(
                label: 'Descrição:',
                isRequired: true,
                hintText: '',
                maxLines: 10,
              ),
              16.height,
              const Text(
                "Anexo",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              8.height,
              Container(
                height: 100,
                decoration: const BoxDecoration(
                  border: null,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Arquivo(s) (50 MB máx)",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[200],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              child: const Text(
                                "Escolher Arquivos",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            8.width,
                            const Text(
                              "Nenhum arquivo escolhido",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              16.height,
              CustomButton(onPressed: _showConfirmationDialog, text: "Enviar"),
            ],
          ),
        ),
      ),
    );
  }
}

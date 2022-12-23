import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:semasma/widgets/bottom_bar.dart';
import 'package:semasma/widgets/custom_button.dart';
import 'package:semasma/widgets/leading.dart';
import 'package:semasma/widgets/screen_title.dart';
import 'package:semasma/widgets/texfield_with_label.dart';
import 'package:semasma/widgets/title_app_bar.dart';

class CatisFormScreen extends StatefulWidget {
  const CatisFormScreen({super.key});

  @override
  State<CatisFormScreen> createState() => _CatisFormScreenState();
}

class _CatisFormScreenState extends State<CatisFormScreen> {
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
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              32.height,
              const TextFieldWithLabel(
                label: 'Título do Chamado:',
                isRequired: true,
                hintText: 'Digite o título do seu chamado...',
              ),
              16.height,
              const TextFieldWithLabel(
                label: 'Categoria:',
                isRequired: true,
                hintText: '-----',
                isSelect: true,
              ),
              16.height,
              const TextFieldWithLabel(
                label: 'Origem da Requisição:',
                isRequired: true,
                hintText: 'Formulário',
                isSelect: true,
              ),
              16.height,
              const TextFieldWithLabel(
                label: 'Localização:',
                isRequired: true,
                hintText: '-----',
                isSelect: true,
              ),
              16.height,
              const TextFieldWithLabel(
                label: 'Ramal ou Celular:',
                isRequired: true,
                hintText: '------',
              ),
              16.height,
              const TextFieldWithLabel(
                label: 'Setor:',
                isRequired: true,
                hintText: '------',
              ),
              32.height,
              CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/chamado_catis/details');
                },
                text: 'Prosseguir',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

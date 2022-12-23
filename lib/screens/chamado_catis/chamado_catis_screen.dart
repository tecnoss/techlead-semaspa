import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:semasma/widgets/bottom_bar.dart';
import 'package:semasma/widgets/leading.dart';
import 'package:semasma/widgets/screen_title.dart';
import 'package:semasma/widgets/title_app_bar.dart';

class ChamadoCatisSCreen extends StatefulWidget {
  const ChamadoCatisSCreen({super.key});

  @override
  State<ChamadoCatisSCreen> createState() => _ChamadoCatisSCreenState();
}

class _ChamadoCatisSCreenState extends State<ChamadoCatisSCreen> {
  List<Map> topics = [
    {
      'title': 'Suporte ao Usuário',
      'items': [
        'Antivírus',
        'Impressora',
        'Instalação/Desinstalação/Atualização de Aplicativos',
        'Equipamentos (PC, Monitor, Teclado, Mouse, etc.)',
      ]
    },
    {
      'title': 'Desenvolvimento de Sistemas',
      'items': [
        'Solicitação de Projeto',
        'Alterações no Sistema',
        'Análise de Requisitos',
      ]
    },
    {
      'title': 'Redes e Comunicação',
      'items': [
        'Cadastro de Usuário na Rede',
        'Cadastro de E-mail Institucional',
        'Redefinição de Senha de Rede, E-mail Institucional',
      ]
    },
    {
      'title': 'Sistemas Corporativos',
      'items': [
        'Gestão de Demandas - LDI - Portal de Entrada Única - PRA - SICAR - SIGERH - SISFAP - SISFLOR',
      ]
    }
  ];

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
              const Text(
                'Bem vindo a Central de Atendimento de Tecnologia da Informação da SEMAS (CATIS)',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              32.height,
              const Text(
                'Para requisições, dúvidas ou informações, preencha o formulário abaixo e sua mensagem será enviada para a Diretoria de Tecnologia da Informação (DTI).',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
              24.height,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => _topics(
                  title: topics[index]['title'],
                  items: topics[index]['items'],
                ),
                itemCount: topics.length,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/chamado_catis/form');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Acessar Formulário',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topics({required String title, required List<String> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '- $title',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        4.height,
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items.map((e) {
              return Text(
                e,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}

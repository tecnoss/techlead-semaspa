import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:semasma/widgets/custom_scaffold.dart';

import 'data_table_widget.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class ExpandModel {
  final String title;
  bool isExpanded;
  Widget child;

  ExpandModel({
    required this.title,
    this.isExpanded = false,
    this.child = const SizedBox(),
  });
}

TextStyle _style = const TextStyle(
  fontSize: 10.0,
  color: Colors.black87,
);

class ProccessDetailModel {
  final String title;
  final String value;

  ProccessDetailModel({
    required this.title,
    required this.value,
  });
}

final List<ProccessDetailModel> _proccessDetailList = [
  ProccessDetailModel(
    title: 'Número do Processo:',
    value: '2006/0000212347',
  ),
  ProccessDetailModel(
    title: 'Tipo de Processo:',
    value: 'Licenciamento Ambiental',
  ),
  ProccessDetailModel(
    title: 'Situação:',
    value: 'Deferido',
  ),
  ProccessDetailModel(
    title: 'Arquivado no Setor:',
    value: 'Gerência de Arquivo',
  ),
  ProccessDetailModel(
    title: 'Interessado:',
    value: 'INDUSTRIA MADEREIRA BARBOSA E SANTOS LTDA',
  ),
  ProccessDetailModel(
    title: 'Empreendimento',
    value: 'MADEIREIRA TRES AMIGOS LTDA ME',
  ),
];

class _FaqsScreenState extends State<FaqsScreen> {
  final List<ExpandModel> _list = [
    ExpandModel(
      title: 'Dados',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.description,
            color: Colors.green,
          ),
          16.height,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _proccessDetailList.length,
            itemBuilder: (context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _proccessDetailList[index].title,
                    style: const TextStyle(
                      fontSize: 10.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  4.width,
                  Text(
                    _proccessDetailList[index].value,
                    style: const TextStyle(
                      fontSize: 10.0,
                      color: Colors.black87,
                    ),
                  ),
                  16.height,
                ],
              );
            },
          ),
        ],
      ),
    ),
    ExpandModel(
      title: 'Movimentação do Processo',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.description,
            color: Colors.green,
          ),
          16.height,
          DataTableWidget(),
        ],
      ),
    ),
    ExpandModel(
      title: 'Documentos e Processos juntados a este Processo',
      child: Text(
        'Não existem Documentos/Processos juntados a este Processo.',
        style: _style,
      ),
    ),
    ExpandModel(
      title: 'Atividades Licenciadas',
      child: Text(
        'Não existem atividades licenciadas para este Processo.',
        style: _style,
      ),
    ),
    ExpandModel(
      title: 'Responsáveis Técnicos',
      child: Text(
        'Não existem responsáveis técnicos para este Processo.',
        style: _style,
      ),
    ),
    ExpandModel(
      title: 'Títulos Emitidos para este Processo',
      child: Text(
        'Não existem títulos emitidos para este Processo.',
        style: _style,
      ),
    ),
    ExpandModel(
      title: 'Pendências',
      child: Text(
        'Não existem pendências para este Processo.',
        style: _style,
      ),
    ),
    ExpandModel(
      title: 'Processo Digitalizado',
      child: Text(
        'Não existem processos digitalizados.',
        style: _style,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'SEMAS',
      screenTitle: 'FAQs',
      child: [
        const Text(
          'Escolha qual pergunta você gostaria de saber',
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        16.height,
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _list[index].isExpanded = !isExpanded;
              });
            },
            children: _list.map((ExpandModel item) {
              return ExpansionPanel(
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 16.0, left: 16.0, right: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      item.child,
                    ],
                  ),
                ),
                isExpanded: item.isExpanded,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

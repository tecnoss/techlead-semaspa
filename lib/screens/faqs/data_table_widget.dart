import 'package:flutter/material.dart';
import 'package:semasma/utils/app_colors.dart';

class MovimentacaoModel {
  final String setorOrigem;
  final String dataHoraEnvio;
  final String setorDestino;
  final String dataHoraRecebimento;

  MovimentacaoModel({
    required this.setorOrigem,
    required this.dataHoraEnvio,
    required this.setorDestino,
    required this.dataHoraRecebimento,
  });
}

class DataTableWidget extends StatelessWidget {
  DataTableWidget({super.key});

  final TextStyle _headerStyle = const TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  final TextStyle _bodyStyle = const TextStyle(
    fontSize: 10.0,
    color: Colors.black87,
  );

  final List<String> _list = [
    'Setor de Origem',
    'Data/Hora Envio',
    'Setor de Destino',
    'Data/Hora Recebimento',
  ];

  final List<MovimentacaoModel> _movimentacaoList = [
    MovimentacaoModel(
      setorOrigem: 'Gerência de Projetos Agrosilvi...',
      dataHoraEnvio: '02/04/2012 11:34:07',
      setorDestino: 'Gabinete do Secretário',
      dataHoraRecebimento: '02/04/2012 11:34:07',
    ),
    MovimentacaoModel(
      setorOrigem: 'Gabinete do Secretário',
      dataHoraEnvio: '02/04/2012 11:34:07',
      setorDestino: 'Gerência de Projetos Agrosilvi...',
      dataHoraRecebimento: '02/04/2012 11:34:07',
    ),
    MovimentacaoModel(
      setorOrigem: 'Seção de Comunicação',
      dataHoraEnvio: '02/04/2012 11:34:07',
      setorDestino: 'Gabiente do Secretário',
      dataHoraRecebimento: '02/04/2012 11:34:07',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: [
        TableRow(
            children: _list.map((String item) {
          return Container(
            padding: const EdgeInsets.all(8.0),
            color: appColorPrimary,
            child: Center(
              child: Text(
                item,
                textAlign: TextAlign.center,
                style: _headerStyle,
              ),
            ),
          );
        }).toList()),
        ..._movimentacaoList.map((MovimentacaoModel item) {
          return TableRow(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    item.setorOrigem,
                    style: _bodyStyle,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    item.dataHoraEnvio,
                    style: _bodyStyle,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    item.setorDestino,
                    style: _bodyStyle,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    item.dataHoraRecebimento,
                    style: _bodyStyle,
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ],
    );
  }
}

import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:semasma/screens/denuncia_ouvidoria/models/municipio_model.dart';

void getCSVData() async {
  // Lê o arquivo CSV como uma lista de linhas
  List<List<dynamic>> data = await readCsv('assets/dm.csv');

  List<Municipio> municipios = [];

  Municipio municipio = Municipio();

  // Itera sobre cada linha
  for (List row in data) {
    String mun = row[0].split(';')[0];

    if (mun != municipio.name) {
      if (municipio.name != null) {
        municipios.add(municipio.copy());
        municipio = Municipio();
      }

      municipio.name = mun;
    }

    String prop = row[0].split(';')[1];

    if (prop == 'Telefone') {
      municipio.telefones = row[0].split(';')[2];
    } else if (prop == 'E-mail') {
      municipio.emails = row[0].split(';')[2];
    } else if (prop == 'Link') {
      municipio.site = row[0].split(';')[2];
    } else if (prop == 'Endereço') {
      municipio.endereco = row[0].split(';')[2];
    }
  }

  saveToJson(municipios);
}

void saveToJson(List<Municipio> municipios) async {
  List<Map<String, dynamic>> json = [];

  for (Municipio municipio in municipios) {
    json.add(municipio.toClipBoard());
  }

  await Clipboard.setData(ClipboardData(text: json.toString()));
}

Future<List<List<dynamic>>> readCsv(String path) async {
  // Lê o arquivo como uma string
  String csv = await rootBundle.loadString(path);

  // Decode o CSV usando a biblioteca csv
  List<List<dynamic>> rows = const CsvToListConverter().convert(csv);

  return rows;
}

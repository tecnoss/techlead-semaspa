import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:semasma/screens/denuncia_ouvidoria/models/subject_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ReportProvider extends ChangeNotifier {
  Subject? subject;
  String? identification;
  String? email;
  String? tipoLocalizacao;
  String? lat;
  String? lng;
  String? municipio;
  String? endereco;
  String? numero;
  String? bairro;
  String? pontoReferencia;
  String? ncar;
  String? date;
  String? message;
  List<String>? files;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _success = false;
  bool get success => _success;
  set success(bool value) {
    _success = value;
    notifyListeners();
  }

  bool _trySend = false;
  bool get trySend => _trySend;
  set trySend(bool value) {
    _trySend = value;
    notifyListeners();
  }

  bool _isError = false;
  bool get isError => _isError;
  set isError(bool value) {
    _isError = value;
    notifyListeners();
  }

  bool _sending = false;
  bool get sending => _sending;
  set sending(bool value) {
    _sending = value;
    notifyListeners();
  }

  final String url =
      "http://appmobile-integracao.semas.pa.gov.br:8443/api/mail/send";

  void setDetails({
    required String date,
    required String message,
  }) {
    this.date = date;
    this.message = message;
    notifyListeners();
  }

  addFiles(String file) {
    files!.add(file);
    notifyListeners();
  }

  void setFiles(List<String> files) {
    this.files = files;
    notifyListeners();
  }

  void setData({
    required String tipoLocalizacao,
    required String lat,
    required String lng,
    required String municipio,
    required String endereco,
    required String numero,
    required String bairro,
    required String pontoReferencia,
    required String ncar,
  }) {
    this.tipoLocalizacao = tipoLocalizacao;
    this.lat = lat;
    this.lng = lng;
    this.municipio = municipio;
    this.endereco = endereco;
    this.numero = numero;
    this.bairro = bairro;
    this.pontoReferencia = pontoReferencia;
    this.ncar = ncar;
    notifyListeners();
  }

  Future<void> sendEmail() async {
    String to = "thiago.nascimento@techlead.com.br";
    String subject =
        "Denúncia de ${this.subject!.escopo} - ${this.subject!.name}";
    String format = "Html";

    // Criar um objeto MultipartRequest
    var request = http.MultipartRequest('POST', Uri.parse(url));

    if (files != null) {
      for (var file in files!) {
        request.files
            .add(await http.MultipartFile.fromPath('attachments', file));
      }
    }

    try {
      trySend = true;
      isLoading = true;
      isError = false;
      sending = true;

      request.fields['to'] = to;
      request.fields['subject'] = subject;
      request.fields['format'] = format;
      request.fields['body'] = formatHTML();

      await request.send();
      debugPrint("Enviado com sucesso!");
      success = true;
      isLoading = false;
      sending = false;
      // _resetFields();
    } catch (e) {
      debugPrint(e.toString());
      success = false;
      isLoading = false;
      isError = true;
      sending = false;
    }
  }

  Future<void> saveOnLocalStorage() async {
    try {
      isLoading = true;
      isError = false;
      sending = true;

      String myClassJson = jsonEncode({
        "subject": subject,
        "identification": identification,
        "email": email,
        "tipoLocalizacao": tipoLocalizacao,
        "lat": lat,
        "lng": lng,
        "municipio": municipio,
        "endereco": endereco,
        "numero": numero,
        "bairro": bairro,
        "pontoReferencia": pontoReferencia,
        "ncar": ncar,
        "date": date,
        "message": message,
        "files": files!.map((e) => e.toString()).toList(),
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('denuncia', myClassJson);

      isLoading = false;
      sending = false;
      _resetFields();
    } catch (e) {
      debugPrint(e.toString());
      isLoading = false;
      isError = true;
      sending = false;
    }
  }

  void _resetFields() {
    subject = null;
    identification = null;
    email = null;
    tipoLocalizacao = null;
    lat = null;
    lng = null;
    municipio = null;
    endereco = null;
    numero = null;
    bairro = null;
    pontoReferencia = null;
    ncar = null;
    date = null;
    message = null;
    files = [];
    notifyListeners();
  }

  String formatHTML() {
    String html = "<html><body>";
    html += "<h3>DADOS DO USUÁRIO</h3>";
    html += "<p><b>Nome</b>: $identification</p>";
    html += "<p><b>E-mail</b>: ${email ?? ' -- '}</p><br><br>";

    html += "<h3>LOCALIZAÇÃO DO ATO ILÍCITO</h3>";
    html += "<p><b>Tipo de Localização</b>: $tipoLocalizacao</p>";
    html += "<p><b>Latitude</b>: $lat</p>";
    html += "<p><b>Longitude</b>: $lng</p>";
    html += "<p><b>Município</b>: $municipio</p>";
    html += "<p><b>Endereço</b>: $endereco</p>";
    html += "<p><b>Número</b>: $numero</p>";
    html += "<p><b>Bairro</b>: $bairro</p>";
    html += "<p><b>Ponto de Referência</b>: $pontoReferencia</p>";
    html += "<p><b>Número do CAR</b>: $ncar</p><br><br>";

    html += "<h3>INFORMAÇÕES DO ATO ILÍCITO</h3>";
    html += "<p><b>Data do Ocorrido</b>: $date</p>";
    html += "<p><b>Mensagem do Ocorrido</b>: $message</p><br><br>";

    html += "</body></html>";
    return html;
  }

  @override
  String toString() => '''
    ReportProvider {
      subject: ${subject.toString()},
      identification: $identification,
      email: $email,
      lat: $lat,
      lng: $lng,
      municipio: $municipio,
      endereco: $endereco,
      numero: $numero,
      bairro: $bairro,
      pontoReferencia: $pontoReferencia,
      ncar: $ncar,
      date: $date,
      message: $message,
    }
  ''';

  Map toJson() => {
        'subject': subject,
        'identification': identification,
        'email': email,
        'tipoLocalizacao': tipoLocalizacao,
        'lat': lat,
        'lng': lng,
        'municipio': municipio,
        'endereco': endereco,
        'numero': numero,
        'bairro': bairro,
        'pontoReferencia': pontoReferencia,
        'ncar': ncar,
        'date': date,
        'message': message,
        'files': files!.map((e) => e.toString()).toList(),
      };
}

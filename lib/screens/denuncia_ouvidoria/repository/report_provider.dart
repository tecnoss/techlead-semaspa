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

  bool _sendingOffline = false;
  bool get sendingOffline => _sendingOffline;
  set sendingOffline(bool value) {
    _sendingOffline = value;
    notifyListeners();
  }

  bool _errorOffline = false;
  bool get errorOffline => _errorOffline;
  set errorOffline(bool value) {
    _errorOffline = value;
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

  void setAddress({
    required String municipio,
    required String endereco,
    required String numero,
    required String bairro,
    required String lat,
    required String lng,
  }) {
    this.municipio = municipio;
    this.endereco = endereco;
    this.numero = numero;
    this.bairro = bairro;
    this.lat = lat;
    this.lng = lng;
    notifyListeners();
  }

  Future<void> sendEmail() async {
    String to =
        "aisc@semas.pa.gov.br;ouvidoria@semas.pa.gov.br;semasouvidoria@gmail.com";

    if (email != null) {
      to += ";$email";
    }

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
      _resetFields();
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
        "subject": subject!.toJson(),
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
      List<String> reports = [];
      reports.add(myClassJson);
      List<String>? getReports = prefs.getStringList('reports');

      if (getReports != null) {
        reports.addAll(getReports);
      }

      Set<String> setReport = <String>{};

      for (var item in reports) {
        setReport.add(item);
      }

      await prefs.setStringList('reports', reports.toList());

      isLoading = false;
      sending = false;

      _resetFields();
    } catch (e) {
      debugPrint("Erro aqui: $e");
      isLoading = false;
      isError = true;
      sending = false;
    }
  }

  Future<bool>? isAnyOfflineReport() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? getReports = prefs.getStringList('reports');
    if (getReports != null) {
      debugPrint("Tem relatório offline: $getReports");
      return true;
    } else {
      return false;
    }
  }

  Future<void> sendOfflineReports() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sendingOffline = true;
    errorOffline = false;

    List<String>? getReports = prefs.getStringList('reports');
    if (getReports != null) {
      for (var item in getReports) {
        Map<String, dynamic> report = jsonDecode(item);

        subject = Subject.fromJson(report['subject']);
        identification = report['identification'];
        email = report['email'];
        tipoLocalizacao = report['tipoLocalizacao'];
        lat = report['lat'];
        lng = report['lng'];
        municipio = report['municipio'];
        endereco = report['endereco'];
        numero = report['numero'];
        bairro = report['bairro'];
        pontoReferencia = report['pontoReferencia'];
        ncar = report['ncar'];
        date = report['date'];
        message = report['message'];
        files = report['files'].cast<String>();

        try {
          await sendEmail();
        } catch (e) {
          errorOffline = true;
          debugPrint("Erro ao enviar relatório offline: $e");
        }
      }
    }

    sendingOffline = false;
    if (!errorOffline) {
      await prefs.remove('reports');
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

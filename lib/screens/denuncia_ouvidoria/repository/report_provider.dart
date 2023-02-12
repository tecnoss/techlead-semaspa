import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:semasma/screens/denuncia_ouvidoria/models/subject_model.dart';

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

    try {
      await Dio().post(
        url,
        data: FormData.fromMap({
          "to": to,
          "subject": subject,
          "format": format,
          "body": formatHTML(),
        }),
      );
      debugPrint("Enviado com sucesso!");
    } catch (e) {
      debugPrint(e.toString());
    }
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
}

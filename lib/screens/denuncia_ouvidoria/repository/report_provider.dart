import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:semasma/screens/denuncia_ouvidoria/models/subject_model.dart';

class ReportProvider extends ChangeNotifier {
  Subject? subject;
  String? identification;
  String? email;
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
    required String lat,
    required String lng,
    required String municipio,
    required String endereco,
    required String numero,
    required String bairro,
    required String pontoReferencia,
    required String ncar,
  }) {
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
    String subject = "[${this.subject!.escopo}][${this.subject!.name}]";
    String format = "Html";

    final Map<String, String> body = {
      "identification": identification.toString(),
      "email": email.toString(),
      "lat": lat.toString(),
      "lng": lng.toString(),
      "municipio": municipio.toString(),
      "endereco": endereco.toString(),
      "numero": numero.toString(),
      "bairro": bairro.toString(),
      "pontoReferencia": pontoReferencia.toString(),
      "ncar": ncar.toString(),
      "date": date.toString(),
      "message": message.toString(),
    };

    String formattedBody = bodyToHTML(body);

    try {
      final response = await Dio().post(
        url,
        data: FormData.fromMap({
          "to": to,
          "subject": subject,
          "format": format,
          "body": formattedBody,
        }),
      );
      print("Enviado com sucesso!");
      print(response);
    } catch (e) {
      print("Erro ao enviar email!");
      print(e);
    }
  }

  String bodyToHTML(Map<String, String> body) {
    String html = "<html><body>";
    body.forEach((key, value) {
      html += "<p><b>$key</b>: $value</p>";
    });
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

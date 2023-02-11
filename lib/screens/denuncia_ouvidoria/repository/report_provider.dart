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

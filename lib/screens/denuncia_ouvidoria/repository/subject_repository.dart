import 'package:flutter/material.dart';
import 'package:semasma/screens/denuncia_ouvidoria/models/subject_model.dart';

class SubjectRepository extends ChangeNotifier {
  final List<String> _crimesAmbientaisList = [
    'Assoreamento',
    'Descarte Irregular de Resíduos',
    'Desmatamento',
    'Desmatamento e Aterramento das Nascentes',
    'Extração de Areia Ilegal (e outros)',
    'Extração Minerária Ilegal',
    'Extração de Madeira Ilegal',
    'Maus Tratos a Animais',
    'Poluição do Rio',
    'Queimada',
    'Poda Irregular de Árvore',
    'Poluição do Ar',
    'Poluição Sonora (som alto)',
    'Poluição Hídrica',
    'Poluição do Solo',
    'Outros',
  ];

  final List<String> _irregularidadesEmpreendimentos = [
    'Abastecimento de Balsa em Local Inadequado',
    'Armazenamento Irregular de Caroço de Açaí',
    'Atuação sem CTDAM',
    'CAR Irregular',
    'Comércio Ilegal de Carne Animal',
    'Empreendimento Atuando sem CEPROF',
    'Empreendimento sem Licença Ambiental',
    'Empreendimento sem Outorga',
    'Serraria Irregular',
    'Sobreposição de CAR',
    'Transporte Irregular de Produtos Florestais',
    'Outros',
  ];

  final List<String> _irregularidadeServicoPublico = [
    'Conduta do Servidor',
    'Demora de Resposta de Setor',
    'Reclamação do Serviço Público',
    'Outros',
  ];

  List<Subject> subjects = [];

  SubjectRepository() {
    for (var element in _crimesAmbientaisList) {
      subjects.add(Subject(
        escopo: 'Crimes Ambientais',
        name: element,
        competencia: getCompetencia(element),
      ));
    }

    for (var element in _irregularidadesEmpreendimentos) {
      subjects.add(Subject(
        escopo: 'Irregularidade de Empreendimentos',
        name: element,
        competencia: getCompetencia(element),
      ));
    }

    for (var element in _irregularidadeServicoPublico) {
      subjects.add(Subject(
        escopo: 'Irregularidade no Serviço Público',
        name: element,
        competencia: getCompetencia(element),
      ));
    }

    subjects.sort(customCompare);
  }

  int customCompare(Subject a, Subject b) {
    if (a.name == "Outros") {
      return 1;
    } else if (b.name == "Outros") {
      return -1;
    } else {
      return a.name.compareTo(b.name);
    }
  }

  String getCompetencia(String name) {
    List<String> compMunicipal = [
      'Maus Tratos a Animais',
      'Poda Irregular de Árvore',
      'Poluição Sonora (som alto)',
      'Armazenamento Irregular de Caroço de Açaí',
    ];

    if (compMunicipal.contains(name)) {
      return 'Município';
    } else {
      return 'SEMAS';
    }
  }

  List<Subject> getSubjectsByScope(String scope) {
    return subjects.where((element) => element.escopo == scope).toList();
  }
}

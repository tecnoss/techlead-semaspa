class Weather {
  final int id;
  final int regiaoId;
  final int minima;
  final int maxima;
  final String dia;
  final int umidadeRelativaMinima;
  final int umidadeRelativaMaxima;
  final String horaPorDoSol;
  final String horaNascerDoSol;
  final String previsao;
  final String icone;
  final String previsaoManha;
  final String iconeManha;
  final String previsaoTarde;
  final String iconeTarde;
  final String previsaoNoite;
  final String iconeNoite;

  Weather({
    required this.id,
    required this.regiaoId,
    required this.minima,
    required this.maxima,
    required this.dia,
    required this.umidadeRelativaMinima,
    required this.umidadeRelativaMaxima,
    required this.horaPorDoSol,
    required this.horaNascerDoSol,
    required this.previsao,
    required this.icone,
    required this.previsaoManha,
    required this.iconeManha,
    required this.previsaoTarde,
    required this.iconeTarde,
    required this.previsaoNoite,
    required this.iconeNoite,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      regiaoId: json['regiao_id'],
      minima: json['minima'],
      maxima: json['maxima'],
      dia: json['dia'],
      umidadeRelativaMinima: json['umidade_relativa_minima'],
      umidadeRelativaMaxima: json['umidade_relativa_maxima'],
      horaPorDoSol: json['hora_por_do_sol'],
      horaNascerDoSol: json['hora_nascer_do_sol'],
      previsao: json['previsao'] ?? '',
      icone: json['icone'],
      previsaoManha: json['previsao_manha'],
      iconeManha: json['icone_manha'],
      previsaoTarde: json['previsao_tarde'],
      iconeTarde: json['icone_tarde'],
      previsaoNoite: json['previsao_noite'],
      iconeNoite: json['icone_noite'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'regiao_id': regiaoId,
      'minima': minima,
      'maxima': maxima,
      'dia': dia,
      'umidade_relativa_minima': umidadeRelativaMinima,
      'umidade_relativa_maxima': umidadeRelativaMaxima,
      'hora_por_do_sol': horaPorDoSol,
      'hora_nascer_do_sol': horaNascerDoSol,
      'previsao': previsao,
      'icone': icone,
      'previsao_manha': previsaoManha,
      'icone_manha': iconeManha,
      'previsao_tarde': previsaoTarde,
      'icone_tarde': iconeTarde,
      'previsao_noite': previsaoNoite,
      'icone_noite': iconeNoite,
    };
  }

  @override
  String toString() {
    return 'Weather{id: $id, regiaoId: $regiaoId, minima: $minima, maxima: $maxima, dia: $dia, umidadeRelativaMinima: $umidadeRelativaMinima, umidadeRelativaMaxima: $umidadeRelativaMaxima, horaPorDoSol: $horaPorDoSol, horaNascerDoSol: $horaNascerDoSol, previsao: $previsao, icone: $icone, previsaoManha: $previsaoManha, iconeManha: $iconeManha, previsaoTarde: $previsaoTarde, iconeTarde: $iconeTarde, previsaoNoite: $previsaoNoite, iconeNoite: $iconeNoite}';
  }
}

class Subject {
  String escopo;
  String name;
  String competencia;

  Subject({
    required this.escopo,
    required this.name,
    required this.competencia,
  });

  Subject.fromJson(Map<String, dynamic> json)
      : escopo = json['escopo'],
        name = json['name'],
        competencia = json['competencia'];

  @override
  String toString() {
    return '''
      Subject {
        escopo: $escopo,
        name: $name,
        competencia: $competencia,
      }
    ''';
  }

  Map toJson() => {
        'escopo': escopo,
        'name': name,
        'competencia': competencia,
      };
}

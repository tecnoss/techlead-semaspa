class Subject {
  String escopo;
  String name;
  String competencia;

  Subject({
    required this.escopo,
    required this.name,
    required this.competencia,
  });

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
}

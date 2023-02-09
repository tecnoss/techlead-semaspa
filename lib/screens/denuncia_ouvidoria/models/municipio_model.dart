class Municipio {
  String? name;
  String? telefones;
  String? endereco;
  String? emails;
  String? site;

  Municipio({
    this.name,
    this.telefones,
    this.endereco,
    this.emails,
    this.site,
  });

  factory Municipio.fromJson(Map<String, dynamic> json) {
    return Municipio(
      name: json['name'],
      endereco: json['endereco'],
      telefones: json['telefones'],
      emails: json['emails'],
      site: json['site'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'endereco': endereco,
      'telefones': telefones,
      'emails': emails,
      'site': site,
    };
  }

  Map<String, dynamic> toClipBoard() {
    return {
      '"name"': '"$name"',
      '"endereco"': '"${endereco ?? ""}"',
      '"telefones"': '"${telefones ?? ""}"',
      '"emails"': '"${emails ?? ""}"',
      '"site"': '"${site ?? ""}"',
    };
  }

  Municipio copy() {
    return Municipio(
      name: name,
      endereco: endereco,
      telefones: telefones,
      emails: emails,
      site: site,
    );
  }
}

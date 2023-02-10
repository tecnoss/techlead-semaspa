class Denuncia {
  String? nome;
  String? email;
  String? telefone;
  String? assunto;
  String? mensagem;

  Denuncia({
    this.nome,
    this.email,
    this.telefone,
    this.assunto,
    this.mensagem,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'assunto': assunto,
      'mensagem': mensagem,
    };
  }
}

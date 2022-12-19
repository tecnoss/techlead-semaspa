class Proccess {
  List<ProccessInfo> proccessInfo = [];

  void initData(int size) {
    proccessInfo.clear();
    for (int i = 0; i < size; i++) {
      proccessInfo.add(
        ProccessInfo(
          "2004/0000362492",
          'Petrobrás Distribuidora S.A',
          'Vibra Energia S/A',
          'Em análise',
        ),
      );
    }
  }

  ///
  /// Single sort, sort Name's id
  void sortName(bool isAscending) {
    proccessInfo.sort((a, b) {
      int aId = int.tryParse(a.numero.replaceFirst('User_', '')) ?? 0;
      int bId = int.tryParse(b.numero.replaceFirst('User_', '')) ?? 0;
      return (aId - bId) * (isAscending ? 1 : -1);
    });
  }

  ///
  /// sort with Status and Name as the 2nd Sort
  void sortSituacao(bool isAscending) {
    proccessInfo.sort((a, b) {
      if (a.situacao == b.situacao) {
        int aId = int.tryParse(a.situacao.replaceFirst('User_', '')) ?? 0;
        int bId = int.tryParse(b.situacao.replaceFirst('User_', '')) ?? 0;
        return (aId - bId);
      } else if (a.situacao == 'Em análise') {
        return isAscending ? 1 : -1;
      } else {
        return isAscending ? -1 : 1;
      }
    });
  }
}

class ProccessInfo {
  String numero;
  String empreendimento;
  String interessado;
  String situacao;

  ProccessInfo(
      this.numero, this.empreendimento, this.interessado, this.situacao);

  dynamic get(String fieldName) {
    switch (fieldName) {
      case 'numero':
        return numero;
      case 'empreendimento':
        return empreendimento;
      case 'interessado':
        return interessado;
      case 'situacao':
        return situacao;
    }
    throw Exception('Invalid field name');
  }
}

class ProccessColumnInfo {
  final String name;
  final double width;
  const ProccessColumnInfo(this.name, this.width);
}

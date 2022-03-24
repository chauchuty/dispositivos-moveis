class Client {
  int id;
  String nome;
  String telefone;
  String email;

  Client({
    required this.id,
    required this.nome,
    required this.telefone,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'nome': nome});
    result.addAll({'telefone': telefone});
    result.addAll({'email': email});

    return result;
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      id: map['id'] ?? '',
      nome: map['nome'] ?? '',
      telefone: map['telefone'] ?? '',
      email: map['email'] ?? '',
    );
  }
}

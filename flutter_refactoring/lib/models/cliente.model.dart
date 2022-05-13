class Cliente {
  int? id;
  String nome;
  String? telefone;
  String? email;

  Cliente({
    this.id,
    required this.nome,
    this.telefone,
    this.email,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        id: json["id"],
        nome: json["nome"],
        telefone: json["telefone"],
        email: json["email"],
      );
}

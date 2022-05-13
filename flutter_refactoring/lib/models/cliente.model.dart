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

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "telefone": telefone,
        "email": email,
      };
}

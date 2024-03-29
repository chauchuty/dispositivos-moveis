import 'package:flutter/material.dart';
import 'package:flutter_refactoring/models/cliente.model.dart';
import 'package:flutter_refactoring/repositories/cliente.repository.dart';
import 'package:flutter_refactoring/utilities/snackbar.dart';
import 'package:flutter_refactoring/utilities/validate.dart';
import 'package:flutter_refactoring/widgets/app.bar.custom.dart';

class ClienteComponent extends StatefulWidget {
  // Settings
  final String title;
  final String mode;
  final Cliente? cliente;

  const ClienteComponent({
    Key? key,
    required this.title,
    required this.mode,
    this.cliente,
  }) : super(key: key);

  @override
  State<ClienteComponent> createState() => _ClienteModalState();
}

class _ClienteModalState extends State<ClienteComponent> {
  final repository = ClienteRepository();
  final _formKey = GlobalKey<FormState>();
  final _nomeC = TextEditingController();
  final _telefoneC = TextEditingController();
  final _emailC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: widget.title,
        visibleActions: false,
      ),
      body: _body(context),
    );
  }

  _body(context) {
    switch (widget.mode) {
      case 'create':
        return _create(context);
      case 'read':
        return _read(context, cliente: widget.cliente);
      case 'update':
        return _update(context, cliente: widget.cliente);
      default:
    }
  }

  _create(context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const Icon(
            Icons.person_add,
            size: 75,
          ),
          _itemCreate('Nome *', Icons.person, _nomeC,
              validator: ValidateCustom.isFullName),
          _itemCreate('Telefone', Icons.phone, _telefoneC),
          _itemCreate('Email', Icons.email, _emailC),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('caiu aqui');
                repository
                    .insert(Cliente(
                        nome: _nomeC.text,
                        telefone: _telefoneC.text,
                        email: _emailC.text))
                    .then((value) {
                  SnackBarCustom.success(context,
                      message: 'Cadastrado com sucesso!');

                  Navigator.pop(context);
                }).catchError((error) {
                  SnackBarCustom.error(context, message: 'Erro ao cadastrar!');
                  Navigator.pop(context);
                });

                return;
              }
              // SnackBarCustom.error(context,
              //     message: 'Usuário ou senha inválido!');
            },
            icon: const Icon(Icons.save),
            label: const Text('Cadastrar'),
          )
        ],
      ),
    );
  }

  _read(context, {Cliente? cliente}) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        const Icon(
          Icons.account_circle,
          size: 75,
        ),
        _itemRead(cliente!.id.toString(), Icons.numbers),
        _itemRead(cliente.nome, Icons.person),
        _itemRead(cliente.telefone, Icons.phone),
        _itemRead(cliente.email, Icons.email),
      ],
    );
  }

  _itemRead(String? title, IconData icon) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title!),
      ),
    );
  }

  _update(context, {Cliente? cliente}) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        const Icon(
          Icons.manage_accounts,
          size: 75,
        ),
        _itemUpdate(cliente!.nome, Icons.person),
        _itemUpdate(cliente.telefone, Icons.phone),
        _itemUpdate(cliente.email, Icons.email),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () {
            SnackBarCustom.success(
              context,
              message: 'Atualizado com sucesso!',
            );
          },
          icon: const Icon(Icons.update),
          label: const Text('Atualizar'),
        )
      ],
    );
  }

  _itemCreate(
    String label,
    IconData icon,
    TextEditingController controller, {
    Function? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (!(validator == null)) {
          if (!validator(value)) {
            return 'Campo "$label" inválido!';
          }
        }

        return null;
      },
      decoration: InputDecoration(
        icon: Icon(icon),
        labelText: label,
      ),
    );
  }

  _itemUpdate(String? title, IconData icon) {
    return TextFormField(
      initialValue: title,
      decoration: InputDecoration(icon: Icon(icon)),
    );
  }
}

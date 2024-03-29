import 'package:flutter/material.dart';
import 'package:flutter_refactoring/components/cliente.component.dart';
import 'package:flutter_refactoring/models/cliente.model.dart';
import 'package:flutter_refactoring/repositories/cliente.repository.dart';
import 'package:flutter_refactoring/utilities/snackbar.dart';
import 'package:flutter_refactoring/widgets/app.bar.custom.dart';
import 'package:flutter_refactoring/widgets/drawer.custom.dart';

class ClientesPage extends StatelessWidget {
  final ClienteRepository repository = ClienteRepository();

  ClientesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: 'Clientes'),
      drawer: const DrawerCustom(),
      body: _body(context),
      floatingActionButton: _create(context),
    );
  }

  _body(context) {
    return FutureBuilder<List<Cliente>>(
      future: repository.getAll(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return _listView(context, snapshot.data![index]);
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error}'),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    // return ListView.builder(
    //   itemBuilder: (context, index) {
    //     return _listView(context, clientes[index]);
    //   },
    //   itemCount: clientes.length,
    // );
  }

  _listView(context, Cliente cliente) {
    return Card(
      child: ListTile(
        onTap: () {
          _read(context, cliente);
        },
        leading: const Icon(
          Icons.account_box,
          size: 35,
        ),
        title: Text(cliente.nome),
        subtitle: Text(cliente.email!),
        trailing: Wrap(
          children: [
            _update(context, cliente),
            _delete(context, cliente),
          ],
        ),
      ),
    );
  }

  _create(context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ClienteComponent(
                title: 'Cadastrar Cliente', mode: 'create'),
          ),
        );
      },
      child: const Icon(Icons.person_add),
    );
  }

  _read(context, Cliente cliente) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ClienteComponent(
          title: 'Cliente',
          mode: 'read',
          cliente: cliente,
        ),
      ),
    );
  }

  _update(context, Cliente cliente) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClienteComponent(
              title: 'Atualizar Cliente',
              mode: 'update',
              cliente: cliente,
            ),
          ),
        );
      },
      icon: const Icon(Icons.edit),
      splashRadius: 20,
    );
  }

  _delete(context, Cliente cliente) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return _alertDialogDelete(context, cliente);
          },
        );
      },
      icon: const Icon(Icons.delete),
      splashRadius: 20,
    );
  }

  _alertDialogDelete(context, Cliente cliente) {
    return AlertDialog(
      title: Text(
        '"${cliente.nome}" (#${cliente.id})',
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.delete, color: Colors.grey),
          label: const Text(
            'Cancelar',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        TextButton.icon(
          onPressed: () {
            repository.delete(cliente.id!);
            SnackBarCustom.success(context, message: 'Deletado com sucesso!');
            Navigator.pop(context);
          },
          icon: const Icon(Icons.delete),
          label: const Text('Deletar'),
        ),
      ],
    );
  }
}

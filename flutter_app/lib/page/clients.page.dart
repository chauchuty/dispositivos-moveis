import 'package:flutter/material.dart';
import 'package:flutter_app/page/home.page.dart';
import 'package:flutter_app/routes/routes.custom.dart';
import 'package:flutter_app/widgets/floatingActionButton.custom.dart';
import 'package:flutter_app/widgets/form.custom.dart';
import 'package:flutter_app/widgets/scaffold.custom.dart';

import '../models/client.model.dart';

class ClientsPage extends StatelessWidget {
  final List<Client> clients = [
    Client(
        id: 1,
        nome: 'Cesar M.',
        telefone: '42 9 9999 9999',
        email: 'cesar@gmail.com'),
    Client(
        id: 2,
        nome: 'Murilo',
        telefone: '42 8 8888 8888',
        email: 'murilo@gmail.com'),
    Client(
        id: 3,
        nome: 'Jucinaldo',
        telefone: '42 7 7777 7777',
        email: 'jucinaldo@gmail.com'),
    Client(
        id: 3,
        nome: 'Marcos',
        telefone: '42 6 6666 6666',
        email: 'marcos@gmail.com'),
  ];

  ClientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      appBarTitle: 'Clientes',
      body: ListView.separated(
        itemBuilder: ((context, index) => Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text(clients[index].nome),
                trailing: Wrap(
                  children: const [
                    Icon(Icons.remove_red_eye, color: Colors.blue),
                    SizedBox(width: 10),
                    Icon(Icons.edit, color: Colors.orange),
                    SizedBox(width: 10),
                    Icon(Icons.delete, color: Colors.red),
                  ],
                ),
              ),
            )),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: clients.length,
      ),
      floatingActionButton: FloatingActionButtonCustom.feature(
        context,
        const FormCustom(
          title: 'Novo Cliente',
        ),
      ),
    );
  }
}

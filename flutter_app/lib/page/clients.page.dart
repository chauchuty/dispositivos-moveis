import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/scaffold.custom.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScaffoldCustom(
      appBarTitle: 'Clientes',
      body: Text('Clientes'),
    );
  }
}

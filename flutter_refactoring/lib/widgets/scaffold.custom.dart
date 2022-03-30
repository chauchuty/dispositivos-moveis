import 'package:flutter/material.dart';
import 'package:flutter_refactoring/pages/agendamentos.page.dart';
import 'package:flutter_refactoring/pages/clientes.page.dart';
import 'package:flutter_refactoring/pages/financas.page.dart';
import 'package:flutter_refactoring/pages/home.page.dart';
import 'package:flutter_refactoring/pages/pacotes.page.dart';
import 'package:flutter_refactoring/pages/servicos.page.dart';

class ScaffoldCustom extends StatefulWidget {
  const ScaffoldCustom({Key? key}) : super(key: key);

  @override
  _ScaffoldCustomState createState() => _ScaffoldCustomState();
}

class _ScaffoldCustomState extends State<ScaffoldCustom> {
  Widget body = const HomePage();
  int _indexIconButtonSelected = 0;

  @override
  Widget build(BuildContext context) {
    return _scaffold();
  }

  Scaffold _scaffold() {
    return Scaffold(
      appBar: PreferredSize(
        child: _appBar(),
        preferredSize: const Size(0, 50),
      ),
      body: body,
    );
  }

  // AppBar
  AppBar _appBar() {
    return AppBar(
      leading: _iconAccount(Icons.account_circle),
      title: Wrap(
        spacing: 20,
        children: [
          _iconAppBar(
            index: 0,
            icon: Icons.home,
            bodyData: const HomePage(),
          ),
          _iconAppBar(
            index: 1,
            icon: Icons.calendar_month,
            bodyData: const AgendamentoPage(),
          ),
          _iconAppBar(
            index: 2,
            icon: Icons.people,
            bodyData: const ClientesPage(),
          ),
          _iconAppBar(
            index: 3,
            icon: Icons.work,
            bodyData: const ServicosPage(),
          ),
          _iconAppBar(
            index: 4,
            icon: Icons.widgets,
            bodyData: const PacotesPage(),
          ),
          _iconAppBar(
            index: 5,
            icon: Icons.account_balance,
            bodyData: const FinancasPage(),
          ),
        ],
      ),
      actions: [
        _iconAction(Icons.more_vert),
      ],
      centerTitle: true,
      elevation: 0,
    );
  }

  // Icons AppBar/Actions/Account

  _iconAppBar({
    required int index,
    required IconData icon,
    required Widget bodyData,
  }) {
    return IconButton(
      onPressed: () {
        setState(() {
          body = bodyData;
          _indexIconButtonSelected = index;
        });
      },
      icon: Icon(
        icon,
        color:
            _indexIconButtonSelected == index ? Colors.grey[850] : Colors.white,
      ),
      splashRadius: 20,
    );
  }

  _iconAction(IconData icon) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon),
      splashRadius: 15,
    );
  }

  _iconAccount(IconData icon) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon),
      splashRadius: 20,
    );
  }
}

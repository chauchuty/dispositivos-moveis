import 'package:flutter/material.dart';
import 'package:flutter_refactoring/pages/agendamentos.page.dart';
import 'package:flutter_refactoring/pages/clientes.page.dart';
import 'package:flutter_refactoring/pages/home.page.dart';
import 'package:flutter_refactoring/pages/login.page.dart';
import 'package:flutter_refactoring/pages/servicos.page.dart';
import 'package:flutter_refactoring/routes/guard.dart';

class RoutesCustom {
  static initialRoute() => '/login';

  static feature() {
    var guard = Guard();
    return {
      '/login': (context) => const LoginPage(),
      '/home': (context) => const ProtectedRoute(widget: HomePage()),
      '/agendamento': (context) => ProtectedRoute(widget: AgendamentosPage()),
      '/clientes': (context) => ProtectedRoute(widget: ClientesPage()),
      '/servicos': (context) => ProtectedRoute(widget: ServicosPage()),
      '/logout': (context) {
        guard.logout();
        return const LoginPage();
      },

      // '/pacotes': (context) => PacotesPage(),
      // '/financeiro': (context) => const FinanceiroPage(),
    };
  }
}

class ProtectedRoute extends StatelessWidget {
  final Widget widget;

  const ProtectedRoute({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var guard = Guard();
    return FutureBuilder<String?>(
      future: guard.getToken(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return widget;
          }
          return const LoginPage();
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

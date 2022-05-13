import 'package:flutter/material.dart';
import 'package:flutter_refactoring/routes/guard.dart';
import 'package:flutter_refactoring/widgets/snackbar.custom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<String> textFieldsValue = ['', ''];
  Guard guard = Guard();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF6E3CBC), Color(0xFF7267CB)]),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Área de acesso',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
                const SizedBox(height: 36),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Usuário',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'É necessário usuário';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      textFieldsValue[0] = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'É necessário senha';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      textFieldsValue[1] = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          guard
                              .login(textFieldsValue[0], textFieldsValue[1])
                              .then(
                                (value) => {
                                  if (value)
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Logado com sucesso!'),
                                        ),
                                      ),
                                      Navigator.pushNamed(context, '/home'),
                                    }
                                  else
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Usuário ou senha inválida!'),
                                        ),
                                      )
                                    }
                                  // {Navigator.pushNamed(context, '/login')}
                                },
                              );
                        }
                      },
                      child: const Text('Acessar')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

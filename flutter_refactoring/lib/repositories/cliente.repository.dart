import 'package:dio/dio.dart';
import 'package:flutter_refactoring/models/cliente.model.dart';
import 'package:flutter_refactoring/routes/guard.dart';

abstract class IClienteRepository {
  List<Cliente> getAll();
  Cliente getOne(int id);
  int insert(Cliente cliente);
  Cliente update(Cliente cliente);
  void delete(int id);
}

class ClienteRepository {
  final guard = Guard();
  final dio = Dio();

  @override
  Future<List<Cliente>> getAll() async {
    return await dio.post('http://localhost:3001/clientes', data: {
      "token": await guard.getToken(),
    }).then((response) {
      return response.data
          .map<Cliente>((cliente) => Cliente.fromJson(cliente))
          .toList();
    });
  }

  Future<int> insert(dynamic cliente) async {
    print('caiu1');
    return await dio.post('http://localhost:3001/clientes/new', data: {
      "token": await guard.getToken(),
      "cliente": cliente.toJson(),
    }).then((response) {
      return 1;
    }).catchError((error) {
      print(error);
      return -1;
    });
  }

  // @override
  // update(data) {
  //   // TODO: implement update
  //   throw UnimplementedError();
  // }

  @override
  void delete(int id) async {
    return await dio.post('http://localhost:3001/clientes/delete', data: {
      "token": await guard.getToken(),
      "id": id,
    }).then((response) {
      print(response);
    });
  }
}

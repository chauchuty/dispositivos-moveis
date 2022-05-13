import 'package:dio/dio.dart';
import 'package:flutter_refactoring/models/cliente.model.dart';

abstract class IClienteRepository {
  List<Cliente> getAll();
  Cliente getOne(int id);
  int insert(Cliente cliente);
  Cliente update(Cliente cliente);
  void delete(int id);
}

class ClienteRepository {
  final dio = Dio();

  @override
  Future<List<Cliente>> getAll() {
    return dio
        .get('http://localhost:3001/clientes')
        .then((response) => response.data)
        .then((data) => data);
  }

  // @override
  // Cliente getOne(int id) {
  //   return clientes[id];
  // }

  // @override
  // int insert(Cliente cliente) {
  //   cliente.id = clientes[clientes.length].id;
  //   clientes.add(cliente);
  //   return cliente.id!;
  // }

  // @override
  // update(data) {
  //   // TODO: implement update
  //   throw UnimplementedError();
  // }

  // @override
  // void delete(int id) {
  //   clientes.removeAt(id);
  // }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mandaditos_express/models/client_model.dart';

class ClientService {
  ClientService();
  Future<Cliente?> getCliente(String email) async {
    Cliente? cliente;
    final QuerySnapshot result = await Future.value(FirebaseFirestore.instance
        .collection("Cliente")
        .where("correo_cliente", isEqualTo: email)
        .get());
    var list = result.docs;
    dynamic us = list[0].data();
    cliente = Cliente.fromJson(us);
    return cliente;
  }

  Future<void> sendToServer(Cliente cli) async {
    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      CollectionReference reference =
          FirebaseFirestore.instance.collection('cliente');
      await reference.add({
        "nombre_cliente": cli.nombreCliente,
        "correo_cliente": cli.correoCliente,
        "img_cliente": cli.imgCliente,
        "contrasena": cli.contrasena,
        "telefono_cliente": cli.telefonoCliente
      });
    });
  }

  Future<void> updateToServer(Cliente cli) async {
    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      CollectionReference reference =
          FirebaseFirestore.instance.collection('cliente');
      await reference.doc(cli.clientid).update({
        "nombre_cliente": cli.nombreCliente,
        "correo_cliente": cli.correoCliente,
        "img_cliente": cli.imgCliente,
        "contrasena": cli.contrasena,
        "telefono_cliente": cli.telefonoCliente
      });
    });
  }
}

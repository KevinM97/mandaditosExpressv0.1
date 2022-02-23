import 'dart:convert';

Cliente clienteFromJson(String str) => Cliente.fromJson(json.decode(str));

String clienteToJson(Cliente data) => json.encode(data.toJson());

class Cliente {
  Cliente({
    required this.contrasena,
    required this.correoCliente,
    required this.imgCliente,
    required this.nombreCliente,
    required this.telefonoCliente,
    this.clientid,
  });

  String contrasena;
  String correoCliente;
  String imgCliente;
  String nombreCliente;
  String telefonoCliente;
  String? clientid;

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        contrasena: json["contrasena"],
        correoCliente: json["correo_cliente"],
        imgCliente: json["img_cliente"],
        nombreCliente: json["nombre_cliente"],
        telefonoCliente: json["telefono_cliente"],
      );
  factory Cliente.created() => Cliente(
        contrasena: "",
        correoCliente: "",
        imgCliente: "",
        nombreCliente: "",
        telefonoCliente: "",
      );

  Map<String, dynamic> toJson() => {
        "contrasena": contrasena,
        "correo_cliente": correoCliente,
        "img_cliente": imgCliente,
        "nombre_cliente": nombreCliente,
        "telefono_cliente": telefonoCliente,
      };
}

import 'dart:convert';

SubGround subGroundFromJson(String str) => SubGround.fromJson(json.decode(str));

String subGroundToJson(SubGround data) => json.encode(data.toJson());

class SubGround {
  SubGround({
    required this.idsubterreno,
    required this.subArea,
    required this.subEstado,
    required this.nombre,
    required this.fkTerrenosIdterrenos,
  });

  int idsubterreno;
  int subArea;
  String subEstado;
  String nombre;
  int fkTerrenosIdterrenos;

  factory SubGround.fromJson(Map<String, dynamic> json) => SubGround(
        idsubterreno: json["idsubterreno"],
        subArea: json["sub_area"],
        nombre: json["nombre"],
        subEstado: json["sub_estado"],
        fkTerrenosIdterrenos: json["fk_terrenos_idterrenos"],
      );

  Map<String, dynamic> toJson() => {
        "idsubterreno": idsubterreno,
        "sub_area": subArea,
        "sub_estado": subEstado,
        "nombre": nombre,
        "fk_terrenos_idterrenos": fkTerrenosIdterrenos,
      };
}

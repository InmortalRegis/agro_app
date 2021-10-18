// To parse this JSON data, do
//
//     final crop = cropFromJson(jsonString);

import 'dart:convert';

Crop cropFromJson(String str) => Crop.fromJson(json.decode(str));

String cropToJson(Crop data) => json.encode(data.toJson());

class Crop {
  Crop({
    required this.fkSubterreno,
    required this.fkTipoCultivos,
    required this.idSubterrenoHasTipoCultivoscol,
    required this.fecha,
  });

  int fkSubterreno;
  int fkTipoCultivos;
  int idSubterrenoHasTipoCultivoscol;
  DateTime fecha;

  factory Crop.fromJson(Map<String, dynamic> json) => Crop(
        fkSubterreno: json["fk_subterreno"],
        fkTipoCultivos: json["fk_tipo_cultivos"],
        idSubterrenoHasTipoCultivoscol:
            json["id_subterreno_has_tipo_cultivoscol"],
        fecha: DateTime.parse(json["fecha"]),
      );

  Map<String, dynamic> toJson() => {
        "fk_subterreno": fkSubterreno,
        "fk_tipo_cultivos": fkTipoCultivos,
        "id_subterreno_has_tipo_cultivoscol": idSubterrenoHasTipoCultivoscol,
        "fecha": fecha.toIso8601String(),
      };
}

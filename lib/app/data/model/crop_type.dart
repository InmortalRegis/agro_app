import 'dart:convert';

CropType cropTypeFromJson(String str) => CropType.fromJson(json.decode(str));

String cropTypeToJson(CropType data) => json.encode(data.toJson());

class CropType {
  CropType({
    required this.idtipoCultivos,
    required this.tcNombre,
    required this.descripcion,
  });

  int idtipoCultivos;
  String tcNombre;
  String descripcion;

  factory CropType.fromJson(Map<String, dynamic> json) => CropType(
        idtipoCultivos: json["idtipo_cultivos"],
        tcNombre: json["tc_nombre"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "idtipo_cultivos": idtipoCultivos,
        "tc_nombre": tcNombre,
        "descripcion": descripcion,
      };
}

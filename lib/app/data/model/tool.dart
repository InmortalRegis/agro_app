import 'dart:convert';

Tool toolFromJson(String str) => Tool.fromJson(json.decode(str));

String toolToJson(Tool data) => json.encode(data.toJson());

class Tool {
  Tool({
    required this.idherramientas,
    required this.heNombre,
    required this.heCantidad,
  });

  int idherramientas;
  String heNombre;
  int heCantidad;

  factory Tool.fromJson(Map<String, dynamic> json) => Tool(
        idherramientas: json["idherramientas"],
        heNombre: json["he_nombre"],
        heCantidad: json["he_cantidad"],
      );

  Map<String, dynamic> toJson() => {
        "idherramientas": idherramientas,
        "he_nombre": heNombre,
        "he_cantidad": heCantidad,
      };
}

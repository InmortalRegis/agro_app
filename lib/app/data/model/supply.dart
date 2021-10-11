import 'dart:convert';

Supply supplyFromJson(String str) => Supply.fromJson(json.decode(str));

String supplyToJson(Supply data) => json.encode(data.toJson());

class Supply {
  Supply({
    required this.insuId,
    required this.inNombre,
    required this.inCantidadv,
  });

  int insuId;
  String inNombre;
  int inCantidadv;

  factory Supply.fromJson(Map<String, dynamic> json) => Supply(
        insuId: json["insu_id"],
        inNombre: json["in_nombre"],
        inCantidadv: json["in_cantidadv"],
      );

  Map<String, dynamic> toJson() => {
        "insu_id": insuId,
        "in_nombre": inNombre,
        "in_cantidadv": inCantidadv,
      };
}

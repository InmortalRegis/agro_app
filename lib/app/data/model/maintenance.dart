// To parse this JSON data, do
//
//     final maintenance = maintenanceFromJson(jsonString);

import 'dart:convert';

Maintenance maintenanceFromJson(String str) =>
    Maintenance.fromJson(json.decode(str));

String maintenanceToJson(Maintenance data) => json.encode(data.toJson());

class Maintenance {
  Maintenance({
    required this.idmantenimentos,
    required this.maFecha,
    this.maDescripcion,
    required this.maEstado,
    required this.fkTiposMatenimiento,
    required this.fkTrabajadorManteni,
  });

  int idmantenimentos;
  DateTime maFecha;
  dynamic maDescripcion;
  String maEstado;
  int fkTiposMatenimiento;
  String fkTrabajadorManteni;

  factory Maintenance.fromJson(Map<String, dynamic> json) => Maintenance(
        idmantenimentos: json["idmantenimentos"],
        maFecha: DateTime.parse(json["ma_fecha"]),
        maDescripcion: json["ma_descripcion"] ?? "N/A",
        maEstado: json["ma_estado"],
        fkTiposMatenimiento: json["fk_tipos_matenimiento"] ?? 0,
        fkTrabajadorManteni: json["fk_trabajador_manteni"] ?? "0",
      );

  Map<String, dynamic> toJson() => {
        "idmantenimentos": idmantenimentos,
        "ma_fecha": maFecha.toIso8601String(),
        "ma_descripcion": maDescripcion,
        "ma_estado": maEstado,
        "fk_tipos_matenimiento": fkTiposMatenimiento,
        "fk_trabajador_manteni": fkTrabajadorManteni,
      };
}

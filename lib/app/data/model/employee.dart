import 'dart:convert';

Employee employeeFromJson(String str) => Employee.fromJson(json.decode(str));

String employeeToJson(Employee data) => json.encode(data.toJson());

class Employee {
  Employee({
    required this.trabajadorId,
    required this.tSalarioJormal,
    required this.tNombre,
  });

  String trabajadorId;
  int tSalarioJormal;
  String tNombre;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        trabajadorId: json["trabajadorId"],
        tSalarioJormal: json["t_salario_jormal"],
        tNombre: json["t_nombre"],
      );

  Map<String, dynamic> toJson() => {
        "trabajadorId": trabajadorId,
        "t_salario_jormal": tSalarioJormal,
        "t_nombre": tNombre,
      };
}

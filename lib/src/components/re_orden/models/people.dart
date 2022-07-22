import 'dart:convert';

List<PersonaModel> personaModelFromJson(String str) => List<PersonaModel>.from(
    json.decode(str).map((x) => PersonaModel.fromJson(x)));

String personaModelToJson(List<PersonaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListadoPersonas {
  ListadoPersonas();

  ListadoPersonas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList.isEmpty) return;

    for (var item in jsonList) {
      final data = PersonaModel.fromJson(item);
      items.add(data);
    }
  }

  List<PersonaModel> items = [];
}

class PersonaModel {
  PersonaModel({
    required this.id,
    required this.name,
    required this.foto,
  });
  PersonaModel.fromMap(json)
      : id = json["id"],
        name = json["name"],
        foto = json["foto"];
  factory PersonaModel.fromJson(Map<String, dynamic> json) => PersonaModel(
        id: json["id"],
        name: json["name"],
        foto: json["foto"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "foto": foto,
      };
  int id;
  String name;
  String foto;
}

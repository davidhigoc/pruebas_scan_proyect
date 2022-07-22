import 'dart:convert';

List<VotosDetalleModel> votosDetalleModelFromJson(String str) =>
    List<VotosDetalleModel>.from(
        json.decode(str).map((x) => VotosDetalleModel.fromJson(x)));

String votosDetalleModelToJson(List<VotosDetalleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListadoVotosDetalle {
  ListadoVotosDetalle();

  ListadoVotosDetalle.fromJsonList(List<dynamic> jsonList) {
    if (jsonList.isEmpty) return;

    for (var item in jsonList) {
      final data = VotosDetalleModel.fromJson(item);

      items.add(data);
    }
  }

  List<VotosDetalleModel> items = [];
}

class VotosDetalleModel {
  VotosDetalleModel({
    required this.campo,
    required this.valor,
  });
  VotosDetalleModel.fromMap(json)
      : campo = json['campo'],
        valor = json['valor'];
  factory VotosDetalleModel.fromJson(Map<String, dynamic> json) =>
      VotosDetalleModel(
        campo: json['campo'],
        valor: json['valor'],
      );
  Map<String, dynamic> toJson() => {
        'campo': campo,
        'valor': valor,
      };
  String campo;
  int valor;
}

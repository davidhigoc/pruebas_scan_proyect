// import 'dart:convert' as convert;
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pru_scan_project/src/components/re_orden/models/company.dart';
import 'package:pru_scan_project/src/components/re_orden/models/people.dart';

// ? JsonPlaceHolder

class GetApis {
  final String _baseJsonplaceH = "my-json-server.typicode.com";
  final String _userRepo = "davidhigoc";
  final String _repoApi = "jsonplaceholder";

  Future<List<PersonaModel>> peapleApi() async {
    var url = Uri.https(
      _baseJsonplaceH,
      '/$_userRepo/$_repoApi/people',
    );

    var response = await http.get(url);
    final decoData = jsonDecode(response.body);
    final info = ListadoPersonas.fromJsonList(decoData);
    return info.items;
  }

  companyInfoApi() async {
    var url = Uri.https(
      _baseJsonplaceH,
      '/$_userRepo/$_repoApi/company',
    );

    var response = await http.get(url);

    final Company info = Company.fromJson(response.body);

    print("Respuesta api: ${info.depart}");
  }
}

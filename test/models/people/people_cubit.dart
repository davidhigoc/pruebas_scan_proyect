import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:pru_scan_project/models/people/peoples_cubit.dart';
import 'package:pru_scan_project/src/components/re_orden/models/people.dart';

void main() {
  group("PeopleBloc", () {
    test("Initial", () {
      final peopleCubit = PeoplesCubit();
      expect(peopleCubit.loading, false);
      expect(peopleCubit.peoples, []);
    });
    test("Api", () async {
      final peopleCubit = PeoplesCubit();
      List<PersonaModel> resp = await peopleCubit.consultPeople();
      if (resp.isNotEmpty) {
        print("Api de consulta --> OK --> Total: ${resp.length}");
      } else {
        print("Api de consulta a personas --> FAIL ");
      }
    });
  });
}

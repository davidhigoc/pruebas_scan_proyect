import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pru_scan_project/service/api.dart';
import 'package:pru_scan_project/src/components/re_orden/models/people.dart';

part 'peoples_state.dart';

class PeoplesCubit extends Cubit<PeoplesState> {
  PeoplesCubit() : super(PeoplesInitial());
  bool loading = false;
  List<PersonaModel> peoples = [];

  consultPeople() async {
    loading = true;
    List<PersonaModel>? resp = await GetApis().peapleApi();
    // ignore: unnecessary_null_comparison
    if (resp == null) {
      peoples = [];
      loading = false;
      print("El mundo es hermoso");
    } else {
      peoples = resp;
      loading = false;
    }

    emit(PeoplesConsul());
  }
}

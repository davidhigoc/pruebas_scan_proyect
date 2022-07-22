import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pru_scan_project/models/cubit/peoples_cubit.dart';
import 'package:pru_scan_project/src/components/re_orden/vistas_grid/grid_build.dart';
import 'package:pru_scan_project/src/components/re_orden/vistas_grid/grid_count.dart';
import 'package:pru_scan_project/src/components/re_orden/vistas_grid/grid_sliver.dart';
import 'package:pru_scan_project/src/components/re_orden/vistas_grid/test24.dart';

class ReOrder extends StatefulWidget {
  const ReOrder({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ReOrder> {
  // Functions
  dataFuture(BuildContext context) async {}

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Grid.count",
              ),
              Tab(
                text: "Grid.build",
              ),
              Tab(
                text: "SliverGrid.count",
              ),
              Tab(
                text: "Test Overlay",
              )
            ],
          ),
          title: const Text("Re-order de Widgets"),
        ),
        body: BlocBuilder<PeoplesCubit, PeoplesState>(
          builder: (context, state) {
            final bloc = context.read<PeoplesCubit>();
            if (state is PeoplesInitial) {
              bloc.consultPeople();
            }
            return bloc.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : TabBarView(
                    children: [
                      DemoReorderableGrid(listPeople: bloc.peoples),
                      const DemoGridBuilder(),
                      const DemoGridSliver(),
                      const TestIssue24()
                    ],
                  );
          },
        ),
      ),
    );
  }
}

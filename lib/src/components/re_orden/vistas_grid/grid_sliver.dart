import 'package:flutter/material.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class DemoGridSliver extends StatefulWidget {
  const DemoGridSliver({Key? key}) : super(key: key);

  @override
  _DemoGridSliverState createState() => _DemoGridSliverState();
}

class _DemoGridSliverState extends State<DemoGridSliver> {
  final data = List<int>.generate(50, (index) => index);
  double scrollSpeedVariable = 5;

  Widget buildItem(int index) {
    return Card(
      key: ValueKey(index),
      child: Text(index.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // return Text("data");
    // return DemoReorderableGrid();
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterLogo(),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Widget Aparte"),
          ),
        ),
        ReorderableSliverGridView.count(
          onReorder: (oldIndex, newIndex) {
            // print("reorder: $oldIndex -> $newIndex");
            setState(() {
              final element = data.removeAt(oldIndex);
              data.insert(newIndex, element);
            });
          },
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          crossAxisCount: 3,
          childAspectRatio: 0.6, // 0 < childAspectRatio <= 1.0
          children: data.map((e) => buildItem(e)).toList(),
        ),
        const SliverToBoxAdapter(
          child: FlutterLogo(),
        ),
        // SliverGrid.count(crossAxisCount: 3),
      ],
    );
  }
}

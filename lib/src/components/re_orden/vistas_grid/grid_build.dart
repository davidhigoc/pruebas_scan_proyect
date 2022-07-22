import 'package:flutter/material.dart';

import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class DemoGridBuilder extends StatefulWidget {
  const DemoGridBuilder({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DemoGridBuilderState createState() => _DemoGridBuilderState();
}

class _DemoGridBuilderState extends State<DemoGridBuilder> {
  final data = List<int>.generate(50, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: Center(
        child: ReorderableGridView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => buildItem(index),
          onReorder: (oldIndex, newIndex) {
            setState(() {
              setState(() {
                final element = data.removeAt(oldIndex);
                data.insert(newIndex, element);
              });
            });
          },
          dragWidgetBuilder: (index, child) {
            return Card(
              color: Colors.blue,
              child: Text(index.toString()),
            );
          },
          /* onDragStart: (index) {
            print("onDragStart: $index");
          }, */
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 0.6,
          ),
        ),
      ),
    );
  }

  Widget buildItem(int index) {
    return Card(
      key: ValueKey(index),
      child: Text(data[index].toString()),
    );
  }
}

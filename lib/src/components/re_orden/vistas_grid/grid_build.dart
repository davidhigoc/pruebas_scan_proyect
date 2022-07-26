import 'package:flutter/material.dart';
import 'package:pru_scan_project/src/components/re_orden/models/people.dart';

import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class DemoGridBuilder extends StatefulWidget {
  const DemoGridBuilder({Key? key, required this.listPeople}) : super(key: key);
  final List<PersonaModel> listPeople;

  @override
  // ignore: library_private_types_in_public_api
  _DemoGridBuilderState createState() => _DemoGridBuilderState();
}

class _DemoGridBuilderState extends State<DemoGridBuilder> {
  List data = [];

  void createList() {
    for (var element in widget.listPeople) {
      data.add({'name': element.name, 'foto': element.foto});
    }
  }

  @override
  void initState() {
    createList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: Center(
        child: ReorderableGridView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) =>
              buildItem(data[index]["name"], data[index]["foto"]),
          // data.map((e) => buildItem(e['name'], e['foto'])).toList(),
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

  /* Widget buildItem(int index) {
    return Card(
      key: ValueKey(index),
      child: Text(data[index].toString()),
    );
  } */

  Widget buildItem(String index, String foto) {
    return Card(
      key: ValueKey(index),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FadeInImage.assetNetwork(
                placeholder: "assets/basic/waiting.gif",
                placeholderScale: 0.4,
                placeholderFit: BoxFit.scaleDown,
                imageErrorBuilder: (context, error, stackTrace) {
                  return const Image(
                    height: 100,
                    width: 100,
                    image: NetworkImage("images/placeholder.png"),
                  );
                },
                image: foto,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              index.toString(),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

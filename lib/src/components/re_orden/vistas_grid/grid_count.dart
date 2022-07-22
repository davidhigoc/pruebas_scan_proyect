import 'package:flutter/material.dart';
import 'package:pru_scan_project/src/components/re_orden/models/people.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class DemoReorderableGrid extends StatefulWidget {
  DemoReorderableGrid({Key? key, required this.listPeople}) : super(key: key);
  final List<PersonaModel> listPeople;
  @override
  State<DemoReorderableGrid> createState() => _DemoReorderableGridState();
}

class _DemoReorderableGridState extends State<DemoReorderableGrid> {
  List data = [];
  @override
  void initState() {
    createList();
    super.initState();
  }

  void createList() {
    for (var element in widget.listPeople) {
      data.add({'name': element.name, 'foto': element.foto});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // use ReorderableGridView.count() when version >= 2.0.0
      // else use ReorderableGridView()
      child: ReorderableGridView.count(
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        crossAxisCount: 3,
        childAspectRatio: 0.6,
        onReorder: (oldIndex, newIndex) {
          setState(() {
            final element = data.removeAt(oldIndex);
            data.insert(newIndex, element);
          });
        },
        footer: const [
          Card(
            child: Center(
              child: Icon(Icons.add),
            ),
          ),
        ],
        children: data.map((e) => buildItem(e['name'], e['foto'])).toList(),
      ),
    );
  }

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



/* 
class DemoReorderableGrid extends StatefulWidget {
  DemoReorderableGrid({Key? key, required this.bloc}) : super(key: key);

  List<PersonaModel> bloc;

  @override
  // ignore: library_private_types_in_public_api
  _DemoReorderableGridState createState() => _DemoReorderableGridState();
}

class _DemoReorderableGridState extends State<DemoReorderableGrid> {
  final data = List<int>.generate(10, (index) => index);
  double scrollSpeedVariable = 5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 6, 5, 6),
      child: Center(
        child: ReorderableGridView.count(
          semanticChildCount: widget.bloc.length,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
          crossAxisCount: 3,
          childAspectRatio: 0.6, // 0 < childAspectRatio <= 1.0
          scrollSpeedController:
              (int timeInMilliSecond, double overSize, double itemSize) {
            if (timeInMilliSecond > 1500) {
              scrollSpeedVariable = 15;
            } else {
              scrollSpeedVariable = 5;
            }
            return scrollSpeedVariable;
          },
          onReorder: (oldIndex, newIndex) {
            // print("reorder: $oldIndex -> ");
            setState(() {
              final element = data.removeAt(oldIndex);
              data.insert(newIndex, element);
            });
          },
          dragWidgetBuilder: (index, child) {
            return Card(
              color: Colors.blue,
              child: Text(index.toString()),
            );
          },
          footer: const [
            Card(
              child: Center(
                child: Icon(Icons.add),
              ),
            ),
          ],
          children: [
            for (var z = 0; z <= widget.bloc.length - 1; z++)
              WidgetPerson(index: widget.bloc[z])
          ],
        ),
      ),
    );
  }
}

 */
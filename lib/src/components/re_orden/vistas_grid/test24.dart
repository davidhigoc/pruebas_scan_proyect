import 'package:flutter/material.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class TestIssue24 extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const TestIssue24({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _TestIssue24State createState() => _TestIssue24State();
}

class HomePageTile {
  int id = 10;
  Color backgroundColor = Colors.lightGreen;
  String name = "name";
  IconData tileIcon = Icons.add;
}

class _TestIssue24State extends State<TestIssue24> {
  List<HomePageTile> features = [];

  _TestIssue24State() {
    for (var i = 0; i < 50; i++) {
      var tile = HomePageTile();
      tile.id = i;
      tile.name = 'Item$i';
      features.add(tile);
    }
  }

  @override
  Widget build(BuildContext context) {
    ///
    ///Builds a single tile widget
    Widget buildTile(HomePageTile tile) {
      return GestureDetector(
        key: ValueKey(tile.id),
        // ignore: avoid_print
        onTap: () => print('onTap: ${tile.id}'),
        // onTap: () => navigateFromTiles(tile.id, context),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: tile.backgroundColor,
            shape: BoxShape.rectangle,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        tile.tileIcon,
                        size: 40,
                        color: Colors.grey[800],
                      ),
                    ],
                  ),
                ),
                Text(
                  tile.name,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.grey[800], fontWeight: FontWeight.bold),
                ),
              ]),
        ),
      );
    }

    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        final element = features.removeAt(oldIndex);
        features.insert(newIndex, element);
      });
    }

    return ReorderableGridView.count(
      padding: const EdgeInsets.all(10),
      childAspectRatio: 1.7,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      onReorder: _onReorder,
      footer: const [],
      children:
          List.generate(features.length, (index) => buildTile(features[index])),
    );
  }
}

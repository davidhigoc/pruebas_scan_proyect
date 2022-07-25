import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pru_scan_project/models/cubit/peoples_cubit.dart';
import 'package:pru_scan_project/src/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PeoplesCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Scan Examples',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}

/* 
import 'package:flutter/material.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Scaffold(
      //   body: DemoReorderableGrid(),
      // ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // return TestIssue24();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
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
          title: Text(widget.title!),
        ),
        body: TabBarView(
          children: [
            DemoReorderableGrid(),
            //DemoGridBuilder(),
            //DemoGridSliver(),
            //TestIssue24()
            SizedBox(),
            SizedBox(),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}

class DemoReorderableGrid extends StatefulWidget {
  @override
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
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ReorderableGridView.count(
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          crossAxisCount: 3,
          childAspectRatio: 0.6, // 0 < childAspectRatio <= 1.0
          
          scrollSpeedController:
              (int timeInMilliSecond, double overSize, double itemSize) {
            // print(
            //     "timeInMilliSecond: $timeInMilliSecond, overSize: $overSize, itemSize $itemSize");
            if (timeInMilliSecond > 1500) {
              scrollSpeedVariable = 15;
            } else {
              scrollSpeedVariable = 5;
            }
            return scrollSpeedVariable;
          },
          onReorder: (oldIndex, newIndex) {
            // print("reorder: $oldIndex -> $newIndex");
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
          children: data.map((e) => buildItem(e)).toList(),
        ),
      ),
    );
  }

  Widget buildItem(int index) {
    return Card(
      key: ValueKey(index),
      child: Text(index.toString()),
    );
  }
}
 */
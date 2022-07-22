// ignore_for_file: avoid_print

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignaturePage extends StatefulWidget {
  const SignaturePage({Key? key}) : super(key: key);

  @override
  State<SignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 1,
    penColor: Colors.red,
    exportBackgroundColor: Colors.blue,
    exportPenColor: Colors.black,
    onDrawStart: () => print('onDrawStart called!'),
    onDrawEnd: () => print('onDrawEnd called!'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        title: const Text(
          "Signature [ Firma ]",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 300,
            child: Center(
              child: Text('Big container to test scrolling issues'),
            ),
          ),
          //SIGNATURE CANVAS
          Signature(
            controller: _controller,
            height: 300,
            backgroundColor: Colors.amber,
          ),
          //OK AND CLEAR BUTTONS
          Container(
            decoration: const BoxDecoration(color: Colors.black),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                //SHOW EXPORTED IMAGE IN NEW ROUTE
                IconButton(
                  icon: const Icon(Icons.check),
                  color: Colors.blue,
                  onPressed: () async {
                    if (_controller.isNotEmpty) {
                      final Uint8List? data = await _controller.toPngBytes();
                      if (data != null) {
                        await Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                              return Scaffold(
                                appBar: AppBar(),
                                body: Center(
                                  child: Container(
                                    color: Colors.grey[300],
                                    child: Image.memory(data),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.undo),
                  color: Colors.blue,
                  onPressed: () {
                    setState(() => _controller.undo());
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.redo),
                  color: Colors.blue,
                  onPressed: () {
                    setState(() => _controller.redo());
                  },
                ),
                //CLEAR CANVAS
                IconButton(
                  icon: const Icon(Icons.clear),
                  color: Colors.blue,
                  onPressed: () {
                    setState(() => _controller.clear());
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 300,
            child: Center(
              child: Text('Big container to test scrolling issues'),
            ),
          ),
        ],
      ),
    );
  }
}

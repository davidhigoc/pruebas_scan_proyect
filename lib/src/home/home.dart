import 'package:flutter/material.dart';
import 'package:pru_scan_project/src/components/firma/signature.dart';
import 'package:pru_scan_project/src/components/re_orden/reorder_w.dart';
import 'package:pru_scan_project/src/home/widgets/decoration_container.dart';
import 'package:pru_scan_project/src/home/widgets/texto_titulo.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        title: const Text(
          "Componentes Scan",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          // * FIRMA Y GESTION
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              width: ancho,
              decoration: decotationBox(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    child: TextTitulo(
                      tituloText: "Creación y gestion de firma",
                    ),
                  ),
                  SizedBox(
                    width: ancho,
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      children: [
                        ElevatedButton(
                          key: const Key("signatureButton"),
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const SignaturePage())),
                          child: const Text("Signature"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          // * RE-ORDER WIDGETS
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              width: ancho,
              decoration: decotationBox(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    child: TextTitulo(
                      tituloText: "Re-Orden de Widgets",
                    ),
                  ),
                  SizedBox(
                    width: ancho,
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ReOrder(),
                            ),
                          ),
                          child: const Text("reorderable_grid_view "),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          // * RE-ORDER WIDGETS
        ],
      ),
    );
  }
}

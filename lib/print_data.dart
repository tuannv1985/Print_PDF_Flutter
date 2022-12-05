import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:pv_plc/home_screen.dart';

import 'model_api.dart';
//import 'package:pdf/widgets.dart' as pw;

Future printDoc(List<ModelApi>  data) async {
  final doc = Document(pageMode: PdfPageMode.outlines);
  var data1 = data.sublist(0, 10);
  var data2 = data.sublist(11, 24);
  doc.addPage(Page(
      pageFormat: PdfPageFormat.a4,
      build: (Context context)
      => Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15, right: 0, top: 0),
            child:Table(
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(1),
              },
              border: const TableBorder(
                top: BorderSide.none,
                bottom: BorderSide.none,
                left: BorderSide.none,
                right: BorderSide.none,
                horizontalInside: BorderSide.none,
                verticalInside: BorderSide.none,
              ),
              children: <TableRow>[
                TableRow(children: [
                  SizedBox(
                    height: 50,
                    child: Center(
                      child: Row(
                        children: [
                          Text("Nha may: ", style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Center(
                      child: Row(
                        children: [
                          Text("Bien so xe: ", style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("92C-00627")
                        ],
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  SizedBox(
                    height: 50,
                    child: Center(
                      child: Row(
                        children: [
                          Text("Nguoi gui: ", style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("Nguyen Van A")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Center(
                      child: Row(
                        children: [
                          Text("Noi goi: ", style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("Ke Hoach")
                        ],
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  SizedBox(
                    height: 50,
                    child: Center(
                      child: Row(
                        children: [
                          Text("So checklist: ", style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("123456")
                        ],
                      ),
                    ),
                  ),
                ]
                ),
              ],
            ),
          ),
          Table(
            columnWidths: const <int, TableColumnWidth>{
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(2),
              3: FlexColumnWidth(6),
              4: FlexColumnWidth(3),

            },
            border: const TableBorder(
              top: BorderSide(width: 1),
              bottom: BorderSide(width: 1),
              left: BorderSide(width: 1),
              right: BorderSide(width: 1),
              horizontalInside: BorderSide(width: 1),
              verticalInside: BorderSide(width: 1),
            ),
            children: <TableRow>[
              TableRow(children: [
                Container(
                    height: 50,
                    child: Center(
                      child: Text("STT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                    ),
                  ),
                Container(
                    height: 50,
                    child: Center(
                      child: Text("Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                    ),
                  ),
                Container(
                    height: 50,
                    child: Center(
                      child: Text("Body", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                    ),
                  ),
                Container(
                    height: 50,
                    child: Center(
                      child: Text("Email", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                    ),
                  ),
                ]
              ),
            ],
          ),
          Table(
            columnWidths: const <int, TableColumnWidth>{
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(2),
              3: FlexColumnWidth(6),
              4: FlexColumnWidth(3),

            },
            border: const TableBorder(
              top: BorderSide(width: 1),
              bottom: BorderSide(width: 1),
              left: BorderSide(width: 1),
              right: BorderSide(width: 1),
              horizontalInside: BorderSide(width: 1),
              verticalInside: BorderSide(width: 1),
            ),
            children: data1.map((e) => TableRow(children: [
              Container(
                  height: 50,
                  child: Center(
                    child: Text('${e.id}', style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12),),
                  ),
                ),
              Container(
                  height: 50,
                  child: Center(
                    child: Text(e.name ?? "", style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12),),
                  ),
                ),
              Container(
                  height: 50,
                  child: Center(
                    child: Text(e.body ?? "", style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12),),
                  ),
                ),
              Container(
                  height: 50,
                  child: Center(
                    child: Text(e.email ?? "", style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12),),
                  ),
                ),
              ]
            )).toList(),
          ),
        ]
      )
    // bodyHeader(),
    // Expanded(
    //   child: Container(
    //     margin: EdgeInsets.only(top: 5),
    //     child: data.isNotEmpty? bodyContent() : Container(),
    //   ),
    // ),
  ));
  // for (int i = 0; i <((data.length - 10)/14).ceil(); i++ ) {
  //   var end = i*14 + 24;
  //   if (end > data.length) end = data.length;
  //   var dataPrint = data.sublist(i*14 + 10, end);
  doc.addPage(Page(
      pageFormat: PdfPageFormat.a4,
      build: (Context context)
      => Column(
          children: [
            Table(
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(2),
                3: FlexColumnWidth(6),
                4: FlexColumnWidth(3),

              },
              border: const TableBorder(
                top: BorderSide(width: 1),
                bottom: BorderSide(width: 1),
                left: BorderSide(width: 1),
                right: BorderSide(width: 1),
                horizontalInside: BorderSide(width: 1),
                verticalInside: BorderSide(width: 1),
              ),
              children: <TableRow>[
                TableRow(children: [
                  Container(
                    height: 50,
                    child: Center(
                      child: Text("STT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Center(
                      child: Text("Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Center(
                      child: Text("Body", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Center(
                      child: Text("Email", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                    ),
                  ),
                ]
                ),
              ],
            ),
            Table(
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(2),
                3: FlexColumnWidth(6),
                4: FlexColumnWidth(3),

              },
              border: const TableBorder(
                top: BorderSide(width: 1),
                bottom: BorderSide(width: 1),
                left: BorderSide(width: 1),
                right: BorderSide(width: 1),
                horizontalInside: BorderSide(width: 1),
                verticalInside: BorderSide(width: 1),
              ),
              children: data2.map((e) => TableRow(children: [
                Container(
                  height: 50,
                  child: Center(
                    child: Text('${e.id}', style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12),),
                  ),
                ),
                Container(
                  height: 50,
                  child: Center(
                    child: Text(e.name ?? "", style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12),),
                  ),
                ),
                Container(
                  height: 50,
                  child: Center(
                    child: Text(e.body ?? "", style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12),),
                  ),
                ),
                Container(
                  height: 50,
                  child: Center(
                    child: Text(e.email ?? "", style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12),),
                  ),
                ),
              ]
              )).toList(),
            ),
          ]
      )
    // bodyHeader(),
    // Expanded(
    //   child: Container(
    //     margin: EdgeInsets.only(top: 5),
    //     child: data.isNotEmpty? bodyContent() : Container(),
    //   ),
    // ),
  ));
  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => doc.save());
  // final file = File("example1111.pdf");
  // await file.writeAsBytes(await doc.save());
}



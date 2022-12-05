import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:pv_plc/data_model.dart';
import 'package:http/http.dart' as http;
import 'package:pv_plc/model_api.dart';
import 'package:pv_plc/save_button.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ModelApi>  data = [];
  List<ModelApi>  dataFilter = [];
  List<String> filterData = ["All", "520", "X3"];
  String dropdownValue = "";
  @override
  void initState() {
    dropdownValue = filterData[0];
    _getData();
    super.initState();
  }
  _getData() async {
    try {
      var client = http.Client();
      var url = Uri.https('jsonplaceholder.typicode.com','/comments');
      final response = await client.get(url);
      final decodedResponse = json.decode(response.body) as List;
      print(decodedResponse);
      List<ModelApi>  temp = [];
      decodedResponse.forEach((element) {
        var model = ModelApi.fromJson(element);
        temp.add(model);
      });
      setState(() {
        data.addAll(temp);
        dataFilter.addAll(temp);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Get Data Failure"),
      ));
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("[Dock] - Xác nhận giao hàng"),
        actions: const [Icon(Icons.new_releases)],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 6, right: 6, top: 6),
            child: header(),
          ),
          bodyHeader(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 5),
              child: data.isNotEmpty? bodyContent() : Container(),
            ),
          ),
          SaveBtnBuilder(data:data),
        ],
      ),
    );
  }

  Widget header() {
    return Table(
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
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.bottom,
            child: SizedBox(
              height: 50,
              child: Center(
                child: Row(
                  children: const [
                    Text("Nhà máy: ", style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.bottom,
            child: SizedBox(
              height: 50,
              child: Center(
                child: Row(
                  children: const [
                    Text("Biển số xe: ", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("92C-00627",  style: TextStyle(color: Colors.blueAccent))
                  ],
                ),
              ),
            ),
          ),
        ]),
        TableRow(children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.bottom,
            child: SizedBox(
              height: 50,
              child: Center(
                child: Row(
                  children: const [
                    Text("Ngươi gởi: ", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("Nguyen Van A",  style: TextStyle(color: Colors.blueAccent))
                  ],
                ),
              ),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.bottom,
            child: SizedBox(
              height: 50,
              child: Center(
                child: Row(
                  children: const [
                    Text("Noi goi: ", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("KeHoach",  style: TextStyle(color: Colors.blueAccent))
                  ],
                ),
              ),
            ),
          ),
        ]),
        TableRow(children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.bottom,
            child: SizedBox(
              height: 50,
              child: Center(
                child: Row(
                  children: const [
                    Text("So checklist: ", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("123456", style: TextStyle(color: Colors.blueAccent))
                  ],
                ),
              ),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.bottom,
            child: SizedBox(
              height: 50,
              child: Center(
                child: Row(
                  children:  [
                    const Text("Filter: ", style: TextStyle(fontWeight: FontWeight.bold),),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                          if (value != filterData[0]) {
                            var temp = dataFilter.where((element) =>
                                element.name!.contains(value, 0));
                            data.clear();
                            data.addAll(temp);
                          } else {
                            data.clear();
                            data.addAll(dataFilter);
                          }
                        });
                      },
                      items: filterData.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]
       ),
      ],
    );
  }

  Widget bodyHeader() {
    return Table(
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
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.fill,
            child: Container(
              color: Colors.amber,
              height: 50,
              child: Center(
                child: Text("STT", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 12),),
              ),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.fill,
            child: Container(
              color: Colors.amber,
              height: 50,
              child: const Center(
                child: Text("Chon", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 12),),
              ),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.fill,
            child: Container(
              color: Colors.amber,
              height: 50,
              child: const Center(
                child: Text("Case No", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 12),),
              ),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.fill,
            child: Container(
              color: Colors.amber,
              height: 50,
              child: Center(
                child: Text("CateryGroup", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 12),),
              ),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.bottom,
            child: Container(
              color: Colors.amber,
              height: 50,
              child: Center(
                child: Text("Lotno", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 12),),
              ),
            ),
          ),
        ]),
      ],
    );
  }

  Widget bodyContent() {
    return SingleChildScrollView(
      child:  Table(
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
        children: data.map((e) => childTableRow(e)).toList(),
      ),
    );
  }

  TableRow childTableRow(ModelApi data) {
   // if(data.cargoName.contains(other)
      return TableRow(children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.fill,
          child: Container(
            height: 50,
            child: Center(
              child: Text('${data.id}', style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 12),),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.fill,
          child: Container(
            height: 50,
            child: Center(
              child: Checkbox(value: true, onChanged: (bool? value) {},),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.fill,
          child: Container(
            height: 50,
            child: Center(
              child: Text(data.name ?? "", style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 12),),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.fill,
          child: Container(
            height: 50,
            child: Center(
              child: Text(data.body ?? "", style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 12),),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.bottom,
          child: Container(
            height: 50,
            child: Center(
              child: Text(data.email ?? "", style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 12),),
            ),
          ),
        ),
      ]);
    }

}

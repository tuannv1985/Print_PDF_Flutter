import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pv_plc/home_screen.dart';
import 'package:pv_plc/model_api.dart';
import 'package:pv_plc/print_data.dart';

class SaveBtnBuilder extends StatelessWidget {
  List<ModelApi>  data = [];
  SaveBtnBuilder({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.indigo,
        primary: Colors.indigo,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: () => printDoc(data.sublist(0, 50)),
      child: const Text(
        "Save as PDF",
        style: TextStyle(color: Colors.white, fontSize: 20.00),
      ),
    );
  }
}

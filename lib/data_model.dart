class DataModel {
  String? id;
  String? cargoCode;
  String? cargoName;
  String? factoryCode;


  DataModel({this.id, this.cargoCode, this.cargoName, this.factoryCode});

  DataModel.fromJson(Map<String, dynamic> json) {
    json.forEach((key, value) {
      if (key == "CargoCode") {
        cargoCode = value;
      } else if (key == "CargoName") {
        cargoName = value;
      } else if (key == "FactoryCode") {
        factoryCode = value;
      } else {
        id = value;
      }
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['CargoCode'] = this.cargoCode;
    data['CargoName'] = this.cargoName;
    data['FactoryCode'] = this.factoryCode;
    return data;
  }
}
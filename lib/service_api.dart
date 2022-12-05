import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pv_plc/model_api.dart';
Future<List<ModelApi>> getCommentFromApi(int startIndex, int limit) async{
  final url = Uri.https('plctext.free.beeceptor.com','/Cargo');
  final http.Client httpClient = http.Client();
  try{
    final response = await httpClient.get(url);
    if(response.statusCode == 200){
      final responseData = json.decode(response.body) as List;
      final List<ModelApi> comments = responseData.map((comment) => ModelApi.fromJson(comment)).toList();
      return comments;
    }
    else {
      return <ModelApi>[];
    }
  }
  catch(exception){
    return <ModelApi>[];
  }
}
import 'dart:developer';

import 'package:apa_test/conatant.dart';
import 'package:apa_test/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + (ApiConstants.usersEndpoint));
      log(url.toString());
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        log(_model.toString());
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

Future<void> getRequest() async {
  var url = Uri.parse(ApiConstants.baseUrl + (ApiConstants.usersEndpoint));
  log(url.toString());
  var response = await http.get(url);
}

// Future<UserModel?> getUser(int id) async {
//   try {
//     var url = Uri.parse(ApiConstants.baseUrl + (ApiConstants.usersEndpoint));
//     log(url.toString());
//     var response = await http.get(url);
//     if (response.statusCode == 200) {
//       final id = userModelFromJson(response.body);
//       UserModel user = UserModel.fromJson(id as Map<String, dynamic>);
//       return user;
//     }
//   } catch (e) {
//     log(e.toString());
//   }
// }




// //get a single user/abstraction -interface/ 
import 'package:the_builders/GUI/globalApi.dart' as global;
import 'package:get/get.dart';
import 'package:the_builders/GUI/loginpages.dart';
import 'package:the_builders/Global/global.dart';

void RegistorUser(String name, String location, String phoneno, String email,
    String pass, String type) async {
  var httprequest = GetConnect();
  var response = await httprequest.post(
      '${global.url}/UserResgister?name=$name&location=$location&phoneno=$phoneno&email=$email&pass=$pass&vtype=$type',
      {
        "lat":lat,
        "lng":long,
        "address":Address,
      });
  print(response.body);
  print(response.statusCode);
  if (response.statusCode == 200) {
    Get.snackbar("Message", "Registration Successful");
    Get.off(login());
  } else {
    // print(response.body);
    // print(response.statusCode);
    Get.snackbar("Message", "Not Registered");
  }
}

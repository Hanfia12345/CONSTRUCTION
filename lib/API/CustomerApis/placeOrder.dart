import 'package:get/get.dart';
import 'package:the_builders/GUI/CustomerScreens/HomePage.dart';
import 'package:the_builders/GUI/globalApi.dart' as global;



void PlaceOrder(var id)async{
  var httprequest =GetConnect();
  var response=await httprequest.post('${global.url}/addOrder?cid=$id', {});
  print(response.statusCode);
  if (response.statusCode == 200) {

    Get.snackbar("Message", response.body);
    Get.to(CustomerHome());
  } else {
    print(response.body);
    print(response.statusCode);
    Get.snackbar("Message", "Order Not Placed");
  }

}
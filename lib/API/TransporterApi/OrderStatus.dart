import 'package:get/get.dart';
import 'package:the_builders/GUI/globalApi.dart' as global;
void UpdateOrderStatus(int oid,String status) async {

  var httprequest = GetConnect();
  var response = await httprequest.post(
      "${global.url}/updateOrderStatusFromDeliverySide?oid=$oid&status=$status",{}
  );

  if (response.statusCode == 200) {
    Get.snackbar("Message", response.body);
  } else {
    print(response.statusCode);
    Get.snackbar("Message", response.body);
  }
}
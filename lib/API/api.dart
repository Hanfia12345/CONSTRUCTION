import 'package:http/http.dart' as http;

class APIHandler {
  static String ip = "http://192.168.1.44/apii/api/";

  static Future<String?> userLogin(String username, String password) async {
    String comurl = '${ip}apii/UserLogin?email=$username&pass=$password';
    Uri u = Uri.parse(comurl);
    http.Response response = await http.get(u);
    if (response.statusCode == 200) return response.body;
    return null;
  }
}

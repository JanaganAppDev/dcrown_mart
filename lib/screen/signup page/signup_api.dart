import 'package:dcrown_mart/service/api_response.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final http.Client client;

  ApiService(this.client);

  Future<void> fetchData() async {
    final url = Uri.parse("$base_url/users/register");
    final response = await client.get(url);
    if (response.statusCode == 200) {
    } else {}
  }

  Future<void> fetchData1() async {
    final url = Uri.parse("$base_url/country/country_code");
    final response = await client.get(url);
    if (response.statusCode == 200) {
    } else {}
  }
}

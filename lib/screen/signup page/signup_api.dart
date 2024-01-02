import 'package:http/http.dart' as http;

class ApiService {
  final http.Client client;

  ApiService(this.client);

  Future<void> fetchData() async {
    final url = Uri.parse("http://localhost:5000/api/users/register");
    final response = await client.get(url);
    if (response.statusCode == 200) {
    } else {}
  }

  Future<void> fetchData1() async {
    final url = Uri.parse("https://api.dcrownmart.com/country/country_code");
    final response = await client.get(url);
    if (response.statusCode == 200) {
    } else {}
  }
}

import 'package:http/http.dart' as http;

class ApiService {
  final http.Client client;

  ApiService(this.client);

  Future<void> fetchData() async {
    final url = Uri.parse("http://localhost:5000/adress/get");
    final response = await client.get(url);

    if (response.statusCode == 200) {
    } else {}
  }
}

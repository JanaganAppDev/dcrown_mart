import 'package:dcrown_mart/service/api_response.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final http.Client client;

  ApiService(this.client);

  Future<void> fetchData() async {
    final url = Uri.parse('$base_url/users/forget');
    final response = await client.get(url);

    if (response.statusCode == 200) {
    } else {}
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;

class CheapSharkService {

  Future<List<dynamic>> getDeals(int page) async {

    final response = await http.get(
      Uri.parse(
        'https://www.cheapshark.com/api/1.0/deals?pageNumber=$page'
      ),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    return [];
  }
}
/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-2-12
/// this lab will show the Current IP via terminal by using future for fetch api
/// this lab focus on using future to fetch data then access data as json
/// Not Using Ai
library;
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  await fetchIPAddress();
}

Future<void> fetchIPAddress() async {
  try {
    final response = await http.get(
      Uri.parse('https://api.ipify.org?format=json')
    );
    if(response.statusCode == 200) {
      Map<String, dynamic> ip = jsonDecode(response.body);
      print('Your public IP address is: ${ip['ip']}');
    } else {
      throw Exception('failed to load IP address');
    }
  } catch (err) {
    throw Exception('Failed to connect to the APT: $err');
  }
}



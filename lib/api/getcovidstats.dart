import 'package:http/http.dart' as http;

Future getCovidStats() async {
  var url = Uri.parse('https://api.rootnet.in/covid19-in/stats/latest');
  var response = await http.get(url);
  return response;
}

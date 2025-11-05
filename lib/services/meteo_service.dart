import 'dart:convert';
import 'package:http/http.dart' as http;

class MeteoService {
  final String _baseUrl = 'https://api.open-meteo.com/v1/forecast';

  Future<Map<String, dynamic>?> getDailyForecast(double lat, double lon) async {
    final url = Uri.parse(
      '$_baseUrl'
          '?latitude=$lat'
          '&longitude=$lon'
          '&hourly=temperature_2m,pm10,pm2_5,pollen_grass,pollen_tree,pollen_weed'
          '&forecast_days=1'
          '&timezone=auto',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('❌ Failed to fetch Meteo data: ${response.statusCode}');
      }
    } catch (e) {
      print('⚠️ Error fetching Meteo data: $e');
    }
    return null;
  }
}

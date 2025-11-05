import 'package:intl/intl.dart';
import 'package:puffpal/services/meteo_service.dart';
import 'package:puffpal/services/firebase_api.dart';

class MeteoDailyNotifier {
  final MeteoService _meteoService = MeteoService();
  final FirebaseApi _firebaseApi = FirebaseApi();

  Future<void> analyzeDayAndNotify(String userId, double lat, double lon) async {
    final data = await _meteoService.getDailyForecast(lat, lon);
    if (data == null) return;

    final hourly = data['hourly'];
    if (hourly == null) return;

    final List<dynamic> times = hourly['time'];
    final List<dynamic> temps = hourly['temperature_2m'];
    final List<dynamic> pm10 = hourly['pm10'];
    final List<dynamic> pm25 = hourly['pm2_5'];
    final List<dynamic> grass = hourly['pollen_grass'];
    final List<dynamic> tree = hourly['pollen_tree'];
    final List<dynamic> weed = hourly['pollen_weed'];

    String message = '';
    final formatter = DateFormat('HH:mm');

    for (int i = 0; i < times.length; i++) {
      final temp = temps[i]?.toDouble();
      final dust = pm10[i]?.toDouble();
      final pollen = [grass[i], tree[i], weed[i]]
          .whereType<num>()
          .fold<double>(0, (sum, p) => sum + p.toDouble());

      List<String> triggers = [];

      if (temp < 15) triggers.add('cold air');
      if (dust > 50 || pm25[i] > 25) triggers.add('dust');
      if (pollen > 100) triggers.add('pollen');

      if (triggers.isNotEmpty) {
        final time = DateTime.parse(times[i]);
        final formatted = formatter.format(time);
        message +=
        'At $formatted, ${triggers.join(" and ")} levels may trigger asthma.\n';
      }
    }

    if (message.isNotEmpty) {
      await _firebaseApi.sendNotificationToUser(
        userId,
        'Asthma Alert for Today 💨',
        'Be careful today! Here’s when to watch out:\n$message',
      );
    } else {
      print('✅ No asthma triggers detected today — no notification sent.');
    }
  }
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get personalInfo => 'المعلومات الشخصية';

  @override
  String get name => 'الاسم';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get phone => 'رقم الهاتف';

  @override
  String get gender => 'النوع';

  @override
  String get age => 'العمر';

  @override
  String hello(Object userName) {
    return 'مرحباً $userName!';
  }

  @override
  String get discoverText =>
      'اكتشف كيف يمكن أن يساعدك فهم صحتك على التنفس بسهولة أكبر!';

  @override
  String get trackSymptoms => 'تتبع الأعراض الخاصة بك!';

  @override
  String get quickQuestions => 'أسئلة سريعة';

  @override
  String get breatheBetter => 'تنفس بشكل أفضل، وتعلم المزيد';

  @override
  String get quizzesTitle => 'الاختبارات والألعاب';

  @override
  String get setReminder => 'تعيين تذكير';

  @override
  String get medicationReminders => 'تذكيرات الأدوية';
}

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

  @override
  String get advice_title => 'نصيحة اليوم';

  @override
  String get advice_inhaler =>
      'احتفظ بجهاز الاستنشاق الإسعافي معك دائماً، حتى لو كنت تشعر بتحسن.';

  @override
  String get advice_dust =>
      'اغسل المفارش بماء ساخن (60 درجة مئوية) مرة أسبوعياً للقضاء على عث الغبار.';

  @override
  String get advice_cold =>
      'في الطقس البارد، تنفس من خلال وشاح لتدفئة الهواء قبل وصوله إلى رئتيك.';

  @override
  String get advice_water =>
      'اشرب الكثير من الماء؛ فهو يساعد على جعل المخاط في رئتيك أقل كثافة.';

  @override
  String get advice_exercise =>
      'قم بالإحماء لمدة 10 دقائق قبل ممارسة الرياضة لتجنب نوبات الربو الناتجة عن الجهد.';

  @override
  String get advice_pollen =>
      'أغلق النوافذ في الأيام التي يكثر فيها حبوب اللقاح أو العواصف الرملية.';
}

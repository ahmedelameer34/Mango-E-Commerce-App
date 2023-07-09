import '../../helper/cashe_helper.dart';

class AppConstants {
  static String? token = CacheHelper.getData(key: 'token');
}

import 'package:flutter_dotenv/flutter_dotenv.dart';

class StripeKeys {
  static String publishableKey = dotenv.env['PUBLISHABLEKEY']!;
  static String secretKey = dotenv.env['SECRETKEY']!;
}

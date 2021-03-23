import 'package:blogappdemo/screens/blogDetailScreen.dart';
import 'package:blogappdemo/screens/blogListScreen.dart';
import 'package:blogappdemo/screens/loginScreen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LogInScreen());
      case '/blogList':
        return MaterialPageRoute(builder: (_) => BlogListScreen());
      case '/blogDetail':
        return MaterialPageRoute(builder: (_) => BlogDetailScreen());
      default:
        return MaterialPageRoute(builder: (_) => LogInScreen());
    }
  }
}

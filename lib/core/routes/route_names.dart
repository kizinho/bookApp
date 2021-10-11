import 'package:bookapp/core/controller/get/auth/middleware_controller.dart';
import 'package:bookapp/view/auth/login.dart';
import 'package:bookapp/view/auth/register.dart';
import 'package:bookapp/view/auth/social.dart';
import 'package:bookapp/view/home/book/book.dart';
import 'package:bookapp/view/onboarding/onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteNames {
  ///Route names used through out the app will be specified as static constants here in this format
  static const String splashScreen = 'splashScreen';
  static const String onBoarding = '/onBoarding';
  static const String login = '/login';
  static const String social = '/social';
  static const String register = '/register';
  static const String books = '/books';
  static const String error = '/error';

  ///Named routes to be added here in this format
  static List<GetPage> routes = [
    GetPage(name: onBoarding, page: () => OnBoarding()),
    GetPage(name: login, page: () => Login()),
    GetPage(name: social, page: () => SocialAuth()),
    GetPage(name: books, page: () => Book(), middlewares: [AuthMiddleware()]),
    GetPage(name: register, page: () => Register()),
  ];

  ///Named routes error
  static Set<GetPage> unknown = {
    GetPage(name: error, page: () => errorView('Error Page')),
  };

  ///error page
  static Widget errorView(name) {
    return Scaffold(body: Center(child: Text('404 $name View not found')));
  }
}

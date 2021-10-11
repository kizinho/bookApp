import 'package:bookapp/core/controller/get/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final auth = Get.put(AuthController());

class AuthMiddleware extends GetMiddleware {
  RouteSettings? redirect(String? route) {
    return !auth.isAuthenticated.value
        ? RouteSettings(name: "/login")
        : null;
  }
}

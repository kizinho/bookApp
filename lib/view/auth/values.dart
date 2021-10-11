import 'package:flutter/material.dart';

validate(GlobalKey<FormState> key) =>
    key.currentState != null && key.currentState!.validate();
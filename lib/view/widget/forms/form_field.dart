import 'package:bookapp/core/controller/get/basic/basic_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

final basic = Get.put(BasicController());

class FormInput extends StatelessWidget {
  const FormInput(
      {this.hintText,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.focusNode,
      this.onChanged,
      this.controller});
  final controller;
  final String? hintText;
  final FocusNode? focusNode;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onChanged;
  @override
  Widget build(BuildContext context) {
    return Obx(() => new TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.deny(new RegExp(r"\s\b|\b\s"))
          ],
          focusNode: focusNode,
          cursorColor: Theme.of(context).primaryColor,
          style: Theme.of(context).textTheme.headline3,
          controller: controller,
          autofocus: false,
          obscureText: basic.obscureText.value,
          keyboardType: TextInputType.emailAddress,
          onChanged: onChanged,
          onSaved: onSaved,
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            counterText: '',
            contentPadding: EdgeInsets.only(left: 25.0),
            alignLabelWithHint: true,
            focusColor: Theme.of(context).hintColor,
            fillColor: Theme.of(context).hintColor,
            filled: true,
            hintText: hintText,
            labelText: labelText,
            helperText: helperText,
            helperStyle: Theme.of(context).textTheme.headline4,
            hintStyle: Theme.of(context).textTheme.headline3,
            prefixIcon: Icon(Icons.password,
                color: Theme.of(context).primaryColorDark, size: 20),
            suffixIcon: Obx(() => new GestureDetector(
                  onTap: () {
                    basic.onTap(basic.obscureText.value);
                  },
                  child: basic.obscureText.value
                      ? Icon(Icons.visibility,
                          color: Theme.of(context).primaryColor, size: 26)
                      : Icon(Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark, size: 26),
                )),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(99.0),
              borderSide:
                  BorderSide(color: Theme.of(context).hintColor, width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(99.0),
              borderSide:
                  BorderSide(color: Theme.of(context).hintColor, width: 0.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(99.0),
              borderSide: BorderSide(
                  color: Theme.of(context).toggleableActiveColor, width: 0.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(99.0),
              borderSide: BorderSide(
                  color: Theme.of(context).toggleableActiveColor, width: 0.5),
            ),
          ),
        ));
  }
}

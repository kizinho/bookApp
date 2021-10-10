import 'package:bookapp/core/controller/post/auth/register_controller.dart';
import 'package:bookapp/view/auth/social/soical.dart';
import 'package:bookapp/view/widget/buttons/button.dart';
import 'package:bookapp/view/widget/forms/form_field.dart';
import 'package:bookapp/view/widget/forms/input_field.dart';
import 'package:bookapp/view/widget/loader/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

final RegisterController register = Get.put(RegisterController());

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.09),
                  child: Form(
                    key: register.registerFormKey,
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            height: 200,
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/auth/auth.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Register Account',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 250,
                          child: InputForms(
                            formatter: [
                              FilteringTextInputFormatter.deny(
                                  new RegExp(r"\s\b|\b\s"))
                            ],
                            icon: Icons.person,
                            hintText: 'Username',
                            controller: register.emailController,
                            validator: (value) {
                              if (value == null) {
                                return 'Username can not be empty';
                              }
                              return value.length < 2
                                  ? 'Username is too short'
                                  : null;
                            },
                            onFieldSubmitted: (v) {
                              FocusScope.of(context)
                                  .requestFocus(register.focusPassword);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 250,
                          child: InputForms(
                            icon: Icons.email,
                            hintText: 'E-mail',
                            controller: register.emailController,
                            validator: (value) {
                              RegExp regex = new RegExp(
                                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                  r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                  r"{0,253}[a-zA-Z0-9])?)*$");
                              return !regex.hasMatch(value!)
                                  ? 'Enter a valid email address!'
                                  : null;
                            },
                            onFieldSubmitted: (v) {
                              FocusScope.of(context)
                                  .requestFocus(register.focusPassword);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 250,
                          child: FormInput(
                            hintText: 'Password',
                            focusNode: register.focusPassword,
                            controller: register.passwordController,
                            validator: (value) {
                              return value!.length < 6
                                  ? 'Password is too short'
                                  : null;
                            },
                            onFieldSubmitted: (v) {
                              if (register.registerFormKey.currentState!
                                  .validate()) {
                                register.registerUser();
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        submitButton(),
                        SizedBox(
                          height: 20,
                        ),
                        Text("or using social accounts",
                            style: Theme.of(context).textTheme.headline3),
                        SizedBox(
                          height: 5,
                        ),
                        Social(),
                        SizedBox(
                          height: 20,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                child: Text(
                                  'Already  have an account?',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                              WidgetSpan(
                                child: GestureDetector(
                                  child: Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Login',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      )),
                                  onTap: () => Get.offNamed("login"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget submitButton() {
    return GestureDetector(
        onTap: () {
          if (register.registerFormKey.currentState!.validate()) {
            register.registerUser();
          }
        },
        child: register.isLoading.value
            ? Loader()
            : SubmitButtion(text: 'register'));
  }
}

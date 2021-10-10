import 'package:bookapp/core/controller/post/auth/login_controller.dart';
import 'package:bookapp/view/auth/social/soical.dart';
import 'package:bookapp/view/widget/buttons/button.dart';
import 'package:bookapp/view/widget/forms/form_field.dart';
import 'package:bookapp/view/widget/forms/input_field.dart';
import 'package:bookapp/view/widget/loader/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final LoginController login = Get.put(LoginController());

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
                    key: login.loginFormKey,
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
                          'Login Account',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 250,
                          child: InputForms(
                            icon: Icons.email,
                            hintText: 'E-mail',
                            controller: login.emailController,
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
                                  .requestFocus(login.focusPassword);
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
                            focusNode: login.focusPassword,
                            controller: login.passwordController,
                            validator: (value) {
                              return value!.length < 6
                                  ? 'Password is too short'
                                  : null;
                            },
                            onFieldSubmitted: (v) {
                              if (login.loginFormKey.currentState!.validate()) {
                                login.loginUser();
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
                                  'Don’t  have an account?',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                              WidgetSpan(
                                child: GestureDetector(
                                  child: Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Sign up',
                                        style:
                                            Theme.of(context).textTheme.headline4,
                                      )),
                                  onTap: () => Get.offNamed("register"),
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
          if (login.loginFormKey.currentState!.validate()) {
           login.loginUser();
          }
        },
        child: login.isLoading.value ? Loader() : SubmitButtion(text: 'Login'));
  }
}

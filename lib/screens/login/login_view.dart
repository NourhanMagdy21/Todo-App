import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home_layout/home_layout_screen.dart';
import '../registration/registration_view.dart';

class LoginView extends StatefulWidget {
  static const String routeName = "login";

  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isVisible = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("asset/images/SIGN IN – 1.png"),
          fit: BoxFit.cover,
        ),
        color: theme.colorScheme.onSecondary,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Login",
            style: theme.textTheme.titleLarge,
          ),
          centerTitle: true,
          toolbarHeight: 120,
        ),
        body: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.16),
              Text(
                "Welcome back!",
                style:
                    theme.textTheme.titleLarge!.copyWith(color: Colors.black),
              ),
              SizedBox(height: 40),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: theme.textTheme.bodyMedium,
                ),
                controller: emailController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "You must provide your email";
                  }

                  var emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                  if (!emailValid.hasMatch(value)) {
                    return "Invalid email";
                  }

                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "password",
                  labelStyle: theme.textTheme.bodyMedium,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      isVisible = !isVisible;
                      setState(() {});
                    },
                    child: isVisible
                        ? Icon(Icons.visibility_outlined, size: 28)
                        : Icon(Icons.visibility_off_outlined, size: 28),
                  ),
                  suffixIconColor: theme.primaryColor,
                ),
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "You must provide your password";
                  }

                  var passValid = RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                  if (!passValid.hasMatch(value)) {
                    return "Invalid password";
                  }

                  return null;
                },
                obscureText: isVisible ? true : false,
              ),
              SizedBox(height: 20),
              Text(
                "Forget password ?",
                style: theme.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 20),
              MaterialButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    login();
                    Navigator.pushReplacementNamed(
                        context, HomeLayout.routeName);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Login",
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: Colors.white),
                    ),
                    Icon(
                      Icons.arrow_forward_outlined,
                      size: 32,
                      color: Colors.white,
                    ),
                  ],
                ),
                height: 55,
                color: theme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RegistrationView.routeName);
                },
                child: Text(
                  "Or Create My Account !",
                  style: theme.textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationView extends StatefulWidget {
  static const String routeName = "registration";

  RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
            "Create account",
            style: theme.textTheme.titleLarge,
          ),
          centerTitle: true,
          toolbarHeight: 120,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Full name",
                  labelStyle: theme.textTheme.bodyMedium,
                ),
                controller: fullNameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "You must provide your name";
                  }

                  return null;
                },
              ),
              SizedBox(height: 20),
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
              TextFormField(
                decoration: InputDecoration(
                  labelText: "confirm password",
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
                controller: confirmPasswordController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "You must provide your password";
                  }

                  if (value != passwordController.text) {
                    return "password doesn't match";
                  }
                  return null;
                },
                obscureText: isVisible ? true : false,
              ),
              SizedBox(height: 20),
              MaterialButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    registration();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Create account",
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
            ],
          ),
        ),
      ),
    );
  }

  registration() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}

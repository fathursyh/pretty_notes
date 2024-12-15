import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_notes/presentations/layouts/main_layout.dart';
import 'package:pretty_notes/presentations/pages/login_page.dart';
import 'package:pretty_notes/src/controllers/auth_controller.dart';
import 'package:pretty_notes/src/setting/custom_colors.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String?> _registerUser = {
    "email": null,
    "fullname": null,
    "password": null,
    "confirmPassword": null,
  };
  bool process = false;
  final AuthController _state = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Opacity(
        opacity: process == false ? 1 : 0.5,
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                    label: Text('Email address'),
                    hintText: 'user@gmail.com',
                    hintStyle: TextStyle(color: Colors.black38)),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required.';
                  }
                  return null;
                },
                onSaved: (newValue) => _registerUser['email'] = newValue,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                    label: Text('Full name'),
                    hintStyle: TextStyle(color: Colors.black38)),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required.';
                  }
                  return null;
                },
                onSaved: (newValue) => _registerUser['fullname'] = newValue,
              ),
              TextFormField(
                obscureText: true,
                obscuringCharacter: "*",
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  label: Text('Password'),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required.';
                  }
                  return null;
                },
                onSaved: (newValue) => _registerUser['password'] = newValue,
              ),
              TextFormField(
                obscureText: true,
                obscuringCharacter: "*",
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  label: Text('Confirm password'),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm password is empty.';
                  }
                  return null;
                },
                onSaved: (newValue) =>
                    _registerUser['confirmPassword'] = newValue,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 38),
                          backgroundColor: CustomColors.primary),
                      onPressed: process
                          ? null
                          : () async {
                              setState(() {
                                process = true;
                              });
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                final register = await _state.registerUser(
                                    _registerUser['email']!,
                                    _registerUser['fullname']!,
                                    _registerUser['password']!);
                                if (register == true) {
                                  Get.offAll(() => const MainLayout());
                                }
                              }
                              setState(() {
                                process = false;
                              });
                            },
                      child: Text(
                        'Register',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Transform.scale(
                      scale: 1.1,
                      child: Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: -8,
                        children: [
                          const Text(
                            "Have an account?",
                          ),
                          TextButton(
                            onPressed: () {
                              Get.off(
                                transition: Transition.leftToRight,
                                const LoginPage(),
                              );
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

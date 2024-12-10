import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_notes/presentations/pages/login_page.dart';
import 'package:pretty_notes/src/setting/custom_colors.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
            ),
            TextFormField(
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
            ),
            TextFormField(
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
                            vertical: 10, horizontal: 38),
                        backgroundColor: CustomColors.primary),
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Process data.
                      }
                    },
                    child: Text(
                      'Sign up',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
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
                          'Have an account?',
                        ),
                        TextButton(
                          onPressed: () {
                            Get.off(
                              transition: Transition.fade,
                              LoginPage(),
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
    );
  }
}

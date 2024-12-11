import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_notes/presentations/layouts/main_layout.dart';
import 'package:pretty_notes/presentations/pages/register_page.dart';
import 'package:pretty_notes/src/setting/custom_colors.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
              obscureText: true,
              obscuringCharacter: "*",
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                  label: Text('Password'),
                  hintStyle: TextStyle(color: Colors.black38)),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Name is required.';
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
                            vertical: 14, horizontal: 38),
                        backgroundColor: CustomColors.primary),
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Process data.
                        Get.offAll(const MainLayout());
                      }
                    },
                    child: Text(
                      'Login',
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
                          "Doesn't have an account?",
                        ),
                        TextButton(
                          onPressed: () {
                            Get.off(
                              transition: Transition.rightToLeft,
                              const RegisterPage(),
                            );
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
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

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});
  static const routeName = '/forgot_password';

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();

  bool inputError = false;

  String _email = '';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(249, 160, 63, 1),
                  Color.fromRGBO(247, 212, 136, 1),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SafeArea(
              child: SizedBox(
                height: deviceSize.height * 0.17,
                width: deviceSize.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: deviceSize.height * 0.04),
                      child: const Text(
                        "Password Reset",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: deviceSize.height * 0.72,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 8,
                    blurRadius: 20,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: SizedBox(
                height: deviceSize.height * 0.72,
                width: deviceSize.width * 0.9,
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    autovalidateMode: inputError
                        ? AutovalidateMode.onUserInteraction
                        : AutovalidateMode.disabled,
                    child: Column(
                      children: [
                        SizedBox(height: deviceSize.height * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Give us your email so we can\nhelp reset your password!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: deviceSize.height * 0.04),

                        // EMAIL FIELD
                        TextFormField(
                          onSaved: (value) => _email = value as String,
                          validator: (value) {
                            RegExp emailCheck =
                                RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                            if (emailCheck.hasMatch(value as String)) {
                              return null;
                            } else {
                              return 'Enter a valid email';
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 16.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'Email',
                            labelStyle: const TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(206, 209, 216, 1),
                            ),
                            filled: true,
                            fillColor: const Color.fromRGBO(237, 240, 247, 0.7),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(249, 160, 63, 1),
                                width: 1.5,
                              ),
                            ),
                            floatingLabelStyle: const TextStyle(
                              color: Color.fromRGBO(249, 160, 63, 1),
                              fontSize: 20,
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                color: Colors.red.shade900,
                                width: 2,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                color: Colors.red.shade900,
                                width: 2,
                              ),
                            ),
                          ),
                          style: const TextStyle(fontSize: 15),
                          textAlignVertical: TextAlignVertical.center,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {},
                        ),
                        SizedBox(height: deviceSize.height * 0.02),
                        Container(
                          height: deviceSize.height * 0.001,
                          width: deviceSize.width * 0.7,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(249, 160, 63, 0.5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        SizedBox(height: deviceSize.height * 0.02),
                        ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                              Size(deviceSize.width * 0.9, 50),
                            ),
                            shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                            ),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(249, 160, 63, 1),
                            ),
                            shadowColor: MaterialStateProperty.all(Colors.grey),
                            elevation: MaterialStateProperty.all(2),
                          ),
                          onPressed: () async {},
                          child: const Text(
                            "Send password reset email",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(height: deviceSize.height * 0.08),
                        Lottie.network(
                            'https://assets1.lottiefiles.com/packages/lf20_hm87r6dh.json')
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

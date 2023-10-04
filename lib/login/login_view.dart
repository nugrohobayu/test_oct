import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_oct/components/text_form_component.dart';
import 'package:test_oct/login/login_view_model.dart';
import 'package:test_oct/user_profile/user_profile_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    dialogErrorLogin() {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            content: SizedBox(
              width: queryData.size.width * 0.01,
              height: queryData.size.height * 0.13,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                ),
                child: Column(
                  children: [
                    const Text("Emailatau password salah"),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return ChangeNotifierProvider(
        create: (context) => LoginViewModel(),
        builder: (context, child) {
          return Scaffold(
            body: Consumer<LoginViewModel>(builder: (context, provider, child) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 32,
                  ),
                  child: Form(
                    key: provider.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Welcome,\nLog in now to continue"),
                        Image.asset("assets/images/login-icon.png"),
                        TextFormComponent(
                          name: "Username",
                          ctrl: provider.email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Username tidak boleh kosong";
                            }
                            // else if (!provider.emailValidation(value)) {
                            //   return "Format email salah";
                            // }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormComponent(
                          name: "Password",
                          ctrl: provider.password,
                          obscureText: !provider.showPassword,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              provider.toggleVisibility();
                            },
                            child: Icon(
                              provider.showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password tidak boleh kosong";
                            }
                            return null;
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                              ),
                              child: GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: queryData.size.height * 0.04,
                        ),
                        SizedBox(
                          width: queryData.size.width * 0.9,
                          height: queryData.size.height * 0.07,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff124d6a),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  )),
                              onPressed: () {
                                if (provider.formKey.currentState!.validate()) {
                                  provider.loginPassword().then((value) {
                                    if (value == true) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const UserProfile(),
                                          ));
                                    } else {
                                      dialogErrorLogin();
                                    }
                                  });
                                }
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: queryData.size.height * 0.08,
                        ),
                        const Center(
                          child: Text.rich(
                            TextSpan(text: "Don't have account?", children: [
                              TextSpan(
                                  text: " Register",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ))
                            ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        });
  }
}

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

    return ChangeNotifierProvider(
        create: (context) => LoginViewModel(),
        builder: (context, child) {
          return Scaffold(
            // appBar: AppBar(
            //   title: const Text("Aplikasi October"),
            //   centerTitle: true,
            // ),
            body: Consumer<LoginViewModel>(builder: (context, provider, child) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 16),
                  child: Center(
                    child: Form(
                      key: provider.formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: queryData.size.height * 0.08,
                          ),
                          Image.asset("assets/images/dashboard-icon.png"),
                          SizedBox(
                            height: queryData.size.height * 0.05,
                          ),
                          const Text(
                            "Wellcome!",
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: queryData.size.height * 0.02,
                          ),
                          TextFormComponent(
                            name: "Email",
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email tidak boleh kosong";
                              } else if (!provider.emailValidation(value)) {
                                return "Format email salah";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormComponent(
                            name: "Password",
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
                          SizedBox(
                            height: queryData.size.height * 0.06,
                          ),
                          SizedBox(
                            width: queryData.size.width * 0.9,
                            height: queryData.size.height * 0.07,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (provider.formKey.currentState!
                                      .validate()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const UserProfile(),
                                        ));
                                  }
                                },
                                child: const Text("Login")),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_oct/login/login_view.dart';
import 'package:test_oct/user_profile/user_profile_view_model.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    return ChangeNotifierProvider(
        create: (context) => UserProfileViewModel(),
        builder: (context, child) {
          return Consumer<UserProfileViewModel>(
              builder: (context, provider, child) {
            return Scaffold(
              backgroundColor: const Color.fromRGBO(21, 76, 121, 0.4),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 24,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: queryData.size.width * 0.4,
                        height: queryData.size.height * 0.22,
                        child: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://randomuser.me/api/portraits/men/75.jpg"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              provider.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              provider.company,
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: queryData.size.height * 0.02,
                      ),
                      SizedBox(
                        width: queryData.size.width * 0.9,
                        height: queryData.size.height * 0.35,
                        child: Card(
                          color: const Color(0xff124d6a),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "About Me",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: queryData.size.height * 0.03,
                                ),
                                const Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: queryData.size.height * 0.01,
                      ),
                      SizedBox(
                        width: queryData.size.width * 0.9,
                        height: queryData.size.height * 0.2,
                        child: Card(
                          color: const Color(0xff124d6a),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Contact Me",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: queryData.size.height * 0.03,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: queryData.size.width * 0.05,
                                    ),
                                    Text(
                                      provider.noTelp,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: queryData.size.height * 0.02,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.email,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: queryData.size.width * 0.05,
                                    ),
                                    Text(
                                      provider.email,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: queryData.size.height * 0.02,
                      ),
                      SizedBox(
                        width: queryData.size.width * 0.88,
                        height: queryData.size.height * 0.075,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffffa85b),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              )),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginView(),
                                ));
                          },
                          child: const Text(
                            "Hire Me",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
}

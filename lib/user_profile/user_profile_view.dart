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
              appBar: AppBar(
                title: const Text("User Profile"),
                centerTitle: true,
                automaticallyImplyLeading: false,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: queryData.size.width * 0.9,
                        height: queryData.size.height * 0.24,
                        child: Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.network(
                                    "https://randomuser.me/api/portraits/men/75.jpg"),
                                SizedBox(
                                  width: queryData.size.width * 0.05,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: queryData.size.width * 0.18,
                                      child: const Text(
                                        "Name",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: queryData.size.width * 0.35,
                                      child: Text(
                                        provider.name,
                                        style: const TextStyle(
                                            color: Colors.black87),
                                      ),
                                    ),
                                    SizedBox(
                                      height: queryData.size.height * 0.008,
                                    ),
                                    SizedBox(
                                      width: queryData.size.width * 0.18,
                                      child: const Text(
                                        "Company",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: queryData.size.width * 0.35,
                                      child: Text(
                                        provider.company,
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                    ),
                                    SizedBox(
                                      height: queryData.size.height * 0.008,
                                    ),
                                    SizedBox(
                                      width: queryData.size.width * 0.18,
                                      child: const Text(
                                        "Address",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: queryData.size.width * 0.35,
                                      child: Text(
                                        provider.address,
                                        style: const TextStyle(
                                            color: Colors.black87),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: queryData.size.height * 0.02,
                      ),
                      SizedBox(
                        width: queryData.size.width * 0.9,
                        height: queryData.size.height * 0.35,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "About Me",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: queryData.size.height * 0.03,
                                ),
                                const Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: queryData.size.height * 0.02,
                      ),
                      SizedBox(
                        width: queryData.size.width * 0.9,
                        height: queryData.size.height * 0.2,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Contact Me",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: queryData.size.height * 0.03,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.phone),
                                    SizedBox(
                                      width: queryData.size.width * 0.05,
                                    ),
                                    Text(provider.noTelp),
                                  ],
                                ),
                                SizedBox(
                                  height: queryData.size.height * 0.02,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.email),
                                    SizedBox(
                                      width: queryData.size.width * 0.05,
                                    ),
                                    Text(provider.email),
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
                        height: queryData.size.height * 0.05,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginView(),
                                ));
                          },
                          child: const Text("Log Out"),
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

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_project/providers/auth_providers.dart';

// class LogInPage extends ConsumerWidget {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final authState = ref.watch(authStateProvider);

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // ...
//             if (authState.isAuthenticated)
//               // Display a loading indicator or a success message while navigating
//               CircularProgressIndicator(),
//             // ...
//             ElevatedButton(
//               onPressed: () async {
//                 if (!authState.isAuthenticated) {
//                   // Perform login using the AuthNotifier
//                   final email = emailController.text;
//                   final password = passwordController.text;
//                   await ref
//                       .read(authStateProvider.notifier)
//                       .login(email, password);
//                 } else {
//                   Navigator.pushNamed(context, '/home');
//                 }
//               },
//               child: Text(
//                 authState.isAuthenticated ? 'Go to Home' : 'Log In',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             // ...
//           ],
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_project/providers/auth_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateProvider =
    StateProvider<AuthState>((ref) => AuthState.unauthenticated());

class AuthState {
  final bool isAuthenticated;

  const AuthState.authenticated() : isAuthenticated = true;
  const AuthState.unauthenticated() : isAuthenticated = false;
}

class LogInPage extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset('Assets/component.png',
                  alignment: Alignment.center, fit: BoxFit.fill),
            ),
            Container(
                margin: EdgeInsets.all(20.0),
                // width: 500,
                child: Column(
                  children: [
                    Text("Log In",
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.mail),
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        'I do not have account',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () async {
                        final email = emailController.text;
                        final password = passwordController.text;
                        final isSuccess = await ref
                            .read(authNotifierProvider.notifier)
                            .login(email, password);

                        if (isSuccess) {
                          Navigator.pushNamed(context, '/home');
                        } else {
                          print("Login failed");
                        }
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )),
            Container(
                child: Image.asset(
              'Assets/component1.png',
              fit: BoxFit.fill,
            ))
          ],
        ),
      ),
    );
  }
}

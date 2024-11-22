import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/utiles/assets_Manager.dart';
import 'package:todo/core/utiles/colors_Manager.dart';
import 'package:todo/core/utiles/routes_Manager.dart';
import 'package:todo/presentation/screens/home/HomeScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/custom_field.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  Future signIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(

      email: _emailController.text,
      password: _passwordController.text,

      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Success.'),
          backgroundColor: Colors.red,
        ),

      );

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homescreen(

      ),));

    } on FirebaseAuthException catch (e) {



      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No user found for that email.'),
            backgroundColor: Colors.red,
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Wrong password provided.'),
            backgroundColor: Colors.red,
          ),
        );
    }

    } catch (e) {
    print('An error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.signin),
        actions: [Image.asset(AssetsManager.SplashLightLogo)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTextField(AppLocalizations.of(context)!.email , _emailController),
            SizedBox(height: 20),
            // Password field with visibility toggle
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible, // This controls the visibility
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.password,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: signIn,
              child: Text('Sign In'),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${AppLocalizations.of(context)!.donthaveAccount}? ",style: TextStyle(fontSize: 18)),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesManager.register);
                  },
                  child: Text(AppLocalizations.of(context)!.signup,style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
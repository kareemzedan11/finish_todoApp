import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utiles/assets_Manager.dart';
import '../../../core/utiles/colors_Manager.dart';
import '../../../core/utiles/routes_Manager.dart';
import '../home/HomeScreen.dart';
import '../widgets/custom_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Register extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<Register> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  Future signUp() async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,

      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Success.'),
          backgroundColor: Colors.red,
        ),
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homescreen(),));


    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('The password provided is too weak.'),
            backgroundColor: Colors.red,
          ),
        );

      } else if (e.code == 'email-already-in-use') {

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("this account already exists for that email."),
            backgroundColor: Colors.red,
          ),
        );


      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.signup),
        actions: [Image.asset(AssetsManager.SplashLightLogo)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTextField(AppLocalizations.of(context)!.email, _emailController),
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
              onPressed: signUp,
              child: Text(AppLocalizations.of(context)!.signup),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${AppLocalizations.of(context)!.haveAccount}? ",style: TextStyle(fontSize: 18)),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.signin,style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
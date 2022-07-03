import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String displayName = '';
  String email = '';
  String photoUrl = '';
  bool isSignedIn = false;
  bool isLoading = false;
  late GoogleSignInAccount? user;

  @override
  Widget build(BuildContext context) {
    return isLoading ? const Center(child: CircularProgressIndicator()) : isSignedIn ? signedInWidget()
        : Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(child: Text('Sign in with', style: Constants.darkTextStyle,
            textAlign: TextAlign.center)),
        const SizedBox(height: 10),
        InkWell(
          onTap: _handleSignIn,
            child: Image.asset('assets/google.png', height: 50)),
      ],
    );
  }

  Widget signedInWidget(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if(photoUrl!='') ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(photoUrl, width: 100, height: 100)),
        const SizedBox(height: 10),
        Text(displayName, style: Constants.smallTextStyle,
            textAlign: TextAlign.center),
        const SizedBox(height: 10),
        Text(email, style: Constants.smallTextStyle,
            textAlign: TextAlign.center),
        const SizedBox(height: 10),
        ElevatedButton.icon(onPressed: _handleSignOut, icon: const Icon(Icons.logout),
            label: const Text('Signout')),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    checkAndSetSignIn();
  }

  checkAndSetSignIn()async{
    isSignedIn = await _googleSignIn.isSignedIn();
    if(isSignedIn){
      _handleSignIn();
    }
  }

  Future<void> _handleSignOut() async{
    _googleSignIn.disconnect();
    setState(() {
      isSignedIn = false;
      user = null;
    });
  }

  Future<void> _handleSignIn() async {
    try {
      setState(() {
        isLoading = true;
      });
      user = await _googleSignIn.signIn();
      if(user != null) {
        setState(() {
          displayName = user?.displayName ?? '';
          email = user?.email ?? '';
          photoUrl = user?.photoUrl ?? '';
          isSignedIn = true;
          isLoading = false;
        });
      }
      // isSignedIn
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print('_handleSignIn error');
      print(error);
    }
  }
}

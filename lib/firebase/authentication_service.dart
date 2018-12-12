import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthenticationService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;

  Future<FirebaseUser> _handleSignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    FirebaseUser user = await _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print("signed in " + user.displayName);
    this._user = user;
    return user;
  }

  callback(){
    _handleSignIn()
    .then((FirebaseUser user) => print(user))
        .catchError((e) => print(e));
  }

  getUser(){
    return _user == null ? "User" : _user.displayName;
  }
}
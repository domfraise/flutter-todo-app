import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthenticationService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleSignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    FirebaseUser user = await _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print("signed in " + user.displayName);
    return user;
  }

  callback(){
    _handleSignIn()
    .then((FirebaseUser user) => print(user))
        .catchError((e) => print(e));
  }

  Future<FirebaseUser> getUser() async {
    return _auth.currentUser();
  }

  Future<String> getDisplayName() async {
    var user = await getUser();
    return user == null ? "" : user.displayName;
  }
}
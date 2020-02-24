import 'package:firebase_auth/firebase_auth.dart';
import 'package:idntfy_app/models/user.dart';
import 'package:idntfy_app/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // method to create custom user based on firebase user
  UserData _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? UserData(uid: user.uid) : null;
  }

  // method to listen to auth changes on user stream and map to custom user model
  Stream<UserData> get userState {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // method to register with email and password
  Future registerWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData(
          name, email, 'Enter your Address', 'Enter your Phone Number');
      final providerDataRef = await DatabaseService(uid: user.uid)
          .updateUserProviderData('company', 'domain', 'datapoints');
      await DatabaseService(uid: user.uid).updateUserProviderAccess(
          providerDataRef.documentID, name, email, 'address', 'phoneNumber');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // method to sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // method to sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

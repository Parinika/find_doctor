import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  // final name=currentUser.name;
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

//   Future<void> signOut() async {
//     await _firebaseAuth.signOut();
//   }
// }

// Future<void> userSetup(String displayName) async {
  // CollectionReference userData = FirebaseFirestore.instance.collection('userData');
//   FirebaseAuth auth = FirebaseAuth.instance;
//   // String? email = auth.currentUser.email.toString();
//   // String uid = auth.currentUser.uid.toString();
//   userData.add({'displayName': displayName,});
//   return;
}

// class DatabaseService {
//   final String uid;
//   DatabaseService({this.uid});
//   final CollectionReference userData =
//       FirebaseFirestore.instance.collection('userData');
//   Future updateUserData(String name, String email) async {
//     return await userData.document(uid).setData({
//       'Name': name,
//       'Email': email
//     });
//   }
// }

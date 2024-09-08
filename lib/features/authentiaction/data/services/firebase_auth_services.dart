import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:spotify/features/authentiaction/data/model/create_user_request.dart';

abstract class FirebaseAuthServices {
  Future<void> signin();
  Future<void> register(CreateUserRequest createUserRequest);
}

class FirebaseAuthServicesImpl extends FirebaseAuthServices {
  @override
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> register(CreateUserRequest createUserRequest) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: createUserRequest.email, password: createUserRequest.password);
    } on FirebaseAuthException catch (e) {}
  }

  @override
  Future<void> signin() async {
    // TODO: implement signin
    throw UnimplementedError();
  }
}

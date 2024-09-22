import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/create_user_request.dart';
import '../model/signin_user_request.dart';

abstract class FirebaseAuthServices {
  Future<Either> signin(SigninUserRequest signInUserRequest);
  Future<Either> register(CreateUserRequest createUserRequest);
}

class FirebaseAuthServicesImpl extends FirebaseAuthServices {
  @override
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Either> register(CreateUserRequest createUserRequest) async {
    try {
      var data = await _auth.createUserWithEmailAndPassword(
          email: createUserRequest.email, password: createUserRequest.password);

      FirebaseFirestore.instance.collection('users')
          .doc(data.user!.uid).set(
        {
          'name':createUserRequest.name,
          'email':data.user!.email,
        }
      );

      return const Right('Signin was successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'invalid-email') {
        message = 'The email address is badly formatted.';
      } else if (e.code == 'operation-not-allowed') {
        message = 'Password sign-in is disabled for this project.';
      } else if (e.code == 'user-disabled') {
        message = 'The user account has been disabled.';
      } else if (e.code == 'user-not-found') {
        message =
            'There is no user corresponding to this identifier. The user may have been deleted.';
      } else if (e.code == 'wrong-password') {
        message =
            'The password is invalid or the user does not have a password.';
      } else {
        message = e.message.toString();
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signin(SigninUserRequest signInUserRequest) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: signInUserRequest.email, password: signInUserRequest.password);
      return Right('Signup was successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'wrong-password') {
        message = 'The password is invalid.';
      } else if (e.code == 'invalid-email') {
        message = 'The email address is badly formatted.';
      } else if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'user-disabled') {
        message = 'This user account has been disabled.';
      } else if (e.code == 'too-many-requests') {
        message = 'Too many attempts. Try again later.';
      } else if (e.code == 'operation-not-allowed') {
        message = 'Email and password login is not enabled.';
      } else {
        message = e.message.toString();
      }
      return Left(message);
    }
  }
}

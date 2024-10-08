import 'dart:async';

import 'package:dartz/dartz.dart';
import '../../../data/model/create_user_request.dart';
import '../../../data/model/signin_user_request.dart';
import '../../../data/services/firebase_auth_services.dart';
import '../../../data/services/service_locator.dart';

abstract class AuthRepository {
  Future<Either> signin(SigninUserRequest signInUserRequest);
  Future<Either> register(CreateUserRequest createUserRequest);
}

class AuthRepoImpl extends AuthRepository {
  late FirebaseAuthServicesImpl firebaseAuthService;
  @override
  Future<Either> register(CreateUserRequest createUserRequest) async {
    return await sl<FirebaseAuthServices>().register(createUserRequest);
  }

  @override
  Future<Either> signin(SigninUserRequest signInUserRequest) async {
    return await sl<FirebaseAuthServices>().signin(signInUserRequest);
  }
}

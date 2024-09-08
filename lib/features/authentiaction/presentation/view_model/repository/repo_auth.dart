import 'dart:async';

import 'package:spotify/features/authentiaction/data/model/create_user_request.dart';

abstract class AuthRepository {
  Future<void> signin();
  Future<void> register();
}

class AuthRepoImpl extends AuthRepository {
  @override
  Future<void> register() {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

}

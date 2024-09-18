import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecasses/usecase.dart';
import 'package:spotify/features/authentiaction/data/model/signin_user_request.dart';
import 'package:spotify/features/authentiaction/data/services/service_locator.dart';
import 'package:spotify/features/authentiaction/presentation/view_model/repository/repo_auth.dart';

class SignInUSeCase implements Usecase<Either,SigninUserRequest>{
  @override
  Future<Either> call({SigninUserRequest? params}) async{
    return sl<AuthRepository>().signin(params!);
  }

}
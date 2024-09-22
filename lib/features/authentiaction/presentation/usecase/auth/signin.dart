import 'package:dartz/dartz.dart';
import '../../../../../core/usecasses/usecase.dart';
import '../../../data/model/signin_user_request.dart';
import '../../../data/services/service_locator.dart';
import '../../view_model/repository/repo_auth.dart';

class SignInUSeCase implements Usecase<Either,SigninUserRequest>{
  @override
  Future<Either> call({SigninUserRequest? params}) async{
    return sl<AuthRepository>().signin(params!);
  }

}
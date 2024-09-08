import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecasses/usecase.dart';
import 'package:spotify/features/authentiaction/data/model/create_user_request.dart';
import 'package:spotify/features/authentiaction/data/services/service_locator.dart';
import 'package:spotify/features/authentiaction/presentation/view_model/repository/repo_auth.dart';

class RegisterUseCase implements Usecase<Either,CreateUserRequest>{
  @override
  Future<Either> call({CreateUserRequest? params}) async{
    return sl<AuthRepository>().register(params!);
  }

}
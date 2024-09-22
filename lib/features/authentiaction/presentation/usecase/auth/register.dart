import 'package:dartz/dartz.dart';
import '../../../../../core/usecasses/usecase.dart';
import '../../../data/model/create_user_request.dart';
import '../../../data/services/service_locator.dart';
import '../../view_model/repository/repo_auth.dart';

class RegisterUseCase implements Usecase<Either,CreateUserRequest>{
  @override
  Future<Either> call({CreateUserRequest? params}) async{
    return sl<AuthRepository>().register(params!);
  }

}
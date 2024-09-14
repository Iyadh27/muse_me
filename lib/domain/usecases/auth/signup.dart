import 'package:dartz/dartz.dart';
import 'package:muse_me/core/usecase/usecase.dart';
import 'package:muse_me/data/models/auth/create_user_req.dart';
import 'package:muse_me/domain/repository/auth/auth.dart';
import 'package:muse_me/service_locator.dart';

class SignupUseCase implements UseCase<Either,CreateUserReq> {
  @override
  Future<Either>call({ CreateUserReq ? params}) async{
    return sl<AuthRepository>().signup(params!);
  }



}
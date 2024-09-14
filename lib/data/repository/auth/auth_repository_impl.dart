import 'package:dartz/dartz.dart';
import 'package:muse_me/data/models/auth/create_user_req.dart';
import 'package:muse_me/data/sources/auth/auth_firebase_service.dart';
import 'package:muse_me/domain/repository/auth/auth.dart';
import 'package:muse_me/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either>signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }


  @override
  Future<void> signin() {
    throw UnimplementedError();
  }
}

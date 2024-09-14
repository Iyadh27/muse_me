import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:muse_me/data/models/auth/create_user_req.dart';

abstract class AuthFirebaseService {
  // Future<User?> signInWithGoogle();
  Future<void> signin();
  Future<Either> signup(CreateUserReq createUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
      return Right("Signup successful");
     } on FirebaseAuthException catch (e) {
      String message = "";

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      return Left(message);
    }
  }

  @override
  Future<void> signin() {
    // TODO: implement signup
    throw UnimplementedError();
  }
}

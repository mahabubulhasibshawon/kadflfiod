import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<void> signin();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
      return Right('Signup was successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if(e.code == 'weak-password'){
        message = 'This password is weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email';
      }

      return left(message);
    }
  }

}
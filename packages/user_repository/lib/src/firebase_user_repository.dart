import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

abstract class FirebaseUserRepository implements UserRepository{

  FirebaseUserRepository({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;
  
  @override
  Future<MyUserModel> signUp(MyUserModel myuser, String password){
    //TODO: implement
    throw UnimplementedError();
  }

  @override
  Future<void> logIn(String email, String password){
    //TODO: implement
    throw UnimplementedError();
  }
  
  @override
  Future<void> logOut(){
    //TODO: implement
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword(String email){
    //TODO: implement
    throw UnimplementedError();
  }
  
}
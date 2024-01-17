import 'package:user_repository/user_repository.dart';

abstract class UserRepository{
  
  Future<MyUserModel> signUp(MyUserModel myuser, String password);

  Future<void> logIn(String email, String password);

  Future<void> logOut();

  Future<void> resetPassword(String email);

}
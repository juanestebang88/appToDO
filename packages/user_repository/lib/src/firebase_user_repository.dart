import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

abstract class FirebaseUserRepository implements UserRepository{

  FirebaseUserRepository({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;
  final userCollection = FirebaseFirestore.instance.collection('users');
  
  @override
  Stream<User?> get user{
    return _firebaseAuth.authStateChanges().map((firebaseUser){
      final user = firebaseUser;
      return user;
    });
  }

  @override
  Future<MyUserModel> signUp(MyUserModel myUser, String password) async{
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: myUser.email,
        password: password
      );

      myUser = myUser.copyWith(
        id: user.user!.uid
      );

      return myUser;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> logIn(String email, String password) async{
    try {
      UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password
      );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  
  @override
  Future<void> logOut() async{
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String email) async{
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: email
      );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> setUserData(MyUserModel myUser) async{
    try {
      await userCollection.doc(myUser.id).set(myUser.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow; 
    }
  }

  @override
  Future<MyUserModel> getMyUser(String myUserId) async{
    try {
      return userCollection.doc(myUserId).get().then((value) => 
        MyUserModel.fromEntity(MyUserEntity.fromDocument(value.data()!))
      );
    } catch (e) {
      log(e.toString());
      rethrow; 
    }
  }

}
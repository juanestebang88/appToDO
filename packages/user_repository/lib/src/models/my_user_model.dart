import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

class MyUserModel extends Equatable{
  final String id;
  final String email;
  final String name;
  final String? picture;

  const MyUserModel({
    required this.id,
    required this.email,
    required this.name,
    this.picture
  });

  //Empty user which represents an unauth user
  static const empty = MyUserModel(
    id: '',
    email: '',
    name: '',
    picture: ''
  );

  //Modify parameters
  MyUserModel copyWith({
    String? id,
    String? email,
    String? name,
    String? picture,
  }){
    return MyUserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      picture: picture ?? this.picture
    );
  }

  bool get isEmpty    => this == MyUserModel.empty;
  bool get isNotEmpty => this != MyUserModel.empty;

  MyUserEntity toEntity(){
    return MyUserEntity(
      id: id,
      email: email,
      name: name
    );
  }

  static MyUserModel fromEntity( MyUserEntity entity){
    return MyUserModel(
      id: entity.id,
      email: entity.email,
      name: entity.name
    );
  }

  @override
  List<Object?> get props => [id, email, name];
  
}
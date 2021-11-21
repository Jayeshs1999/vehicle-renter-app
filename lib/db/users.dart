//import 'package:firebase_core/firebase_core.dart';

class UserModel {
  String? uid;
  String? firstName;
  String? email;
  String? gender;
  String? password;

  UserModel({this.uid, this.email, this.firstName, this.gender, this.password});

  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        firstName: map['firstName'],
        gender: map['gender'],
        password: map['password']);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'gender': gender
    };
  }
}

// import 'package:firebase_database/firebase_database.dart';

// class UserServices {
//   final FirebaseDatabase _database = FirebaseDatabase.instance;
//   String ref = "Users";

//   createUser(Map value) {
//     _database
//         .reference()
//         .child("ref")
//         .push()
//         .set(value)
//         .catchError((e) => {print(e.toString())});
//   }
// }



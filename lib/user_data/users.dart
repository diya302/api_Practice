import 'package:practice2/user_data/user_dob.dart';
import 'package:practice2/user_data/user_location.dart';
import 'package:practice2/user_data/user_name.dart';
import 'package:practice2/user_data/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserPicture picture;
  final UserLocation location;
  User(
      {required this.gender,
      required this.picture,
      required this.location,
      required this.dob,
      required this.email,
      required this.phone,
      required this.cell,
      required this.name,
      required this.nat});

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName.forMap(e['name']);
    // final date = e['dob']['date'];
    final dob = UserDob.fromMap(e['job']);
    final location = UserLocation.fromMap(e['location']);
    final picture = UserPicture.fromMap(e['picture']);
    return User(
      gender: e['gender'],
      cell: e['cell'],
      email: e['email'],
      nat: e['nat'],
      phone: e['phone'],
      name: name,
      dob: dob,
      location: location,
      picture: picture,
    );
  }
  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}

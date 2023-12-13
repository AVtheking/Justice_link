// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Lawyer {
  final String? id;
  final String name;
  final String email;
  final String password;
  final String? lawyerId;
  final String? lawyerType;
  final String? lawyerExperience;
  final String? location;
  final String? skills;
  final String? lawyerbio;
  Lawyer({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    this.lawyerId,
    this.lawyerType,
    this.lawyerExperience,
    this.location,
    this.skills,
    this.lawyerbio,
  });

  Lawyer copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? lawyerId,
    String? lawyerType,
    String? lawyerExperience,
    String? location,
    String? skills,
    String? lawyerbio,
  }) {
    return Lawyer(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      lawyerId: lawyerId ?? this.lawyerId,
      lawyerType: lawyerType ?? this.lawyerType,
      lawyerExperience: lawyerExperience ?? this.lawyerExperience,
      location: location ?? this.location,
      skills: skills ?? this.skills,
      lawyerbio: lawyerbio ?? this.lawyerbio,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'lawyerId': lawyerId,
      'lawyerType': lawyerType,
      'lawyerExperience': lawyerExperience,
      'location': location,
      'skills': skills,
      'lawyerbio': lawyerbio,
    };
  }

  factory Lawyer.fromMap(Map<String, dynamic> map) {
    return Lawyer(
      id: map['_id'] != null ? map['_id'] as String : null,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      lawyerId: map['lawyerId'] != null ? map['lawyerId'] as String : null,
      lawyerType:
          map['lawyerType'] != null ? map['lawyerType'] as String : null,
      lawyerExperience: map['lawyerExperience'] != null
          ? map['lawyerExperience'] as String
          : null,
      location: map['location'] != null ? map['location'] as String : null,
      skills: map['skills'] != null ? map['skills'] as String : null,
      lawyerbio: map['bio'] != null ? map['bio'] as String : null,
    );
  }

  String toJson() =>
      json.encode(toMap()..removeWhere((key, value) => value == null));

  factory Lawyer.fromJson(String source) =>
      Lawyer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Lawyer(id: $id, name: $name, email: $email, password: $password, lawyerId: $lawyerId, lawyerType: $lawyerType, lawyerExperience: $lawyerExperience, location: $location, skills: $skills, lawyerbio: $lawyerbio)';
  }
}

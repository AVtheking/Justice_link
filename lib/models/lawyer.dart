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

  Lawyer({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.lawyerId,
    required this.lawyerType,
    required this.lawyerExperience,
    required this.location,
    required this.skills,
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
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory Lawyer.fromMap(Map<String, dynamic> map) {
    return Lawyer(
      id: map['_id'] as String? ?? '',
      name: map['name'] as String? ?? '',
      email: map['email'] as String? ?? '',
      password: map['password'] as String? ?? '',
      lawyerId: map['lawyerId'] as String? ?? '',
      lawyerType: map['lawyerType'] as String? ?? '',
      lawyerExperience: map['lawyerExperience'] as String? ?? '',
      location: map['location'] as String? ?? '',
      skills: map['skills'] as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Lawyer.fromJson(String source) =>
      Lawyer.fromMap(json.decode(source) as Map<String, dynamic>);
}

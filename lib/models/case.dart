// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Case {
  final String? id;
  final String lawyerId;
  final String victimName;
  final String oppositionName;
  final String lastPresentedOn;
  final String petitioner;
  final String caseNo;
  final String respondent;
  final String petAdvocates;
  final String caseStatus;
  final String category;
  final String resAdvocates;

  Case({
    this.id,
    required this.lawyerId,
    required this.victimName,
    required this.oppositionName,
    required this.lastPresentedOn,
    required this.petitioner,
    required this.caseNo,
    required this.respondent,
    required this.petAdvocates,
    required this.caseStatus,
    required this.category,
    required this.resAdvocates,
  });

  Case copyWith({
    String? id,
    String? lawyerId,
    String? victimName,
    String? oppositionName,
    String? lastPresentedOn,
    String? petitioner,
    String? caseNo,
    String? respondent,
    String? petAdvocates,
    String? caseStatus,
    String? category,
    String? resAdvocates,
  }) {
    return Case(
      id: id ?? this.id,
      lawyerId: lawyerId ?? this.lawyerId,
      victimName: victimName ?? this.victimName,
      oppositionName: oppositionName ?? this.oppositionName,
      lastPresentedOn: lastPresentedOn ?? this.lastPresentedOn,
      petitioner: petitioner ?? this.petitioner,
      caseNo: caseNo ?? this.caseNo,
      respondent: respondent ?? this.respondent,
      petAdvocates: petAdvocates ?? this.petAdvocates,
      caseStatus: caseStatus ?? this.caseStatus,
      category: category ?? this.category,
      resAdvocates: resAdvocates ?? this.resAdvocates,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'lawyerId': lawyerId,
      'victimName': victimName,
      'oppositionName': oppositionName,
      'lastPresentedOn': lastPresentedOn,
      'petitioner': petitioner,
      'caseNo': caseNo,
      'respondent': respondent,
      'petAdvocates': petAdvocates,
      'caseStatus': caseStatus,
      'category': category,
      'resAdvocates': resAdvocates,
    };
  }

  factory Case.fromMap(Map<String, dynamic> map) {
    return Case(
      id: map['_id'] != null ? map['_id'] as String : null,
      lawyerId: map['lawyerId'] as String,
      victimName: map['victimName'] as String,
      oppositionName: map['oppositionName'] as String,
      lastPresentedOn: map['lastPresentedOn'] as String,
      petitioner: map['petitioner'] as String,
      caseNo: map['caseNo'] as String,
      respondent: map['respondent'] as String,
      petAdvocates: map['petAdvocates'] as String,
      caseStatus: map['caseStatus'] as String,
      category: map['category'] as String,
      resAdvocates: map['resAdvocates'] as String,
    );
  }

  String toJson() =>
      json.encode(toMap()..removeWhere((key, value) => value == null));

  factory Case.fromJson(String source) =>
      Case.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Case(id: $id, lawyerId: $lawyerId, victimName: $victimName, oppositionName: $oppositionName, lastPresentedOn: $lastPresentedOn, petitioner: $petitioner, caseNo: $caseNo, respondent: $respondent, petAdvocates: $petAdvocates, caseStatus: $caseStatus, category: $category, resAdvocates: $resAdvocates)';
  }

  @override
  bool operator ==(covariant Case other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.lawyerId == lawyerId &&
        other.victimName == victimName &&
        other.oppositionName == oppositionName &&
        other.lastPresentedOn == lastPresentedOn &&
        other.petitioner == petitioner &&
        other.caseNo == caseNo &&
        other.respondent == respondent &&
        other.petAdvocates == petAdvocates &&
        other.caseStatus == caseStatus &&
        other.category == category &&
        other.resAdvocates == resAdvocates;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        lawyerId.hashCode ^
        victimName.hashCode ^
        oppositionName.hashCode ^
        lastPresentedOn.hashCode ^
        petitioner.hashCode ^
        caseNo.hashCode ^
        respondent.hashCode ^
        petAdvocates.hashCode ^
        caseStatus.hashCode ^
        category.hashCode ^
        resAdvocates.hashCode;
  }
}

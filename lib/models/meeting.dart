// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Meeting {
  final String id;
  final String lawyerId;
  final String userId;
  final String senderName;
  final String receiverName;
  final String accusedName;
  final String applicantName;
  final String caseType;
  final String oppositionLawyerName;
  final String caseNo;
  final String courtName;
  final String caseDetails;
  String? meetingStatus;

  Meeting({
    required this.id,
    required this.lawyerId,
    required this.userId,
    required this.senderName,
    required this.receiverName,
    required this.accusedName,
    required this.applicantName,
    required this.caseType,
    required this.oppositionLawyerName,
    required this.caseNo,
    required this.courtName,
    required this.caseDetails,
    this.meetingStatus,
  });

  Meeting copyWith({
    String? id,
    String? lawyerId,
    String? userId,
    String? senderName,
    String? receiverName,
    String? accusedName,
    String? applicantName,
    String? caseType,
    String? oppositionLawyerName,
    String? caseNo,
    String? courtName,
    String? caseDetails,
    String? meetingStatus,
  }) {
    return Meeting(
      id: id ?? this.id,
      lawyerId: lawyerId ?? this.lawyerId,
      userId: userId ?? this.userId,
      senderName: senderName ?? this.senderName,
      receiverName: receiverName ?? this.receiverName,
      accusedName: accusedName ?? this.accusedName,
      applicantName: applicantName ?? this.applicantName,
      caseType: caseType ?? this.caseType,
      oppositionLawyerName: oppositionLawyerName ?? this.oppositionLawyerName,
      caseNo: caseNo ?? this.caseNo,
      courtName: courtName ?? this.courtName,
      caseDetails: caseDetails ?? this.caseDetails,
      meetingStatus: meetingStatus ?? this.meetingStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'lawyerId': lawyerId,
      'userId': userId,
      'senderName': senderName,
      'receiverName': receiverName,
      'accusedName': accusedName,
      'applicantName': applicantName,
      'caseType': caseType,
      'oppositionLawyerName': oppositionLawyerName,
      'caseNo': caseNo,
      'courtName': courtName,
      'caseDetails': caseDetails,
      'meetingStatus': meetingStatus,
    };
  }

  factory Meeting.fromMap(Map<String, dynamic> map) {
    return Meeting(
      id: map['_id'] as String,
      lawyerId: map['lawyerId'] as String,
      userId: map['userId'] as String,
      senderName: map['senderName'] as String,
      receiverName: map['receiverName'] as String,
      accusedName: map['accusedName'] as String,
      applicantName: map['applicantName'] as String,
      caseType: map['caseType'] as String,
      oppositionLawyerName: map['opposingLawyerName'] as String,
      caseNo: map['caseNo'] as String,
      courtName: map['courtName'] as String,
      caseDetails: map['caseDetails'] as String,
      meetingStatus:
          map['meetingStatus'] != null ? map['meetingStatus'] as String : null,
    );
  }

  String toJson() =>
      json.encode(toMap()..removeWhere((key, value) => value == null));

  factory Meeting.fromJson(String source) =>
      Meeting.fromMap(json.decode(source) as Map<String, dynamic>);
}

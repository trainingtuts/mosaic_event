class UserModel {
  String? uid;
  String? firstname;
  String? lastname;
  String? email;
  String? role;
  String? phoneNo;
  String? profileUrl;
  String? gender;
  DateTime? joiningDate;
  bool? isActive;

  UserModel({
    this.uid,
    this.firstname,
    this.lastname,
    this.email,
    this.role,
    this.phoneNo,
    this.gender,
    this.joiningDate,
    this.profileUrl,
    this.isActive,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'role': role,
      'phoneNo': phoneNo,
      'gender': gender,
      'joiningDate': joiningDate,
      'profileUrl': profileUrl,
      'isActive': isActive,
    };
  }
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      role: map['role'],
      phoneNo: map['phoneNo'],
      gender: map['gender'],
      joiningDate: map['joiningDate'],
      profileUrl: map['profileUrl'],
      isActive: map['isActive'],
    );
  }
}

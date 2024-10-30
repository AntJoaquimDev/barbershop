import 'dart:convert';

sealed class UserModel {
  final int id;
  final String name;
  final String email;
  final String? avatar;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
  });
factory UserModel.fromMap(Map<String, dynamic> json) {
  return switch(json['profile']){
      'ADM'=>UserModel.fromMap(json),
      'PROFILE'=>UserModelEmployee.fromMap(json),
      _ =>throw ArgumentError('User profile not found')
  };
}

}

class UserModelADM extends UserModel {
  List<String>? workDays;
  List<String>? workHours;

  UserModelADM(
      {required super.id,
      required super.name,
      required super.email,
      super.avatar,
      this.workDays,
      this.workHours});

  factory UserModelADM.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id':final int id,
        'name': final String name,
        'email': final String email,
      } =>
        UserModelADM(
          id: id,
          name: name,
          email: email,
          avatar: json['avatar'],
          workDays:  json['work_hours']?.cast<String>(),
          workHours: json['work_hours']?.cast<String>(),
        ),
      _ => throw ArgumentError('inavlide erro'),
    };
  }
}

class UserModelEmployee extends UserModel {
  final int barberShopId;
  List<String> workDays;
  List<int> workHours;

  UserModelEmployee({
    required super.id,
    required super.name,
    required super.email,
    required this.barberShopId,
    required this.workDays,
    required this.workHours,
    super.avatar,
  });

  
  factory UserModelEmployee.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id':final int id,
        'name': final String name,
        'email': final String email,
        'barberShopId':final barberShopId,
        'work_days':final List workDays,
        'work_hours':final List workHours,
      } =>
        UserModelEmployee(
          id: id,
          name: name,
          email: email,
          avatar: json['avatar'],
          barberShopId: barberShopId,
          workDays:workDays.cast<String>(),
          workHours:workHours.cast<int>(),
        ),
      _ => throw ArgumentError('inavlide erro'),
    };
  }
}
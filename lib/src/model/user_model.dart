sealed class UserModel {
  final int id;
  final String name;
  final String email;
  // final String password;
  final String? avatar;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    // required this.password,
    this.avatar,
  });
  factory UserModel.fromMap(Map<String, dynamic> json) {
    return switch (json['profile']) {
      'ADM' => UserModelADM.fromMap(json),
      'EMPLOYEE' => UserModelEmployee.fromMap(json),
      _ => throw ArgumentError('User profile not found')
    };
  }
}

class UserModelADM extends UserModel {
  final List<String>? workDays;
  final List<int>? workHours;

  UserModelADM({
    required super.id,
    required super.name,
    required super.email,
    super.avatar,
    this.workDays,
    this.workHours,
  });

  factory UserModelADM.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': final int id,
        'name': final String name,
        'email': final String email,
       
      } =>
        UserModelADM(
          id: id,
          name: name,
          email: email,
          
          avatar: json['avatar'],
          workDays: json['work_days']?.cast<String>(),
          workHours: json['work_hours']?.cast<int>(),
        ),
      _ => throw ArgumentError('inavlide Json'),
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
        'id': final int id,
        'name': final String name,
        'email': final String email,
        'barbershop_id': final int barberShopId,
        'work_days': final List workDays,
        'work_hours': final List workHours,
      } =>
        UserModelEmployee(
          id: id,
          name: name,
          email: email,
          avatar: json['avatar'],
          barberShopId: barberShopId,
          workDays: workDays.cast<String>(),
          workHours: workHours.cast<int>(),
        ),
      _ => throw ArgumentError('inavlide Json'),
    };
  }
}

import 'package:foodes/AuthScreens/Strings.dart';

class UserModelList {
  String userUid; // uid
  String userName; // display_name
  String userEmail; // email
  String userImage;
  String userNumber;

  Map<String, dynamic> toMap() {
    return {
      'uid': userUid,
      'name': userName,
      'email': userEmail,
      'user_number':userNumber,
      'user_image':userImage,


    };
  }

  UserModelList();

  static UserModelList mapToUser(Map<String, dynamic> map) {
    UserModelList userModelList = new UserModelList();
    userModelList.userUid = map['uid'];
    userModelList.userName = map['name'] ?? "";
    userModelList.userEmail = map["email"];
    userModelList.userNumber = map["user_number"];
    userModelList.userImage = map["user_image"];

    return userModelList;
  }
}
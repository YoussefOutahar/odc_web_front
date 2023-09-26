class Message {
  String? uid;
  bool isRead;
  String email;
  String message;

  Message({this.uid, required this.isRead, required this.email, required this.message});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      uid: json['uid'] as String?,
      isRead: json['isRead'] as bool,
      email: json['email'] as String,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'isRead': isRead,
      'email': email,
      'message': message,
    };
  }
}

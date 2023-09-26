class Message {
  String? uid;
  String email;
  String message;

  Message({this.uid, required this.email, required this.message});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      uid: json['uid'] as String?,
      email: json['email'] as String,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'message': message,
    };
  }
}

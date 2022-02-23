import 'dart:convert';

FeedBack feedBackFromJson(String str) => FeedBack.fromJson(json.decode(str));

String feedBackToJson(FeedBack data) => json.encode(data.toJson());

class FeedBack {
  FeedBack({
    required this.feedback,
  });

  String feedback;

  factory FeedBack.fromJson(Map<String, dynamic> json) => FeedBack(
        feedback: json["feedback"],
      );
  factory FeedBack.created() => FeedBack(
        feedback: "",
      );
  Map<String, dynamic> toJson() => {
        "feedback": feedback,
      };
}

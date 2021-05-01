class OxygenPostModel {
  final String title;
  final String description;
  final String pin;
  final String postedOn;
  final String postedBy;
  final String postedRole;

  OxygenPostModel({
    required this.title,
    required this.description,
    required this.pin,
    required this.postedOn,
    required this.postedBy,
    required this.postedRole,
  });

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "pin": pin,
      "postedOn": postedOn,
      "postedBy": postedBy,
      "postedRole": postedRole,
    };
  }
}

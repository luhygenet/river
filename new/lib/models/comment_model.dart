class Comment {
  final String id;
  final String comment;

  Comment({required this.id, required this.comment});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      comment: json['comment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comment': comment,
    };
  }
}
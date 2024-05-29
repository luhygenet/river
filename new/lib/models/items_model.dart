class Item {
  final String id;
  final String description;
  final List<int> picture;

  Item({required this.id, required this.description, required this.picture});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      description: json['description'],
      picture: (json['picture'] as List).cast<int>(), // Assuming picture is stored as a list of integers
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'picture': picture,
    };
  }
}
class MovieModel {
  final int id;
  final String url;
  final String name;
  final String language;
  final String image;

  MovieModel({
    required this.id,
    required this.url,
    required this.name,
    required this.language,
    required this.image,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      url: json['url'],
      name: json['name'],
      language: json['language'] ?? '',
      image: _parseImage(json['image']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'name': name,
      'language': language,
      'image': image,
    };
  }
}

String _parseImage(dynamic imageJson) {
  if (imageJson == null) return '';
  if (imageJson is String) return imageJson;
  if (imageJson is Map) {
    // prefer medium, fallback to original, else empty string
    return (imageJson['medium'] ?? imageJson['original'] ?? '') as String;
  }
  return '';
}

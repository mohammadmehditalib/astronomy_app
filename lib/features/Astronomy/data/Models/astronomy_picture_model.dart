class AstronomyPicture {
  final String url;
  final String explanation;

  AstronomyPicture({required this.url, required this.explanation});

  factory AstronomyPicture.fromJson(Map<String, dynamic> json) {
    return AstronomyPicture(
      url: json['url'],
      explanation: json['explanation'],
    );
  }
}



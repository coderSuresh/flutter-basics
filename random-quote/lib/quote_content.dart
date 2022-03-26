class QuoteContent {
  final String quote;
  QuoteContent({required this.quote});
  factory QuoteContent.fromJson(Map<String, dynamic> json) {
    return QuoteContent(
      quote: json['advice'],
    );
  }
}

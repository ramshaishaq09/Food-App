class MenuItem {
  final String id;
  final String name;
  final String category;
  final double price;
  final double rating;
  final String imageUrl;
  final String description;
  final bool isPopular;

  const MenuItem({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.description,
    this.isPopular = false,
  });
}

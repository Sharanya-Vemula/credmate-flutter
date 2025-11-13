class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });
}

// ✅ Sample demo products with working online image URLs
final List<Product> demoProducts = [
  Product(
    id: 'p1',
    title: 'iPhone 14 Pro',
    description: 'Flagship smartphone with A16 Bionic chip and 48MP Pro camera system.',
    price: 129999,
    image: 'https://images.unsplash.com/photo-1678500628822-fdb8b9278eb3?auto=format&fit=crop&w=800&q=60',
  ),
  Product(
    id: 'p2',
    title: 'Sony WH-1000XM5',
    description: 'Industry-leading wireless noise-cancelling headphones with superior sound.',
    price: 29999,
    image: 'https://images.unsplash.com/photo-1585386959984-a41552231693?auto=format&fit=crop&w=800&q=60',
  ),
  Product(
    id: 'p3',
    title: 'Apple Watch Series 9',
    description: 'Smartwatch with health tracking, GPS, and Always-On Retina display.',
    price: 45999,
    image: 'https://images.unsplash.com/photo-1617043980955-1c26f2dd5e3b?auto=format&fit=crop&w=800&q=60',
  ),
  Product(
    id: 'p4',
    title: 'MacBook Air M3',
    description: 'Powerful, ultra-portable laptop with Apple M3 chip and 18-hour battery life.',
    price: 134999,
    image: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=800&q=60',
  ),
  Product(
    id: 'p5',
    title: 'Samsung Galaxy S24 Ultra',
    description: 'Next-gen smartphone with AI-powered camera and stunning Dynamic AMOLED 2X display.',
    price: 119999,
    image: 'https://images.unsplash.com/photo-1598327105666-5b89351aff97?auto=format&fit=crop&w=800&q=60',
  ),
];

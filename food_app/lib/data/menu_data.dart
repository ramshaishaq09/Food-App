import '../models/menu_item.dart';

/// Static demo menu. Swap this for an API call in a real app.
final List<MenuItem> menuItems = [
  const MenuItem(
    id: 'm1',
    name: 'Classic Cheeseburger',
    category: 'Burgers',
    price: 8.99,
    rating: 4.6,
    imageUrl: 'https://images.unsplash.com/photo-1667329829058-ac191ba4a905?w=500',
    description:
        'A juicy grilled beef patty with melted cheddar, crisp lettuce, '
        'tomato and our secret sauce, stacked in a toasted brioche bun.',
    isPopular: true,
  ),
  const MenuItem(
    id: 'm2',
    name: 'Margherita Pizza',
    category: 'Pizza',
    price: 11.50,
    rating: 4.7,
    imageUrl: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500',
    description:
        'Wood-fired thin crust topped with San Marzano tomato sauce, '
        'fresh mozzarella and basil leaves, finished with a drizzle of olive oil.',
    isPopular: true,
  ),
  const MenuItem(
    id: 'm3',
    name: 'Salmon Sushi Platter',
    category: 'Sushi',
    price: 16.00,
    rating: 4.8,
    imageUrl: 'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=500',
    description:
        "Chef's selection of fresh salmon nigiri and maki rolls, served "
        'with pickled ginger, wasabi and soy sauce.',
    isPopular: true,
  ),
  const MenuItem(
    id: 'm4',
    name: 'Caesar Salad',
    category: 'Salads',
    price: 7.25,
    rating: 4.3,
    imageUrl: 'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?w=500',
    description:
        'Crisp romaine tossed in creamy Caesar dressing with parmesan '
        'shavings, garlic croutons and a hint of cracked black pepper.',
  ),
  const MenuItem(
    id: 'm5',
    name: 'Chocolate Fudge Cake',
    category: 'Desserts',
    price: 6.50,
    rating: 4.9,
    imageUrl: 'https://images.unsplash.com/photo-1517427294546-5aa121f68e8a?w=500',
    description:
        'Rich, moist layers of dark chocolate sponge with a silky fudge '
        'frosting, finished with a light dusting of cocoa.',
    isPopular: true,
  ),
  const MenuItem(
    id: 'm6',
    name: 'Iced Caramel Latte',
    category: 'Drinks',
    price: 4.75,
    rating: 4.5,
    imageUrl: 'https://images.unsplash.com/photo-1527156231393-7023794f363c?w=500',
    description:
        'Smooth espresso poured over ice with cold milk and a swirl of '
        'caramel syrup, topped with a light layer of foam.',
  ),
  const MenuItem(
    id: 'm7',
    name: 'Spaghetti Carbonara',
    category: 'Pasta',
    price: 12.00,
    rating: 4.6,
    imageUrl: 'https://images.unsplash.com/photo-1560434019-4558f9a9e2a1?w=500',
    description:
        'Al dente spaghetti tossed in a creamy egg and parmesan sauce '
        'with crispy pancetta and cracked black pepper.',
  ),
  const MenuItem(
    id: 'm8',
    name: 'Street Tacos Trio',
    category: 'Tacos',
    price: 9.50,
    rating: 4.4,
    imageUrl: 'https://images.unsplash.com/photo-1648437595587-e6a8b0cdf1f9?w=500',
    description:
        'Three soft corn tortillas filled with seasoned grilled meat, '
        'onion, fresh cilantro and a squeeze of lime.',
  ),
];

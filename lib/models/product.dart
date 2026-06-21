import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title;
  final String price;
  final String image;
  final String description;
  final String tagline;
  final Map<String, dynamic> specs;
  final int stock;
  final double rating;
  final int reviewCount;
  final List<Color> colors;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.tagline,
    required this.specs,
    required this.stock,
    required this.rating,
    required this.reviewCount,
    required this.colors,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['name'],
      price: json['price'],
      image: json['image'],
      description: json['description'],
      tagline: json['tagline'] ?? '',
      specs: json['specs'] ?? {},
      stock: json['stock'] ?? 10,
      rating: json['rating'] ?? 4.5,
      reviewCount: json['reviewCount'] ?? 100,
      colors: json['colors'] ?? [Colors.black],
    );
  }
}

// Tam 15 Ürünlük Zenginleştirilmiş Apple Katalog Verisi
final List<Map<String, dynamic>> mockProductsJson = [
  // 1
  {
    "id": 1,
    "name": "iPhone 15 Pro",
    "tagline": "Titanium. So strong. So light. So Pro.",
    "description":
        "The iPhone 15 Pro is the first iPhone to feature an aerospace-grade titanium design, making it lighter and more durable than ever before. It is powered by the groundbreaking A17 Pro chip, which delivers next-level gaming performance and efficiency.",
    "price": "\$999",
    "image": "https://wantapi.com/assets/images/iphone.png",
    "stock": 3,
    "rating": 4.9,
    "reviewCount": 1245,
    "colors": [
      Colors.grey.shade400,
      Colors.black87,
      Colors.blue.shade900,
      Colors.grey.shade200,
    ],
    "specs": {"CHIP": "A17 Pro", "MATERIAL": "Titanium", "CAMERA": "48MP Main"},
  },
  // 2
  {
    "id": 2,
    "name": "iPhone 15",
    "tagline": "New camera. New design. Newphoria.",
    "description":
        "The iPhone 15 features a stunning new design with color-infused back glass and a contoured aerospace-grade aluminum enclosure. It introduces the Dynamic Island, bubbling up alerts and live activities so you don’t miss them.",
    "price": "\$799",
    "image": "https://wantapi.com/assets/images/iphone_pink.png",
    "stock": 45,
    "rating": 4.7,
    "reviewCount": 890,
    "colors": [Colors.pink.shade100, Colors.yellow.shade100, Colors.black87],
    "specs": {
      "CHIP": "A16 Bionic",
      "MATERIAL": "Aluminum",
      "CAMERA": "48MP Main",
    },
  },
  // 3
  {
    "id": 4,
    "name": "iPhone 14",
    "tagline": "Wonderfull.",
    "description":
        "The iPhone 14 takes a huge leap in battery life and durability, making it a total powerhouse for its price. It features a ceramic shield front that is tougher than any smartphone glass. The advanced dual-camera system lets you take beautiful photos in any light.",
    "price": "\$699",
    "image": "https://wantapi.com/assets/images/iphone_blue.png",
    "stock": 20,
    "rating": 4.5,
    "reviewCount": 540,
    "colors": [
      Colors.blue.shade200,
      Colors.black87,
      Colors.red.shade700,
      Colors.grey.shade100,
    ],
    "specs": {
      "CHIP": "A15 Bionic",
      "DISPLAY": "6.1\"",
      "CAMERA": "Dual system",
    },
  },
  // 4
  {
    "id": 6,
    "name": "MacBook Pro 16\"",
    "tagline": "Mind-blowing. Head-turning.",
    "description":
        "The MacBook Pro 16-inch is the most advanced Mac laptop ever, powered by the M3 Max chip for extreme performance. Its Liquid Retina XDR display is mind-blowing, offering 1000 nits of sustained brightness for HDR content.",
    "price": "\$2,499",
    "image": "https://wantapi.com/assets/images/macbook.png",
    "stock": 12,
    "rating": 4.8,
    "reviewCount": 320,
    "colors": [Colors.grey.shade400, Colors.grey.shade800],
    "specs": {"CHIP": "M3 Max", "DISPLAY": "Retina XDR", "BATTERY": "22 hrs"},
  },
  // 5
  {
    "id": 8,
    "name": "MacBook Air 15\"",
    "tagline": "Impressively big.",
    "description":
        "The MacBook Air 15-inch is excessively big on screen space yet impressively thin and light. Supercharged by the M2 chip, it delivers incredible speed and power efficiency for everything from work to play.",
    "price": "\$1,299",
    "image": "https://wantapi.com/assets/images/macbook_air.png",
    "stock": 15,
    "rating": 4.8,
    "reviewCount": 410,
    "colors": [
      Colors.grey.shade300,
      Colors.grey.shade800,
      Colors.yellow.shade100,
    ],
    "specs": {"CHIP": "M2", "WEIGHT": "3.3 lbs", "DESIGN": "Fanless"},
  },
  // 6
  {
    "id": 10,
    "name": "iMac",
    "tagline": "Packed with power.",
    "description":
        "The iMac is the all-in-one for all, now supercharged by the M3 chip for even faster performance. Its stunning 24-inch 4.5K Retina display offers 500 nits of brightness and over a billion colors.",
    "price": "\$1,299",
    "image": "https://wantapi.com/assets/images/imac.png",
    "stock": 8,
    "rating": 4.6,
    "reviewCount": 210,
    "colors": [
      Colors.green.shade200,
      Colors.blue.shade200,
      Colors.pink.shade200,
      Colors.grey.shade300,
    ],
    "specs": {
      "CHIP": "M3",
      "DISPLAY": "24\" 4.5K",
      "COLORS": "7 vibrant colors",
    },
  },
  // 7
  {
    "id": 11,
    "name": "iPad Pro 12.9\"",
    "tagline": "Supercharged by M2.",
    "description":
        "The iPad Pro 12.9-inch provides the ultimate iPad experience, supercharged by the M2 chip for groundbreaking performance. Its Liquid Retina XDR display delivers true-to-life detail.",
    "price": "\$1,099",
    "image": "https://wantapi.com/assets/images/ipad.png",
    "stock": 25,
    "rating": 4.9,
    "reviewCount": 650,
    "colors": [Colors.grey.shade300, Colors.grey.shade800],
    "specs": {"CHIP": "M2", "SCREEN": "XDR", "PENCIL": "Hover support"},
  },
  // 8
  {
    "id": 12,
    "name": "iPad Air",
    "tagline": "Light. Bright. Full of might.",
    "description":
        "The iPad Air combines serious performance with a thin and light design, making it a versatile tool for creativity. Powered by the breakthrough M1 chip, it delivers a giant leap in performance and all-day battery life.",
    "price": "\$599",
    "image": "https://wantapi.com/assets/images/ipad_air.png",
    "stock": 30,
    "rating": 4.7,
    "reviewCount": 820,
    "colors": [
      Colors.blue.shade100,
      Colors.pink.shade100,
      Colors.grey.shade400,
    ],
    "specs": {"CHIP": "M1", "DISPLAY": "10.9\"", "CONNECT": "5G"},
  },
  // 9
  {
    "id": 14,
    "name": "Apple Watch Ultra 2",
    "tagline": "Next level.",
    "description":
        "The Apple Watch Ultra 2 is the most rugged and capable Apple Watch ever, designed for endurance athletes and adventurers. It features a lightweight titanium case that is corrosion-resistant and protects the sapphire crystal.",
    "price": "\$799",
    "image": "https://wantapi.com/assets/images/watch.png",
    "stock": 2, // Çok az stok
    "rating": 4.9,
    "reviewCount": 560,
    "colors": [Colors.orange.shade400, Colors.grey],
    "specs": {"CASE": "Titanium", "NITS": "3000 nits", "GPS": "Dual-frequency"},
  },
  // 10
  {
    "id": 15,
    "name": "Apple Watch Series 9",
    "tagline": "Smarter. Brighter. Mightier.",
    "description":
        "The Apple Watch Series 9 is smarter, brighter, and mightier, powered by the custom S9 SiP for a boost in performance. It introduces a magical new way to use your watch without touching the screen: Double tap your fingers.",
    "price": "\$399",
    "image": "https://wantapi.com/assets/images/watch_series9.png",
    "stock": 4,
    "rating": 4.8,
    "reviewCount": 940,
    "colors": [Colors.pink.shade100, Colors.black87, Colors.red.shade700],
    "specs": {"CHIP": "S9 SiP", "FEATURE": "Double tap", "CARBON": "Neutral"},
  },
  // 11
  {
    "id": 16,
    "name": "Apple Vision Pro",
    "tagline": "Welcome to spatial computing.",
    "description":
        "Apple Vision Pro is a revolutionary spatial computer that seamlessly blends digital content with your physical world. It introduces a fully three-dimensional user interface controlled by your eyes, hands, and voice.",
    "price": "\$3,499",
    "image": "https://wantapi.com/assets/images/vision_pro.png",
    "stock": 5,
    "rating": 4.4,
    "reviewCount": 85,
    "colors": [Colors.grey.shade300],
    "specs": {
      "OS": "visionOS",
      "DISPLAY": "Micro-OLED",
      "CONTROL": "Eyes, hands",
    },
  },
  // 12
  {
    "id": 17,
    "name": "AirPods Pro (2nd Gen)",
    "tagline": "Adaptive Audio.",
    "description":
        "The AirPods Pro (2nd Generation) feature the new H2 chip, delivering smarter noise cancellation and superior sound. Adaptive Audio effectively prioritizes sounds that need your attention.",
    "price": "\$249",
    "image": "https://wantapi.com/assets/images/airpods.png",
    "stock": 150,
    "rating": 4.9,
    "reviewCount": 2100,
    "colors": [Colors.white],
    "specs": {"CHIP": "H2", "AUDIO": "Spatial Audio", "CASE": "USB-C"},
  },
  // 13
  {
    "id": 18,
    "name": "AirPods Max",
    "tagline": "Sound focused.",
    "description":
        "AirPods Max reimagine over-ear headphones with an Apple-designed dynamic driver that provides high-fidelity audio. Active Noise Cancellation blocks outside noise so you can immerse yourself in what you are listening to.",
    "price": "\$549",
    "image": "https://wantapi.com/assets/images/airpods_max.png",
    "stock": 18,
    "rating": 4.7,
    "reviewCount": 450,
    "colors": [
      Colors.grey.shade400,
      Colors.pink.shade100,
      Colors.blue.shade100,
      Colors.green.shade100,
      Colors.black87,
    ],
    "specs": {
      "DRIVER": "Dynamic",
      "AUDIO": "Active Noise",
      "DESIGN": "Mesh canopy",
    },
  },
  // 14
  {
    "id": 19,
    "name": "HomePod",
    "tagline": "Profound sound.",
    "description":
        "The HomePod is a powerhouse of sound, delivering high-fidelity audio that adapts to the room it is in for the best experience. It features a high-excursion woofer and a beamforming tweeter array that creates deep bass.",
    "price": "\$299",
    "image": "https://wantapi.com/assets/images/homepod.png",
    "stock": 22,
    "rating": 4.6,
    "reviewCount": 230,
    "colors": [Colors.black87, Colors.white],
    "specs": {"AUDIO": "Computational", "HOME": "Smart Hub", "SENSING": "Room"},
  },
  // 15
  {
    "id": 20,
    "name": "HomePod Mini",
    "tagline": "Color-pop.",
    "description":
        "The HomePod Mini is jam-packed with innovation, delivering unexpectedly big sound for a speaker of its size. At just 3.3 inches tall, it takes up almost no space but fills the entire room with rich 360-degree audio.",
    "price": "\$99",
    "image": "https://wantapi.com/assets/images/homepod_mini.png",
    "stock": 5,
    "rating": 4.6,
    "reviewCount": 128,
    "colors": [
      Colors.orange.shade600,
      Colors.grey.shade200,
      Colors.blue,
      Colors.yellow,
    ],
    "specs": {
      "SIZE": "3.3 inches",
      "AUDIO": "360-degree",
      "COLORS": "5 colors",
    },
  },
];

final List<Product> dummyProducts = mockProductsJson
    .map((json) => Product.fromJson(json))
    .toList();

// Ortak listelerimiz
final List<Product> cartProducts = [];
final List<Product> favoriteProducts = [];

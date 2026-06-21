import 'package:flutter/material.dart';
import '../models/product.dart';
import 'cart_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isAddedToCart = false;
  bool isFavorite = false;
  int selectedColorIndex = 0;

  @override
  void initState() {
    super.initState();
    isFavorite = favoriteProducts.contains(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Resmi tam yukarı yaslamak için AppBar'ı şeffaf yapıyoruz (ExtendBody)
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.white70,
            shape: BoxShape.circle,
          ),
          child: const BackButton(color: Colors.black),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white70,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.black,
              ),
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                  if (isFavorite) {
                    favoriteProducts.add(widget.product);
                  } else {
                    favoriteProducts.remove(widget.product);
                  }
                });
              },
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. TAM EKRAN (COVER) ÜRÜN RESMİ
            Container(
              width: double.infinity,
              height: 420, // Resim artık ekranın yarısını devasa kaplıyor!
              decoration: const BoxDecoration(color: Color(0xFFF4F5F7)),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.network(
                    widget.product.image,
                    fit: BoxFit
                        .contain, // Ürün resminin yapısına göre cover veya contain
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. DİNAMİK YILDIZLAR VE DEĞERLENDİRME
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber.shade500, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        widget.product.rating.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        ' (${widget.product.reviewCount} Değerlendirme)',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // 3. BAŞLIK, FİYAT VE "TAGLINE" (Alt Başlık)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.title,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w900,
                                letterSpacing: -0.5,
                                height: 1.1,
                              ),
                            ),
                            const SizedBox(height: 6),
                            // Gönderdiğin resimdeki "Color-pop." yazısı!
                            Text(
                              widget.product.tagline,
                              style: TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        widget.product.price,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // 4. DİNAMİK SATICI VE STOK BİLGİSİ
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.storefront,
                          color: Colors.black54,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Satıcı: TNC Group A.Ş.',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        // Ürün stoğu azsa kırmızı, çoksa yeşil göster!
                        Text(
                          widget.product.stock <= 5
                              ? '🔥 Son ${widget.product.stock} Ürün!'
                              : 'Stokta Var',
                          style: TextStyle(
                            color: widget.product.stock <= 5
                                ? Colors.red
                                : Colors.green.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 5. ÜRÜNE ÖZEL (DİNAMİK) RENK SEÇENEKLERİ
                  const Text(
                    'Renk Seçenekleri',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: List.generate(widget.product.colors.length, (
                      index,
                    ) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColorIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 12),
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: selectedColorIndex == index
                                  ? Colors.black
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: widget.product.colors[index],
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 24),

                  // 6. ÜZÜN VE DETAYLI ÜRÜN AÇIKLAMASI
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.product.description,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 7. GÖNDERDİĞİN RESİMDEKİ "SPECIFICATIONS" (Özellik Kutuları)
                  if (widget.product.specs.isNotEmpty) ...[
                    const Text(
                      'Specifications',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: widget.product.specs.entries.map((entry) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                entry.key, // Örn: SIZE
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade500,
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                entry.value.toString(), // Örn: 3.3 inches
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            onPressed: () {
              setState(() => isAddedToCart = true);
              if (!cartProducts.contains(widget.product)) {
                cartProducts.add(widget.product);
              }
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              ).then((_) => setState(() {}));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isAddedToCart
                  ? Colors.green.shade600
                  : Colors.black,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text(
              isAddedToCart ? 'Sepete Eklendi ✓' : 'Sepete Ekle',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

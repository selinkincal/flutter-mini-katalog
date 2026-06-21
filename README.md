# 📱 Mini Katalog Uygulaması

Flutter 5 Günlük Eğitim Kampı kapsamında geliştirilen, modern ve minimalist bir e-ticaret/katalog simülasyonudur. Kullanıcıların ürünleri listeleyebildiği, detaylarını inceleyebildiği, favorilere ve sepete ekleme yapabildiği etkileşimli bir arayüz sunar.
## 🛠️ Kullanılan Flutter Sürümü
* **Dart SDK:** >=3.11.5 <4.0.0
* **Flutter SDK:** >=3.18.0

## 🚀 Proje Kazanımları ve Özellikler
Bu proje kapsamında dışarıdan hiçbir üçüncü parti State Management paketi kullanılmamış, sadece saf Flutter yetenekleri sergilenmiştir:
- **Sayfa Navigasyonu:** `Navigator.push` ve `pop` ile sayfalar arası veri taşıma.
- **Model ve JSON İşlemleri:** Karmaşık veri yapılarının `Product.fromJson` ile modellenmesi.
- **Gelişmiş UI Yapıları:** `GridView.builder` ve `ListView.builder` ile dinamik liste yönetimleri.
- **State Simülasyonu:** `setState` kullanılarak sepet ve favori listelerinin eşzamanlı güncellenmesi.

## 📸 Ekran Görüntüleri

| Keşfet (Ana Sayfa) | Ürün Detay | Ürün Detay  |
| :---: | :---: | :---: |
| <img src="./screenshots/home.jpeg" width="250"/> | <img src="./screenshots/detail.jpeg" width="250"/> | <img src="./screenshots/detail1.jpeg" width="250"/> |
| **Favoriler** | **Arama Sonuçları** | **Boş Durum (Empty State)** |
| <img src="./screenshots/favorı.jpeg" width="250"/> | <img src="./screenshots/homelist.jpeg" width="250"/> | <img src="./screenshots/favorıbos.jpeg" width="250"/> |
| **Sepetim** | **Sepet Onay** | **Boş Durum (Empty State)** |
| <img src="./screenshots/sepet1.jpeg" width="250"/> | <img src="./screenshots/sepet.jpeg" width="250"/> | <img src="./screenshots/sepetbos.jpeg" width="250"/> |

## 🛠️ Kullanılan Teknolojiler
* **SDK:** Flutter
* **Dil:** Dart
* **Kütüphaneler:** Sadece `material.dart` (Eğitim kısıtlamaları gereği ekstra paket kullanılmamıştır).

## 💻 Kurulum ve Çalıştırma Adımları

Projeyi kendi bilgisayarınızda (Android Studio Emulator veya VS Code üzerinden) çalıştırmak için şu adımları izleyin:

**1. Projeyi Klonlayın:**
```bash
git clone [https://github.com/selinkincal/flutter-mini-katalog.git](https://github.com/selinkincal/flutter-mini-katalog.git)

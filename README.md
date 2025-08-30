# brand_ads_flutter

A simple and customizable Flutter widget library for showing **in-app promotional banner ads**.  
Supports standard IAB sizes with callbacks for **view** and **click events**.

---

## ✨ Features

- 📏 Predefined IAB standard sizes:  
  - `banner` → 320×50  
  - `largeBanner` → 320×100  
  - `fullBanner` → 468×60  
  - `leaderboard` → 728×90  
- 🎨 Customizable background and button colors  
- 🖼️ Supports image/logo preview  
- ⚡ Lightweight and easy to integrate  
- 🔔 Callbacks: `onView` and `onClick`  

---

## 📦 Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  brand_ads_flutter: ^1.0.0
```

Then import it:

```dart
import 'package:brand_ads_flutter/brand_ads_flutter.dart';
```

---

## 🚀 Usage

```dart
import 'package:flutter/material.dart';
import 'package:brand_ads_flutter/brand_ads_flutter.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Brand Ads Example")),
      body: Center(
        child: BrandAd(
          adType: BrandAdType.banner, // choose ad size
          title: "Special Offer",
          subtitle: "50% OFF today only",
          imageUrl: "https://via.placeholder.com/150",
          buttonText: "Shop Now",
          backgroundColor: Colors.blue.shade50,  // optional
          buttonColor: Colors.blue,              // optional
          onClick: () => debugPrint("Ad clicked"),
          onView: () => debugPrint("Ad viewed"),
        ),
      ),
    );
  }
}
```

---

## 📐 Available Ad Types

| AdType        | Size (px)  | Device            |
|---------------|------------|-------------------|
| `banner`      | 320×50     | Phones & tablets |
| `largeBanner` | 320×100    | Phones & tablets |
| `fullBanner`  | 468×60     | Tablets           |
| `leaderboard` | 728×90     | Tablets           |

---

## ⚖️ Policy Note

These are **embedded banner ads**, not interstitials.  
✅ A close button is **not required** by Google Play policy for banner ads.  

---

## 📜 License

MIT License © 2025

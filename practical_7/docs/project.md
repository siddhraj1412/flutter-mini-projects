# Mobile Application Development (AIML308) Practical Report - Product Catalog App

## Technical Approach

The application implements a product catalog using Flutter's GridView for responsive grid layouts, with custom reusable ProductCard widgets ensuring consistent UI design. State management is achieved through the Provider package, utilizing a CartManager class that extends ChangeNotifier for dynamic cart functionality across screens. Core widgets include StatefulWidget for interactive product details and cart management, GridView for product display, and Image.asset for loading local assets, with setState handling local UI updates in quantity selectors and form validations.

## File Structure

```
lib/
├── cart_manager.dart
├── dashboard.dart
├── login.dart
├── main.dart
├── orders.dart
├── product_catalog.dart
├── product_detail.dart
├── profile.dart
├── todolist.dart
└── widgets/
    └── product_card.dart
```

## Key Code Snippets

### 1. Reusable ProductCard Widget (lib/widgets/product_card.dart - ProductCard class)
```dart
class ProductCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String? description;
  final double? price;

  const ProductCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    this.description,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              title: title,
              imageUrl: imageUrl,
              description: description,
              price: price,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: imageUrl,
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported, size: 50),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (price != null)
                    Text(
                      '\₹${price!.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 2. GridView Layout Implementation (lib/product_catalog.dart - ProductCatalogScreen class)
```dart
class ProductCatalogScreen extends StatelessWidget {
  const ProductCatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Catalog'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            title: product['title']!,
            imageUrl: product['image']!,
            description: product['description'],
            price: product['price'],
          );
        },
      ),
    );
  }
}
```

### 3. Local Asset Loading (lib/widgets/product_card.dart - Image.asset usage)
```dart
Image.asset(
  imageUrl,
  fit: BoxFit.cover,
  width: double.infinity,
  errorBuilder: (context, error, stackTrace) => Container(
    color: Colors.grey[300],
    child: const Icon(Icons.image_not_supported, size: 50),
  ),
),
```

### 4. Cart State Management (lib/cart_manager.dart - addItem method)
```dart
void addItem({
  required String id,
  required String name,
  required String image,
  required double price,
  int quantity = 1,
}) {
  final existingIndex = _items.indexWhere((item) => item.id == id);

  if (existingIndex >= 0) {
    // Item already exists, update quantity
    _items[existingIndex].quantity += quantity;
  } else {
    // Add new item
    _items.add(CartItem(
      id: id,
      name: name,
      image: image,
      price: price,
      quantity: quantity,
    ));
  }

  notifyListeners();
}
```

## Key Questions

- **How to create reusable custom widgets?** Create a separate StatelessWidget or StatefulWidget class in a dedicated file (e.g., `lib/widgets/product_card.dart`), define required parameters in the constructor, and use it across multiple screens by importing and instantiating the widget with appropriate props, as demonstrated by the ProductCard widget used in the GridView.
- **How to use GridView for layout?** Use `GridView.builder` or `GridView.count` with `SliverGridDelegateWithFixedCrossAxisCount` to specify cross-axis count, spacing, and aspect ratio, then provide an itemBuilder function that returns widgets for each grid item, as implemented in the ProductCatalogScreen for displaying product cards in a 2-column grid.
- **How to load local assets (images)?** Add image files to the `assets/` directory, configure the path in `pubspec.yaml` under the `assets` section, then use `Image.asset()` widget with the asset path string, including error handling with `errorBuilder` to display fallback content if the image fails to load, as shown in the ProductCard widget.</content>
<parameter name="filePath">d:\SEM 5\AIML308_Mobile Application Development\PR_LIST\practical_7\docs\project.txt
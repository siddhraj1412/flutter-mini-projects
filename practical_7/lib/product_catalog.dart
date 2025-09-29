import 'package:flutter/material.dart';
import 'widgets/product_card.dart';
import 'product_detail.dart';

class ProductCatalogScreen extends StatelessWidget {
  const ProductCatalogScreen({Key? key}) : super(key: key);

  static const List<Map<String, dynamic>> products = [
    {
      'title': 'Neural Network',
      'imagePath': 'assets/ANN.png',
      'description': 'Artificial Neural Network Architecture',
      'price': 299.99,
    },
    {
      'title': 'Architecture Extended',
      'imagePath': 'assets/Architecture Diagram (extended).png',
      'description': 'Extended System Architecture',
      'price': 449.99,
    },
    {
      'title': 'System Architecture',
      'imagePath': 'assets/Architecture Diagram.png',
      'description': 'Complete System Design',
      'price': 399.99,
    },
    {
      'title': 'MDP Framework',
      'imagePath': 'assets/MDP.png',
      'description': 'Markov Decision Process',
      'price': 249.99,
    },
    {
      'title': 'Methodology Guide',
      'imagePath': 'assets/Methodology.png',
      'description': 'Research Methodology Overview',
      'price': 199.99,
    },
    {
      'title': 'Network Design',
      'imagePath': 'assets/Network Architecture.png',
      'description': 'Advanced Network Architecture',
      'price': 349.99,
    },
    {
      'title': 'Original Image',
      'imagePath': 'assets/Original Image.png',
      'description': 'Source Image Processing',
      'price': 99.99,
    },
    {
      'title': 'PPO Extended',
      'imagePath': 'assets/PPO Network (extended).png',
      'description': 'Extended PPO Network',
      'price': 399.99,
    },
    {
      'title': 'PPO Network',
      'imagePath': 'assets/PPO Network.png',
      'description': 'Proximal Policy Optimization',
      'price': 329.99,
    },
    {
      'title': 'Reconstructed',
      'imagePath': 'assets/Reconstructed Image.png',
      'description': 'Image Reconstruction Result',
      'price': 149.99,
    },
    {
      'title': 'VAE Reconstruction',
      'imagePath': 'assets/VAE Reconstruction.png',
      'description': 'Variational Autoencoder Result',
      'price': 279.99,
    },
    {
      'title': 'VAE Model',
      'imagePath': 'assets/VAE.png',
      'description': 'Variational Autoencoder',
      'price': 259.99,
    },
    {
      'title': 'VAE+PPO Hybrid',
      'imagePath': 'assets/VAE+PPO.png',
      'description': 'Combined VAE and PPO System',
      'price': 499.99,
    },
    {
      'title': 'Vehicle Vectors',
      'imagePath': 'assets/Vehicle Vectors Diagram.png',
      'description': 'Vehicle Movement Analysis',
      'price': 189.99,
    },
    {
      'title': 'Waypoints System',
      'imagePath': 'assets/Waypoints.png',
      'description': 'Navigation Waypoints',
      'price': 229.99,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Catalog'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(
              title: product['title'],
              imagePath: product['imagePath'],
              description: product['description'],
              price: product['price'],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(
                      title: product['title'],
                      imageUrl: product['imagePath'],
                      description: product['description'],
                      price: product['price'],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cart feature coming soon!'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}

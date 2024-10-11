import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Product Gallery'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: const [
          ProductCard(
            title: 'Product 1',
            imageUrl: 'assets/images/paracetamol.png',
            price: 100,
            description: 'This is a description for Product 1.',
          ),
          ProductCard(
            title: 'Product 2',
            imageUrl:
                'assets/images/century_hotdog.jpg',
            price: 200,
            description: 'This is a description for Product 2.',
          ),
          ProductCard(
            title: 'Product 3',
            imageUrl:
                'assets/images/house_and_lot.jpg',
            price: 300,
            description: 'This is a description for Product 3.',
          ),
          ProductCard(
            title: 'Product 4',
            imageUrl:
                'https://dummyimage.com/300x150/FF33A1/FFFFFF&text=Product+4',
            price: 400,
            description: 'This is a description for Product 4.',
          ),
          ProductCard(
            title: 'Product 5',
            imageUrl:
                'https://dummyimage.com/300x150/FFC300/FFFFFF&text=Product+5',
            price: 500,
            description: 'This is a description for Product 5.',
          ),
          ProductCard(
            title: 'Product 6',
            imageUrl:
                'https://dummyimage.com/300x150/DAF7A6/FFFFFF&text=Product+6',
            price: 600,
            description: 'This is a description for Product 6.',
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final String description;

  const ProductCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showProductDialog(context);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              imageUrl,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                    child: Text('Image not found',
                        style: TextStyle(color: Colors.red)));
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '\PHP.${price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showProductDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imageUrl,
                height: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                      child: Text('Image not found',
                          style: TextStyle(color: Colors.red)));
                },
              ),
              const SizedBox(height: 10),
              Text(
                'PHP.${price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16, color: Colors.green),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

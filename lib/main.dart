// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

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
        scaffoldBackgroundColor:
            Colors.white, // Set overall background color to white
      ),
      home: const MyHomePage(title: 'PRODUCT GALLERY'),
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
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            color: Color(0xFF1F1F1F), // Set title text color to #1F1F1F
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white, // Set AppBar background color to white
        elevation: 0, // Remove AppBar shadow for a flat design
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10), // Empty space above the header

          // Top Divider spanning the full width
          Divider(
            color: const Color(0xFF1F1F1F), // Line color #1F1F1F
            thickness: 2,
          ),

          const SizedBox(height: 5), // spacing on top of browse products

          // "Browse Products" Subtitle with left alignment and horizontal padding
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: const Text(
              'BROWSE PRODUCTS',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF1F1F1F), // Subtitle text color #1F1F1F
              ),
            ),
          ),

          const SizedBox(height: 5), // spacing on bottom of browse products

          // Bottom Divider spanning the full width
          Divider(
            color: const Color(0xFF1F1F1F), // Line color #1F1F1F
            thickness: 2,
          ),

          // Expanded ListView with horizontal padding
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                children: const [
                  ProductCard(
                    title: 'Vicks Vaporub',
                    imageUrl: 'assets/images/vicks_vaporub.png',
                    price: 222,
                    description: 'You love to watch your kids sleep and see them lost in their world of dreams. But with a cough & cold, their sleep gets disturbed and their dreams are left incomplete. Use Camphor + Menthol + Eucalyptus Oil (Vicks VapoRub), providing relief from nasal congestion due to cold to help them sleep better!',
                  ),
                  ProductCard(
                    title: 'Efficascent Oil',
                    imageUrl: 'assets/images/efficascent.png',
                    price: 140,
                    description: "Efficascent Oil is the only Filipino pain-relief brand that's been over 60 years in providing relief and relaxation to Filipino households.It is made from essential oils such as that of camphor and menthol whose benefits greatly perform as a treatment for a wide variety of ailments.",
                  ),
                  ProductCard(
                    title: 'PRODUCT 3',
                    imageUrl: 'assets/images/',
                    price: 300,
                    description: 'This is a description for Product 3.',
                  ),
                  ProductCard(
                    title: 'BUS',
                    imageUrl: 'assets/images/bus.jpg',
                    price: 400,
                    description: 'Ra Elyu',
                  ),
                  ProductCard(
                    title: 'PRODUCT 5',
                    imageUrl: 'https://dummyimage.com/300x300/FFC300/FFFFFF&text=Product+5',
                    price: 500,
                    description: 'This is a description for Product 5.',
                  ),
                  ProductCard(
                    title: 'PRODUCT 6',
                    imageUrl: 'https://dummyimage.com/300x300/DAF7A6/FFFFFF&text=Product+6',
                    price: 600,
                    description: 'This is a description for Product 6.',
                  ),
                ],
              ),
            ),
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
        color: const Color(0xFFD1FF00), // Set card background color to #d1ff00
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Color(0xFF303030), // Set card border color to #303030
            width: 2,
          ),
        ),
        margin: const EdgeInsets.symmetric(
            vertical: 8.0, horizontal: 8.0), // Increased horizontal margin
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image section with white background
            Container(
              color: Colors.white, // Set image section background to white
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1, // Makes the image square
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Text(
                          'Image not found',
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                //TITLE FOR CARD
                title,
                style: const TextStyle(
                  fontSize: 20,
                  letterSpacing: 1.2,
                  color: Color(0xFF1F1F1F), // Set title text color to #1F1F1F
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Text(
                'PHP ${price.toStringAsFixed(2)}', // Corrected line to show price correctly
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF1F1F1F), // Set price text color to #1F1F1F
                ),
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
          backgroundColor:
              const Color(0xFFD1FF00), // Set dialog background to #d1ff00
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: Color(0xFF303030), // Set dialog border color to #303030
              width: 2,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black, // Set title color to black
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image section with grey background
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(10), // Ensure rounded corners match
                child: Container(
                  color: Colors.grey, // Set image section background to grey
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Text(
                            'Image not found',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'PHP ${price.toStringAsFixed(2)}', // Corrected line to show price correctly
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black, // Set price text color to black
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black, // Set description text color to black
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Close',
                style: const TextStyle(
                  color: Colors.white, // Set close button text color to white
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: const Color(
                    0xFF303030), // Set close button background color to #303030
              ),
            ),
          ],
        );
      },
    );
  }
}

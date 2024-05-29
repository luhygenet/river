import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WithAccount extends StatefulWidget {
  @override
  _WithAccountState createState() => _WithAccountState();
}

class _WithAccountState extends State<WithAccount> {
  List<Item> items = [];

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    final response = await http.get(Uri.parse('http://localhost:3005/items'));
    if (response.statusCode == 200) {
      final List<dynamic> itemJson = json.decode(response.body);
      setState(() {
        items = itemJson.map((json) => Item.fromJson(json)).toList();
      });
    } else {
      // Handle the error
      throw Exception('Failed to load items');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
            child: Text(
              'Home',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
                color: Colors.white,
                letterSpacing: 1.3,
              ),
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          style: ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white)),
        ),
      ),
      body: items.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(15),
              child: GridView.count(
                crossAxisCount: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 30,
                children: List.generate(items.length, (index) {
                  return GridItem(
                    item: items[index],
                  );
                }),
              ),
            ),
    );
  }
}

class Item {
  final String imageUrl;
  final String description;

  Item({required this.imageUrl, required this.description});
  factory Item.fromJson(Map<String, dynamic> json) {
    String base64Image = base64Encode(List<int>.from(json['picture']['data']));
    String imageUrl = 'data:image/png;base64,$base64Image';
    return Item(
      imageUrl: imageUrl,
      description: json['description'] ?? '', // Provide a default value if null
    );
  }
}

class GridItem extends StatelessWidget {
  final Item item;

  GridItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail');
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 1),
            Expanded(
              child: Image.network(
                item.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(child: Icon(Icons.broken_image, size: 50));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.description,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/comment');
                  },
                  child: Icon(Icons.comment),
                  style: ButtonStyle(
                      iconColor: MaterialStatePropertyAll(Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

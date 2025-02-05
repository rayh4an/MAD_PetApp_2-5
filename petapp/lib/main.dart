import 'package:flutter/material.dart';

void main() {
  runApp(const PetApp());
}

class PetApp extends StatelessWidget {
  const PetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PetListPage(),
    );
  }
}

class PetListPage extends StatelessWidget {
  const PetListPage({super.key});

  final List<String> pets = const ['Cat', 'Dog', 'Lizard', 'Bunny', 'Snake'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pet APP',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: pets.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                pets[index],
                style: const TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PetDetailPage(petName: pets[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class PetDetailPage extends StatelessWidget {
  final String petName;

  PetDetailPage({super.key, required this.petName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(petName),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          petName,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

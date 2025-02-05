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

// Model: Pet
class Pet {
  final String name;
  final String funFact;

  const Pet({
    required this.name,
    required this.funFact,
  });
}

class PetListPage extends StatelessWidget {
  const PetListPage({super.key});

  // Your pets with fun facts
  final List<Pet> pets = const [
    Pet(
      name: 'Cat',
      funFact:
          'Cats have five toes on their front paws, but only four on their back paws.',
    ),
    Pet(
      name: 'Dog',
      funFact:
          'Dogs can see in the dark much better than humans, thanks to a special membrane in their eyes.',
    ),
    Pet(
      name: 'Lizard',
      funFact: 'Some lizards can detach their tails to escape predators!',
    ),
    Pet(
      name: 'Bunny',
      funFact:
          'Rabbits’ teeth never stop growing; they file them down by gnawing on vegetation.',
    ),
    Pet(
      name: 'Snake',
      funFact:
          'Snakes smell with their tongue by collecting scent particles from the air.',
    ),
  ];

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
          final pet = pets[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                pet.name,
                style: const TextStyle(fontSize: 18),
              ),
              onTap: () {
                // Navigate to the detail page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PetDetailPage(pet: pet),
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
  final Pet pet;

  const PetDetailPage({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pet.name),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            pet.funFact,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

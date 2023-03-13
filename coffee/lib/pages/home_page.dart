import 'package:coffee/util/coffee_tile.dart';
import 'package:coffee/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeeType = [
    ['Café', true],
    ['Capuccino', false],
    ['Latte', false],
    ['Chá', false]
  ];
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[900],
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: '')
      ]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              'Encontre o melhor café para você',
              style: GoogleFonts.bebasNeue(fontSize: 54),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Encontre seu Café...',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600))),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                    coffeeType: coffeeType[index][0],
                    isSelected: coffeeType[index][1],
                    onTap: () {
                      coffeeTypeSelected(index);
                    });
              },
            ),
          ),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CoffeeTile(
                coffeeImage: 'assets/coffee.jpg',
                coffeeName: 'Café preto',
                coffeePrice: '2.50',
              ),
              CoffeeTile(
                coffeeImage: 'assets/capuccino.jpg',
                coffeeName: 'Capuccino',
                coffeePrice: '4.50',
              ),
              CoffeeTile(
                coffeeImage: 'assets/latte.jpg',
                coffeeName: 'Latte',
                coffeePrice: '7.00',
              ),
              CoffeeTile(
                coffeeImage: 'assets/tea.jpg',
                coffeeName: 'Chá',
                coffeePrice: '2.50',
              ),
            ],
          ))
        ],
      ),
    );
  }
}

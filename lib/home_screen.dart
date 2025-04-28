import 'package:flutter/material.dart';
import 'package:toko_online/gantitema.dart'; // pastikan path benar

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isDark = true;

  void _ubahTema(bool isDark) {
    setState(() {
      _isDark = isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: _isDark ? Colors.black : const Color.fromARGB(255, 54, 67, 73),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),

              // Username
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '@alberts_',
                    style: TextStyle(
                      color: _isDark ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                ],
              ),
              const SizedBox(height: 20),

              // Foto profil
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundImage: const AssetImage('images/foto_Profil.jpg'),
                backgroundColor: Colors.grey,
              ),

              // Username lagi
              Text(
                '@albertusradya',
                style: TextStyle(
                  color: _isDark ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),

              // Statistik
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  StatItem(count: '250', label: 'Following'),
                  StatItem(count: '10.5k', label: 'Followers'),
                  StatItem(count: '400k', label: 'Likes'),
                ],
              ),
              const SizedBox(height: 20),

              // Tombol-tombol action
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ActionButton(text: 'Edit profile'),
                  const SizedBox(width: 10),
                  const ActionButton(text: 'Share profile'),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.grey,
                    child:
                        const Icon(Icons.bookmark_border, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Bio dan tombol ganti tema
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '230103086 - TI 23A3',
                            style: TextStyle(
                                color: _isDark ? Colors.grey : Colors.black54),
                          ),
                        ),
                        Gantitema(onTemaChange: _ubahTema),
                      ],
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Tab bar
              const TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  Tab(icon: Icon(Icons.grid_on)),
                  Tab(icon: Icon(Icons.lock_outline)),
                  Tab(icon: Icon(Icons.favorite_border)),
                ],
              ),
              SizedBox(
                height: 400,
                child: TabBarView(
                  children: [
                    const PostGridView(),
                    Center(
                      child: Text(
                        'Private Posts',
                        style: TextStyle(
                          color: _isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Liked Posts',
                        style: TextStyle(
                          color: _isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Komponen Statistik
class StatItem extends StatelessWidget {
  final String count;
  final String label;

  const StatItem({required this.count, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

// Komponen Action Button
class ActionButton extends StatelessWidget {
  final String text;

  const ActionButton({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}

// Komponen Grid Postingan
class PostGridView extends StatelessWidget {
  const PostGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final images = [
      'images/foto 1.jpg',
      'images/foto 2.jpg',
      'images/foto 3.jpg',
      'images/foto 4.jpg',
      'images/foto 5.jpg',
      'images/foto 6.jpg',
      'images/foto 7.jpg',
      'images/foto 8.jpg',
      'images/foto 9.jpg',
    ];

    return GridView.builder(
      itemCount: images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(images[index]),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[800],
          ),
        );
      },
    );
  }
}

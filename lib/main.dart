import 'package:flutter/material.dart';
import 'form_mahasiswa.dart';
// Impor file form baru
import 'form_dosen.dart';
import 'form_matkul.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu Drawer',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const MainWithDrawer(),
      routes: {
        '/form': (_) => const FormMahasiswaPage(),
        '/list': (_) => const DaftarMahasiswaPage(),
        '/tentang': (_) => const TentangAplikasiPage(),
        '/pengaturan': (_) => const PengaturanPage(),
        // Rute untuk Dosen dan Mata Kuliah
        '/dosen': (_) => const FormDosenPage(),
        '/matkul': (_) => const FormMatkulPage(),
      },
    );
  }
}

class MainWithDrawer extends StatelessWidget {
  const MainWithDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu Utama (Drawer)')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Demo Form Mahasiswa'),
              accountEmail: const Text('v1.0.0'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: const Icon(Icons.school),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_add),
              title: const Text('Form Mahasiswa'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/form');
              },
            ),
            // Menu Dosen
            ListTile(
              leading: const Icon(Icons.person_pin_outlined),
              title: const Text('Form Dosen'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/dosen');
              },
            ),
            // Menu Mata Kuliah
            ListTile(
              leading: const Icon(Icons.class_outlined),
              title: const Text('Form Mata Kuliah'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/matkul');
              },
            ),
            ListTile(
              leading: const Icon(Icons.list_alt),
              title: const Text('Daftar Mahasiswa'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/list');
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Aplikasi'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/tentang');
              },
            ),
            ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Pengaturan'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/pengaturan');
            },
          ),
          ],
        ),
      ),
      body: const _HomeContent(),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(24),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.menu, size: 48),
              SizedBox(height: 12),
              Text('Tap ikon ☰ atau geser dari kiri untuk membuka Drawer.'),
            ],
          ),
        ),
      ),
    );
  }
}

class DaftarMahasiswaPage extends StatelessWidget {
  const DaftarMahasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Mahasiswa")),
      body: const Center(child: Text("Halaman daftar mahasiswa masih kosong.")),
    );
  }
}

//Dwi Ayu Meilinda Maharani

class TentangAplikasiPage extends StatelessWidget {
  const TentangAplikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tentang Aplikasi")),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Aplikasi ini dibuat untuk demo form dan daftar data mahasiswa menggunakan Flutter.",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class PengaturanPage extends StatelessWidget {
  const PengaturanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pengaturan")),
      body: const Center(
        child: Text("Halaman pengaturan masih dalam pengembangan."),
      ),
    );
  }
}
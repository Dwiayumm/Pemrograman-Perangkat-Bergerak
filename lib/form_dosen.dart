// lib/form_dosen.dart

import 'package:flutter/material.dart';

class FormDosenPage extends StatefulWidget {
  const FormDosenPage({super.key});

  @override
  State<FormDosenPage> createState() => _FormDosenPageState();
}

class _FormDosenPageState extends State<FormDosenPage> {
  final _formKey = GlobalKey<FormState>();
  
  // Controller untuk atribut Dosen
  final cNidn = TextEditingController();
  final cNama = TextEditingController();
  final cHomeBase = TextEditingController();
  final cEmail = TextEditingController();
  final cNoTlp = TextEditingController();

  @override
  void dispose() {
    cNidn.dispose();
    cNama.dispose();
    cHomeBase.dispose();
    cEmail.dispose();
    cNoTlp.dispose();
    super.dispose();
  }

  void _simpan() {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Periksa kembali isian Anda.')),
      );
      return;
    }

    final data = {
      'NIDN': cNidn.text.trim(),
      'Nama': cNama.text.trim(),
      'Home Base': cHomeBase.text.trim(),
      'Email': cEmail.text.trim(),
      'No Telepon': cNoTlp.text.trim(),
    };

    // Menampilkan output di dalam AlertDialog
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Ringkasan Data Dosen'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: data.entries
                .map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text('${e.key}: ${e.value}'),
                    ))
                .toList(),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Tutup')),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8, top: 16),
        child: Text(text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Data Dosen')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionTitle('Identitas Dosen'),
              TextFormField(
                controller: cNidn,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'NIDN',
                  hintText: 'cth: 0412345601',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.credit_card),
                ),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'NIDN wajib diisi' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: cNama,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  hintText: 'cth: Dr. Rina Setiadi, M.Kom.',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Nama wajib diisi' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: cHomeBase,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Home Base',
                  hintText: 'cth: Teknik Informatika',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_city),
                ),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Home Base wajib diisi' : null,
              ),
              
              _sectionTitle('Kontak'),
              TextFormField(
                controller: cEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'cth: rina.setiadi@kampus.ac.id',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Email wajib diisi';
                  final ok = RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v.trim());
                  return ok ? null : 'Format email tidak valid';
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: cNoTlp,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'No. Telepon',
                  hintText: 'cth: 081234567890',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'No. Telepon wajib diisi' : null,
              ),

              const SizedBox(height: 24),
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.check),
                  label: const Text('Simpan Data Dosen'),
                  onPressed: _simpan,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// lib/form_matkul.dart

import 'package:flutter/material.dart';

class FormMatkulPage extends StatefulWidget {
  const FormMatkulPage({super.key});

  @override
  State<FormMatkulPage> createState() => _FormMatkulPageState();
}

class _FormMatkulPageState extends State<FormMatkulPage> {
  final _formKey = GlobalKey<FormState>();

  // Controller untuk atribut Mata Kuliah
  final cKodeMatkul = TextEditingController();
  final cNamaMatkul = TextEditingController();
  final cSks = TextEditingController();

  @override
  void dispose() {
    cKodeMatkul.dispose();
    cNamaMatkul.dispose();
    cSks.dispose();
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
      'Kode Mata Kuliah': cKodeMatkul.text.trim(),
      'Nama Mata Kuliah': cNamaMatkul.text.trim(),
      'SKS': cSks.text.trim(),
    };

    // Menampilkan output di dalam AlertDialog
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Ringkasan Data Mata Kuliah'),
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
      appBar: AppBar(title: const Text('Form Data Mata Kuliah')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionTitle('Detail Mata Kuliah'),
              TextFormField(
                controller: cKodeMatkul,
                textCapitalization: TextCapitalization.characters,
                decoration: const InputDecoration(
                  labelText: 'Kode Mata Kuliah',
                  hintText: 'cth: IF2101',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.code),
                ),
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Kode Mata Kuliah wajib diisi'
                    : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: cNamaMatkul,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Nama Mata Kuliah',
                  hintText: 'cth: Pemrograman Perangkat Bergerak',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.subject),
                ),
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Nama Mata Kuliah wajib diisi'
                    : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: cSks,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'SKS',
                  hintText: 'cth: 3',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.format_list_numbered),
                ),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'SKS wajib diisi';
                  }
                  final sks = int.tryParse(v.trim());
                  if (sks == null || sks <= 0) {
                    return 'SKS harus berupa angka positif';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.check),
                  label: const Text('Simpan Data Mata Kuliah'),
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
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_mahasiswa_controller.dart';

class TambahDataScreen extends StatelessWidget {
  final TextEditingController npmController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  void tambahData() {
    FirebaseFirestore.instance.collection('mahasiswa_npm').add({
      'npm': npmController.text,
      'nama': namaController.text,
      'alamat': alamatController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data Mahasiswa'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: npmController,
              decoration: InputDecoration(labelText: 'NPM'),
            ),
            TextFormField(
              controller: namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextFormField(
              controller: alamatController,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
            ElevatedButton(
              onPressed: () {
                tambahData();
                Navigator.pop(context);
              },
              child: Text('Tambah Data'),
            ),
          ],
        ),
      ),
    );
  }
}

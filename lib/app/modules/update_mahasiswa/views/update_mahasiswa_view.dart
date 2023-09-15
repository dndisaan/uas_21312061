import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_mahasiswa_controller.dart';

class EditDataScreen extends StatelessWidget {
  final TextEditingController npmController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final DocumentSnapshot document;

  EditDataScreen({required this.document}) {
    npmController.text = document['npm'];
    namaController.text = document['nama'];
    alamatController.text = document['alamat'];
  }

  void editData() {
    FirebaseFirestore.instance.collection('mahasiswa_npm').doc(document.id).update({
      'npm': npmController.text,
      'nama': namaController.text,
      'alamat': alamatController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data Mahasiswa'),
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
                editData();
                Navigator.pop(context);
              },
              child: Text('Simpan Perubahan'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mahasiswa_controller.dart';

class MahasiswaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Mahasiswa'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('mahasiswa_npm').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          final List<Mahasiswa> mahasiswaList = snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Mahasiswa(
              npm: data['npm'] ?? '',
              nama: data['nama'] ?? '',
              alamat: data['alamat'] ?? '',
            );
          }).toList();

          return ListView.builder(
            itemCount: mahasiswaList.length,
            itemBuilder: (context, index) {
              final mahasiswa = mahasiswaList[index];
              return ListTile(
                title: Text('NPM: ${mahasiswa.npm}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama: ${mahasiswa.nama}'),
                    Text('Alamat: ${mahasiswa.alamat}'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

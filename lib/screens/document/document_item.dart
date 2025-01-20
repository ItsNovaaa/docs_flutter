import 'package:flutter/material.dart';
// untuk melakukan define apa saja yang dibutuhkan
// untuk menampilkan data

class DocumentItem extends StatelessWidget {
  final String title;
  final String text;
  final String image;
  const DocumentItem({
    required this.title,
    required this.text,
    required this.image,
    super.key
    });

    // stateless widget yang akan menampilkan data

  @override
  Widget build(BuildContext context) {

    return ListTile(
      title: Text(title),
      subtitle: Text(text),
      leading: Image.network(image),
    );

  }
}
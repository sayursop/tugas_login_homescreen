import 'package:flutter/material.dart';

class Gantitema extends StatefulWidget {
  final Function(bool) onTemaChange;
  
  const Gantitema({Key? key, required this.onTemaChange}) : super(key: key);

  @override
  _GantitemaState createState() => _GantitemaState();
}

class _GantitemaState extends State<Gantitema> {
  bool _isDark = true;

  void _toggleTema() {
    setState(() {
      _isDark = !_isDark;
    });
    widget.onTemaChange(_isDark);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _toggleTema,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[800],
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        "Ganti Tema",
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}

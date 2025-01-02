import 'package:flutter/material.dart';
import 'package:social_media/features/home/presentation/components/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // BUILD UI
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // SCAFFOLD
      child: Scaffold(
        // APPBAR
        appBar: AppBar(
          title: Text("Home"),
          
        ),
        // DRAWER
        drawer: MyDrawer(),
      ),
    );
  }
}

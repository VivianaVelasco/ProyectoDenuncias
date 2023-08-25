import 'package:denunciasapp/presentation/app/sidenav.dart';
import 'package:denunciasapp/presentation/widgets/recent_complaints.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //final colorTheme = Theme.of(context).colorScheme;
    return Scaffold(
      drawer: const SideNavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightBlue,
        title: const Text(
          "Denuncias",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          )
        ],
      ),
      body: const RecentComplaints(),
    );
  }
}

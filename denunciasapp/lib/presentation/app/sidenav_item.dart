import 'package:flutter/material.dart';

class SideNavItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final String link;
  final VoidCallback? onTap;

  const SideNavItem(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.title,
      this.subtitle, required this.link});

  @override
  Widget build(BuildContext context) { 
    return ListTile(
      contentPadding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
      leading: Icon(
        icon,
        color: Colors.white,
        size: 25,
      ),
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
      ),
      subtitle: subtitle != null
          ? Text(subtitle ?? "", style: const TextStyle(color: Colors.white))
          : null,
      onTap: onTap,
    );
  }
}

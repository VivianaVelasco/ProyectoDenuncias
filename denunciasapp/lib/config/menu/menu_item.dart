import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData iconData;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.iconData});
}

const appMenusItems = <MenuItem>[
  MenuItem(
      title: "Inicio",
      subTitle: "Ver denuncias recientes",
      link: "/",
      iconData: Icons.home),
  MenuItem(
      title: "Denunciar",
      subTitle: "Realizar una denuncia",
      link: "/",
      iconData: Icons.sos_outlined),
  MenuItem(
      title: "Ver Historial",
      subTitle: "Ver todas las denuncias que has publicado",
      link: "/",
      iconData: Icons.history),
  MenuItem(
      title: "Inicio",
      subTitle: "Ver denuncias de otros usuarios",
      link: "/",
      iconData: Icons.list_alt)
];

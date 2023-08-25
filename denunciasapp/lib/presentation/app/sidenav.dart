import 'package:denunciasapp/presentation/app/sidenav_item.dart';
import 'package:flutter/material.dart';

class SideNavDrawer extends StatelessWidget {
  const SideNavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // final colorTheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: (size.width * 0.65),
      child: Drawer(
          backgroundColor: Colors.lightBlue,
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: const <Widget>[
                      DrawerHeader(
                          child: Text("Denuncias Guayaquil App",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold))),
                      SideNavItem(
                        icon: Icons.home,
                        title: "Inicio",
                      ),
                      SideNavItem(icon: Icons.sos_outlined, title: "Denunciar"),
                      SideNavItem(icon: Icons.history, title: "Ver Historial"),
                      SideNavItem(icon: Icons.list_alt, title: "Denuncias"),
                    ],
                  ),
                ),
                const SideNavItem(icon: Icons.logout, title: "Cerrar Sessión")
              ],
            ),
          )),
    );
  }
}

import 'package:denunciasapp/config/menu/menu_item.dart';
import 'package:denunciasapp/presentation/app/sidenav_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                const DrawerHeader(
                    child: Text("Denuncias Guayaquil App",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold))),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: appMenusItems.length,
                    itemBuilder: (context, index) {
                      final icon = appMenusItems[index].iconData;
                      final title = appMenusItems[index].title;
                      final subTitle = appMenusItems[index].subTitle;
                      final link = appMenusItems[index].link;
                      return SideNavItem(
                          icon: icon,
                          title: title,
                          subtitle: subTitle,
                          onTap: () => context.push(link),
                          link: link);
                    },
                  ),
                ),
                SideNavItem(
                  icon: Icons.logout,
                  title: "Cerrar Sessión",
                  onTap: () => context.go("/login"),
                  link: "/login",
                )
              ],
            ),
          )),
    );
  }
}

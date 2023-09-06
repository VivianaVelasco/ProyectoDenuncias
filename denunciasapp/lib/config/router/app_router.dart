import 'package:denunciasapp/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) => HomeScreen()),
  GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
  GoRoute(path: '/register', builder: (context, state) => RegisterScreen()),
  GoRoute(
      path: '/crear-denuncia',
      builder: (context, state) => CrearDenunciasScreen()),
  GoRoute(path: '/denuncias', builder: (context, state) => DenunciasScreen()),
  GoRoute(
      name: "denuncia",
      path: '/denuncias/:id',
      builder: (context, state) {
        final int id = int.parse(state.pathParameters["id"] ?? "");
        return DenunciaScreen(id: id);
      }),
  GoRoute(
      path: '/midenuncias',
      builder: (context, state) => HistorialDenunciasScreen()),
]);

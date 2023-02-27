import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'auth_state/auth.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  static const path = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Home Page"),
            ElevatedButton(
              onPressed: () {
                ref.watch(authNotifierProvider.notifier).logout();
              },
              child: const Text("Logout"),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('$path/page-a');
              },
              child: const Text("Go to Page A"),
            ),
          ],
        ),
      ),
    );
  }
}

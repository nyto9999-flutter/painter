// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paint/entities/user.dart';
import 'package:paint/logger.dart';
import 'package:paint/router/router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'main.g.dart';

//provider
final prefsPod = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

//notifier
@riverpod
class UserRepo extends _$UserRepo {
  String key = 'key';

  @override
  String build() {
    //local storage here...
    return ref.read(prefsPod).getString(key) ?? 'from repo';
  }

  Future<void> add(User user) async {
    await ref.read(prefsPod).setString(key, user.name);
    state = user.name;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(ProviderScope(
    observers: [Logger()],
    overrides: [prefsPod.overrideWithValue(prefs)],
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  static const path = '/my-app';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: 'flutter_riverpod + go_router Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static const path = '/splash';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Splash Page")),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paint/logger.dart';
import 'package:paint/user.dart';
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
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(userRepoProvider);
    final controller = TextEditingController();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Riverpod Annotation Example'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(username),
              TextField(
                controller: controller,
                decoration: const InputDecoration(hintText: 'Enter your name'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  ref
                      .read(userRepoProvider.notifier)
                      .add(User(controller.text));
                },
                icon: const Icon(CupertinoIcons.add),
                label: const Text('Add'),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.clear),
                label: const Text('Clear'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

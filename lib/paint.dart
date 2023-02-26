import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Paint extends ConsumerStatefulWidget {
  const Paint({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaintState();
}

class _PaintState extends ConsumerState<Paint> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('paint'),
    );
  }
}

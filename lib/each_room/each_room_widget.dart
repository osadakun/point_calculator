import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EachRoomWidget extends HookConsumerWidget {
  const EachRoomWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("部屋名"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              _openRuleSettingsDialog(context);
            },
          ),
        ],
      ),
      body: const Center(
        child: Text("部屋の中身"),
      ),
    );
  }

  void _openRuleSettingsDialog(BuildContext context) {
    final controller = useTextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("ルール設定"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("持ち点を入力してください"),
              TextField(
                controller: controller,
                keyboardType: TextInputType.number, // 数値入力のみ許可
                decoration: const InputDecoration(
                  hintText: "25000",
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("キャンセル"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("保存"),
            ),
          ],
        );
      },
    );
  }
}

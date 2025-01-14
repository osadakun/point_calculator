
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'sample_view_model.dart';



class SamplePage extends ConsumerWidget {
  const SamplePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // viewModelのstateを取得
    // @riverpod で生成されたものは、'view_model_class_name'+Providerでアクセスできる
    final state = ref.watch(sampleViewModelProvider);
    // viewModelの'build()'メソッド以外を呼び出したいときに使う
    // @riverpod で生成されたものは、.notifierでアクセスできる
    final viewModel = ref.read(sampleViewModelProvider.notifier);

    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Name: ${state.name}'),
              Text('Age: ${state.age}'),
              ElevatedButton(
                onPressed: () {
                  viewModel.update('Hoge Fuga', 30);
                },
                child: const Text('Update'),
              ),
            ],
          ),
        )
    );
  }
}
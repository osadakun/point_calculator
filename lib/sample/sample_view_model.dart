

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'sample_state.dart';

// コマンド実行前に記述する
// コマンド実行までエラーが出るが、コマンド実行で解消される
part 'sample_view_model.g.dart';

// @riverpodでviewModelを作成
// 〇〇ViewModelという名前で作成する
@riverpod
class SampleViewModel extends _$SampleViewModel {
  @override
  SampleState build() {
    return const SampleState();
  }

  // 更新したいstateを引数に取るメソッドを作成
  void update(String? name, int? age) {
    state = state.copyWith(
      name: name ?? state.name,
      age: age ?? state.age,
    );
  }
}
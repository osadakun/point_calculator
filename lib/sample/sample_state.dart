import 'package:freezed_annotation/freezed_annotation.dart';

// コマンド実行前に記述する
// コマンド実行までエラーが出るが、コマンド実行で解消される
part 'sample_state.freezed.dart';

// freezed_annotationを使用して、immutableなクラスを作成
// 〇〇Stateという名前で作成する
// stateの定義が完了したら `flutter pub run build_runner (build or watch) --delete-conflicting-outputs`を実行すること
@freezed
class SampleState with _$SampleState {
  const factory SampleState({
    // デフォルト値を設定
    @Default('') String name,
    @Default(0) int age,
  }) = _SampleState;
}
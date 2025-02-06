import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:point_calculator/components/text.dart';
import 'package:point_calculator/each_room/each_room_view_model.dart';
import 'package:point_calculator/enter_room/enter_room_state.dart';
import 'package:point_calculator/gateway/supabase_gateway.dart';

class EachRoomWidget extends HookConsumerWidget {
  const EachRoomWidget({super.key, required this.data});
  final RoomName data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final client = ref.read(supabaseGatewayProvider.notifier);
    final roomName = data.name;
    final roomId = data.roomId;
    final memberMap = {for (var member in data.members) member.id: member.name};

    final controller = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: roomName, fontSize: 20, isBold: true),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () async {
              final basePoint = await client.fetchRoomRule(roomId);
              final parsePoint = basePoint.getOrElse(() => 0);
              if (!context.mounted) return;
              _openRuleSettingsDialog(
                  context, controller, client, roomId, parsePoint);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // 子要素を親幅いっぱいに広げる
          children: [
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: const StadiumBorder(),
                ),
                onPressed: () async {
                  final basePoint = await client.fetchRoomRule(roomId);
                  final parsePoint = basePoint.getOrElse(() => 0);
                  if (!context.mounted || parsePoint == 0) return;
                  _openScoreInputDialog(context, client, roomId, memberMap);
                },
                child: const CustomText(
                  text: '結果を入力する',
                  color: Colors.white,
                  isBold: true,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _TableWidget(
                memberMap: memberMap,
                roomId: roomId,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TableWidget extends HookConsumerWidget {
  const _TableWidget({required this.memberMap, required this.roomId});
  final Map<int, String> memberMap;
  final int roomId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final client = ref.read(supabaseGatewayProvider.notifier);
    final viewModel = ref.watch(eachRoomViewModelProvider.notifier);
    final scoreInfo =
        ref.watch(eachRoomViewModelProvider.select((value) => value.scoreInfo));
    final isLoad =
        ref.watch(eachRoomViewModelProvider.select((value) => value.isLoad));

    useEffect(() {
      debugPrint("useEffect 発火: isLoad=$isLoad");
      Future.microtask(() async {
        final response = await client.fetchResults(roomId);
        response.map(success: (data) {
          viewModel.updateScoreInfo(data);
        }, failure: (error) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title:
                      const CustomText(text: "エラー", isBold: true, fontSize: 24),
                  content: CustomText(text: error.toString()),
                );
              });
        });
      });
      return null;
    }, [isLoad]);

    final List<Map<String, dynamic>> updatedScoreInfo = scoreInfo.map((data) {
      final memberId = data["member_id"] as int;
      return {
        "name": memberMap[memberId] ?? "不明",
        "scores": data["scores"],
      };
    }).toList();

    if (updatedScoreInfo.isEmpty) {
      return const Center(child: CustomText(text: "データなし", fontSize: 16));
    }

    // プレイヤー名リスト
    final playerNames = updatedScoreInfo.map((info) => info["name"]).toList();

    // 各スコア（0列目: トータル, 1列目以降: 各スコア）
    final List<List<String>> scoreRows = [];

    // 1列目 = トータルスコア
    scoreRows.add([
      "トータル",
      ...updatedScoreInfo
          .map((info) => (info["scores"].fold(0.0, (a, b) => a + b)).toString())
    ]);

    // 2列目以降 = 各試合のスコア
    for (int i = 0; i < updatedScoreInfo.first["scores"].length; i++) {
      scoreRows.add([
        "${i + 1}",
        ...updatedScoreInfo.map((info) => info["scores"][i].toString())
      ]);
    }

    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(32),
      child: Scrollbar(
        thumbVisibility: false,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // 横スクロール
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical, // 縦スクロール
            child: Table(
              border: TableBorder.all(color: Colors.grey), // 枠線
              columnWidths: {
                0: const FixedColumnWidth(100), // 最初の列を固定幅
                for (int i = 1; i <= playerNames.length; i++)
                  i: const FixedColumnWidth(120),
              },
              children: [
                _buildHeader(["項目", ...playerNames]),
                _buildRow(scoreRows.first, isTotal: true),
                for (final row in scoreRows.skip(1)) _buildRow(row),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TableRow _buildHeader(List<String> cells) {
    return TableRow(
      decoration: BoxDecoration(color: Colors.blue[100]),
      children: cells.map((cell) {
        return Padding(
          padding: const EdgeInsets.all(4),
          child: CustomText(
              text: cell, isBold: true, align: TextAlign.center, fontSize: 16),
        );
      }).toList(),
    );
  }

  TableRow _buildRow(List<String> cells, {bool isTotal = false}) {
    return TableRow(
      decoration: isTotal
          ? BoxDecoration(color: Colors.grey[300]) // トータルの行だけ背景色変更
          : null,
      children: cells.map((cell) {
        final numValue = double.tryParse(cell);
        final textColor = numValue != null
            ? (numValue > 0
                ? Colors.lightBlue
                : (numValue < 0 ? Colors.redAccent : Colors.black))
            : Colors.black;
        return Padding(
          padding: const EdgeInsets.all(4),
          child: CustomText(
            text: cell,
            isBold: true,
            align: TextAlign.center,
            fontSize: 14,
            color: textColor,
          ),
        );
      }).toList(),
    );
  }
}

// セッティングダイアログの中身
Future<void> _openRuleSettingsDialog(
    BuildContext context,
    TextEditingController controller,
    SupabaseGateway client,
    int roomId,
    int basePoint) async {
  if (basePoint != 0) {
    controller.text = basePoint.toString();
  }
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const CustomText(text: "ルール設定", isBold: true, fontSize: 24),
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomText(text: "持ち点:", fontSize: 16, isBold: true),
            const SizedBox(width: 2),
            Expanded(
              child: TextFormField(
                controller: controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "25000",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const CustomText(text: "キャンセル"),
          ),
          TextButton(
            onPressed: () async {
              final response =
                  await client.setRoomRule(roomId, controller.text);
              response.map(
                success: (data) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("ルールを設定しました")),
                  );
                },
                failure: (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("ルールの設定に失敗しました: $error")),
                  );
                },
              );
              if (!context.mounted) return;
              Navigator.pop(context);
            },
            child: const CustomText(text: "保存", isBold: true),
          ),
        ],
      );
    },
  );
}

Future<void> _openScoreInputDialog(BuildContext context, SupabaseGateway client,
    int roomId, Map<int, String> memberMap) async {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return ScoreInputDialogWidget(
        client: client,
        roomId: roomId,
        memberMap: memberMap,
      );
    },
  );
}

class ScoreInputDialogWidget extends HookConsumerWidget {
  const ScoreInputDialogWidget({
    super.key,
    required this.client,
    required this.roomId,
    required this.memberMap,
  });

  final SupabaseGateway client;
  final int roomId;
  final Map<int, String> memberMap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(eachRoomViewModelProvider.notifier);
    final controllers = useMemoized(() {
      return {
        for (var id in memberMap.keys) id: TextEditingController(),
      };
    });

    // 各プレイヤーごとにマイナスフラグを管理
    final minusFlags = useState<Map<int, bool>>(
      {for (var id in memberMap.keys) id: false},
    );

    final basePoint = useState(0);

    useEffect(() {
      Future(() async {
        final point = await client.fetchRoomRule(roomId);
        basePoint.value = point.getOrElse(() => 0);
      });
      return null;
    }, []);

    return AlertDialog(
      title: const CustomText(text: "最終持ち点を入力", isBold: true, fontSize: 24),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomText(
            text: "※ 最終持ち点がマイナスの場合はチェックボックスを押してください",
            fontSize: 14,
            isBold: true,
          ),
          const SizedBox(height: 4),
          Align(
            child: CustomText(
              text: "基準点: ${basePoint.value.toString()}点",
              fontSize: 14,
              isBold: true,
            ),
          ),
          const SizedBox(height: 16),
          for (var entry in memberMap.entries)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Expanded(child: CustomText(text: entry.value, fontSize: 16)),
                  SizedBox(
                    width: 80,
                    child: TextFormField(
                      controller: controllers[entry.key],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: "25000",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Checkbox(
                    value: minusFlags.value[entry.key] ?? false,
                    onChanged: (value) {
                      minusFlags.value = {
                        ...minusFlags.value,
                        entry.key: value ?? false,
                      };
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("キャンセル"),
        ),
        TextButton(
          onPressed: () async {
            final defaultPoint =
                basePoint.value * (memberMap.length <= 3 ? 3 : 4) * -1;
            int total = controllers.entries.fold(defaultPoint, (sum, entry) {
              int score = int.tryParse(entry.value.text) ?? 0;
              // ✅ マイナスフラグが立っていたら負の値に変換
              if (minusFlags.value[entry.key] == true) {
                score = -score;
              }
              return sum + score;
            });

            if (total != 0) {
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("合計スコアが0になっていません")),
              );
              return;
            }

            final results = controllers.entries
                .map((entry) => {
                      "member_id": entry.key,
                      "score": ((minusFlags.value[entry.key] == true
                                  ? -(int.tryParse(entry.value.text) ?? 0)
                                  : int.tryParse(entry.value.text) ?? 0) -
                              basePoint.value) /
                          1000,
                    })
                .toList();

            final response = await client.storeResults(results, roomId);
            response.map(
              success: (_) {
                if (!context.mounted) return;
                viewModel.updateIsLoad();
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("結果を保存しました")),
                );
              },
              failure: (error) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("エラーが発生しました: ${error.toString()}")),
                );
              },
            );
          },
          child:
              const Text("保存", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}

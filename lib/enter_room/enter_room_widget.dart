import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:point_calculator/components/card.dart';
import 'package:point_calculator/enter_room/enter_room_state.dart';
import 'package:point_calculator/enter_room/enter_room_view_model.dart';
import 'package:point_calculator/gateway/supabase_gateway.dart';

class EnterRoomWidget extends HookConsumerWidget {
  const EnterRoomWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(enterRoomViewModelProvider.notifier);
    final roomList = useState<List<RoomName>>([]);
    final isLoading = useState<bool>(true);
    final errorMessage = useState<String?>(null);
    final client = ref.read(supabaseGatewayProvider.notifier);
    useEffect(() {
      Future(() async {
        final result = await client.fetchRoomInformations();
        result.map(
          success: (data) {
            roomList.value = data.entries.map((entry) {
              return RoomName(
                roomId: int.parse(entry.key),
                members: entry.value,
              );
            }).toList();
            viewModel.updateRoomName(roomList.value);
            isLoading.value = false;
          },
          failure: (error) {
            errorMessage.value = '部屋情報の取得に失敗しました: $error';
            isLoading.value = false;
          },
        );
      });
      return null;
    }, []);

    final state = ref.watch(enterRoomViewModelProvider);
    return Scaffold(
      body: Center(
        child: isLoading.value
            ? const CircularProgressIndicator()
            : errorMessage.value != null
                ? Text("エラー: ${errorMessage.value}")
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 48, horizontal: 16),
                    child: ListView.builder(
                      itemCount: state.roomNames.length,
                      itemBuilder: (context, index) {
                        return Column(
                          spacing: 24,
                          children: [
                            CustomCard(
                              title: state.roomNames[index].name,
                              onTap: () {
                                debugPrint(
                                    state.roomNames[index].roomId.toString());
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
      ),
    );
  }
}

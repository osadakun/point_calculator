import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:point_calculator/components/text.dart';
import 'package:point_calculator/create_room/create_room_view_model.dart';
import 'package:point_calculator/gateway/rooms_gateway.dart';

class CreateRoomWidget extends HookConsumerWidget {
  const CreateRoomWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createRoomViewModelProvider);
    final isActive = state.isValidMembers();
    final viewModel = ref.read(createRoomViewModelProvider.notifier);
    final client = ref.read(roomsGatewayProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(text: "部屋名：", isBold: true, fontSize: 16),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 200,
                    child: buildTextFormField(
                      context,
                      (value) {
                        viewModel.updateRoomName(value);
                      },
                      initialValue: state.roomName,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(text: "メンバー", isBold: true, fontSize: 18),
                  const SizedBox(width: 32),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.addMember();
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: state.members.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 32),
                      child: Row(
                        children: [
                          Expanded(
                            child: buildTextFormField(
                              context,
                              (value) {
                                viewModel.updateMembers(index, value);
                              },
                              initialValue: state.members[index].name,
                              hintText: "名前",
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              viewModel.removeMember(index);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isActive ? Colors.blue : Colors.grey.shade400,
                  shape: const StadiumBorder(),
                ),
                onPressed: isActive
                    ? () async {
                        final res = await client.createRoom(state.roomName);
                        res.map(
                          success: (_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      '部屋が作成されました\n「部屋に入る」から作成した部屋に入室してください')),
                            );
                            Navigator.pop(context);
                          },
                          failure: (error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    '部屋の作成に失敗しました\nFailed to create room: $error'),
                                duration: const Duration(seconds: 10),
                              ),
                            );
                          },
                        );
                      }
                    : null,
                child: CustomText(
                  text: "部屋を作成",
                  isBold: true,
                  color: isActive ? Colors.white : Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormField(
    BuildContext context,
    Function(String) onChanged, {
    String initialValue = '',
    String hintText = '',
  }) {
    return TextFormField(
      onTap: () => FocusScope.of(context).unfocus(),
      style: const TextStyle(fontSize: 20),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        fillColor: Colors.grey[200],
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
      initialValue: initialValue,
      onChanged: onChanged,
    );
  }
}

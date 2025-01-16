import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:point_calculator/components/text.dart';
import 'package:point_calculator/create_room/create_room_view_model.dart';

class CreateRoomWidget extends HookConsumerWidget {
  const CreateRoomWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createRoomViewModelProvider);
    final isActive = state.isValidMembers();
    final viewModel = ref.read(createRoomViewModelProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.grey[300],
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
                  backgroundColor: Colors.orange,
                  disabledBackgroundColor: Colors.orange.withValues(alpha: 0.3),
                  shape: const StadiumBorder(),
                ),
                onPressed: isActive ? () {} : null,
                child: CustomText(
                  text: "部屋を作成",
                  isBold: true,
                  color: isActive ? Colors.black : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormField(
    Function(String) onChanged, {
    String initialValue = '',
    String hintText = '',
  }) {
    return TextFormField(
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

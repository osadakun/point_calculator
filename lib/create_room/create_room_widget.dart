import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:point_calculator/components/text.dart';
import 'package:point_calculator/create_room/create_room_state.dart';
import 'package:point_calculator/create_room/create_room_view_model.dart';
import 'package:point_calculator/gateway/supabase_gateway.dart';

class CreateRoomWidget extends HookConsumerWidget {
  const CreateRoomWidget({super.key});

  bool isValidMembers(List<Member> members, String roomName) {
    return members.length >= 3 && roomName.isNotEmpty;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createRoomViewModelProvider);
    final viewModel = ref.read(createRoomViewModelProvider.notifier);
    final client = ref.read(supabaseGatewayProvider.notifier);
    final allMembersList = useState<List<Member>>([]);
    final isLoading = useState<bool>(true);
    final errorMessage = useState<String?>(null);
    final selectedMember = useState<Member?>(null);
    final selectedMembersList = useState<List<Member>>([]);
    final isActive = isValidMembers(selectedMembersList.value, state.roomName);

    useEffect(() {
      Future(() async {
        final result = await client.fetchAllMembers();
        result.map(
          success: (data) {
            allMembersList.value = data
                .map((member) => Member(
                      name: member['name'] as String,
                      id: member['id'] as int,
                    ))
                .toList();
            isLoading.value = false;
          },
          failure: (error) {
            errorMessage.value = 'メンバー情報の取得に失敗しました: $error';
            isLoading.value = false;
          },
        );
      });
      return null;
    }, []);

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
                  DropdownButton<Member>(
                    value: selectedMember.value,
                    hint: const Text("メンバーを選択"),
                    items: allMembersList.value
                        .map((member) => DropdownMenuItem(
                              value: member,
                              child: Text(member.name),
                            ))
                        .toList(),
                    onChanged: (member) {
                      selectedMember.value = member;
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.blue),
                    onPressed: () {
                      if (selectedMember.value != null) {
                        selectedMembersList.value.add(selectedMember.value!);
                        allMembersList.value.remove(selectedMember.value);
                        selectedMember.value = null;
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: selectedMembersList.value.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 32),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomText(
                              text: selectedMembersList.value[index].name,
                              isBold: true,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              final memberToRemove =
                                  selectedMembersList.value[index];

                              allMembersList.value = [
                                ...allMembersList.value,
                                memberToRemove
                              ];
                              final updatedList =
                                  List.of(selectedMembersList.value)
                                    ..removeAt(index);
                              selectedMembersList.value = updatedList;
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
                        final res = await client.createRoomWithMembers(
                            state.roomName, selectedMembersList.value);
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

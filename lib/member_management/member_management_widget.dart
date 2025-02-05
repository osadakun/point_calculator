import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:point_calculator/components/text.dart';
import 'package:point_calculator/create_room/create_room_state.dart';
import 'package:point_calculator/gateway/supabase_gateway.dart';
import 'package:point_calculator/member_management/member_management_view_model.dart';

class MemberManagementWidget extends HookConsumerWidget {
  const MemberManagementWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memberList = useState<List<Member>>([]);
    final isLoading = useState<bool>(true);
    final errorMessage = useState<String?>(null);
    final shouldReload = useState<bool>(false);
    final viewModel = ref.read(memberManagementViewModelProvider.notifier);
    final client = ref.read(supabaseGatewayProvider.notifier);
    final newMemberController = useTextEditingController();

    useEffect(() {
      Future(() async {
        final result = await client.fetchAllMembers();
        result.map(
          success: (data) {
            memberList.value = data.entries
                .map((entry) => Member(
                      id: entry.key,
                      name: entry.value,
                    ))
                .toList();
            viewModel.updateMembers(memberList.value);
            isLoading.value = false;
            shouldReload.value = false;
          },
          failure: (error) {
            errorMessage.value = 'メンバー情報の取得に失敗しました: $error';
            isLoading.value = false;
          },
        );
      });
      return null;
    }, [shouldReload.value]);

    final state = ref.watch(memberManagementViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("メンバー管理")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            const CustomText(text: "メンバーの追加", isBold: true, fontSize: 18),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: newMemberController,
                    decoration: const InputDecoration(
                      labelText: "名前",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.blue),
                  onPressed: () async {
                    final newName = newMemberController.text.trim();
                    if (newName.isNotEmpty) {
                      final result = await client.addMember(newName);
                      result.map(
                        success: (_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("$newNameが追加されました")),
                          );
                          newMemberController.clear();
                          shouldReload.value = true;
                        },
                        failure: (error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("追加に失敗しました: $error")),
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 32),
            const CustomText(text: "登録済みメンバー", isBold: true, fontSize: 18),
            const SizedBox(height: 16),
            Expanded(
              child: isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : errorMessage.value != null
                      ? Center(child: Text("エラー: ${errorMessage.value}"))
                      : ListView.builder(
                          itemCount: state.members.length,
                          itemBuilder: (context, index) {
                            final member = state.members[index];
                            return Card(
                              child: ListTile(
                                title: CustomText(
                                  text: member.name,
                                  isBold: true,
                                  fontSize: 18,
                                ),
                                trailing: IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const CustomText(
                                                text: "本当に削除しますか？",
                                                isBold: true,
                                                fontSize: 24),
                                            content: CustomText(
                                                text: "削除対象：${member.name}",
                                                isBold: true,
                                                fontSize: 18),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const CustomText(
                                                    text: "キャンセル",
                                                    isBold: true,
                                                    color: Colors.grey),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  final result = await client
                                                      .deleteMember(member.id);
                                                  result.map(
                                                    success: (_) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                            content: Text(
                                                                "${member.name}が削除されました")),
                                                      );
                                                      shouldReload.value = true;
                                                    },
                                                    failure: (error) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                            content: Text(
                                                                "削除に失敗しました: $error")),
                                                      );
                                                    },
                                                  );
                                                  if (!context.mounted) return;
                                                  Navigator.pop(context);
                                                },
                                                child: const CustomText(
                                                    text: "削除",
                                                    isBold: true,
                                                    color: Colors.red),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}

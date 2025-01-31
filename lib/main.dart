import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:point_calculator/components/text.dart';
import 'package:point_calculator/create_room/create_room_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  final url = dotenv.env["SUPABASE_URL"];
  final anonKey = dotenv.env["SUPABASE_ANON_KEY"];
  await Supabase.initialize(
    url: url!,
    anonKey: anonKey!,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const CreateRoomWidget();
                        },
                      ),
                    );
                  },
                  child: const CustomText(
                    text: "部屋を作る",
                    isBold: true,
                  ),
                ),
              ),
              const SizedBox(height: 100),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const CustomText(
                    text: "部屋に入る",
                    isBold: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

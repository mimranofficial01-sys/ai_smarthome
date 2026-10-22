import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/constants/app_constants/app_constants.dart';
import 'package:ai_smart_home_design/widgets/responsive_container/responsive_container.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final msgs = <(bool, String)>[(false, 'Hi! Ask me to redesign any room.')];
  final TextEditingController ctl = TextEditingController();
  final ScrollController scrollCtl = ScrollController();

  void send(String t) {
    if (t.trim().isEmpty) return;
    setState(() {
      msgs.add((true, t));
      msgs.add((false, 'Done! I updated your design: "$t". Check 3D view.'));
    });
    ctl.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollCtl.hasClients) {
        scrollCtl.animateTo(
          scrollCtl.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    ctl.dispose();
    scrollCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Assistant')),
      body: ResponsiveContainer(
        maxWidth: 800,
        child: Column(
          children: [
            SizedBox(
              height: 52,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                children: [
                  for (final s in [
                    'Make the lounge more modern',
                    'Suggest a larger kitchen',
                    'Add a balcony',
                    'Luxury master bedroom'
                  ])
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ActionChip(
                        label: Text(s),
                        onPressed: () => send(s),
                      ),
                    )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollCtl,
                padding: const EdgeInsets.all(16),
                itemCount: msgs.length,
                itemBuilder: (context, index) {
                  final m = msgs[index];
                  final isUser = m.$1;
                  return Align(
                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(14),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.75,
                      ),
                      decoration: BoxDecoration(
                        color: isUser ? royal : Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(16),
                          topRight: const Radius.circular(16),
                          bottomLeft: Radius.circular(isUser ? 16 : 4),
                          bottomRight: Radius.circular(isUser ? 4 : 16),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        m.$2,
                        style: TextStyle(
                          color: isUser ? Colors.white : navy,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: ctl,
                onSubmitted: send,
                decoration: InputDecoration(
                  hintText: 'Type a request…',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send, color: royal),
                    onPressed: () => send(ctl.text),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

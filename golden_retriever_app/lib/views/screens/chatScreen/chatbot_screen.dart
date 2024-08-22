// lib/views/screens/chatbot_screen.dart

import 'package:flutter/cupertino.dart';

import '../../../controllers/chatbot/chatbot_service.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  ChatbotScreenState createState() => ChatbotScreenState();
}

class ChatbotScreenState extends State<ChatbotScreen> {
  static final List<Map<String, String>> messages = [];
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  // 초기 데이터
  final String poopColor = "brown"; // 예시 데이터
  final bool poopBlood = false; // 예시 데이터
  final int poopType = 4; // 예시 데이터

  @override
  void initState() {
    super.initState();
    _sendInitialMessage(); // 초기 메시지 전송
  }

  void _sendInitialMessage() async {
    // 초기 데이터를 기반으로 메시지 생성
    String initialMessage = "다음과 같은 똥 상태를 바탕으로 사용자의 건강 상태를 분석해 주세요."
        "답변은 한국어로 반환해야 합니다."
        "똥 색깔은 $poopColor 색, 똥의 브리스톨 등급은 $poopType 입니다.. "
        "${poopBlood ? "똥에서 피가 보입니다." : "똥에서 피는 보이지 않습니다."}";

    setState(() {
      _isLoading = true;
    });

    // 생성한 초기 메시지를 챗봇 서버에 전송
    String? response = await sendMessageToChatbot(initialMessage);

    setState(() {
      if (response != null) {
        // 사용자에게는 봇의 응답만 표시
        messages.add({"sender": "bot", "text": response});
      } else {
        // 오류 메시지 표시
        messages.add({
          "sender": "bot",
          "text": "에러가 발생했습니다. 다시 시도해 주세요."
        });
      }
      _isLoading = false;
    });
  }

  void _sendMessage() async {
    final userMessage = _controller.text.trim();
    if (userMessage.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      // 사용자 메시지를 서버로 전송하고 응답을 기다림
      final response = await sendMessageToChatbot(userMessage);

      setState(() {
        if (response != null) {
          // 사용자 메시지와 봇의 응답을 UI에 업데이트
          messages.add({"sender": "user", "text": userMessage});
          messages.add({"sender": "bot", "text": response});
        } else {
          messages.add({
            "sender": "user",
            "text": userMessage,
          });
          messages.add({
            "sender": "bot",
            "text": "죄송합니다, 이해하지 못했습니다. 다시 시도해 주시겠습니까?"
          });
        }
        _isLoading = false;
        _controller.clear(); // 메시지 전송 후 텍스트 필드를 비움
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('챗봇'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.clear_circled),
          onPressed: () {
            Navigator.pop(context); // 챗봇 대화 상자를 닫음
          },
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(18.0),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  final isUser = message["sender"] == "user";
                  return Align(
                    alignment: isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: isUser
                            ? CupertinoColors.activeOrange
                            : CupertinoColors.systemGrey5,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Text(
                        message["text"]!,
                        style: TextStyle(
                          color: isUser
                              ? CupertinoColors.white
                              : CupertinoColors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CupertinoActivityIndicator(),
              ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 18),
                      child: CupertinoTextField(
                        controller: _controller,
                        placeholder: "메세지를 입력하세요",
                        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 12.0, 16.0),
                      ),
                    ),
                  ),
                  CupertinoButton(
                    child: const Icon(
                      CupertinoIcons.arrow_up_circle_fill,
                      size: 50,
                    ),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
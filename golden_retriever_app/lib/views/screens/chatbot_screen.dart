// lib/screens/chatbot_screen.dart

// import 'package:flutter/cupertino.dart';
// import 'dart:async';
//
// class ChatbotScreen extends StatefulWidget {
//   const ChatbotScreen({super.key});
//
//   @override
//   _ChatbotScreenState createState() => _ChatbotScreenState();
// }
//
// class _ChatbotScreenState extends State<ChatbotScreen> {
//   final List<Map<String, String>> _messages = [];
//   final TextEditingController _controller = TextEditingController();
//   bool _isLoading = false;
//
//   // 초기 데이터
//   final String poopColor = "brown"; // 예시 데이터
//   final bool poopBlood = false; // 예시 데이터
//   final int poopType = 4; // 예시 데이터
//
//   @override
//   void initState() {
//     super.initState();
//     _sendInitialMessage(); // 초기 메시지 전송
//   }
//
//   void _sendInitialMessage() async {
//     String initialMessage = "다음과 같은 똥 상태를 바탕으로 사용자의 건강 상태를 분석해 주세요."
//         "답변은 한국어로 반환해야 합니다."
//         "똥 색깔은 $poopColor 색, 똥의 브리스톨 등급은 $poopType 입니다.. "
//         "${poopBlood ? "똥에서 피가 보입니다." : "똥에서 피는 보이지 않습니다."}";
//
//     setState(() {
//       _isLoading = true;
//     });
//
//     // 2초 기다림
//     await Future.delayed(const Duration(seconds: 2));
//
//     // 고정된 문자열 응답
//     String response = "변이 검은색이고 브리스톨 등급이 1으로, 위장 내 출혈이나 심한 변비가 의심됩니다. 특히, 검은색 변은 상부 소화기관에서 출혈이 발생했을 가능성을 나타낼 수 있어요. 이런 경우에는 신속하게 병원에서 검사를 받아보시는 것이 중요합니다.";
//
//     setState(() {
//       _messages.add({"sender": "bot", "text": response});
//       _isLoading = false;
//     });
//   }
//
//   void _sendMessage() async {
//     final userMessage = _controller.text.trim();
//     if (userMessage.isNotEmpty) {
//       setState(() {
//         _isLoading = true;
//       });
//
//       _messages.add({"sender": "user", "text": userMessage});
//       _controller.clear(); // 메시지 전송 후 텍스트 필드를 비움
//
//       // 2초 기다림
//       await Future.delayed(const Duration(seconds: 2));
//
//       // 고정된 봇의 응답
//       final response = "네, 가능한 한 빨리 병원에 가보시는 것이 좋겠습니다. 특히 복통이나 체중 감소 같은 다른 증상이 있다면, 지체하지 말고 즉시 전문가의 진단을 받는 것이 중요합니다.";
//
//       setState(() {
//         _messages.add({"sender": "bot", "text": response});
//         _isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: const Text('챗봇'),
//         trailing: CupertinoButton(
//           padding: EdgeInsets.zero,
//           child: const Icon(CupertinoIcons.clear_circled),
//           onPressed: () {
//             Navigator.pop(context); // 챗봇 대화 상자를 닫음
//           },
//         ),
//       ),
//       child: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 padding: const EdgeInsets.all(18.0),
//                 itemCount: _messages.length,
//                 itemBuilder: (context, index) {
//                   final message = _messages[index];
//                   final isUser = message["sender"] == "user";
//                   return Align(
//                     alignment: isUser
//                         ? Alignment.centerRight
//                         : Alignment.centerLeft,
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(vertical: 8.0),
//                       padding: const EdgeInsets.all(15.0),
//                       decoration: BoxDecoration(
//                         color: isUser
//                             ? CupertinoColors.activeOrange
//                             : CupertinoColors.systemGrey5,
//                         borderRadius: BorderRadius.circular(16.0),
//                       ),
//                       child: Text(
//                         message["text"]!,
//                         style: TextStyle(
//                           color: isUser
//                               ? CupertinoColors.white
//                               : CupertinoColors.black,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             if (_isLoading)
//               const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: CupertinoActivityIndicator(),
//               ),
//             Padding(
//               padding: const EdgeInsets.all(0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       margin: const EdgeInsets.only(left: 18),
//                       child: CupertinoTextField(
//                         controller: _controller,
//                         placeholder: "메세지를 입력하세요",
//                         padding: const EdgeInsets.fromLTRB(16.0, 16.0, 12.0, 16.0),
//                       ),
//                     ),
//                   ),
//                   CupertinoButton(
//                     child: const Icon(
//                       CupertinoIcons.arrow_up_circle_fill,
//                       size: 50,
//                     ),
//                     onPressed: _sendMessage,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  ChatbotScreenState createState() => ChatbotScreenState();
}

class ChatbotScreenState extends State<ChatbotScreen> {
  final List<Map<String, String>> _messages = [];
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  // 대화 기록을 저장할 정적 변수
  static final Map<DateTime, List<Map<String, String>>> chatLogs = {};

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
    setState(() {
      _isLoading = true;
    });

    // 2초 기다림
    await Future.delayed(const Duration(seconds: 2));

    // 고정된 문자열 응답
    String response = "변이 검은색이고 브리스톨 등급이 1으로, 위장 내 출혈이나 심한 변비가 의심됩니다. 특히, 검은색 변은 상부 소화기관에서 출혈이 발생했을 가능성을 나타낼 수 있어요. 이런 경우에는 신속하게 병원에서 검사를 받아보시는 것이 중요합니다.";

    setState(() {
      _messages.add({"sender": "bot", "text": response});
      _saveChatLog();
      _isLoading = false;
    });
  }

  void _sendMessage() async {
    final userMessage = _controller.text.trim();
    if (userMessage.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      _messages.add({"sender": "user", "text": userMessage});
      _controller.clear(); // 메시지 전송 후 텍스트 필드를 비움

      // 2초 기다림
      await Future.delayed(const Duration(seconds: 2));

      // 고정된 봇의 응답
      final response = "네, 가능한 한 빨리 병원에 가보시는 것이 좋겠습니다. 특히 복통이나 체중 감소 같은 다른 증상이 있다면, 지체하지 말고 즉시 전문가의 진단을 받는 것이 중요합니다.";

      setState(() {
        _messages.add({"sender": "bot", "text": response});
        _saveChatLog();
        _isLoading = false;
      });
    }
  }

  // 현재 대화 기록을 저장하는 함수
  void _saveChatLog() {
    final today = DateTime.now();
    final dateOnly = DateTime(today.year, today.month, today.day);
    chatLogs[dateOnly] = List.from(_messages);
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
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
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

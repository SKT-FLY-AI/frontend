// lib/views/data/chatlog_list.dart

class ChatlogData {
  final String sender;
  final String chatTime;
  final String message;

  ChatlogData({
    required this.sender,
    required this.chatTime,
    required this.message,
  });
}

final List<Map<String, dynamic>> response = [
  {
    "id": 10,
    "user_id": 1,
    "role": "assistant",
    "message": "알겠습니다. 추가적인 질문을 한 가지 하겠습니다.\n\n- 최근 몇 주간의 변화된 식사나 생활습관이 있었나요?\n\n변의 색과 Type, 출혈 여부에 대해서 이야기해 주셨는데, 현재 변의 색은 갈색(#784d05)이며 Type은 솔리드하고 출혈이 있습니다. 이러한 변화가 나타나는 상황은 변비나 소화 문제 등 다양한 이유로 발생할 수 있으므로 식사나 생활습관에 대한 정보가 중요한 것 같습니다. 변화된 식사나 생활습관이 있었을 경우 그것이 이러한 증상의 원인이 될 수도 있습니다. 추가 질문이 있거나 도움이 필요하시면 언제든지 말씀해주세요.",
    "timestamp": "2024-08-19T15:28:13",
    "image_id": 18,
    "poo_color": "#784d05",
    "poo_type": 4,
    "poo_blood": 1
  },
  {
    "id": 9,
    "user_id": 1,
    "role": "user",
    "message": "사용자의 대변 색상 코드: #784d05, 브리스톨 지수: 4, 혈액 존재: 있음이야. 이와 관련된 건강 상태를 확인하고 상황을 해결하기 위해 나에게 추가적인 질문을 한가지만 해줘. 그리고 내 변의 색과 Type, 출혈유무를 다시말해줘.",
    "timestamp": "2024-08-19T15:28:09",
    "image_id": 18,
    "poo_color": "#784d05",
    "poo_type": 4,
    "poo_blood": 1
  },
  {
    "id": 7,
    "user_id": 1,
    "role": "user",
    "message": "Image uploaded with ID: 18, Poo Type: 4, Poo Color: #784d05, Poo Blood: True",
    "timestamp": "2024-08-19T15:27:59",
    "image_id": 18,
    "poo_color": "#784d05",
    "poo_type": 4,
    "poo_blood": 1
  },
  {
    "id": 8,
    "user_id": 1,
    "role": "assistant",
    "message": "사용자의 대변 색상 코드 #784d05은 주황색을 나타내며 브리스톨 지수 4는 변의 모양이 뭉툭하고 딱딱한 형태를 갖추고 있다는 것을 의미합니다. 혈액이 존재한다면 변의 색상이나 Type에 추가적인 변화가 있는지 확인해야 합니다. 이에 대한 질문을 한 가지만 해드리겠습니다.\n\n대변의 색상이나 Type에 추가적인 변화나 이상 증상이 있습니까? 출혈 유무도 같이 확인 부탁드립니다.",
    "timestamp": "2024-08-19T15:27:59",
    "image_id": 18,
    "poo_color": "#784d05",
    "poo_type": 4,
    "poo_blood": 1
  },
  {
    "id": 2,
    "user_id": 1,
    "role": "assistant",
    "message": "당신의 변 색상 코드는 #2f2815이며 브리스톨 지수는 4입니다. 혈액이 존재하는 상황이시군요. 추가적인 질문이 한 가지 있으셔서 감사합니다. 변의 색과 Type, 출혈 여부를 다시 확인해드리겠습니다.\n\n변 색: 검은색\nType: 1형\n출혈 여부: 있음\n\n위 정보를 바탕으로 혈압이나 소화관 문제와 관련이 있을 수 있으니, 즉시 의료진을 찾아서 상황을 점검해 보시는 것이 좋을 것 같습니다. 건강에 신경 쓰시고 조속한 회복을 기원합니다.",
    "timestamp": "2024-08-19T11:27:47",
    "image_id": null,
    "poo_color": null,
    "poo_type": null,
    "poo_blood": null
  },
  {
    "id": 1,
    "user_id": 1,
    "role": "assistant",
    "message": "혈액이 대변에 섞여있는 경우, 이는 소화기관이나 항문 부분에서 출혈이 발생했을 가능성이 있습니다. 즉각적인 의료 상담이 필요할 수 있습니다. 추가적인 질문을 하나 더 받기 위해 사용자의 현재 증상 중 어떤 것이 가장 주요한지 물어봐주시겠어요? 함께 상황을 해결해보겠습니다.",
    "timestamp": "2024-08-19T11:21:32",
    "image_id": null,
    "poo_color": null,
    "poo_type": null,
    "poo_blood": null
  },
  {
    "id": 6,
    "user_id": 1,
    "role": "assistant",
    "message": "사용자의 대변 색상 코드 #784d05은 주황색을 나타내며 브리스톨 지수 4는 변의 모양이 뭉툭하고 딱딱한 형태를 갖추고 있다는 것을 의미합니다. 혈액이 존재한다면 변의 색상이나 Type에 추가적인 변화가 있는지 확인해야 합니다. 이에 대한 질문을 한 가지만 해드리겠습니다.\n\n대변의 색상이나 Type에 추가적인 변화나 이상 증상이 있습니까? 출혈 유무도 같이 확인 부탁드립니다.",
    "timestamp": "2024-08-19T06:27:59",
    "image_id": null,
    "poo_color": null,
    "poo_type": null,
    "poo_blood": null
  },
  {
    "id": 5,
    "user_id": 1,
    "role": "assistant",
    "message": "고객님의 변 색상 코드 #784d05은 짙은 갈색을 나타냅니다. 변의 Type은 순간적인 변인 것으로 생각됩니다. 출혈이 있는 것으로 확인되었으며, 혈액이 섞여 나오고 있다는 것을 알 수 있습니다.\n\n추가 질문이 있다면 얼마든지 해주세요. 예를 들어 변의 냄새, 변의 빈도, 변의 양 등에 대해 알고 싶다면 말씀해주시면 됩니다.",
    "timestamp": "2024-08-19T06:26:50",
    "image_id": null,
    "poo_color": null,
    "poo_type": null,
    "poo_blood": null
  },
  {
    "id": 4,
    "user_id": 1,
    "role": "assistant",
    "message": "사용자의 대변의 색상 코드인 #6d4929는 갈색 계열의 색상입니다. 브리스톨 지수가 4이므로 변의 형태는 부서진 소시지 모양입니다. 혈액이 존재하는 것으로 알려졌습니다.\n\n추가적인 질문을 하나더 받으셨군요. 혹시 변의 냄새가 변했거나 변의 양이 갑자기 많아진 적이 있나요? 혹은 소화에 관련된 불편한 증상이 있나요?\n\n변의 색과 Type은 갈색 계열의 소시지 모양이며, 혈액이 섞여 있는 상태입니다. 변의 색상, 형태 및 출혈 여부를 지속적으로 관찰하고 있다면 변화가 있다면 즉시 의료 전문가와 상담하는 것을 권장합니다. 변화된 변의 색이나 모양은 건강 문제의 징후일 수 있습니다.",
    "timestamp": "2024-08-19T06:13:49",
    "image_id": null,
    "poo_color": null,
    "poo_type": null,
    "poo_blood": null
  },
  {
    "id": 3,
    "user_id": 1,
    "role": "assistant",
    "message": "혈액이 대변에 섞여 있는 경우 식이 섭취나 소화기관 문제로 인한 출혈 등 다양한 이유로 발생할 수 있습니다. 꼬리의 대변 색상 코드가 #6d4929로 주어진다면 갈색에 가까운 짙은 갈색색으로 볼 수 있습니다. 이 색의 변은 대부분은 건강한 변이지만 출혈 등의 문제가 있을 수도 있습니다. 브리스톨 지수가 4인 상황에서 추가적인 질문을 한 가지 드리자면, 종양, 궤양, 혹은 내부 출혈과 같은 잠재적인 심각한 건강 문제를 고려해 봐야 할 수도 있습니다. 그래서 제가 드리는 지식으로만 응답을 드릴 수 있으니 의사나 전문가의 도움을 받아 상황을 보다 정확하게 평가하고 안내를 받는 것이 좋습니다.",
    "timestamp": "2024-08-19T05:55:30",
    "image_id": null,
    "poo_color": null,
    "poo_type": null,
    "poo_blood": null
  }
];

final List<ChatlogData> chatlogList = response.map((item) {
  return ChatlogData(
    sender: item['role'],
    chatTime: item['timestamp'],
    message: item['message'],
  );
}).toList();


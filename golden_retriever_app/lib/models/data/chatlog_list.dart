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
  // {
  //   "id": 2,
  //   "user_id": 1,
  //   "role": "assistant",
  //   "message": "당신의 변 색상 코드는 #2f2815이며 브리스톨 지수는 4입니다. 혈액이 존재하는 상황이시군요. 추가적인 질문이 한 가지 있으셔서 감사합니다. 변의 색과 Type, 출혈 여부를 다시 확인해드리겠습니다.\n\n변 색: 검은색\nType: 1형\n출혈 여부: 있음\n\n위 정보를 바탕으로 혈압이나 소화관 문제와 관련이 있을 수 있으니, 즉시 의료진을 찾아서 상황을 점검해 보시는 것이 좋을 것 같습니다. 건강에 신경 쓰시고 조속한 회복을 기원합니다.",
  //   "timestamp": "2024-08-19T11:27:47",
  //   "image_id": null,
  //   "poo_color": null,
  //   "poo_type": null,
  //   "poo_blood": null
  // },
  // {
  //   "id": 1,
  //   "user_id": 1,
  //   "role": "assistant",
  //   "message": "혈액이 대변에 섞여있는 경우, 이는 소화기관이나 항문 부분에서 출혈이 발생했을 가능성이 있습니다. 즉각적인 의료 상담이 필요할 수 있습니다. 추가적인 질문을 하나 더 받기 위해 사용자의 현재 증상 중 어떤 것이 가장 주요한지 물어봐주시겠어요? 함께 상황을 해결해보겠습니다.",
  //   "timestamp": "2024-08-19T11:21:32",
  //   "image_id": null,
  //   "poo_color": null,
  //   "poo_type": null,
  //   "poo_blood": null
  // },
  // {
  //   "id": 6,
  //   "user_id": 1,
  //   "role": "assistant",
  //   "message": "사용자의 대변 색상 코드 #784d05은 주황색을 나타내며 브리스톨 지수 4는 변의 모양이 뭉툭하고 딱딱한 형태를 갖추고 있다는 것을 의미합니다. 혈액이 존재한다면 변의 색상이나 Type에 추가적인 변화가 있는지 확인해야 합니다. 이에 대한 질문을 한 가지만 해드리겠습니다.\n\n대변의 색상이나 Type에 추가적인 변화나 이상 증상이 있습니까? 출혈 유무도 같이 확인 부탁드립니다.",
  //   "timestamp": "2024-08-19T06:27:59",
  //   "image_id": null,
  //   "poo_color": null,
  //   "poo_type": null,
  //   "poo_blood": null
  // },
  // {
  //   "id": 5,
  //   "user_id": 1,
  //   "role": "assistant",
  //   "message": "고객님의 변 색상 코드 #784d05은 짙은 갈색을 나타냅니다. 변의 Type은 순간적인 변인 것으로 생각됩니다. 출혈이 있는 것으로 확인되었으며, 혈액이 섞여 나오고 있다는 것을 알 수 있습니다.\n\n추가 질문이 있다면 얼마든지 해주세요. 예를 들어 변의 냄새, 변의 빈도, 변의 양 등에 대해 알고 싶다면 말씀해주시면 됩니다.",
  //   "timestamp": "2024-08-19T06:26:50",
  //   "image_id": null,
  //   "poo_color": null,
  //   "poo_type": null,
  //   "poo_blood": null
  // },
  // {
  //   "id": 4,
  //   "user_id": 1,
  //   "role": "assistant",
  //   "message": "사용자의 대변의 색상 코드인 #6d4929는 갈색 계열의 색상입니다. 브리스톨 지수가 4이므로 변의 형태는 부서진 소시지 모양입니다. 혈액이 존재하는 것으로 알려졌습니다.\n\n추가적인 질문을 하나더 받으셨군요. 혹시 변의 냄새가 변했거나 변의 양이 갑자기 많아진 적이 있나요? 혹은 소화에 관련된 불편한 증상이 있나요?\n\n변의 색과 Type은 갈색 계열의 소시지 모양이며, 혈액이 섞여 있는 상태입니다. 변의 색상, 형태 및 출혈 여부를 지속적으로 관찰하고 있다면 변화가 있다면 즉시 의료 전문가와 상담하는 것을 권장합니다. 변화된 변의 색이나 모양은 건강 문제의 징후일 수 있습니다.",
  //   "timestamp": "2024-08-19T06:13:49",
  //   "image_id": null,
  //   "poo_color": null,
  //   "poo_type": null,
  //   "poo_blood": null
  // },
  // {
  //   "id": 3,
  //   "user_id": 1,
  //   "role": "assistant",
  //   "message": "혈액이 대변에 섞여 있는 경우 식이 섭취나 소화기관 문제로 인한 출혈 등 다양한 이유로 발생할 수 있습니다. 꼬리의 대변 색상 코드가 #6d4929로 주어진다면 갈색에 가까운 짙은 갈색색으로 볼 수 있습니다. 이 색의 변은 대부분은 건강한 변이지만 출혈 등의 문제가 있을 수도 있습니다. 브리스톨 지수가 4인 상황에서 추가적인 질문을 한 가지 드리자면, 종양, 궤양, 혹은 내부 출혈과 같은 잠재적인 심각한 건강 문제를 고려해 봐야 할 수도 있습니다. 그래서 제가 드리는 지식으로만 응답을 드릴 수 있으니 의사나 전문가의 도움을 받아 상황을 보다 정확하게 평가하고 안내를 받는 것이 좋습니다.",
  //   "timestamp": "2024-08-19T05:55:30",
  //   "image_id": null,
  //   "poo_color": null,
  //   "poo_type": null,
  //   "poo_blood": null
  // },
  // {
  //   "id": 28,
  //   "user_id": 1,
  //   "role": "assistant",
  //   "message": "노란색 변과 심한 냄새는 지방이 제대로 흡수되지 않는 상태일 수 있으며, 이는 장내 문제나 간과 췌장과 관련된 문제일 수 있습니다. 특히 지속적인 설사와 함께 나타난다면 전문가의 상담이 필요할 수 있습니다. 최근 식습관에 변화가 있었는지도 확인해보세요.",
  //   "timestamp": "2024-08-08T08:48:00",
  //   "image_id": 27,
  //   "poo_color": "#d4a53b",
  //   "poo_type": 6,
  //   "poo_blood": 0
  // },
  {
    "id": 27,
    "user_id": 1,
    "role": "user",
    "message": "오늘 변의 색이 노란색이었고 약간 냄새가 심했어요. 이상한 것 같아요.",
    "timestamp": "2024-08-08T08:45:10",
    "image_id": 27,
    "poo_color": "#d4a53b",
    "poo_type": 6,
    "poo_blood": 0
  },
  {
    "id": 26,
    "user_id": 1,
    "role": "assistant",
    "message": "변이 녹색으로 변한 이유는 장을 통과하는 시간이 짧아 담즙이 완전히 분해되지 않았기 때문일 수 있습니다. 또한, 최근에 녹색 채소나 색소가 포함된 음식을 섭취했다면 그 영향일 수도 있습니다. 변 색상이 하루 이틀 내에 정상으로 돌아오지 않거나 다른 증상이 동반된다면, 의료 전문가와 상담하는 것이 좋습니다.",
    "timestamp": "2024-08-03T09:15:30",
    "image_id": 26,
    "poo_color": "#4a7f3f",
    "poo_type": 4,
    "poo_blood": 0
  },
  {
    "id": 25,
    "user_id": 1,
    "role": "user",
    "message": "오늘 변이 갑자기 녹색으로 변했어요. 식단은 평소와 같았는데 왜 그럴까요?",
    "timestamp": "2024-08-03T09:12:45",
    "image_id": 26,
    "poo_color": "#4a7f3f",
    "poo_type": 4,
    "poo_blood": 0
  },
  {
    "id": 24,
    "user_id": 1,
    "role": "assistant",
    "message": "변이 딱딱하고 검은색에 가까웠다면, 이는 변비와 관련이 있을 수 있으며, 철분 보충제 섭취로 인해 변이 검게 변할 수도 있습니다. 변비 예방을 위해 물 섭취량을 늘리고 식이섬유가 풍부한 음식을 섭취하는 것이 좋습니다. 혈액이 없었다니 다행이지만, 변의 상태가 계속 좋지 않다면 전문가와 상의해 보세요.",
    "timestamp": "2024-07-30T08:58:30",
    "image_id": 25,
    "poo_color": "#3b2d1f",
    "poo_type": 2,
    "poo_blood": 0
  },
  {
    "id": 23,
    "user_id": 1,
    "role": "user",
    "message": "오늘 변의 상태가 평소보다 딱딱했고, 약간 검은색에 가까웠어요. 혈액은 없었어요.",
    "timestamp": "2024-07-30T08:55:50",
    "image_id": 25,
    "poo_color": "#3b2d1f",
    "poo_type": 2,
    "poo_blood": 0
  },
  {
    "id": 22,
    "user_id": 1,
    "role": "assistant",
    "message": "변에서 기름기가 느껴지고 회색이라면, 이는 담즙 분비에 문제가 있을 가능성이 있습니다. 담즙이 충분히 분비되지 않으면 변이 회색이나 백색을 띄게 됩니다. 이는 간, 쓸개, 췌장과 관련된 문제일 수 있으므로 빠른 시일 내에 의료기관에서 검사를 받아보시는 것을 권장합니다.",
    "timestamp": "2024-07-26T10:33:45",
    "image_id": 24,
    "poo_color": "#bfbfbf",
    "poo_type": 5,
    "poo_blood": 0
  },
  {
    "id": 21,
    "user_id": 1,
    "role": "user",
    "message": "변에서 약간 기름기가 느껴지고 색이 회색으로 나왔어요. 이게 심각한 건가요?",
    "timestamp": "2024-07-26T10:30:15",
    "image_id": 24,
    "poo_color": "#bfbfbf",
    "poo_type": 5,
    "poo_blood": 0
  },
  {
    "id": 20,
    "user_id": 1,
    "role": "assistant",
    "message": "변이 묽고 노란색으로 나왔다면, 이는 소화불량이나 장의 흡수 문제와 관련이 있을 수 있습니다. 장염이나 간 문제와도 연관될 수 있으므로, 증상이 지속되면 의료 상담을 받아보시는 것이 좋습니다. 최근 식습관이나 섭취한 음식에 변화가 있었는지도 확인해보세요.",
    "timestamp": "2024-07-23T07:48:55",
    "image_id": 23,
    "poo_color": "#d9a741",
    "poo_type": 6,
    "poo_blood": 0
  },
  {
    "id": 19,
    "user_id": 1,
    "role": "user",
    "message": "오늘 아침 변이 너무 묽고 색이 노랗게 나왔어요. 무슨 문제일까요?",
    "timestamp": "2024-07-23T07:45:20",
    "image_id": 23,
    "poo_color": "#d9a741",
    "poo_type": 6,
    "poo_blood": 0
  },
  {
    "id": 18,
    "user_id": 1,
    "role": "assistant",
    "message": "변의 색상이 붉어 보인다면, 이는 출혈 가능성을 시사할 수 있습니다. 특히 대장의 출혈이나 치질에서 출혈이 발생할 수 있습니다. 변이 붉은 색을 띄는 경우 즉시 의료기관에 방문하여 정확한 원인을 확인하는 것이 중요합니다. 최근 먹은 음식 중 붉은색을 띄는 것이 있었는지도 확인해보세요.",
    "timestamp": "2024-07-20T09:17:45",
    "image_id": 22,
    "poo_color": "#a33524",
    "poo_type": 3,
    "poo_blood": 1
  },
  {
    "id": 17,
    "user_id": 1,
    "role": "user",
    "message": "오늘 변의 색상이 평소보다 붉어보여서 걱정이 됩니다. 혹시 출혈일까요?",
    "timestamp": "2024-07-20T09:15:30",
    "image_id": 22,
    "poo_color": "#a33524",
    "poo_type": 3,
    "poo_blood": 1
  },
  {
    "id": 16,
    "user_id": 1,
    "role": "assistant",
    "message": "오늘 아침 변이 어두운 색으로 변했다고 하셨는데, 이는 위장 출혈이나 철분 섭취와 관련된 경우가 많습니다. 출혈이 없는 상태에서도 변 색상이 검게 변할 수 있으니, 최근에 철분 보충제를 섭취했는지 혹은 철분이 많은 음식을 섭취했는지 확인해보세요. 만약 변 색상이 지속적으로 어둡게 유지된다면, 내과에서 추가적인 검사를 받는 것이 좋습니다.",
    "timestamp": "2024-07-19T18:23:15",
    "image_id": 21,
    "poo_color": "#2c1b0f",
    "poo_type": 4,
    "poo_blood": 0
  },
  {
    "id": 15,
    "user_id": 1,
    "role": "user",
    "message": "오늘 아침에 본 변이 갑자기 아주 어두운 색으로 변했어요. 출혈은 없었지만 좀 이상해요.",
    "timestamp": "2024-07-19T18:20:30",
    "image_id": 21,
    "poo_color": "#2c1b0f",
    "poo_type": 4,
    "poo_blood": 0
  },
  {
    "id": 14,
    "user_id": 1,
    "role": "assistant",
    "message": "최근 며칠 동안 변이 짙어지고 딱딱해졌다고 하셨습니다. 이는 변비의 초기 증상일 수 있으며, 식이섬유와 물 섭취가 부족할 때 자주 나타납니다. 특히 짙은 갈색의 변은 변비가 심해질 때 나타날 수 있는 증상 중 하나입니다. 물과 식이섬유를 충분히 섭취해보시고, 변의 상태가 지속된다면 의료 전문가의 상담을 권장합니다.",
    "timestamp": "2024-07-19T17:05:40",
    "image_id": 20,
    "poo_color": "#5e2e02",
    "poo_type": 2,
    "poo_blood": 0
  },
  {
    "id": 13,
    "user_id": 1,
    "role": "user",
    "message": "최근 며칠 동안 변의 색이 짙어지고 딱딱해진 느낌이 있어요. 이게 무슨 문제인지 궁금합니다.",
    "timestamp": "2024-07-19T17:03:20",
    "image_id": 20,
    "poo_color": "#5e2e02",
    "poo_type": 2,
    "poo_blood": 0
  },
  {
    "id": 12,
    "user_id": 1,
    "role": "assistant",
    "message": "오늘 아침에 보신 변의 색상이 평소보다 옅고 물기가 있었다고 하셨는데, 이는 소화 과정에 변화가 있음을 나타낼 수 있습니다. 색상이 옅어지는 경우 간이나 췌장 관련 문제일 수 있으므로 주의가 필요합니다. 최근 식사에서 지방이 많은 음식을 섭취한 적이 있는지, 혹은 복통 같은 다른 증상이 있는지 확인하는 것이 중요합니다.",
    "timestamp": "2024-07-19T16:12:45",
    "image_id": 19,
    "poo_color": "#c6a15b",
    "poo_type": 5,
    "poo_blood": 0
  },
  {
    "id": 11,
    "user_id": 1,
    "role": "user",
    "message": "오늘 아침에 변을 보았는데 색상이 평소보다 옅고 약간 물기가 있었어요. 이런 변화가 건강에 문제가 될까요?",
    "timestamp": "2024-07-19T16:10:00",
    "image_id": 19,
    "poo_color": "#c6a15b",
    "poo_type": 5,
    "poo_blood": 0
  },
];

final List<ChatlogData> chatlogList = response.map((item) {
  return ChatlogData(
    sender: item['role'],
    chatTime: item['timestamp'],
    message: item['message'],
  );
}).toList();
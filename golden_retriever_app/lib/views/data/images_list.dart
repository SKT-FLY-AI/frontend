// lib/views/data/images_list.dart

class ImagesData {
  final String uploadTime;
  final String pooColor;
  final int? pooType;
  final int? pooBlood;

  ImagesData({
    required this.uploadTime,
    required this.pooColor,
    this.pooType,
    this.pooBlood,
  });
}


final List<Map<String, dynamic>> response = [
  {
    "id": 3,
    "user_id": 1,
    "file_path": "2024-08-08_150939.png",
    "upload_time": "2024-08-02T12:33:20",
    "file_name": "2024-08-08_150939.png",
    "poo_type": 4,
    "poo_color": "#6e4a2a",
    "poo_blood": 1,
    "usersex": 0
  },
  {
    "id": 4,
    "user_id": 1,
    "file_path": "2024-07-31_201428.png",
    "upload_time": "2024-08-02T23:13:59",
    "file_name": "2024-07-31_201428.png",
    "poo_type": 4,
    "poo_color": "#895851",
    "poo_blood": 1,
    "usersex": 1
  },
  {
    "id": 5,
    "user_id": 1,
    "file_path": "2024-07-31_201428.png",
    "upload_time": "2024-08-03T23:15:33",
    "file_name": "2024-07-31_201428.png",
    "poo_type": 4,
    "poo_color": "#895851",
    "poo_blood": 1,
    "usersex": 1
  },
  {
    "id": 6,
    "user_id": 1,
    "file_path": "2024-07-31_201428.png",
    "upload_time": "2024-08-04T23:16:30",
    "file_name": "2024-07-31_201428.png",
    "poo_type": 4,
    "poo_color": "#895851",
    "poo_blood": 1,
    "usersex": 1
  },
  {
    "id": 7,
    "user_id": 1,
    "file_path": "339.jpeg",
    "upload_time": "2024-08-05T00:07:09",
    "file_name": "339.jpeg",
    "poo_type": 1,
    "poo_color": "AD1A2A",
    "poo_blood": 1,
    "usersex": 1
  },
  {
    "id": 8,
    "user_id": 1,
    "file_path": "339.jpeg",
    "upload_time": "2024-08-07T00:07:27",
    "file_name": "339.jpeg",
    "poo_type": 1,
    "poo_color": "AD1A2A",
    "poo_blood": 1,
    "usersex": 1
  },
  {
    "id": 11,
    "user_id": 1,
    "file_path": "339.jpeg",
    "upload_time": "2024-08-09T00:15:43",
    "file_name": "339.jpeg",
    "poo_type": 1,
    "poo_color": "#6e4a2a",
    "poo_blood": 1,
    "usersex": 1
  },
  {
    "id": 12,
    "user_id": 1,
    "file_path": "339.jpeg",
    "upload_time": "2024-08-10T00:22:06",
    "file_name": "339.jpeg",
    "poo_type": 1,
    "poo_color": "#AD1A2A",
    "poo_blood": 1,
    "usersex": 1
  },
  {
    "id": 13,
    "user_id": 1,
    "file_path": "339.jpeg",
    "upload_time": "2024-08-11T00:22:39",
    "file_name": "339.jpeg",
    "poo_type": 1,
    "poo_color": "#AD1A2A",
    "poo_blood": 1,
    "usersex": 1
  },
  {
    "id": 14,
    "user_id": 1,
    "file_path": "317.jpeg",
    "upload_time": "2024-08-12T10:56:26",
    "file_name": "317.jpeg",
    "poo_type": 4,
    "poo_color": "#2f2815",
    "poo_blood": 1,
    "usersex": 1
  },
  {
    "id": 15,
    "user_id": 1,
    "file_path": "317.jpeg",
    "upload_time": "2024-08-13T11:03:13",
    "file_name": "317.jpeg",
    "poo_type": 4,
    "poo_color": "#2f2815",
    "poo_blood": 1,
    "usersex": 1
  }
];

// 데이터를 추출해서 ImagesData 리스트로 변환
final List<ImagesData> imagesList = response.map((item) {
  return ImagesData(
    uploadTime: item['upload_time'],
    pooColor: item['poo_color'],
    pooType: item['poo_type'],
    pooBlood: item['poo_blood'],
  );
}).toList();

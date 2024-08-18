// lib/vies/screens/hospital_list_screen.dart

import 'package:flutter/cupertino.dart';

class HospitalListScreen extends StatelessWidget {
  final String title;

  // 병원 데이터 리스트
  final List<Map<String, dynamic>> hospitals = [
    {
      "name": "Seoul Boramae Hospital",
      "address": "20 Boramae-ro 5-gil, Dongjak District",
      "location": {"lat": 37.4932234, "lng": 126.9244612}
    },
    {
      "name": "백설공주피부과의원",
      "address": "353 Sillim-ro, Sillim-dong, Gwanak-gu",
      "location": {"lat": 37.4857531, "lng": 126.9292291}
    },
    {
      "name": "하정한정형외과",
      "address": "405-11 대방동, Dongjak District",
      "location": {"lat": 37.49942480000001, "lng": 126.927877}
    },
    {
      "name": "선산부인과의원",
      "address": "1433-100 Sillim-dong, Gwanak-gu",
      "location": {"lat": 37.484193, "lng": 126.9275102}
    },
    {
      "name": "봄정신건강의학과의원",
      "address": "393-65 Daebang-dong, Dongjak District",
      "location": {"lat": 37.4999212, "lng": 126.9283641}
    },
    {
      "name": "서울특별시 보라매병원 응급의료센타",
      "address": "20 Boramae-ro 5-gil, Dongjak District",
      "location": {"lat": 37.4934818, "lng": 126.9238663}
    },
    {
      "name": "평화 치과",
      "address": "284 Bongcheon-ro, 신림동, Gwanak-gu",
      "location": {"lat": 37.4870571, "lng": 126.9323484}
    },
    {
      "name": "신림제일정형외과의원",
      "address": "2층, 서원프라자, 350 Sillim-ro, Gwanak-gu",
      "location": {"lat": 37.4855283, "lng": 126.9298329}
    },
    {
      "name": "Sillim-dong",
      "address": "646-137 Daebang-dong 402, 신림동, 관악구, villa",
      "location": {"lat": 37.4993576, "lng": 126.9235544}
    },
    {
      "name": "야호정신건강의학과의원",
      "address": "2층, 1601-1 Nambusunhwan-ro, Gwanak-gu",
      "location": {"lat": 37.48437979999999, "lng": 126.9285139}
    },
    {
      "name": "이재준치과",
      "address": "1433-48 Sillim-dong, Gwanak-gu",
      "location": {"lat": 37.4843308, "lng": 126.9286038}
    },
    {
      "name": "닥터제이미의원",
      "address": "8층, 르네상스 쇼핑몰, 340 Sillim-ro, Gwanak-gu",
      "location": {"lat": 37.4846401, "lng": 126.930181}
    },
    {
      "name": "신림평온정신건강의학과",
      "address": "1422-30 Sillim-dong, 번지 4층, Gwanak-gu",
      "location": {"lat": 37.48466929999999, "lng": 126.9306512}
    },
    {
      "name": "연세 광 정신건강의학과의원",
      "address": "7층, 13 Sangdo-ro, Dongjak District",
      "location": {"lat": 37.4999457, "lng": 126.9219707}
    }
  ];

  HospitalListScreen({
    super.key,
    this.title = '내 근처 병원', // 화면 상단 타이틀
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title), // 네비게이션 바의 가운데 텍스트
      ),
      child: ListView.builder(
        itemCount: hospitals.length, // 병원 리스트의 항목 개수
        itemBuilder: (context, index) {
          final hospital = hospitals[index]; // 해당 인덱스의 병원 정보
          return CupertinoListTile(
            title: Text(hospital['name']), // 병원 이름
            subtitle: Text(hospital['address']), // 병원 주소
          );
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../controllers/auth_service/dog_service.dart';
import '../../custom_text_field.dart';

class DogInfoScreen extends StatefulWidget {
  final int userId; // userId 추가

  const DogInfoScreen({super.key, required this.userId});

  @override
  _DogInfoScreenState createState() => _DogInfoScreenState();
}

class _DogInfoScreenState extends State<DogInfoScreen> {
  final TextEditingController _dogNameController = TextEditingController();
  final TextEditingController _dogAgeController = TextEditingController();
  int _selectedGender = -1;
  int _spayedStatus = 1; // 또는 0으로 초기화
  int _pregnancyStatus = 0; // 또는 1으로 초기화
  bool _isLoading = false;

  Future<void> _registerDog() async {
    if (_selectedGender == -1 || _spayedStatus == -1 || _pregnancyStatus == -1) {
      _showDialog('모든 필드를 채워주세요');
      return;
    }

    _setLoading(true);

    final response = await DogService.registerDog(
      dogName: _dogNameController.text,
      dogAge: int.parse(_dogAgeController.text),
      dogSex: _selectedGender,
      dogSpayed: _spayedStatus == 1, // int를 bool로 변환
      dogPregnant: _pregnancyStatus == 1, // int를 bool로 변환
      userId: widget.userId, // userId 함께 전송
    );

    _setLoading(false);

    if (response != null && response.statusCode == 200) {
      _showDialog('강아지 등록 완료!', isSuccess: true);
    } else {
      _showDialog('강아지 등록 실패: ${response?.reasonPhrase ?? 'Unknown error'}');
    }
  }

  void _showDialog(String message, {bool isSuccess = false}) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(isSuccess ? 'Success' : 'Error'),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
                if (isSuccess) {
                  Navigator.pop(context); // 성공 시 이전 화면으로 돌아가기
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _setLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        border: null,
        backgroundColor: CupertinoColors.transparent,
      ),
      child: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  controller: _dogNameController,
                  placeholder: '강아지 이름',
                  prefixIcon: CupertinoIcons.paw,
                ),
                CustomTextField(
                  controller: _dogAgeController,
                  placeholder: '강아지 나이',
                  prefixIcon: CupertinoIcons.time,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "성별: ",
                      style: TextStyle(
                        fontSize: contextHeight * 0.2,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    _buildGenderButton('남성', 0),
                    _buildGenderButton('여성', 1),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "중성화 여부: ",
                      style: TextStyle(
                        fontSize: contextHeight * 0.2,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    _buildStatusButton('O', 1, _spayedStatus, (value) => setState(() => _spayedStatus = value)),
                    _buildStatusButton('X', 0, _spayedStatus, (value) => setState(() => _spayedStatus = value)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "임신 여부: ",
                      style: TextStyle(
                        fontSize: contextHeight * 0.2,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    _buildStatusButton('O', 1, _pregnancyStatus, (value) => setState(() => _pregnancyStatus = value)),
                    _buildStatusButton('X', 0, _pregnancyStatus, (value) => setState(() => _pregnancyStatus = value)),
                  ],
                ),
                const SizedBox(height: 16.0),
                _isLoading
                    ? const CupertinoActivityIndicator()
                    : CupertinoButton(
                  color: CupertinoColors.activeOrange,
                  child: const Text("강아지 등록"),
                  onPressed: _registerDog,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenderButton(String label, int value) {
    return Expanded(
      child: CupertinoButton(
        color: _selectedGender == value ? Colors.orange : Colors.grey,
        onPressed: () => setState(() {
          _selectedGender = value;
        }),
        child: Text(label),
      ),
    );
  }

  Widget _buildStatusButton(String label, int value, int groupValue, ValueChanged<int> onChanged) {
    return Expanded(
      child: CupertinoButton(
        color: groupValue == value ? Colors.orange : Colors.grey,
        onPressed: () => onChanged(value),
        child: Text(label),
      ),
    );
  }
}

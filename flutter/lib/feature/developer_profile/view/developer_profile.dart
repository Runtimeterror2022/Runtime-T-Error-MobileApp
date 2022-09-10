import 'package:flutter/material.dart';
import 'package:mvc_bolierplate_getx/core/constants/app_text_style.dart';
import 'package:mvc_bolierplate_getx/core/constants/color_palette.dart';
import 'package:mvc_bolierplate_getx/core/reponsive/SizeConfig.dart';

class DeveloperProfileScreen extends StatefulWidget {
  String name;
  String techStack;
  String experience;
  DeveloperProfileScreen(this.name, this.techStack, this.experience, {Key? key})
      : super(key: key);

  @override
  State<DeveloperProfileScreen> createState() => _DeveloperProfileScreenState();
}

class _DeveloperProfileScreenState extends State<DeveloperProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Profile',
          style: AppTextStyle.titleBlackMedium18,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30 * SizeConfig.heightMultiplier!,
              ),
              Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 82,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 80,
                    child: randomAvatar(DateTime.now().toIso8601String()),
                  ),
                ),
              ),
              SizedBox(
                height: 20 * SizeConfig.heightMultiplier!,
              ),
              Center(
                child: Text(
                  widget.name,
                  style: const TextStyle(
                      color: AppColors.ksecondary,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 12 * SizeConfig.heightMultiplier!,
              ),
              Center(
                child: Text(
                  widget.techStack,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  '${widget.experience} years of experience',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Divider(
                  color: AppColors.kgrey300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _title('Date of joining'),
                    _subtitle('01/09/1999'),
                    const SizedBox(height: 15),
                    _title('Client'),
                    const SizedBox(height: 1),
                    _subtitle('Victor , Bodnarasec'),
                    const SizedBox(height: 15),
                    _title('Induction'),
                    _subtitle('Done'),
                    const SizedBox(height: 15),
                    _title('Comments'),
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 30,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _subtitle(String subtitle) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 21,
      child: Text(
        subtitle,
        style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 14,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}

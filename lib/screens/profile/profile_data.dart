import 'package:cached_network_image/cached_network_image.dart';
import 'package:flora/elements/colors.dart';
import 'package:flora/screens/profile/edit_profile.dart';
import 'package:flutter/material.dart';

class MyProfileData extends StatefulWidget {
  final Map profile;
  const MyProfileData({super.key, required this.profile});

  @override
  State<MyProfileData> createState() => _MyProfileDataState();
}

class _MyProfileDataState extends State<MyProfileData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Constants.grad1Color(),
                  Constants.grad2Color(),
                ],
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        const Text(
                          "الملف الشخصي",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  EditProfileScreen(
                                  profile: widget.profile,
                                ),
                              ),
                            );
                          },
                          child: Image.asset(
                            "assets/images/edit.png",
                            height: 24,
                            width: 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(300.0),
                      child: CachedNetworkImage(
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                        imageUrl: widget.profile['pic']??"",
                        // color: Colors.black12,
                        // colorBlendMode: BlendMode.softLight,
                        placeholder: (context, url) => Image.asset(
                          'assets/images/loading.gif',
                          fit: BoxFit.fill,
                          height: 100,
                          width: 100,
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          'assets/images/loading.gif',
                          fit: BoxFit.fill,
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   Text(
                    widget.profile['username'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          profileDataModel("أسم المستخدم", widget.profile['username']),
          profileDataModel("البريد الإلكتروني", widget.profile['email']),
          profileDataModel("كلمة المرور", "***********"),
          profileDataModel("رقم الجوال",  widget.profile['mobile']),
        ],
      ),
    );
  }

  profileDataModel(txt, sub) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      txt,
                      style: TextStyle(
                        color: Constants.secondaryColor(),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      sub,
                      style: TextStyle(
                        color: Constants.secondaryColor(),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios,color: Constants.primaryColor(),),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 1,
          color: Constants.secondaryColor().withOpacity(.5),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

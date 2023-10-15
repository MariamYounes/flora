import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../elements/colors.dart';
import '../../elements/text_area.dart';
import '../bottom_bar_screen/pages.dart';

class EditProfileScreen extends StatefulWidget {
  final Map profile;
  const EditProfileScreen({super.key, required this.profile});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  fetchController(){
    nameController.text = widget.profile['username'];
    emailController.text = widget.profile['email'];
    phoneController.text = widget.profile['mobile'];
  }

  @override
  void initState() {
    fetchController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                                  builder: (context) => PagesTestWidget(),
                                ),
                              );
                            },
                            child: const Text(
                              "حفظ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
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
                      widget.profile['username']??"",
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
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 20),
                      child: Column(
                        children: [
                          addressAddElement(context, "اسم المستخدم",
                              nameController, "الأسم", TextInputType.text),
                          addressAddElement(
                              context,
                              "البريد الإلكتروني",
                              emailController,
                              "البريد الإلكتروني",
                              TextInputType.emailAddress),
                          addressAddElement(
                              context,
                              "رقم الجوال",
                              phoneController,
                              "رقم الجوال",
                              TextInputType.phone,
                              maxLength: 11),
                        ],
                      ),
                    ),
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

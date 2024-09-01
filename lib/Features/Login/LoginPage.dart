import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:get/get.dart';
import 'package:jatitrans_app/Core/Utils/ImagesConstant.dart';
import 'package:jatitrans_app/Core/Utils/VColor.dart';
import 'package:jatitrans_app/Features/Login/Controller/LoginPageController.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(LoginPageController());
    return BaseWidgetContainer(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  ImagesConstant.appIcon,
                  width: 90,
                  height: 90,
                ),
                const SizedBox(
                  height: 10,
                ),
                const CText(
                  text: 'Welcome to JATITRANS',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CText(
                      text: 'Email',
                      fontWeight: FontWeight.bold,
                    ),
                    CTextInput(
                      textController: _controller.emailController,
                      labelInput: "Email",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CText(
                      text: 'Password',
                      fontWeight: FontWeight.bold,
                    ),
                    Obx(
                      () => CTextInput(
                        textController: _controller.passwordController,
                        obscureText: _controller.obsecurePassword.value,
                        labelInput: "Password",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        maxLines: 1,
                        suffixIcon: InkWell(
                          onTap: () {
                            _controller.changeObsecure();
                          },
                          child: _controller.obsecurePassword.value
                              ? const Icon(
                                  Icons.remove_red_eye_outlined,
                                )
                              : const Icon(
                                  Icons.remove_red_eye,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => CustomButton(
                    onPressed: () {
                      _controller.doLogin(context);
                    },
                    enableButton: _controller.enableButton.value,
                    titleButton: "Login",
                    backgroundColors: VColor.primaryColors,
                    backgroundDisableColors:
                        VColor.primaryColors.withOpacity(0.4),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Row(
                //   // crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const CText(
                //       text: 'Belum punya akun? ',
                //       fontSize: 13,
                //       fontWeight: FontWeight.w400,
                //     ),
                //     InkWell(
                //       onTap: () {},
                //       child: const CText(
                //         text: "Sign Up",
                //         fontSize: 13,
                //         fontWeight: FontWeight.w900,
                //         decoration: TextDecoration.underline,
                //       ),
                //     )
                //   ],
                // ),
              ],
            ),
          ),
          Obx(
            () => _controller.isLoading.value
                ? const DefaultScreenLoading()
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}

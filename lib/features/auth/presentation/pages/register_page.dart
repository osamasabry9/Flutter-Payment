import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/color_manager.dart';
import 'package:payment_app/core/utils/strings_manager.dart';
import 'package:payment_app/core/widgets/default_button.dart';
import 'package:payment_app/core/widgets/default_textformfiled.dart';

import '../../../../core/utils/assets_manager.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paymentt Integration"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.35,
                child: Image.asset(ImageAssets.Dlivery),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: DefaultTextFormFiled(
                            controller: firstNameController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return ' ${AppStrings.firstname} must be filled';
                              }
                              return null;
                            },
                            hintText: AppStrings.firstname,
                            prefix: Icons.person,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: DefaultTextFormFiled(
                            controller: lastNameController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return ' ${AppStrings.lastname} must be filled';
                              }
                              return null;
                            },
                            hintText: AppStrings.lastname,
                            prefix: Icons.person,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DefaultTextFormFiled(
                      controller: emailController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return ' ${AppStrings.emailHint} must be filled';
                        }
                        return null;
                      },
                      hintText: AppStrings.emailHint,
                      prefix: Icons.email,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DefaultTextFormFiled(
                      controller: phoneController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return ' ${AppStrings.phone} must be filled';
                        }
                        return null;
                      },
                      hintText: AppStrings.phone,
                      prefix: Icons.phone,
                      type: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DefaultTextFormFiled(
                      controller: priceController,
                      type: TextInputType.number,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return ' ${AppStrings.price} must be filled';
                        }
                        return null;
                      },
                      hintText: AppStrings.price,
                      prefix: Icons.price_change,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    DefaultButton(
                      buttonWidget: const Text(
                        AppStrings.register,
                        style: TextStyle(
                          color: ColorManager.white,
                          fontSize: 18,
                          letterSpacing: 1.7,
                        ),
                      ),
                      function: () {
                        if (formKey.currentState!.validate()) {
                          print("No Data");
                        }
                      },
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
}

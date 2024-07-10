import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_launcher/controllers/application_controller.dart';
import 'package:widget_launcher/widgets/android/common/form_fields/button/android_text_button_widget.dart';
import 'package:widget_launcher/widgets/android/common/form_fields/text_field/android_floating_tax_field_widget.dart';

class AndroidDrawerFormWidget extends StatefulWidget {
  const AndroidDrawerFormWidget({super.key});

  @override
  State<AndroidDrawerFormWidget> createState() =>
      _AndroidDrawerFormWidgetState();
}

class _AndroidDrawerFormWidgetState extends State<AndroidDrawerFormWidget> {
  TextEditingController drawerNameTextEditingController =
      TextEditingController();
  final ApplicationController applicationController =
      Get.put(ApplicationController());

  @override
  void initState() {
    super.initState();
    applicationController.restDrawerFormForInsert();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApplicationController>(
      builder: (applicationControllerContext) {
        if (applicationControllerContext.isResetForm) {
          drawerNameTextEditingController.text = '';
        }

        return Container(
          margin: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              AndroidFloatingTextFieldWidget(
                controller: drawerNameTextEditingController,
                labelText: 'Add Drawer',
                errorMessage: 'Please enter valid drawer name',
                showError: applicationControllerContext.showDrawerNameError,
                onChange: (String value) {},
                onSubmitted: (String value) {},
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: AndroidTextButtonWidget(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    applicationController.addDrawer(
                      drawerNameTextEditingController.text.capitalize!,
                    );
                  },
                  buttonText: 'Save',
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        );
      },
    );
  }
}

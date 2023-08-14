import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/providers.dart';
import '../../widgets/button.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});
  static const String route = '/profile';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _emailController,
      _nameController,
      _phoneController,
      _bioController;

  String? get email => ref.read(emailProvider).when(
        data: (value) => value,
        error: (_, __) => '',
        loading: () => '',
      );

  @override
  void initState() {
    super.initState();
    // print(email);
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _bioController = TextEditingController();
    _emailController.text = email ?? '';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _trySubmit() {
    bool isValid = _formKey.currentState!.validate();
    if (!isValid) {
      null;
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    // final email = ref.watch(dbProvider).getEmail;
    // print(email);
    // _emailController.text = email;
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                Image.asset(
                  'assets/images/profile_view.png',
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20.h),
                ProfileTextField(
                  controller: _nameController,
                  label: 'Name',
                  // validator: ,
                ),
                SizedBox(height: 8.h),
                ProfileTextField(
                  controller: _emailController,
                  label: 'Email',
                ),
                SizedBox(height: 8.h),
                ProfileTextField(
                  controller: _phoneController,
                ),
                SizedBox(height: 16.h),
                ProfileTextField(
                  controller: _bioController,
                  label: 'Bio',
                  isBio: true,
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100.w),
                  child: AppElevatedButton(
                    onPressed: _trySubmit,
                    text: 'Update',
                    width: 158.w,
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    super.key,
    required this.controller,
    this.validator,
    this.label,
    this.isBio = false,
  });

  final TextEditingController controller;
  final FormFieldValidator? validator;
  final String? label;
  final bool isBio;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isBio ? 125.h : 68.h,
      padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 0),
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (label != null)
            Padding(
              padding: EdgeInsets.only(top: 8.h, bottom: 0),
              child: SizedBox(
                height: 14,
                child: Text(
                  label!,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Color(0xFFD9D9D9),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          SizedBox(
            height: 43,
            child: TextFormField(
              controller: controller,
              validator: validator,
              maxLength: isBio ? 150 : null,
              maxLines: isBio ? 5 : null,
              // expands: isBio,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

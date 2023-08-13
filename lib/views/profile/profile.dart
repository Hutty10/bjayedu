import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _bioController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
            children: [
              Image.asset(
                'assets/images/profile_view.png',
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Container(
                height: 53.h,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                alignment: AlignmentDirectional.centerStart,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration.collapsed(
                    hintText: 'hintText',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

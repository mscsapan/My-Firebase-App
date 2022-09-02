import 'package:flutter/material.dart';
import 'package:my_firebase/auth_provider/auth_provider.dart';
import 'package:my_firebase/views/user_input.dart';
import 'package:provider/provider.dart';

class UserRegistration extends StatelessWidget {
  UserRegistration({Key? key}) : super(key: key);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: true);
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)
            .copyWith(bottom: size.height * 0.05),
        alignment: Alignment.center,
        child: Consumer<AuthProvider>(
          builder: (context, AuthProvider auth, _) {
            bool active = context.read<AuthProvider>().isShow;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                UserInput(controller: _nameController, hintText: 'Name'),
                UserInput(controller: _emailController, hintText: 'Email'),
                UserInput(
                  controller: _passwordController,
                  hintText: 'Your Password',
                  suffixIcon: IconButton(
                    splashRadius: 24.0,
                    onPressed: () => auth.showPassword(),
                    icon: active == true
                        ? const Icon(Icons.visibility, color: Colors.grey)
                        : const Icon(Icons.visibility_off, color: Colors.grey),
                  ),
                  isObscure: !active,
                ),
                const SizedBox(height: 20.0),
                authProvider.loading == false
                    ? SizedBox(
                        width: size.width,
                        height: size.height * 0.07,
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                          onPressed: () {
                            authProvider.createAndStoreUser(
                                context,
                                _nameController.text,
                                _emailController.text,
                                _passwordController.text);
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      )
                    : const CircularProgressIndicator(),
              ],
            );
          },
        ),
      ),
    );
  }
}

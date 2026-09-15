import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_strings.dart';
import '../routes/app_routes.dart';

/// Login page.
///
/// StatefulWidget because we need to keep track of:
///  - the text the user types (using TextEditingController)
///  - whether the password is hidden or shown
///  - whether we are "loading" while the fake login runs
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // A key that lets us validate the Form below.
  final _formKey = GlobalKey<FormState>();

  // Controllers hold whatever the user types into a text field.
  final _emailController = TextEditingController(text: AppStrings.demoEmail);
  final _passwordController =
      TextEditingController(text: AppStrings.demoPassword);

  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    // Always dispose controllers when the page is removed, to avoid
    // memory leaks.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Runs when the user taps "Log In".
  Future<void> _handleLogin() async {
    // validate() runs every validator below and returns false if any
    // field is invalid.
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // Pretend we are calling a server. In a real app this is where
    // you would call your login API.
    await Future.delayed(const Duration(milliseconds: 700));

    if (!mounted) return;
    setState(() => _isLoading = false);

    // offNamed replaces the login page with the home page, so the
    // user can't go "back" to the login screen.
    Get.offNamed(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),

                // App icon
                const Icon(
                  Icons.restaurant_rounded,
                  color: Color.fromRGBO(108, 31, 4, 1),
                  size: 60,
                ),
                const SizedBox(height: 20),

                Text(
                  AppStrings.welcomeBack,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                const Text(
                  AppStrings.loginSubtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 32),

                // ---- Email field ----
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: AppStrings.emailLabel,
                    hintText: AppStrings.emailHint,
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.emailRequiredError;
                    }
                    if (!value.contains('@')) {
                      return AppStrings.emailInvalidError;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // ---- Password field ----
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: AppStrings.passwordLabel,
                    hintText: AppStrings.passwordHint,
                    prefixIcon: const Icon(Icons.lock_outline),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return AppStrings.passwordMinLengthError;
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(AppStrings.forgotPassword),
                  ),
                ),
                const SizedBox(height: 8),

                // ---- Log In button ----
                ElevatedButton(
                  onPressed: _isLoading ? null : _handleLogin,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color.fromRGBO(108, 31, 4, 1),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.4,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          AppStrings.logIn,
                          style: TextStyle(fontSize: 16),
                        ),
                ),
                const SizedBox(height: 16),

                // ---- Link to Signup page ----
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(AppStrings.noAccountPrompt,
                        style: TextStyle(color: Colors.black54)),
                    TextButton(
                      onPressed: () {
                        // Navigate to the signup page.
                        Get.toNamed(AppRoutes.signup);
                      },
                      child: const Text(AppStrings.signUp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

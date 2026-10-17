import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/welcome/welcome_components.dart';
import '../theme/welcome_colors.dart';
import '../utils/validators.dart';

class WelcomeBackLoginScreen extends StatefulWidget {
  const WelcomeBackLoginScreen({super.key});

  @override
  State<WelcomeBackLoginScreen> createState() => _WelcomeBackLoginScreenState();
}

class _WelcomeBackLoginScreenState extends State<WelcomeBackLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  /// 0 = Login, 1 = Sign Up.
  int _tab = 0;

  bool get _isLogin => _tab == 0;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showMessage(String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
    _showMessage(
      _isLogin
          ? 'Logged in as ${_emailController.text.trim()}'
          : 'Account created for ${_nameController.text.trim()}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: WelcomeColors.background,
        body: Stack(
          children: [
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 340,
              child: TopGlow(
                left: WelcomeColors.topLeft,
                right: WelcomeColors.topRight,
                background: WelcomeColors.background,
              ),
            ),
            SafeArea(
              bottom: false,
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: _buildContent(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 28, 20, 24),
            child: Column(
              children: [
                Text(
                  'Hello,\nWelcome Back!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 29,
                    fontWeight: FontWeight.w800,
                    height: 1.15,
                    letterSpacing: -0.6,
                    color: WelcomeColors.text,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Please enter your email and password details to access your account.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                    color: WelcomeColors.subtitle,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: _buildCard()),
        ],
      ),
    );
  }

  Widget _buildCard() {
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + bottomInset),
      decoration: const BoxDecoration(
        color: WelcomeColors.card,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AutofillGroup(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SegmentedToggle(
                  options: const ['Login', 'Sign Up'],
                  selected: _tab,
                  onChanged: (i) => setState(() => _tab = i),
                ),
                const SizedBox(height: 20),
                if (!_isLogin) ...[
                  PillField(
                    controller: _nameController,
                    icon: Icons.person_outline_rounded,
                    hint: 'Full Name',
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    autofillHints: const [AutofillHints.name],
                    validator: Validators.name,
                  ),
                  const SizedBox(height: 12),
                ],
                PillField(
                  controller: _emailController,
                  icon: Icons.mail_outline_rounded,
                  hint: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.email],
                  validator: Validators.email,
                ),
                const SizedBox(height: 12),
                PillPasswordField(
                  controller: _passwordController,
                  onSubmitted: (_) => _submit(),
                  validator: Validators.password,
                ),
                const SizedBox(height: 12),
                if (_isLogin)
                  Align(
                    alignment: Alignment.centerRight,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => _showMessage('Password reset coming soon'),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: WelcomeColors.text,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const Spacer(),
          const SizedBox(height: 24),
          MintButton(
            label: _isLogin ? 'Log Me In' : 'Sign Me Up',
            onTap: _submit,
          ),
        ],
      ),
    );
  }
}
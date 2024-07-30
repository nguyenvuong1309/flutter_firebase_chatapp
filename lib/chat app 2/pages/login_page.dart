import 'package:flutter/material.dart';
import '../widgets/custom_form_field.dart';
import '../consts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

	final GlobalKey<FormState> _loginFormkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerText(),
						_loginForm(),
            // Add other widgets here
          ],
        ),
      ),
    );
  }

  Widget _headerText() {
    return SizedBox(
      width: MediaQuery.of(context).size.width, // Sử dụng MediaQuery.of(context)
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome to LuxOasis",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
					Text(
						"Hello again, you've been missed",
						style: TextStyle(
							fontSize: 15,
							fontWeight: FontWeight.w500,
							color: Colors.grey,
						), 
					),
					Container(
						alignment: Alignment.center, 
						child: Image.asset(
							'assets/logo_LuxOasis.png',
							height: 80,
							width: 300,
							fit: BoxFit.contain,
						),
					), 
        ],
      ),
    );
  }
	 Widget _loginForm() {
    return Container(
      height:  MediaQuery.of(context).size.height * 0.40,
      margin: EdgeInsets.symmetric(
        vertical:  MediaQuery.of(context).size.height * 0.05,
      ), // EdgeInsets.symmetric
      child: Form(
				key: _loginFormkey,
        child: Column (
					mainAxisSize: MainAxisSize.max,
					mainAxisAlignment: MainAxisAlignment.spaceEvenly,
					crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomFormField(
							hintText:"Email",
							height: MediaQuery.of(context).size.height * 0.1,
							validationRegEx: EMAIL_VALIDATION_REGEX
							),
            CustomFormField(
							hintText:"Password",
							height: MediaQuery.of(context).size.height * 0.1,
							validationRegEx: PASSWORD_VALIDATION_REGEX,
							obscureText: true,
							),
						_loginButton(),
						_createAnAccountLink(),
          ]
        ),// Column
      ),// Form
    ); // Container
  }
	Widget _loginButton() {
		return SizedBox(
			width: MediaQuery.sizeOf(context).width,
			child: MaterialButton(
				onPressed: () {
					if (_loginFormkey.currentState?.validate() ?? false) {
						print("Wohooo");
					}
				},
				color: Color(0xFF2F7682),//Theme.of(context).colorScheme.primary,
				child: const Text("Login",style: TextStyle(
					color: Colors.white,
					), // TextStyle
				), // Text
			), // MaterialButton
    ); // SizedBox   
  }
	Widget _createAnAccountLink() {
  return Expanded(
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("Don't have an account? "),
        GestureDetector(
          onTap: () {
            // Handle navigation or function to sign up
            print('Navigate to sign up screen');
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Color(0xFF2F7682),//Colors.blue, // Make it look more like a link
            ),
          ),
        ),
      ],
    ),
  );
}
}

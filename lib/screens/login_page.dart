import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // using SystemUiOverlayStyle
import 'home.dart';
import 'sign_up_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShuttleGo',
      // Light theme settings
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Dark theme settings
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // system theme
      themeMode: ThemeMode.system,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // the theme data which adapts to the system theme.
    final ThemeData theme = Theme.of(context);

    // the status bar icons are visible in all themes
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
      statusBarIconBrightness: theme.brightness == Brightness.dark ? Brightness.light : Brightness.dark,
    ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('ShuttleGo Login'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20), // Space at the top
                // Logo
                Image(image: AssetImage('images/Shuttlego.png')),

                SizedBox(height: 15), // Space after logo



                // Email input field
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20), // Space between input fields

                // Password input field
                TextFormField(
                  obscureText: true, //  hide password input
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30), // Space before buttons

                // Login button
                ElevatedButton(
                  onPressed: () {
                    // redirect to home page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: const Text('Login'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 0, 13, 79), // background
                    onPrimary: Colors.white, // foreground
                    minimumSize: const Size(double.infinity, 50), // width and height
                  ),
                ),
                const SizedBox(height: 20), // Space between buttons

                // Social login section
                const Text(
                  'Or login with',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Login with Google button
                ElevatedButton.icon(
                  icon: const Icon(Icons.g_mobiledata),
                  label: const Text('Login with Google'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Background color for Google button
                    onPrimary: Colors.white, // Text color for Google button
                    minimumSize: const Size(double.infinity, 50), 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Space between buttons

                // Login with Apple button
                ElevatedButton.icon(
                  icon: const Icon(Icons.apple),
                  label: const Text('Login with Apple'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, 
                    onPrimary: Colors.white, 
                    minimumSize: const Size(double.infinity, 50), 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 30), // Space before the register link

                // Register link
                Center(
                  child: 
                   TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpPage()),
                        );
                      },
                      child: const Text('Don\'t have an account? Register'),
                    ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

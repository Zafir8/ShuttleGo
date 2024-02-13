import 'package:flutter/material.dart';
import 'home.dart'; 

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
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

                SizedBox(height: 25), // Space after logo


                // Username field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: const Icon(Icons.person),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                // Email field
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                // Password field
                TextFormField(
                  obscureText: true, //  hide password input
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                // Confirm Password field
                TextFormField(
                  obscureText: true, //  hide password input
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30),

                // Sign Up button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: const Text('Sign Up'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    primary: const Color.fromARGB(255, 0, 13, 79),
                    onPrimary: Colors.white,
                  ),
                ),

                // Link to go back to login page
                TextButton(
                  onPressed: () {
                    // Navigate back to login page
                    Navigator.pop(context);
                  },
                  child: const Text('Already have an account? Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

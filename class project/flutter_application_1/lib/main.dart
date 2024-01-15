import 'package:flutter/material.dart';
void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/profile': (context) => ProfilePage(),
      },
      title: "My App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}



class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String? errorMessage = '';
  Widget _errorMessage() {
    return Text(
      errorMessage == '' ? '' : 'Umm! $errorMessage.',
      style: TextStyle(
        color: Colors.red[400],
      ),
    );
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
late var c;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.email_outlined),
                    labelText: "Enter Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    )),
                controller: emailController,
                // ... (other properties)
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.password_outlined),
                    labelText: "Enter Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    )),
                controller: passwordController,
                // ... (other properties)
              ),

              SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Create a RegistrationData instance with the entered values

                

                    // Now you can use the registrationData object as needed
                    _handleSignUp();
                  }
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSignUp() {
  }
}
var photourl="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYM-EGcVo86EANXlbWe33sG8GzYd9M6qj6wvNR9RGrQofR2Kmkx4gqgB7ivNShaXYIw60&usqp=CAU";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? errorMessage = '';
  Widget _errorMessage() {
    return Text(
      errorMessage == '' ? '' : 'Umm! $errorMessage.',
      style: TextStyle(
        color: Colors.red[400],
      ),
    );
  }

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], //
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Mobi Store"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                    photourl),
              ),
              // Replace with your image path
              const SizedBox(height: 20.0),
              const Text('Welcome!', style: TextStyle(fontSize: 18.0)),
              TextFormField(
                controller: _controllerEmail,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _controllerPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                obscureText: true,
              ),
              const SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {
                  // Implement your forget password logic
                },
                child: GestureDetector(
                  onTap: () {
                   
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        'A password reset email has been sent to your email address.',
                      ),
                    ));
                  },
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Text('Forget Password', textAlign: TextAlign.left),
                  ),
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              _errorMessage(),

              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _handleSignin();
                  }
                },
                child: const Text('Sign In'),
              ),
              const SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {
                      Navigator.pushNamed(context, '/signup');

                },
                child: const Text('Don\'t have an account? Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSignin() {

    
  }
}

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        backgroundColor: Colors.grey[100], //
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Profile Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [

              SizedBox(height: 16),
              Text(
                "Email: email",
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 8, 255)),
              ),
              SizedBox(height: 16),
              
             //_signOutButton(),
            ],
          ),
        ),
      
    );
  }
}



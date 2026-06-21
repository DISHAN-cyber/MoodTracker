import 'package:flutter/material.dart';
import 'package:mood_tracker/pages/home_page.dart';

class WelcomePage extends StatefulWidget {
  static const routeName = '/';

  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18181B),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                const Text(
                  'How are you',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'feeling today?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 26),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _moodButton('Joyful', false),
                      _moodButton('Cheerful', true),
                      _moodButton('Content', false),
                      _moodButton('Content', false),
                    ],
                  ),
                ),
                const SizedBox(height: 26),
                const Text(
                  'Swipe to Learn More',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.72,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'assets/images/cat1.png',
                          fit: BoxFit.cover,
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color.fromRGBO(0, 0, 0, 0.05),
                                  const Color.fromRGBO(0, 0, 0, 0.70),
                                ],
                                stops: const [0.4, 1.0],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 36,
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 100,
                              height: 36,
                              decoration: BoxDecoration(
                                color: const Color(0xFF18181B),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(24),
                                  bottomRight: Radius.circular(24),
                                ),
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              width: 60,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Colors.white30,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          right: 20,
                          bottom: 24,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFACC15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  minimumSize: const Size.fromHeight(54),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    MyHomePage.routeName,
                                  );
                                },
                                child: const Text(
                                  'Get Started',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              RichText(
                                text: const TextSpan(
                                  text: 'Already have an account? ',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Login',
                                      style: TextStyle(
                                        color: Color(0xFFFACC15),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _moodButton(String label, bool active) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Container(
        decoration: BoxDecoration(
          gradient: active
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFF3D217), Color(0xFFFF30F1)],
                )
              : null,
          color: active ? null : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: active ? Colors.transparent : Colors.white54,
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Text(
          label,
          style: TextStyle(
            color: active ? Colors.black : Colors.white70,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

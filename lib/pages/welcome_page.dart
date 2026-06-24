import 'package:flutter/material.dart';
import 'package:mood_tracker/pages/home_page.dart';

class WelcomePage extends StatefulWidget {
  static const routeName = '/';

  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _selectedMoodIndex = 1;
  final List<String> _moods = ['Joyful', 'Cheerful', 'Content', 'Calm'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18181B),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 14),
                  const Text(
                    'How are you',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'feeling today?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      _moods.length,
                      (index) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: _moodButton(
                            _moods[index],
                            index == _selectedMoodIndex,
                            () => setState(() => _selectedMoodIndex = index),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Swipe to Learn More',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(39),
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
                              const Color.fromRGBO(0, 0, 0, 0.15),
                              const Color.fromRGBO(0, 0, 0, 0.8),
                            ],
                            stops: const [0.2, 1.0],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -5,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 76,
                          height: 20,
                          decoration: BoxDecoration(
                            color: const Color(0xFF18181B),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Container(
                              width: 48,
                              height: 1,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 24,
                      right: 24,
                      bottom: 28,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 54,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFACC15),
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  HomeScreen.routeName,
                                );
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28),
                                ),
                              ),
                              child: const Text(
                                'Get Started',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
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
          ],
        ),
      ),
    );
  }

  Widget _moodButton(String label, bool active, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 38, minWidth: 0),
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
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: active ? Colors.black : Colors.white70,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
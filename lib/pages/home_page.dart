import 'package:flutter/material.dart';
import 'package:mood_tracker/pages/WelcomePage.dart';
import 'package:mood_tracker/pages/mood_selection_page.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/home';

  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121214),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121214),
        elevation: 0,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        leadingWidth: 64,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.pushNamed(
                context,
                WelcomePage.routeName,
              );
            },
            child: Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: const Color(0xFF2D2F38),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.arrow_back_ios_new,
                  color: Colors.white, size: 18),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MoodSelectionPage.routeName,
                );
              },
              child: Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: const Color(0xFF2D2F38),
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 4, 18, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Good Morning Milni!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Start your\n day here!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 24),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'For Good Mornings',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildActivityCard(
                        title: 'New Day,\nFresh Start',
                        subtitle: '7.32am',
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFF30F1), Color(0xFFF3D217)],
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildActivityCard(
                        title: 'New Day,\nFresh Start',
                        subtitle: '7.32am',
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFF30F1), Color(0xFFF3D217)],
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildActivityCard(
                        title: 'New Day,\nFresh Start',
                        subtitle: '7.32am',
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFF30F1), Color(0xFFF3D217)],
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'For Afternoon Shift',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      _buildActivityCard(
                        title: 'Recharge',
                        subtitle: '7.32am',
                        gradient: const LinearGradient(
                          colors: [Color(0xFF3DD1FF), Color(0xFF9EDE4C)],
                        ),
                        iconColor: const Color(0xFF3DD1FF),
                      ),
                      const SizedBox(height: 12),
                      _buildActivityCard(
                        title: 'keep Calm',
                        subtitle: '7.32am',
                        gradient: const LinearGradient(
                          colors: [Color(0xFF3DD1FF), Color(0xFF9EDE4C)],
                        ),
                        iconColor: const Color(0xFF3DD1FF),
                      ),
                      const SizedBox(height: 12),
                      _buildActivityCard(
                        title: 'Stay Focused',
                        subtitle: '7.32am',
                        gradient: const LinearGradient(
                          colors: [Color(0xFF3DD1FF), Color(0xFF9EDE4C)],
                        ),
                        iconColor: const Color(0xFF3DD1FF),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1F24),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _NavIcon(icon: Icons.home, active: true),
            _NavIcon(icon: Icons.search),
            _NavIcon(icon: Icons.calendar_today),
            _NavIcon(icon: Icons.person),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityCard({
    required String title,
    required String subtitle,
    required Gradient gradient,
    Color iconColor = const Color(0xFFFACC15),
  }) {
    return Container(
      constraints: const BoxConstraints(minHeight: 76),
      decoration: BoxDecoration(
        color: const Color(0xFF2D2F38),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 128,
            height: 52,
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFFACC15),
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.play_arrow,
              color: Colors.black,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({super.key, required this.icon, this.active = false});

  final IconData icon;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: active ? const Color(0xFF2D2F38) : Colors.transparent,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Icon(
        icon,
        color: active ? Colors.white : Colors.white54,
        semanticLabel: '',
      ),
    );
  }
}

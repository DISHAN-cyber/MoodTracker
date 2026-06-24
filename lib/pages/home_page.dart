import 'package:flutter/material.dart';
import 'package:mood_tracker/pages/mood_selection_page.dart';

class TaskItem {
  final String title;
  final String time;
  final List<Color> gradientColors;
  final Color buttonColor;
  const TaskItem({
    required this.title,
    required this.time,
    required this.gradientColors,
    required this.buttonColor,
  });
}

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const morningTasks = [
    TaskItem(
      title: 'New Day,\nFresh Start',
      time: '1:10am',
      gradientColors: [Color(0xFFF5A623), Color(0xFFE91E8C)],
      buttonColor: Color(0xFFFFD600),
    ),
    TaskItem(
      title: 'New Day,\nFresh Start',
      time: '1:10am',
      gradientColors: [Color(0xFFF5A623), Color(0xFFE91E8C)],
      buttonColor: Color(0xFFFFD600),
    ),
    TaskItem(
      title: 'New Day,\nFresh Start',
      time: '1:25am',
      gradientColors: [Color(0xFFF5A623), Color(0xFFE91E8C)],
      buttonColor: Color(0xFFFFD600),
    ),
  ];

  static const afternoonTasks = [
    TaskItem(
      title: 'Recharge',
      time: '7:30am',
      gradientColors: [Color(0xFFCDFF47), Color(0xFF00D4E0)],
      buttonColor: Color(0xFF00BFFF),
    ),
    TaskItem(
      title: 'keep Calm',
      time: '11:30am',
      gradientColors: [Color(0xFFCDFF47), Color(0xFF00D4E0)],
      buttonColor: Color(0xFF00BFFF),
    ),
    TaskItem(
      title: 'Stay\nFocused',
      time: '1:32pm',
      gradientColors: [Color(0xFFCDFF47), Color(0xFF00D4E0)],
      buttonColor: Color(0xFF00BFFF),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: Column(
          children: [
            // ── Scrollable content fills available space ──────────────────
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 14),

                        // Greeting
                        Center(
                          child: Text(
                            'Good Morning Milni!',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.55),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),

                        // Hero headline
                        const Center(
                          child: Text(
                            'Start your\nday here!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              height: 1.15,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Morning section
                        _sectionLabel('For Good Mornings'),
                        const SizedBox(height: 8),
                        ...morningTasks
                            .map((t) => _TaskCard(task: t, compact: true)),

                        const SizedBox(height: 12),

                        // Afternoon section
                        _sectionLabel('For Afternoon Shift'),
                        const SizedBox(height: 8),
                        ...afternoonTasks
                            .map((t) => _TaskCard(task: t, compact: true)),

                        const Spacer(),
                      ],
                    ),
                  );
                },
              ),
            ),

            // ── Bottom nav ────────────────────────────────────────────────
            _BottomNav(
              selectedIndex: _selectedIndex,
              onTap: (i) {
                if (i == 2) {
                  Navigator.pushNamed(context, MoodSelectionPage.routeName);
                  return;
                }
                setState(() => _selectedIndex = i);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionLabel(String label) => Text(
        label,
        style: TextStyle(
          color: Colors.white.withOpacity(0.4),
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      );
}

// ── Task Card ─────────────────────────────────────────────────────────────────

class _TaskCard extends StatelessWidget {
  final TaskItem task;
  final bool compact;
  const _TaskCard({required this.task, this.compact = false});

  @override
  Widget build(BuildContext context) {
    final cardHeight = 68.0;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 5.0,
              height: cardHeight,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(0.5),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: cardHeight,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 84, 84, 87),
                borderRadius: BorderRadius.circular(20),
                border:
                    Border.all(color: Colors.white.withOpacity(0.08), width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    // Text
                    SizedBox(
                      width: 110,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            task.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            task.time,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.38),
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 16),

                    // Gradient bar
                    Expanded(
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: task.gradientColors,
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Play button outside the gray card with yellow outer box and white inner shape
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 68,
              height: 68,
              decoration: BoxDecoration(
                color: task.buttonColor,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Icon(Icons.play_arrow_rounded,
                      color: task.buttonColor, size: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Bottom Navigation ─────────────────────────────────────────────────────────

class _BottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;
  const _BottomNav({required this.selectedIndex, required this.onTap});

  static const _icons = [
    Icons.home_rounded,
    Icons.search_rounded,
    Icons.calendar_today_rounded,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 8, 20, 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 83, 83, 85),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.08), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < _icons.length; i++) ...[
            if (i != 0) const SizedBox(width: 6),
            GestureDetector(
              onTap: () => onTap(i),
              behavior: HitTestBehavior.opaque,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: i == selectedIndex
                      ? const Color(0xFF3C3F48)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white
                        .withOpacity(i == selectedIndex ? 0.08 : 0.18),
                    width: 1,
                  ),
                ),
                child: Icon(
                  _icons[i],
                  color: i == selectedIndex ? Colors.white : Colors.white54,
                  size: 14,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

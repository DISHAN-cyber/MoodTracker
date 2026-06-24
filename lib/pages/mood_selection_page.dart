import 'package:flutter/material.dart';

class MoodSelectionPage extends StatefulWidget {
  static const routeName = '/mood-selection';

  const MoodSelectionPage({super.key});

  @override
  State<MoodSelectionPage> createState() => _MoodSelectionPageState();
}

class _MoodSelectionPageState extends State<MoodSelectionPage> {
  final List<String> _moods = ['Joyful', 'Cheerful', 'Content', 'Calm'];
  int _selectedMoodIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18181B),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxHeight = constraints.maxHeight;
            const bottomNavHeight = 88.0;
            final availableContentHeight = maxHeight - bottomNavHeight;
            final imageHeight = availableContentHeight * 0.60;
            final barsHeight = availableContentHeight * 0.12;
            final contentSpacing = 10.0;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: imageHeight.clamp(280.0, 430.0),
                  child: _buildHeaderImage(context),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18, 16, 18, 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: contentSpacing + 18),
                        const Text(
                          'Select your\ntoday’s mood',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            height: 1.05,
                          ),
                        ),
                        SizedBox(height: contentSpacing + 8),
                        SizedBox(
                          height: barsHeight.clamp(90.0, 120.0),
                          child: _buildMoodBars(),
                        ),
                        const SizedBox(height: 10),
                        _buildMoodOptions(),
                        const SizedBox(height: 2),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50, child: _buildBottomNav()),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeaderImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/cat2.png',
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: const Color(0xFF2F2F35),
                alignment: Alignment.center,
                child: const Text(
                  'Image not found',
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.05),
                  Colors.black.withOpacity(0.60),
                ],
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: _IconButton(
              icon: Icons.arrow_back_ios_new,
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Mood saved successfully')),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(color: Colors.black, width: 1.5),
                  color: Colors.transparent,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Color.fromARGB(255, 7, 7, 7),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoodOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_moods.length, (index) {
          final bool isSelected = index == _selectedMoodIndex;
          return Expanded(
            child: Padding(
              padding:
                  EdgeInsets.only(right: index == _moods.length - 1 ? 0 : 6),
              child: GestureDetector(
                onTap: () => setState(() => _selectedMoodIndex = index),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  decoration: BoxDecoration(
                    gradient: isSelected
                        ? const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF8C3BFF), Color(0xFFFF6BE0)],
                          )
                        : null,
                    color: isSelected ? null : const Color(0xFF1F1F24),
                    border: Border.all(
                      color: isSelected ? Colors.transparent : Colors.white24,
                      width: 1.2,
                    ),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Center(
                    child: Text(
                      _moods[index],
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.white70,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildMoodBars() {
    final List<double> heights = [
      0.25,
      0.35,
      0.45,
      0.55,
      0.65,
      1.0,
      0.95,
      0.90,
      0.55,
      0.48,
      0.30,
      0.25,
      0.45,
    ];

    return Center(
      child: GestureDetector(
        onTap: () => setState(
          () => _selectedMoodIndex = (_selectedMoodIndex + 1) % _moods.length,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(heights.length, (index) {
            final bool isCenter = index == heights.length ~/ 2;
            final double barHeight = 130 * heights[index];

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 11),
              width: 4,
              height: barHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: isCenter
                      ? const [Color(0xFFF3D217), Color(0xFFFF30F1)]
                      : const [Color(0xFF66686F), Color(0xFF3A3A40)],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    const icons = [
      Icons.home_rounded,
      Icons.search_rounded,
      Icons.calendar_today_rounded,
      Icons.person_rounded,
    ];

    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF222328),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white10, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < icons.length; i++) ...[
              if (i != 0) const SizedBox(width: 6),
              GestureDetector(
                onTap: () {},
                behavior: HitTestBehavior.opaque,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: i == 0
                        ? const Color(0xFF3C3F48)
                        : const Color(0xFF1A1A1F),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white.withOpacity(i == 0 ? 0.12 : 0.08),
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    icons[i],
                    color: i == 0 ? Colors.white : Colors.white54,
                    size: 14,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black, width: 1.2),
        ),
        child: Icon(
          icon,
          color: Colors.black,
          size: 18,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MoodSelectionPage extends StatefulWidget {
  static const routeName = '/mood-selection';

  const MoodSelectionPage({super.key});

  @override
  State<MoodSelectionPage> createState() => _MoodSelectionPageState();
}

class _MoodSelectionPageState extends State<MoodSelectionPage> {
  final List<String> _moods = [
    'Joyful',
    'Cheerful',
    'Content',
    'Calm',
  ];
  int _selectedMoodIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18181B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final maxHeight = constraints.maxHeight;
              final imageHeight = maxHeight * 0.44;
              final barsHeight = maxHeight * 0.18;
              final contentSpacing = 16.0;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: imageHeight.clamp(240.0, 360.0),
                    child: _buildHeaderImage(context),
                  ),
                  SizedBox(height: contentSpacing),
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
                  SizedBox(height: contentSpacing),
                  SizedBox(
                    height: barsHeight.clamp(120.0, 180.0),
                    child: _buildMoodBars(),
                  ),
                  SizedBox(height: contentSpacing),
                  _buildMoodOptions(),
                  const Spacer(),
                  _buildBottomNav(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderImage(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.05,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/cat2.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.red,
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
                    Colors.black.withValues(alpha: 0.05),
                    Colors.black.withValues(alpha: 0.60),
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
                    const SnackBar(
                      content: Text('Mood saved successfully'),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    border: Border.all(color: Colors.white60),
                    color: Colors.transparent,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoodOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(_moods.length, (index) {
          final bool isSelected = index == _selectedMoodIndex;
          return Expanded(
            child: Padding(
              padding:
                  EdgeInsets.only(right: index == _moods.length - 1 ? 0 : 10),
              child: GestureDetector(
                onTap: () => setState(() => _selectedMoodIndex = index),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    gradient: isSelected
                        ? const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF8C3BFF), Color(0xFFFF6BE0)],
                          )
                        : null,
                    color: isSelected ? null : const Color(0xFF222328),
                    border: Border.all(color: Colors.white70, width: 1.3),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      _moods[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.white,
                        fontSize: 14,
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
    final List<_BarConfig> bars = [
      _BarConfig(height: 40, width: 4, color: const Color(0xFF5B5D68)),
      _BarConfig(height: 58, width: 4, color: const Color(0xFF5B5D68)),
      _BarConfig(height: 80, width: 4, color: const Color(0xFF5B5D68)),
      _BarConfig(height: 100, width: 4, color: const Color(0xFF5B5D68)),
      _BarConfig(height: 122, width: 4, color: const Color(0xFF5B5D68)),
      _BarConfig(height: 144, width: 4, color: const Color(0xFF5B5D68)),
      _BarConfig(
        height: 168,
        width: 10,
        color: const Color(0xFFFF30F1),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF3D217), Color(0xFFFF30F1)],
        ),
      ),
      _BarConfig(height: 144, width: 4, color: const Color(0xFF5B5D68)),
      _BarConfig(height: 122, width: 4, color: const Color(0xFF5B5D68)),
      _BarConfig(height: 100, width: 4, color: const Color(0xFF5B5D68)),
      _BarConfig(height: 80, width: 4, color: const Color(0xFF5B5D68)),
      _BarConfig(height: 58, width: 4, color: const Color(0xFF5B5D68)),
      _BarConfig(height: 40, width: 4, color: const Color(0xFF5B5D68)),
    ];

    return SizedBox(
      height: 180,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: bars.asMap().entries.map((entry) {
              final bar = entry.value;
              final isLast = entry.key == bars.length - 1;
              return Container(
                margin: EdgeInsets.only(right: isLast ? 0 : 12),
                width: bar.width,
                height: bar.height,
                decoration: BoxDecoration(
                  color: bar.gradient == null ? bar.color : null,
                  gradient: bar.gradient,
                  borderRadius: BorderRadius.circular(bar.width / 2),
                ),
              );
            }).toList(),
          ),
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

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 67, 66, 66),
        borderRadius: BorderRadius.circular(34),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(icons.length, (i) {
          final selected = i == 0;
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: selected
                    ? const Color.fromARGB(255, 90, 90, 90)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withOpacity(selected ? 0.08 : 0.18),
                  width: 1,
                ),
              ),
              child: Icon(
                icons[i],
                color: selected ? Colors.white : Colors.white54,
                size: 20,
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _BarConfig {
  const _BarConfig({
    required this.height,
    required this.width,
    required this.color,
    this.gradient,
  });

  final double height;
  final double width;
  final Color color;
  final Gradient? gradient;
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({required this.icon, this.label, this.active = false});

  final IconData icon;
  final String? label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: active ? const Color(0xFF2D2F38) : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: active ? Colors.white : Colors.white54,
            size: 20,
          ),
        ),
        if (active && label != null) ...[
          const SizedBox(height: 6),
          Text(
            label!,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
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
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          color: const Color(0xFF2D2F38),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}

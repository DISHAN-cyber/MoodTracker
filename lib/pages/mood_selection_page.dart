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
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: _buildContent(context),
                ),
              ),
              const SizedBox(height: 12),
              _buildBottomNav(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 320,
          width: double.infinity,
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
                        Colors.black.withOpacity(0.10),
                        Colors.black.withOpacity(0.70),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _IconButton(
                        icon: Icons.arrow_back_ios_new,
                        onPressed: () => Navigator.pop(context),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Mood saved successfully')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          side: const BorderSide(color: Colors.white54),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 28),
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
        const SizedBox(height: 30),
        _buildMoodBars(),
        const SizedBox(height: 26),
        _buildMoodOptions(),
      ],
    );
  }

  Widget _buildMoodOptions() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_moods.length, (index) {
          final bool isSelected = index == _selectedMoodIndex;
          return Padding(
            padding:
                EdgeInsets.only(right: index == _moods.length - 1 ? 0 : 14),
            child: GestureDetector(
              onTap: () => setState(() {
                _selectedMoodIndex = index;
              }),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? null : Colors.transparent,
                  gradient: isSelected
                      ? const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFFB67EEC), Color(0xFFFF30F1)],
                        )
                      : null,
                  border: Border.all(color: Colors.white70, width: 1.3),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Text(
                  _moods[index],
                  style: TextStyle(
                    color: isSelected ? Colors.black : Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
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
      _BarConfig(height: 42, width: 4, color: const Color(0xFF5B5D68)),
      _BarConfig(height: 62, width: 4, color: const Color(0xFF5B5D68)),
      _BarConfig(height: 84, width: 4, color: const Color(0xFF5B5D68)),
      _BarConfig(height: 108, width: 4, color: const Color(0xFF5B5D68)),
      _BarConfig(height: 134, width: 4, color: const Color(0xFF5B5D68)),
      _BarConfig(height: 156, width: 4, color: const Color(0xFF5B5D68)),
      _BarConfig(
        height: 176,
        width: 10,
        color: const Color(0xFFFF30F1),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF3D217), Color(0xFFFF30F1)],
        ),
      ),
      _BarConfig(height: 156, width: 4, color: const Color(0xFF5B5D68)),
      _BarConfig(height: 134, width: 4, color: const Color(0xFF5B5D68)),
      _BarConfig(height: 108, width: 4, color: const Color(0xFF5B5D68)),
      _BarConfig(height: 84, width: 4, color: const Color(0xFF5B5D68)),
      _BarConfig(height: 62, width: 4, color: const Color(0xFF5B5D68)),
      _BarConfig(height: 42, width: 4, color: const Color(0xFF5B5D68)),
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
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1F24),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          _BottomNavItem(icon: Icons.home, label: 'Home', active: true),
          _BottomNavItem(icon: Icons.search),
          _BottomNavItem(icon: Icons.calendar_today),
          _BottomNavItem(icon: Icons.person),
        ],
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

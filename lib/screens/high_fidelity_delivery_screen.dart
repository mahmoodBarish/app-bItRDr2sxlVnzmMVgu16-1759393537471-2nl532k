import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class HighFidelityDeliveryScreen extends StatefulWidget {
  const HighFidelityDeliveryScreen({super.key});

  @override
  State<HighFidelityDeliveryScreen> createState() =>
      _HighFidelityDeliveryScreenState();
}

class _HighFidelityDeliveryScreenState
    extends State<HighFidelityDeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Stack(
          children: [
            // Map Background
            Positioned.fill(
              child: Image.asset(
                'assets/images/216_52.png',
                fit: BoxFit.cover,
              ),
            ),

            // Route Path
            Positioned.fill(
              child: CustomPaint(
                painter: RoutePainter(),
              ),
            ),

            // Map Markers
            Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
              left: MediaQuery.of(context).size.width * 0.35,
              child: const Icon(
                Icons.location_on,
                color: Color(0xFFC67C4E),
                size: 32,
              ),
            ),

            Positioned(
              top: MediaQuery.of(context).size.height * 0.38,
              right: MediaQuery.of(context).size.width * 0.1,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/I216_86_418_950.png',
                  width: 24,
                  height: 24,
                ),
              ),
            ),

            // Top Bar
            _buildTopBar(context),

            // Bottom Sheet
            _buildBottomSheet(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Positioned(
      top: 50,
      left: 24,
      right: 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconButton(
            icon: Icons.arrow_back_ios_new,
            onPressed: () => context.pop(),
          ),
          _buildIconButton(
            icon: Icons.gps_fixed,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(
      {required IconData icon, required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: const Color(0xFFEDEDED),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, size: 20, color: const Color(0xFF2F2D2C)),
      ),
    );
  }

  Widget _buildBottomSheet() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.42,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Container(
                width: 45,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFFE3E3E3),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '10 minutes left',
                style: GoogleFonts.sora(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2F2D2C),
                ),
              ),
              const SizedBox(height: 2),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.sora(
                    fontSize: 12,
                    color: const Color(0xFF808080),
                  ),
                  children: const <TextSpan>[
                    TextSpan(text: 'Delivery to '),
                    TextSpan(
                      text: 'Jl. Kpg Sutoyo',
                      style: TextStyle(
                        color: Color(0xFF2A2A2A),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildProgressBar(),
              const SizedBox(height: 16),
              _buildDeliveryStatusCard(),
              const SizedBox(height: 16),
              _buildDriverInfoCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Row(
      children: [
        _buildProgressSegment(isCompleted: true),
        const SizedBox(width: 10),
        _buildProgressSegment(isCompleted: true),
        const SizedBox(width: 10),
        _buildProgressSegment(isCompleted: true),
        const SizedBox(width: 10),
        _buildProgressSegment(isCompleted: false),
      ],
    );
  }

  Widget _buildProgressSegment({required bool isCompleted}) {
    return Expanded(
      child: Container(
        height: 4,
        decoration: BoxDecoration(
          color: isCompleted ? const Color(0xFF36C07E) : const Color(0xFFE3E3E3),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildDeliveryStatusCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE3E3E3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE3E3E3)),
            ),
            child: Image.asset(
              'assets/images/I216_65_418_950.png',
              width: 32,
              height: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivered your order',
                  style: GoogleFonts.sora(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2F2D2C),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'We will deliver your goods to you in the shortest possible time.',
                  style: GoogleFonts.sora(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xFFA2A2A2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDriverInfoCard() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.asset(
            'assets/images/216_57.png',
            width: 56,
            height: 56,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Brooklyn Simmons',
              style: GoogleFonts.sora(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2F2D2C),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Personal Courier',
              style: GoogleFonts.sora(
                fontSize: 12,
                color: const Color(0xFFA2A2A2),
              ),
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE3E3E3)),
            ),
            child: const Icon(
              Icons.call_outlined,
              color: Color(0xFF2A2A2A),
            ),
          ),
        ),
      ],
    );
  }
}

class RoutePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFC67C4E)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(size.width * 0.4, size.height * 0.27);
    path.cubicTo(size.width * 0.6, size.height * 0.2, size.width * 0.8,
        size.height * 0.35, size.width * 0.85, size.height * 0.4);

    // Create a dashed path
    const dashWidth = 10.0;
    const dashSpace = 5.0;
    double distance = 0.0;

    for (var metric in path.computeMetrics()) {
      while (distance < metric.length) {
        canvas.drawPath(
          metric.extractPath(distance, distance + dashWidth),
          paint,
        );
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
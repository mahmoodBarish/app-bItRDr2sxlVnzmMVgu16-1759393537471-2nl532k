import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HighFidelityDetailItemScreen extends StatefulWidget {
  const HighFidelityDetailItemScreen({super.key});

  @override
  State<HighFidelityDetailItemScreen> createState() =>
      _HighFidelityDetailItemScreenState();
}

class _HighFidelityDetailItemScreenState
    extends State<HighFidelityDetailItemScreen> {
  String _selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 24),
              _buildProductImage(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProductInfo(),
                    const SizedBox(height: 20),
                    const Divider(color: Color(0xFFE2E2E2), height: 1),
                    const SizedBox(height: 20),
                    _buildDescription(),
                    const SizedBox(height: 20),
                    _buildSizeSelector(),
                  ],
                ),
              ),
              const SizedBox(height: 120), // Space for the bottom bar
            ],
          ),
        ),
      ),
      bottomSheet: _buildBottomBar(context),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF2F2D2C)),
            onPressed: () => context.pop(),
          ),
          Text(
            'Detail',
            style: GoogleFonts.sora(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2F2D2C),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Color(0xFF2F2D2C)),
            onPressed: () {
              // Handle favorite action
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.asset(
          'assets/images/I216_420_417_715.png',
          height: 226,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProductInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cappuccino',
          style: GoogleFonts.sora(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2F2D2C),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'with Chocolate',
          style: GoogleFonts.sora(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF9B9B9B),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.star, color: Color(0xFFFBBE21), size: 20),
                const SizedBox(width: 4),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.sora(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2F2D2C),
                    ),
                    children: [
                      const TextSpan(text: '4.8 '),
                      TextSpan(
                        text: '(230)',
                        style: GoogleFonts.sora(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF808080),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                _buildInfoIcon('assets/images/I216_65_418_950.png'),
                const SizedBox(width: 12),
                _buildInfoIcon('assets/images/I216_86_418_950.png'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoIcon(String assetPath) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Image.asset(
        assetPath,
        width: 24,
        height: 24,
        color: const Color(0xFFC67C4E),
      ),
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: GoogleFonts.sora(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2F2D2C),
          ),
        ),
        const SizedBox(height: 12),
        RichText(
          text: TextSpan(
            style: GoogleFonts.sora(
              fontSize: 14,
              color: const Color(0xFF9B9B9B),
              height: 1.5,
            ),
            children: [
              const TextSpan(
                text:
                    'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo... ',
              ),
              TextSpan(
                text: 'Read More',
                style: GoogleFonts.sora(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFC67C4E),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSizeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: GoogleFonts.sora(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2F2D2C),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSizeChip('S'),
            _buildSizeChip('M'),
            _buildSizeChip('L'),
          ],
        ),
      ],
    );
  }

  Widget _buildSizeChip(String size) {
    bool isSelected = _selectedSize == size;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedSize = size;
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFFFF5EE) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color:
                  isSelected ? const Color(0xFFC67C4E) : const Color(0xFFDEDEDE),
            ),
          ),
          child: Center(
            child: Text(
              size,
              style: GoogleFonts.sora(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: isSelected
                    ? const Color(0xFFC67C4E)
                    : const Color(0xFF2F2D2C),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      height: 121,
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: GoogleFonts.sora(
                  fontSize: 14,
                  color: const Color(0xFF9B9B9B),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '\$ 4.53',
                style: GoogleFonts.sora(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFC67C4E),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: SizedBox(
              height: 62,
              child: ElevatedButton(
                onPressed: () {
                  context.push('/order');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC67C4E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                ),
                child: Text(
                  'Buy Now',
                  style: GoogleFonts.sora(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
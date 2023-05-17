import 'package:flutter/material.dart';

class Share extends StatelessWidget {
  const Share({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 325,
      width: 309,
      margin: const EdgeInsets.only(left: 33, top: 244),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 0.5312, 1],
          colors: [
            Color.fromRGBO(187, 134, 252, 0.6),
            Color.fromRGBO(173, 87, 152, 0.797039),
            Color(0xFF2B265B),
          ],
        ),
        image: DecorationImage(
          image: const AssetImage('assets/background_image.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.2),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            height: 104,
            width: 104,
            left: 135,
            top: 286,
            child: Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/image.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
          Positioned(
            height: 16,
            width: 26,
            left: 74,
            top: 451,
            child: Container(
              color: Colors.white,
            ),
          ),
          Positioned(
            height: 20,
            width: 22,
            left: 178,
            top: 447,
            child: Container(
              color: Colors.white,
            ),
          ),
          Positioned(
            height: 20,
            width: 18,
            left: 279,
            top: 447,
            child: Container(
              color: Colors.white,
            ),
          ),
          const Positioned(
            height: 21,
            width: 108,
            left: 33,
            top: 480,
            child: Text('Text 1'),
          ),
          const Positioned(
            height: 21,
            width: 108,
            left: 133,
            top: 480,
            child: Text('Text 2'),
          ),
          const Positioned(
            height: 21,
            width: 108,
            left: 234,
            top: 480,
            child: Text('Text 3'),
          ),
          const Positioned(
            height: 21,
            width: 108,
            left: 33,
            top: 513,
            child: Text('0'),
          ),
          const Positioned(
            height: 21,
            width: 108,
            left: 133,
            top: 513,
            child: Text('0'),
          ),
          const Positioned(
            height: 21,
            width: 108,
            left: 234,
            top: 513,
            child: Text('0'),
          ),
          Positioned(
            height: 45,
            width: 300,
            left: 37,
            top: 729,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFBB86FC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/vector.png',
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Button',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

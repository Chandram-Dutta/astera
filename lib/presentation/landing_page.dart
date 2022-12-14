import 'package:astera/presentation/home_page.dart';
import 'package:astera/services/responsive.dart';
import 'package:flutter/material.dart';

class LanndingPage extends StatelessWidget {
  const LanndingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: AnimatedCrossFade(
              duration: const Duration(seconds: 1),
              firstChild: Image.asset(
                "assets/images/landing_page_mobile.jpg",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              secondChild: Image.asset(
                "assets/images/landing_page_desktop.jpg",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              crossFadeState: isDesktop(context, 600)
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: !isDesktop(context, 600)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: 'title',
                        child: Column(
                          children: [
                            Text(
                              "Astera",
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            Text(
                              "Locate asteroids near you",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) => HomePage(),
                              ),
                            );
                          },
                          child: const Text("GO!! 🚀🚀"),
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Hero(
                        tag: 'title',
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Astera",
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            Text(
                              "Locate asteroids near you.",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) => HomePage(),
                              ),
                            );
                          },
                          child: const Text("GO!! 🚀🚀"),
                        ),
                      )
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

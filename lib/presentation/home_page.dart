import 'package:astera/presentation/asteroid_data_page.dart';
import 'package:astera/services/get_asteroid_list.dart';
import 'package:astera/services/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  final todayDate = DateTime.now();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asteroidList = ref.watch(
      getAsteroidListProvider(
        todayDate,
        todayDate,
      ),
    );
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
          Positioned(
            top: 20,
            child: Hero(
              tag: 'title',
              child: Text(
                "Astera 🚀",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
          Positioned(
            top: 80,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  child: asteroidList.when(
                    data: (data) {
                      return Row(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height - 100,
                            width: isDesktop(context, 600)
                                ? MediaQuery.of(context).size.width * 0.5 - 18
                                : MediaQuery.of(context).size.width - 18,
                            child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    ref.read(indexProvider.notifier).state =
                                        index;

                                    if (!isDesktop(context, 600)) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Scaffold(
                                            appBar: AppBar(
                                              title:
                                                  const Text("Asteroid Data"),
                                            ),
                                            body: AsteroidDetailPage(
                                                asteroidList: data),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Card(
                                    color: data[index]
                                            .isPotentiallyHazardousAsteroid
                                        ? Theme.of(context)
                                            .colorScheme
                                            .error
                                            .withOpacity(
                                              index ==
                                                          ref.watch(
                                                              indexProvider) &&
                                                      isDesktop(context, 600)
                                                  ? 1
                                                  : 0.2,
                                            )
                                        : Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(
                                              index ==
                                                          ref.watch(
                                                              indexProvider) &&
                                                      isDesktop(context, 600)
                                                  ? 1
                                                  : 0.2,
                                            ),
                                    child: ListTile(
                                      title: Text(data[index].name),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: isDesktop(context, 600)
                                ? MediaQuery.of(context).size.width * 0.5
                                : 0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                child: Scaffold(
                                  body: AsteroidDetailPage(
                                    asteroidList: data,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    loading: () => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                          SizedBox(height: 20),
                          Text("Fetching the nearest asteroids to Earth"),
                        ],
                      ),
                    ),
                    error: (error, stack) => const Center(
                      child: Text('Error'),
                    ),
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

final indexProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

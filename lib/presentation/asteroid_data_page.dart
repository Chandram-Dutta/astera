import 'package:astera/models/asteroid_model.dart';
import 'package:astera/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsteroidDetailPage extends ConsumerWidget {
  const AsteroidDetailPage({
    required this.asteroidList,
    Key? key,
  }) : super(key: key);

  final List<Asteroid> asteroidList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          const Text("Name"),
          Text(
            asteroidList[ref.watch(indexProvider)].name,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const Divider(),
          const Text("ID"),
          Text(
            asteroidList[ref.watch(indexProvider)].id,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          const Text("H (absolute magnitude)"),
          Text(
            "${asteroidList[ref.watch(indexProvider)].absoluteMagnitudeH} au",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          const Text("Potentially Hazardous Asteroid"),
          asteroidList[ref.watch(indexProvider)].isPotentiallyHazardousAsteroid
              ? Container(
                  decoration: BoxDecoration(
                    color: Colors.red[900],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Yes"),
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    color: Colors.green[900],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("No"),
                  ),
                ),
          const SizedBox(height: 8),
          const Text("Sentry Object"),
          Text(
            asteroidList[ref.watch(indexProvider)].isSentryObject
                ? "Yes"
                : "No",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Divider(),
          const Text("Max Estimated Diameter"),
          Text(
            "${asteroidList[ref.watch(indexProvider)].estimatedDiameter.meters.estimatedDiameterMax} m",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          const Text("Min Estimated Diameter"),
          Text(
            "${asteroidList[ref.watch(indexProvider)].estimatedDiameter.meters.estimatedDiameterMin} m",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Divider(),
          ColumnBuilder(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            itemCount:
                asteroidList[ref.watch(indexProvider)].closeApproachData.length,
            itemBuilder: (context, index) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Close Approach Data ${index + 1}"),
                const Divider(),
                const Text("Close Approach Date"),
                Text(
                  asteroidList[ref.watch(indexProvider)]
                      .closeApproachData[index]
                      .closeApproachDate,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 8),
                const Text("Epoch Close Approach Date"),
                Text(
                  "${asteroidList[ref.watch(indexProvider)].closeApproachData[index].epochDateCloseApproach}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 8),
                const Text("Orbiting Body"),
                Text(
                  asteroidList[ref.watch(indexProvider)]
                      .closeApproachData[index]
                      .orbitingBody,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 8),
                const Text("Relative Velocity"),
                Text(
                  "${asteroidList[ref.watch(indexProvider)].closeApproachData[index].relativeVelocity.kilometersPerHour} km/h",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "${asteroidList[ref.watch(indexProvider)].closeApproachData[index].relativeVelocity.kilometersPerSecond} km/s",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "${asteroidList[ref.watch(indexProvider)].closeApproachData[index].relativeVelocity.milesPerHour} miles/h",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 8),
                const Text("Miss Distance"),
                Text(
                  "${asteroidList[ref.watch(indexProvider)].closeApproachData[index].missDistance.astronomical} au",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "${asteroidList[ref.watch(indexProvider)].closeApproachData[index].missDistance.kilometers} km",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "${asteroidList[ref.watch(indexProvider)].closeApproachData[index].missDistance.lunar} lunar",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "${asteroidList[ref.watch(indexProvider)].closeApproachData[index].missDistance.miles} miles",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ColumnBuilder extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection textDirection;
  final VerticalDirection verticalDirection;
  final int itemCount;

  const ColumnBuilder({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection = TextDirection.ltr,
    this.verticalDirection = VerticalDirection.down,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: List.generate(itemCount, (index) => itemBuilder(context, index))
          .toList(),
    );
  }
}

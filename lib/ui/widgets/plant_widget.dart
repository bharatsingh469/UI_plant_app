import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app_ui/constants.dart';
import 'package:plant_app_ui/models/plants.dart';
import 'package:plant_app_ui/ui/screens/detail_page.dart';

class PlantWidget extends StatelessWidget {
  const PlantWidget({
    super.key,
    required this.index, required this.plantList,
  });

  final index;
  final List<Plant> plantList;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
              child: DetailPage(
                plantId: plantList[index].plantId,
              ),
              type: PageTransitionType.bottomToTop),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Constants.primaryColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80.0,
        padding: const EdgeInsets.only(left: 10, top: 10),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.8),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                    bottom: 5,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 60,
                      child: Image.asset(plantList[index].imageURL),
                    )),
                Positioned(
                  bottom: 5,
                  left: 80,
                  child: Column(
                    children: [
                      Text(plantList[index].category),
                      Text(
                        plantList[index].plantName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Constants.blackColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                r'$' + plantList[index].price.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Constants.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} //

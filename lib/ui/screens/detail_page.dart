import 'package:flutter/material.dart';
import 'package:plant_app_ui/constants.dart';
import 'package:plant_app_ui/models/plants.dart';

class DetailPage extends StatefulWidget {
  final int plantId;
  const DetailPage({super.key, required this.plantId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //button to Toggle Favorite  button and unfavorite
  bool toggleIsFavorated(bool isFavorited) {
    return !isFavorited;
  }

  // toggle to cart and add to cart  button
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //plant model
    List<Plant> _plantList = Plant.plantList;
    return Scaffold(
      body: Stack(
        children: [
          //this for two icon on top created in left and right
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //for lesft icon
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Constants.primaryColor.withOpacity(.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                //for right icon
                GestureDetector(
                  onTap: () {
                    debugPrint('favorite');
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Constants.primaryColor.withOpacity(.15),
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          bool isFavorited = toggleIsFavorated(
                              _plantList[widget.plantId].isFavorated);
                          _plantList[widget.plantId].isFavorated = isFavorited;
                        });
                      },
                      icon: Icon(
                        _plantList[widget.plantId].isFavorated == true
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //
          Positioned(
              top: 100,
              left: 20,
              right: 20,
              child: Container(
                width: size.width * .8,
                height: size.height * .8,
                padding: const EdgeInsets.all(20),
                child: Stack(
                  children: [
                    Positioned(
                        top: 10,
                        right: 0,
                        left: 0,
                        child: SizedBox(
                          height: 350,
                          child:
                              Image.asset(_plantList[widget.plantId].imageURL),
                        )),
                    Positioned(
                        top: 10,
                        right: 0,
                        child: SizedBox(
                          height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PlantFeature(
                                title: 'Size',
                                plantFeature: _plantList[widget.plantId].size,
                              ),
                              PlantFeature(
                                title: 'Humidity',
                                plantFeature: _plantList[widget.plantId]
                                    .humidity
                                    .toString(),
                              ),
                              PlantFeature(
                                title: 'Temprature',
                                plantFeature:
                                    _plantList[widget.plantId].temperature,
                              )
                            ],
                          ),
                        )),
                    //bottom panel
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 80, left: 30, right: 30),
                          height: size.height * .5,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Constants.primaryColor.withOpacity(.4),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //for plant name
                                      Text(
                                        _plantList[widget.plantId].plantName,
                                        style: TextStyle(
                                          color: Constants.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      // plant rate
                                      Text(
                                        r'$' +
                                            _plantList[widget.plantId]
                                                .price
                                                .toString(),
                                        style: TextStyle(
                                          color: Constants.blackColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // this row for rating and star
                                  Row(
                                    children: [
                                      Text(
                                        _plantList[widget.plantId]
                                            .rating
                                            .toString(),
                                        style: TextStyle(
                                          color: Constants.primaryColor,
                                          fontSize: 30.0,
                                        ),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Constants.primaryColor,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Expanded(
                                child: Text(
                                  _plantList[widget.plantId].decription,
                                  style: TextStyle(
                                    height: 1.5,
                                    fontSize: 18,
                                    color: Constants.blackColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              )),
        ],
      ),
      //
      floatingActionButton: SizedBox(
        width: size.width * .9,
        height: 50,
        child: Row(
          children: [
            // for bottom shopping cart icon
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: _plantList[widget.plantId].isSelected == true ? Constants.primaryColor.withOpacity(.5) : Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Constants.primaryColor.withOpacity(.3),
                    ),
                  ]),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    bool isSelected =
                        toggleIsSelected(_plantList[widget.plantId].isSelected);
                    _plantList[widget.plantId].isSelected = isSelected;
                  });
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: _plantList[widget.plantId].isSelected == true ? Colors.white : Constants.primaryColor,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Constants.primaryColor.withOpacity(.3),
                    ),
                  ]),
              child: Center(
                child: Text(
                  'BUY NOW',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String plantFeature;
  final String title;
  const PlantFeature({
    super.key,
    required this.plantFeature,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Constants.blackColor),
        ),
        Text(
          plantFeature,
          style: TextStyle(
              color: Constants.primaryColor,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

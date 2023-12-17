import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../Controller/catagorycontroller.dart';
import '../../Controller/homecontroller.dart';
import '../Export/export.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Homecontroller homecontroller = Get.put(Homecontroller());
  Catagorycontroller catagorycontroller = Get.put(Catagorycontroller());
  TextEditingController pendingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // backgroundColor: Color(0xffE2D9FA).withOpacity(0.9),
            bottomNavigationBar: const Bottomnavigation(
              item: 0,
            ),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              // elevation:10,
              // backgroundColor: const Color(0xff00D6C7),
              automaticallyImplyLeading: false,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              leading: Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {},
                    child: const Image(
                      image: AssetImage("images/icon.png"),
                      width: 20,
                    ),
                  );
                },
              ),

              centerTitle: true,
              title: const Image(
                image: AssetImage("images/logo.png"),
                width: 150,
              ),
            ),
            body: Obx( (){
              if (catagorycontroller.catagoryResponseStatus.value) {
                return SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: TextField(
                            // cursorColor: Color(0xff293E6F),
                            //  textAlign: TextAlign.center,
                            controller: pendingController,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: const EdgeInsets.all(10.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: Color(0xffE2D9FA)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: Color(0xff572AC8)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                suffixIcon: pendingController.text.isEmpty
                                    ? IconButton(
                                        icon: const Icon(
                                          IconlyLight.search,
                                          color: Color(0xff0C1A30),
                                          size: 25.0,
                                        ),
                                        onPressed: () {
                                          homecontroller
                                                  .homescreenResponseStatus =
                                              false.obs;
                                          homecontroller.homescreen(
                                              "products/search?q=${pendingController.text}");
                                        },
                                      )
                                    : IconButton(
                                        icon: const Icon(
                                          IconlyLight.close_square,
                                          color: Color(0xff0C1A30),
                                          size: 30.0,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            pendingController.clear();
                                            homecontroller
                                                    .homescreenResponseStatus =
                                                false.obs;
                                            homecontroller.homescreen(
                                                "products/search?q=${pendingController.text}");
                                          });
                                        },
                                      ),
                                floatingLabelStyle: const TextStyle(
                                  color: Color(0xff293E6F),
                                  fontSize: 10,
                                ),
                                hintText: 'What do you want to buy today?',
                                hintStyle: TextStyle(color: Color(0xffC4C5C4))),
                            onChanged: (value) {
                              setState(() {
                                homecontroller.searchdata = value;
                                print(homecontroller.searchdata);
                              });
                              homecontroller.homescreenResponseStatus =
                                  false.obs;
                              homecontroller.homescreen(
                                  "products/search?q=${homecontroller.searchdata}");
                            }),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Select Catagory",
                            style: ThemeText.heading,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                  isExpanded: true,
                                  hint: const SizedBox(
                                    child: Text(
                                      'Select Catagory',
                                      style:
                                          TextStyle(color: Color(0xffC4C5C4)),
                                    ),
                                  ),
                                  items: catagorycontroller.catagorydata!
                                      .map<DropdownMenuItem<String>>((data) {
                                    return DropdownMenuItem<String>(
                                      child: Text(data,
                                          style: const TextStyle(
                                              fontSize: 14.0,
                                              fontStyle: FontStyle.normal,
                                              fontFamily: 'DM Sans')),
                                      value: data,
                                    );
                                  }).toList(),
                                  value: catagorycontroller.catagory,
                                  onChanged: (value) {
                                    setState(() {
                                      catagorycontroller.catagory = value;
                                      print(catagorycontroller.catagory);
                                    });
                                    homecontroller.homescreenResponseStatus =
                                        false.obs;
                                    homecontroller.homescreen(
                                        "products/category/${catagorycontroller.catagory}");
                                  },
                                  icon: const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      size: 20.0,
                                    ),
                                  ),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Color(0xffE2D9FA),
                                    ),
                                  ),
                                  buttonPadding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  buttonElevation: 0,
                                  // itemHeight: 40,
                                  dropdownMaxHeight: 200,
                                  dropdownElevation: 8,
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.topRight,
                                colors: [Color(0xff673400), Color(0xffB5651D)],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Title Text",
                                          style: ThemeText.content,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.80,
                                          child: Text(
                                              "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups",
                                              style: ThemeText.content1),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                 Obx(() {
                   if (homecontroller.homescreenResponseStatus.value) {
                     return (homecontroller
                         .homeproductData.value.products!.isNotEmpty)?GridView.count(
                       crossAxisCount: 2,
                       physics: const ScrollPhysics(),
                       crossAxisSpacing: 0.0,
                       mainAxisSpacing: 0.0,
                       shrinkWrap: true,
                       // childAspectRatio: 0.70,
                       childAspectRatio: 0.65,
                       children: List.generate(
                         homecontroller
                             .homeproductData.value.products!.length,
                             (index) {
                           return Padding(
                             padding: const EdgeInsets.all(5.0),
                             child: SizedBox(
                               child: Card(
                                 elevation: 5.0,
                                 child: Column(
                                   //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   crossAxisAlignment:
                                   CrossAxisAlignment.start,
                                   children: [
                                     Stack(
                                       children: [
                                         ClipRRect(
                                           borderRadius:
                                           BorderRadius.circular(5),
                                           child: ClipRRect(
                                               borderRadius:
                                               BorderRadius.circular(5),
                                               child: ImageFade(
                                                 width:
                                                 MediaQuery
                                                     .of(context)
                                                     .size
                                                     .width *
                                                     0.43,
                                                 height:
                                                 MediaQuery
                                                     .of(context)
                                                     .size
                                                     .height *
                                                     0.20,

                                                 image: NetworkImage(
                                                   homecontroller
                                                       .homeproductData
                                                       .value
                                                       .products![index]
                                                       .thumbnail,
                                                 ),

                                                 duration: const Duration(
                                                     milliseconds: 900),


                                                 syncDuration:
                                                 const Duration(
                                                     milliseconds: 150),


                                                 alignment: Alignment.center,
                                                 fit: BoxFit.cover,
                                                 scale: 2,

                                                 loadingBuilder: (context,
                                                     progress,
                                                     chunkEvent) =>
                                                 const Center(
                                                     child:
                                                     SpinKitRipple(
                                                       color: Color(0xffE2D9FA),
                                                       size: 50.0,
                                                     )),

                                                 // displayed when an error occurs:
                                                 errorBuilder: (context,
                                                     error) =>
                                                 const Center(
                                                     child:
                                                     SpinKitRipple(
                                                       color: Color(0xffE2D9FA),
                                                       size: 50.0,
                                                     )),
                                               )),
                                         ),
                                         Align(
                                           alignment: Alignment.topRight,
                                           child: Card(
                                             shape: RoundedRectangleBorder(
                                               borderRadius:
                                               BorderRadius.circular(50),
                                             ),
                                             child: Padding(
                                               padding: const EdgeInsets
                                                   .symmetric(
                                                   horizontal: 3.0,
                                                   vertical: 3.0),
                                               child: InkWell(
                                                 onTap: () {},
                                                 child: const Icon(
                                                   Icons
                                                       .favorite_border_outlined,
                                                   color: Color(0xffDE2127),
                                                   size: 20,
                                                 ),
                                               ),
                                             ),
                                           ),
                                         ),
                                       ],
                                     ),
                                     const SizedBox(height: 5),
                                     SizedBox(
                                         child: Padding(
                                           padding:
                                           const EdgeInsets.only(left: 3,right: 3),
                                           child: Column(
                                             crossAxisAlignment:
                                             CrossAxisAlignment.start,
                                             mainAxisAlignment:
                                             MainAxisAlignment.spaceBetween,
                                             children: [
                                               SizedBox(
                                                 child: Text(
                                                   homecontroller
                                                       .homeproductData
                                                       .value
                                                       .products![index]
                                                       .title,
                                                   style: ThemeText.heading1,
                                                   maxLines: 2,
                                                 ),
                                               ),
                                               const SizedBox(height: 5),
                                               Text(
                                                 homecontroller
                                                     .homeproductData
                                                     .value
                                                     .products![index]
                                                     .description,

                                                 style: ThemeText.subconten,
                                                 maxLines: 2,

                                               ),
                                               const SizedBox(height: 5),
                                               Text(
                                                 '\$ ${homecontroller
                                                     .homeproductData.value
                                                     .products![index].price}',
                                                 style: ThemeText.amount,
                                                 // endColor: ThemeText.basiccolor,
                                                 //
                                                 // duration: Duration(milliseconds: 500),
                                               ),
                                               const SizedBox(height: 5),
                                               RatingBar.builder(
                                                 ignoreGestures: true,
                                                 tapOnlyMode: false,
                                                 itemSize: 12,
                                                 initialRating: homecontroller
                                                     .homeproductData
                                                     .value
                                                     .products![index]
                                                     .rating,
                                                 minRating: 1,
                                                 direction: Axis.horizontal,
                                                 allowHalfRating: false,
                                                 itemCount: 5,
                                                 itemPadding:
                                                 const EdgeInsets.symmetric(
                                                     horizontal: 1.0),
                                                 itemBuilder: (context, _) =>
                                                 const Icon(
                                                   Icons.star,
                                                   color: Colors.amber,
                                                 ),
                                                 onRatingUpdate: (rating) {
                                                   print(rating);
                                                 },
                                               ),
                                             ],
                                           ),
                                         )),
                                   ],
                                 ),
                               ),
                             ),
                           );
                         },
                       ),
                     ): const Image(
                       image: AssetImage("images/nodatafound.png"),



                     );
                   }
                   else {
                     return const Center(
                         child: SpinKitRipple(
                           color: Color(0xffFF708B),
                           size: 50.0,
                         ));
                 }
                 }),
                      const SizedBox(
                        height: 15,
                      ),
                      /*home services*/
                    ],
                  ),
                ));
              } else {
                return Center(
                    child: SpinKitRipple(
                  color: Color(0xffFF708B),
                  size: 50.0,
                ));
              }
            })));
  }
}

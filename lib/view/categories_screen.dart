


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:newsie/models/categories_news_model.dart';

import '../view_model/news_view_model.dart';
import 'home_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  NewsViewModel newsViewModel = NewsViewModel();

  final format = DateFormat('MMM dd, yyyy');
  String categoryName = 'general' ;

  // Categories List
  List<String> categoriesList = [
    'General',
    'Entertainment',
    'Health',
    'Sports',
    'Business',
    'Technology'
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return  Scaffold(backgroundColor: const Color(0xFFE5D9F2),
      appBar: AppBar(backgroundColor: const Color(0xFFE5D9F2),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                //getting above Categories List Length..
                itemCount: categoriesList.length,
                  itemBuilder: (context, index) {
                     return InkWell(
                       onTap: (){
                          categoryName = categoriesList[index];
                          setState(() {

                          });
                       },
                       child: Padding(
                         padding: const EdgeInsets.only(right: 12),
                         child:
                             
                         // categories container..
                         Container(
                           decoration: BoxDecoration(
                             color: categoryName == categoriesList[index] ? Colors.blue : Colors.grey,
                             borderRadius: BorderRadius.circular(20),
                           ),
                           child:
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 7.5),
                              child: Center(child:
                              // calls "all categories" list by index and convert toString..
                               Text(
                                 categoriesList[index].toString(),
                                 style: GoogleFonts.yaldevi(
                                   fontSize: 13,
                                   color: Colors.white
                                 ),
                                 ),
                              ),
                            ),
                         ),
                       ),
                     );
                  },),
            ),
            SizedBox(height:   20),
            Expanded(
              child: FutureBuilder<CategoriesNewsModel>(
                future: newsViewModel.fetchCategoriesNewsApi(categoryName),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Show loading indicator while waiting for data
                    return  Center(
                      child: SpinKitCircle(
                        size: 50,
                        color: Color(0xff3E3835),
                      ),
                    );
                  } else {
                    // Build a "horizontal" list of news articles
                    return ListView.builder(
                      itemCount: snapshot.data!.articles!.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        DateTime dateTime = DateTime.parse(
                          snapshot.data!.articles![index].publishedAt.toString(),
                        );

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0, right: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: CachedNetworkImage(
                                  imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                                  fit: BoxFit.cover,
                                  height: height * 0.15,
                                  width: width * 0.3,
                                  placeholder: (context, url) => const Center(child: spinkit2),
                                  errorWidget: (context, url, error) =>
                                  const Icon(Icons.error_outline, color: Colors.red),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.articles![index].title ?? "No Title",
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      snapshot.data!.articles![index].source!.name ?? "No Source",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      format.format(dateTime),
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );

                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

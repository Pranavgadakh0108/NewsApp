import 'package:flutter/material.dart';
import 'package:news_app/data/appdata.dart';
import 'package:news_app/ui/bookmark_news.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('BookMarks Library', style: TextStyle(fontSize: 18)),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.deepOrange,
      ),
      body:
          // SafeArea(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: GestureDetector(
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => NewsDetailScreen()),
          //         );
          //       },
          //       child: ListView.separated(
          //         itemCount: trendingNews.length,
          //         separatorBuilder: (context, index) => const SizedBox(height: 14),
          //         itemBuilder: (context, index) {
          //           final item = trendingNews[index];
          //           return Padding(
          //             padding: const EdgeInsets.symmetric(vertical: 5),
          //             child: Row(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 // Image
          //                 ClipRRect(
          //                   borderRadius: BorderRadius.circular(8),
          //                   child: Image.network(
          //                     item["image"]!,
          //                     width: 100,
          //                     height: 75,
          //                     fit: BoxFit.cover,
          //                   ),
          //                 ),
          //                 const SizedBox(width: 12),
          //                 // Text Details
          //                 Expanded(
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Text(
          //                         item["title"]!,
          //                         maxLines: 2,
          //                         overflow: TextOverflow.ellipsis,
          //                         style: const TextStyle(
          //                           fontSize: 14,
          //                           fontWeight: FontWeight.w600,
          //                         ),
          //                       ),
          //                       const SizedBox(height: 6),
          //                       Text(
          //                         "${item["source"]} • ${item["time"]}",
          //                         style: const TextStyle(
          //                           fontSize: 12,
          //                           color: Colors.grey,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.only(top: 25),
          //                   child: Icon(Icons.bookmark, color: Colors.orange),
          //                 ),
          //               ],
          //             ),
          //           );
          //         },
          //       ),
          //     ),
          //   ),
          // ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.85,
                      children: categories.map((item) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                              
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    colors: [Colors.orange.shade400, Colors.orange.shade50],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                  
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => BookmarkNews(),
                                          ),
                                        );
                                      },
                                      child: Image.network(
                                        item['image']!,
                                        fit: BoxFit.contain,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item['name']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              // item['subtitle']!,
                              "7 items",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}

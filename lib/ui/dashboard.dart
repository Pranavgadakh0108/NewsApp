// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/data/appdata.dart';
import 'package:news_app/ui/breaking_news.dart';
import 'package:news_app/ui/latest_news.dart';
import 'package:news_app/ui/news_detail_screen.dart';
import 'package:news_app/utils/logout.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late List<bool> isBookmarked;
  final ScrollController _scrollController = ScrollController();
  late Timer _autoScrollTimer;
  

  @override
  void initState() {
    super.initState();
    isBookmarked = List<bool>.filled(latestNews.length, false);
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_scrollController.hasClients) {
        double maxScroll = _scrollController.position.maxScrollExtent;
        double current = _scrollController.offset;
        double next = current + 300;

        if (next >= maxScroll) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.animateTo(
            next,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          // Main scroll for the entire page
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            child: Column(
              children: [
                // Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello Aditya",
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        Text('Your Daily Dose of News'),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        logout(context);
                      },
                      icon: Icon(
                        Icons.power_settings_new,
                        color: Colors.red,
                        size: 27,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Categories List
                SizedBox(
                  height: 70,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              categories[index]['image']!,
                            ),
                            backgroundColor: Colors.orange.shade100,
                            radius: 22,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            categories[index]['name']!,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Breaking News Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Breaking News',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BreakingNews()),
                      ),
                      child: Text(
                        'View all',
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Breaking News List
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: breakingNews.length,
                    itemBuilder: (context, index) {
                      var item = breakingNews[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailScreen(),
                          ),
                        ),
                        child: Container(
                          width: 280,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.shade100,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                                child: Image.network(
                                  item["image"]!,
                                  height: 150,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  item["title"]!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.circle_rounded,
                                      color: Colors.orange,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      item["source"]!,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),

                // Latest News Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Latest News',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LatestNews()),
                      ),
                      child: Text(
                        'View all',
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Latest News List (Nested Scrollable)
                SizedBox(
                  // Constrain height to prevent infinite expansion
                  height: 300, // Adjust this height as needed
                  child: ListView.builder(
                    physics:
                        const ClampingScrollPhysics(), // Smooth nested scrolling
                    itemCount: latestNews.length,
                    itemBuilder: (context, index) {
                      final item = latestNews[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailScreen(),
                          ),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              item["image"]!,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            item["title"]!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                color: Colors.blue,
                                size: 13,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "${item["source"]} • ${item["time"]}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                isBookmarked[index] = !isBookmarked[index];
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    isBookmarked[index]
                                        ? 'News Bookmarked Successfully'
                                        : 'Bookmark Removed',
                                    style: const TextStyle(
                                      color: Colors.orangeAccent,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              );
                            },
                            icon: Icon(
                              isBookmarked[index]
                                  ? Icons.bookmark
                                  : Icons.bookmark_border_outlined,
                              color: Colors.orange,
                              size: 30,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

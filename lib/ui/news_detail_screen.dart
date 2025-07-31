import 'package:flutter/material.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header image with overlay icons
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    'https://contentstatic.techgig.com/photo/115456875/tcs-offering-free-online-courses-for-freshers-and-professional-techies-apply-now.jpg?23518',
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.black45,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black45,
                        child: Icon(Icons.bookmark_border, color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Colors.black45,
                        child: Icon(Icons.more_vert, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Body content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Metadata row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.red,
                          child: Text(
                            "BBC",
                            style: TextStyle(fontSize: 8, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "BBC News",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        Spacer(),
                        Text(
                          "6 hour ago • 5 min read",
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "• Tech",
                          style: TextStyle(color: Colors.deepOrange, fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Headline
                    Text(
                      "TCS freezes salary hikes after 12,000 layoffs; CEO’s compensation in spotlight",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 12),

                    // News paragraph
                    Text(
                      "The salary of Tata Consultancy Services top brass has come into light after the company announced it will lay off over 12,000 employees from its global workforce, sparking a debate on the need for the TCS layoffs. The company is also likely to freeze salary hikes for employees that remain.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "According to the annual report of India's largest IT services company, TCS CEO K Krithivasan and other top leaders earned in crores in the financial year ending March 2025.TCS' 12,000 employee layoff move comes as part of the company's broader strategy to become a “future-ready organisation”, with its focus shifting to investments in technology, AI deployment, market expansion, and workforce realignment.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

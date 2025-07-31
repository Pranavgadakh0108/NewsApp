final RegExp emailRegex = RegExp(
  r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
);

final RegExp passwordRegExp = RegExp(
  r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$',
);


final List<Map<String, String>> categories = [
  {
    'name': 'Business',
    'image': 'https://cdn-icons-png.freepik.com/512/14113/14113970.png',
  },
  {
    'name': 'Crime',
    'image': 'https://cdn-icons-png.flaticon.com/512/2040/2040658.png',
  },
  {
    'name': 'Domestic',
    'image': 'https://cdn-icons-png.flaticon.com/512/4158/4158731.png',
  },
  {
    'name': 'Science',
    'image': 'https://cdn-icons-png.flaticon.com/512/6554/6554176.png',
  },
  {
    'name': 'Sports',
    'image': 'https://cdn-icons-png.flaticon.com/512/857/857455.png',
  },
  {
    'name': 'Eduction',
    'image': 'https://cdn-icons-png.flaticon.com/512/4729/4729436.png',
  },
  {
    'name': 'Food',
    'image': 'https://cdn-icons-png.flaticon.com/512/5235/5235253.png',
  },
  {
    'name': 'Health',
    'image': 'https://cdn-icons-png.flaticon.com/512/2966/2966327.png',
  },
  {
    'name': 'Lifestyle',
    'image': 'https://cdn-icons-png.flaticon.com/512/11257/11257964.png',
  },
  {
    'name': 'Politics',
    'image': 'https://cdn-icons-png.flaticon.com/512/981/981272.png',
  },
  {
    'name': 'Technology',
    'image': 'https://cdn-icons-png.flaticon.com/512/4319/4319100.png',
  },
];

final List<String> newsCategories = [
  'General',
  'Business',
  'Crime',
  'Domestic',
  'Entertainment',
  'Environment',
  'Eduction',
  'Food',
  'Health',
  'Lifestyle',
  'Other',
  'Politics',
  'Science',
  'Sports',
  'Technology',
  'Tourism',
  'World',
];

final List<Map<String, String>> newsData = [
  {
    "title": "NASA Discovers New Earth-like Planet",
    "imageUrl": "https://images.unsplash.com/photo-1507525428034-b723cf961d3e",
    "description":
        "NASA has discovered a new Earth-like planet in the habitable zone of a nearby star, raising hopes for the existence of life beyond Earth.",
  },
  {
    "title": "Flutter 4.0 Released with AI-Powered Features",
    "imageUrl": "https://images.unsplash.com/photo-1581090700227-1e8e48bdf6d6",
    "description":
        "Flutter 4.0 introduces AI-powered widgets, faster rendering engine, and extended cross-platform capabilities for desktop and web.",
  },
  {
    "title": "India Wins Cricket World Cup 2025",
    "imageUrl": "https://images.unsplash.com/photo-1508804185872-d7badad00f7d",
    "description":
        "India emerged victorious in the 2025 Cricket World Cup final, defeating Australia in a thrilling match at Eden Gardens.",
  },
  {
    "title": "AI Revolutionizes Healthcare Diagnostics",
    "imageUrl": "https://images.unsplash.com/photo-1588776814546-ec7e01bba408",
    "description":
        "AI is transforming the healthcare sector by offering quicker, more accurate diagnoses through machine learning algorithms.",
  },
  {
    "title": "Electric Cars Outsell Petrol for the First Time",
    "imageUrl": "https://images.unsplash.com/photo-1587829741301-dc798b83add3",
    "description":
        "For the first time, global sales of electric vehicles surpassed petrol-powered cars, marking a significant shift in the auto industry.",
  },
  {
    "title": "Google Unveils Next-Gen AI Assistant",
    "imageUrl": "https://images.unsplash.com/photo-1498050108023-c5249f4df085",
    "description":
        "Google's new AI assistant can understand emotions, multi-language context, and perform complex reasoning tasks in real time.",
  },
  {
    "title": "Massive Cyberattack Hits Global Banks",
    "imageUrl": "https://images.unsplash.com/photo-1605902711622-cfb43c4437d4",
    "description":
        "A coordinated cyberattack compromised the data of over 20 international banks, raising concerns over digital security worldwide.",
  },
];

// final List<Map<String, String>> breakingNews = [
//     {
//       "title": "Ten Hag Can't Hide Behind Man United Ownership Issues Anymore",
//       "image": "https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa",
//       "source": "Sky News",
//       "logo": "https://upload.wikimedia.org/wikipedia/commons/5/5f/Sky_News_2020.svg"
//     },
//     {
//       "title": "Ten Hag Can't Hide Behind Man United Ownership Issues Anymore",
//       "image": "https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa",
//       "source": "Sky News",
//       "logo": "https://upload.wikimedia.org/wikipedia/commons/5/5f/Sky_News_2020.svg"
//     },
//   ];

final List<Map<String, String>> breakingNews = [
  {
    "title": "Global Heatwaves Shatter Temperature Records Across Continents",
    "image": "https://images.unsplash.com/photo-1535223289827-42f1e9919769",
    "source": "BBC News",
  },
  {
    "title": "Tech Giants Announce Partnership to Advance AI Safety Standards",
    "image": "https://images.unsplash.com/photo-1535223289827-42f1e9919769",
    "source": "Reuters",
  },
  {
    "title": "Stock Markets Rally as Inflation Slows Across Major Economies",
    "image": "https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3",
    "source": "CNBC",
  },
  {
    "title": "NASA Discovers Earth-Like Exoplanet in Habitable Zone",
    "image": "https://images.unsplash.com/photo-1517976487492-5750f3195933",
    "source": "NASA",
  },
  {
    "title": "Massive Cyberattack Hits Global Banks and Infrastructure",
    "image": "https://images.unsplash.com/photo-1591696205602-2f950c417cb9",
    "source": "The Guardian",
  },
  {
    "title": "India Successfully Launches Next-Gen Weather Satellite",
    "image": "https://images.unsplash.com/photo-1517976487492-5750f3195933",
    "source": "Times of India",
  },
];

final List<Map<String, String>> latestNews = [
  {
    "title": "Fashion needs to support for transition",
    "time": "6 hour ago",
    "source": "Sky News",
    "image": "https://images.unsplash.com/photo-1607746882042-944635dfe10e",
  },
  {
    "title": "Fashion needs to support for transition",
    "time": "6 hour ago",
    "source": "Sky News",
    "image": "https://images.unsplash.com/photo-1607746882042-944635dfe10e",
  },
  {
    "title": "Fashion needs to support for transition",
    "time": "6 hour ago",
    "source": "Sky News",
    "image": "https://images.unsplash.com/photo-1607746882042-944635dfe10e",
  },
  {
    "title": "Fashion needs to support for transition",
    "time": "6 hour ago",
    "source": "Sky News",
    "image": "https://images.unsplash.com/photo-1607746882042-944635dfe10e",
  },
  {
    "title": "Fashion needs to support for transition",
    "time": "6 hour ago",
    "source": "Sky News",
    "image": "https://images.unsplash.com/photo-1607746882042-944635dfe10e",
  },
  {
    "title": "Fashion needs to support for transition",
    "time": "6 hour ago",
    "source": "Sky News",
    "image": "https://images.unsplash.com/photo-1607746882042-944635dfe10e",
  },
  {
    "title": "Fashion needs to support for transition",
    "time": "6 hour ago",
    "source": "Sky News",
    "image": "https://images.unsplash.com/photo-1607746882042-944635dfe10e",
  },
];

final List<Map<String, String>> trendingNews = [
    {
      "title": "NCC Bank Re-elects Chairmen for Committee",
      "source": "BBC News",
      "time": "2 hour ago",
      "image":
          "https://images.unsplash.com/photo-1517976487492-5750f3195933"
    },
    {
      "title": "Focus on AI to Bridge Digital Divide Experts",
      "source": "CNN News",
      "time": "5 hour ago",
      "image":
          "https://images.unsplash.com/photo-1517976487492-5750f3195933"
    },
    {
      "title": "Leclerc takes surprise Mexico pole",
      "source": "BBC News",
      "time": "6 hour ago",
      "image":
         "https://images.unsplash.com/photo-1517976487492-5750f3195933"
    },
    {
      "title": "NCC Bank Re-elects Chairmen for Committee",
      "source": "BBC News",
      "time": "2 hour ago",
      "image":
          "https://images.unsplash.com/photo-1517976487492-5750f3195933"
    },
    {
      "title": "Focus on AI to Bridge Digital Divide Experts",
      "source": "CNN News",
      "time": "5 hour ago",
      "image":
          "https://images.unsplash.com/photo-1517976487492-5750f3195933"
    },
    {
      "title": "Leclerc takes surprise Mexico pole",
      "source": "BBC News",
      "time": "6 hour ago",
      "image":
         "https://images.unsplash.com/photo-1517976487492-5750f3195933"
    },
    {
      "title": "NCC Bank Re-elects Chairmen for Committee",
      "source": "BBC News",
      "time": "2 hour ago",
      "image":
          "https://images.unsplash.com/photo-1517976487492-5750f3195933"
    },
    {
      "title": "Focus on AI to Bridge Digital Divide Experts",
      "source": "CNN News",
      "time": "5 hour ago",
      "image":
          "https://images.unsplash.com/photo-1517976487492-5750f3195933"
    },
    {
      "title": "Leclerc takes surprise Mexico pole",
      "source": "BBC News",
      "time": "6 hour ago",
      "image":
         "https://images.unsplash.com/photo-1517976487492-5750f3195933"
    },
  ];

final Map<String, String> countries = {
  'au': 'Australia',
  'fr': 'France',
  'in': 'India',
  'jp': 'Japan',
  'ru': 'Russia',
  'us': 'United States',
};
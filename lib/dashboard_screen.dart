// dashboard_screen.dart
// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:azakarstream/SearchScreen.dart';
import 'package:flutter/material.dart';
import 'movie_details_screen.dart';
import 'view_all_movies_screen.dart'; // Import the new screen
import 'genre_screen.dart'; // Import the GenreScreen
import 'favorites_screen.dart'; // Import the FavoriteScreen
import 'profile_screen.dart'; // Import the ProfileScreen
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io' show Platform;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const DashboardScreen());
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String? _selectedGenre; // Track the selected genre
  int _selectedNavIndex = 0; // Track the selected navigation index

  AdRequest? adRequest;
  BannerAd? bannerAd;

  @override
  void initState() {
    super.initState();

    String bannerId = Platform.isAndroid
        ? "ca-app-pub-3940256099942544/6300978111"
        : "ca-app-pub-3940256099942544/2934735716";

    adRequest = const AdRequest(
      nonPersonalizedAds: false,
    );
    BannerAdListener bannerAdListener = BannerAdListener(
      onAdClosed: (ad) {
        bannerAd?.load();
      },
      onAdFailedToLoad: (ad, error) {
        bannerAd?.load();
      },
    );
    bannerAd = BannerAd(
      size: AdSize.fluid,
      adUnitId: bannerId,
      request: adRequest!,
      listener: bannerAdListener,
    );
    bannerAd!.load();
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    super.dispose();
  }

  // Updated movie lists with videoUrl field.
  final List<Map<String, String>> newReleases = [
    {
      'title': 'One Piece',
      'rating': '★★★★★',
      'reviews': '(100k)',
      'imageUrl':
          'https://m.media-amazon.com/images/M/MV5BMTNjNGU4NTUtYmVjMy00YjRiLTkxMWUtNzZkMDNiYjZhNmViXkEyXkFqcGc@._V1_.jpg',
      'genre': 'Action',
      'duration': '2h 4m',
      'videoUrl':
          'https://res.cloudinary.com/dywykbqpw/video/upload/zrf1mbajhv8m24n9gxi7.mp4',
    },
    {
      'title': 'One Punch Man',
      'rating': '★★★★☆',
      'reviews': '(55k)',
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/en/c/c3/OnePunchMan_manga_cover.png',
      'genre': 'Adventure',
      'duration': '2h 4m',
      'videoUrl':
          'https://res.cloudinary.com/dywykbqpw/video/upload/One_Punch_Man_Season_1_-_Episode_05_English_Sub_gvmv1g.mp4',
    },
    {
      'title': 'Sakamoto Days',
      'rating': '★★★★★',
      'reviews': '(35k)',
      'imageUrl':
          'https://res.cloudinary.com/dkhe2vgto/image/upload/v1739157398/Sakamoto_qmwwmw.jpg',
      'genre': 'Action',
      'duration': '2h 4m',
      'videoUrl':
          'https://res.cloudinary.com/dkhe2vgto/video/upload/AH2_SAKAMOTO_DAYS_-_01_1080p_v0.mkv_1_qccg8z.mp4',
    },
    {
      'title': 'I Have a Crush at Work',
      'rating': '★★★★★',
      'reviews': '(105k)',
      'imageUrl':
          'https://res.cloudinary.com/dkhe2vgto/image/upload/9f76212f36053b1cb40bf7468b463e82_dyctyj.jpg',
      'genre': 'Romance',
      'duration': '2h 4m',
      'videoUrl':
          'https://res.cloudinary.com/dkhe2vgto/video/upload/AH2_I_Have_a_Crush_at_Work_-_01_1080p_v0.mkv_fslfz2.mp4',
    },
    {
      'title': 'Spider-Man: No Way Home',
      'rating': '★★★★★',
      'reviews': '(200k)',
      'imageUrl':
          'https://m.media-amazon.com/images/M/MV5BZWMyYzFjYTYtNTRjYi00OGExLWE2YzgtOGRmYjAxZTU3NzBiXkEyXkFqcGdeQXVyMzQ0MzA0NTM@._V1_FMjpg_UX1000_.jpg',
      'genre': 'Action',
      'duration': '2h 4m',
      'videoUrl':
          'https://res.cloudinary.com/dkhe2vgto/video/upload/y2mate.com_-_Defeating_Doc_Ock_SpiderMan_2_Voyage_With_Captions_1080_eufgx6.mp4',
    },
    {
      'title': 'Horimiya: The Missing Pieces',
      'rating': '★★★★★',
      'reviews': '(10k)',
      'imageUrl':
          'https://res.cloudinary.com/dkhe2vgto/image/upload/horimiya_mekupa.jpg',
      'genre': 'Fantasy',
      'duration': '2h 4m',
      'videoUrl':
          'https://res.cloudinary.com/dkhe2vgto/video/upload/SubsPlease_Horimiya_-_Piece_-_01_1080p_F8A2CB28_.mkv_wan7d0.mp4',
    },
  ];

  final List<Map<String, String>> mostPopular = [
    {
      'title': 'The Batman',
      'rating': '★★★★☆',
      'reviews': '(95k)',
      'imageUrl':
          'https://m.media-amazon.com/images/M/MV5BMDdmMTBiNTYtMDIzNi00NGVlLWIzMDYtZTk3MTQ3NGQxZGEwXkEyXkFqcGdeQXVyMzMwOTU5MDk@._V1_.jpg',
      'genre': 'Action',
      'duration': '2h 56m',
      'videoUrl': 'https://example.com/the_batman.mp4',
    },
    {
      'title': 'Black Panther',
      'rating': '★★★★★',
      'reviews': '(150k)',
      'imageUrl':
          'https://m.media-amazon.com/images/M/MV5BNTM4NjIxNmEtYWE5NS00NDczLTkyNWQtYThhNmQyZGQzMjM0XkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_FMjpg_UX1000_.jpg',
      'genre': 'Action',
      'duration': '2h 14m',
      'videoUrl': 'https://example.com/black_panther.mp4',
    },
    {
      'title': 'Avatar: The Way of Water',
      'rating': '★★★★☆',
      'reviews': '(120k)',
      'imageUrl':
          'https://m.media-amazon.com/images/M/MV5BYjhiNjBlODctY2ZiOC00YjVlLWFlNzAtNTVhNzM1YjI1NzMxXkEyXkFqcGdeQXVyMjQxNTE1MDA@._V1_FMjpg_UX1000_.jpg',
      'genre': 'Drama',
      'duration': '2h 14m',
      'videoUrl': 'https://example.com/avatar_the_way_of_water.mp4',
    },
    {
      'title': 'Top Gun: Maverick',
      'rating': '★★★★★',
      'reviews': '(180k)',
      'imageUrl':
          'https://m.media-amazon.com/images/M/MV5BZWYzOGEwNTgtNWU3NS00ZTQ0LWJkODUtMmVhMjIwMjA1ZmQwXkEyXkFqcGdeQXVyMjkwOTAyMDU@._V1_FMjpg_UX1000_.jpg',
      'genre': 'Action',
      'duration': '2h 14m',
      'videoUrl': 'https://example.com/top_gun_maverick.mp4',
    },
    {
      'title': 'Titanic',
      'rating': '★★★★★',
      'reviews': '(180k)',
      'imageUrl': 'https://res.cloudinary.com/dkhe2vgto/image/upload/titanic_xowrkm.jpg',
      'genre': 'Romance',
      'duration': '2h 14m',
      'videoUrl': 'https://example.com/titanic.mp4',
    },
    {
      'title': 'The Little Man',
      'rating': '★★★★☆',
      'reviews': '(95k)',
      'imageUrl':
          'https://th.bing.com/th/id/OIP.VcW6HtnsQerz4KJBq6IxAwHaKb?w=588&h=828&rs=1&pid=ImgDetMain',
      'genre': 'Comedy',
      'duration': '2h 56m',
      'videoUrl': 'https://example.com/the_little_man.mp4',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Remove the local dark mode theme setting.
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTopBar(),
                const SizedBox(height: 20),
                _buildFeaturedMovie(),
                const SizedBox(height: 25),
                _buildGenres(),
                const SizedBox(height: 25),
                _buildNewReleases(),
                _buildMoreMovies(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (bannerAd != null)
              SizedBox(
                height: 50,
                child: AdWidget(ad: bannerAd!),
              ),
            _buildBottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Time and Location (if needed)
        Row(
          children: [
            Text(
              '', // Replace with actual time if needed.
              style: TextStyle(
                color: isDark
                    ? Colors.white
                    : const Color(0xFF1A4D2E).withOpacity(0.6),
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text(
                'StreamScape',
                style: TextStyle(
                  color: isDark ? Colors.white : const Color(0xFF1A4D2E),
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        // Search and Notifications
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.search,
                  color: isDark ? Colors.white : const Color(0xFF1A4D2E)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(
                      allMovies: [...newReleases, ...mostPopular],
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications,
                  color: isDark ? Colors.white : const Color(0xFF1A4D2E)),
              onPressed: () {
                // Implement notifications if needed.
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeaturedMovie() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: NetworkImage(
              'https://cdn.mos.cms.futurecdn.net/NJXQ8h3mUd9mhsh2m8xpba-1200-80.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'DOCTOR STRANGE MULTIVERSE OF MADNESS',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 10,
                  color: Color(0xCC000000),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenres() {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Genres',
          style: TextStyle(
            color: isDark ? Colors.white : const Color(0xFF1A4D2E),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _GenreChip(
                title: 'Fantasy',
                genre: 'Fantasy',
                isSelected: _selectedGenre == 'Fantasy',
                onSelected: (genre) {
                  setState(() {
                    _selectedGenre = genre;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GenreScreen(
                        genre: genre,
                        allMovies: [...newReleases, ...mostPopular],
                      ),
                    ),
                  );
                },
              ),
              _GenreChip(
                title: 'Drama',
                genre: 'Drama',
                isSelected: _selectedGenre == 'Drama',
                onSelected: (genre) {
                  setState(() {
                    _selectedGenre = genre;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GenreScreen(
                        genre: genre,
                        allMovies: [...newReleases, ...mostPopular],
                      ),
                    ),
                  );
                },
              ),
              _GenreChip(
                title: 'Action',
                genre: 'Action',
                isSelected: _selectedGenre == 'Action',
                onSelected: (genre) {
                  setState(() {
                    _selectedGenre = genre;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GenreScreen(
                        genre: genre,
                        allMovies: [...newReleases, ...mostPopular],
                      ),
                    ),
                  );
                },
              ),
              _GenreChip(
                title: 'Romance',
                genre: 'Romance',
                isSelected: _selectedGenre == 'Romance',
                onSelected: (genre) {
                  setState(() {
                    _selectedGenre = genre;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GenreScreen(
                        genre: genre,
                        allMovies: [...newReleases, ...mostPopular],
                      ),
                    ),
                  );
                },
              ),
              _GenreChip(
                title: 'Comedy',
                genre: 'Comedy',
                isSelected: _selectedGenre == 'Comedy',
                onSelected: (genre) {
                  setState(() {
                    _selectedGenre = genre;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GenreScreen(
                        genre: genre,
                        allMovies: [...newReleases, ...mostPopular],
                      ),
                    ),
                  );
                },
              ),
              _GenreChip(
                title: 'Anime',
                genre: 'Anime',
                isSelected: _selectedGenre == 'Anime',
                onSelected: (genre) {
                  setState(() {
                    _selectedGenre = genre;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GenreScreen(
                        genre: genre,
                        allMovies: [...newReleases, ...mostPopular],
                      ),
                    ),
                  );
                },
              ),
              _GenreChip(
                title: 'Horror',
                genre: 'Horror',
                isSelected: _selectedGenre == 'Horror',
                onSelected: (genre) {
                  setState(() {
                    _selectedGenre = genre;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GenreScreen(
                        genre: genre,
                        allMovies: [...newReleases, ...mostPopular],
                      ),
                    ),
                  );
                },
              ),
              _GenreChip(
                title: 'Thriller',
                genre: 'Thriller',
                isSelected: _selectedGenre == 'Thriller',
                onSelected: (genre) {
                  setState(() {
                    _selectedGenre = genre;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GenreScreen(
                        genre: genre,
                        allMovies: [...newReleases, ...mostPopular],
                      ),
                    ),
                  );
                },
              ),
              _GenreChip(
                title: 'Sci-Fi',
                genre: 'Sci-Fi',
                isSelected: _selectedGenre == 'Sci-Fi',
                onSelected: (genre) {
                  setState(() {
                    _selectedGenre = genre;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GenreScreen(
                        genre: genre,
                        allMovies: [...newReleases, ...mostPopular],
                      ),
                    ),
                  );
                },
              ),
              _GenreChip(
                title: 'Mystery',
                genre: 'Mystery',
                isSelected: _selectedGenre == 'Mystery',
                onSelected: (genre) {
                  setState(() {
                    _selectedGenre = genre;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GenreScreen(
                        genre: genre,
                        allMovies: [...newReleases, ...mostPopular],
                      ),
                    ),
                  );
                },
              ),
              _GenreChip(
                title: 'Adventure',
                genre: 'Adventure',
                isSelected: _selectedGenre == 'Adventure',
                onSelected: (genre) {
                  setState(() {
                    _selectedGenre = genre;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GenreScreen(
                        genre: genre,
                        allMovies: [...newReleases, ...mostPopular],
                      ),
                    ),
                  );
                },
              ),
              _GenreChip(
                title: 'Documentary',
                genre: 'Documentary',
                isSelected: _selectedGenre == 'Documentary',
                onSelected: (genre) {
                  setState(() {
                    _selectedGenre = genre;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GenreScreen(
                        genre: genre,
                        allMovies: [...newReleases, ...mostPopular],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNewReleases() {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'New Releases',
              style: TextStyle(
                color: isDark ? Colors.white : const Color(0xFF1A4D2E),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ViewAllMoviesScreen(movies: newReleases)),
                );
              },
              child: Text(
                'View All',
                style: TextStyle(
                  color: isDark ? Colors.white : const Color(0xFF1A4D2E),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 281,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: newReleases
                .map(
                  (movie) => _MovieCard(
                    title: movie['title']!,
                    rating: movie['rating']!,
                    reviews: movie['reviews']!,
                    imageUrl: movie['imageUrl']!,
                    genre: movie['genre']!,
                    duration: movie['duration']!,
                    videoUrl: movie['videoUrl']!,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildMoreMovies() {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Most Popular',
              style: TextStyle(
                color: isDark ? Colors.white : const Color(0xFF1A4D2E),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ViewAllMoviesScreen(movies: mostPopular)),
                );
              },
              child: Text(
                'View All',
                style: TextStyle(
                  color: isDark ? Colors.white : const Color(0xFF1A4D2E),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 281,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: mostPopular
                .map(
                  (movie) => _MovieCard(
                    title: movie['title']!,
                    rating: movie['rating']!,
                    reviews: movie['reviews']!,
                    imageUrl: movie['imageUrl']!,
                    genre: movie['genre']!,
                    duration: movie['duration']!,
                    videoUrl: movie['videoUrl']!,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return BottomNavigationBar(
      backgroundColor: isDark ? Colors.grey[900] : const Color(0xFF1A4D2E),
      selectedItemColor: const Color(0xFFF5EFE6),
      unselectedItemColor: const Color(0xFFF5EFE6).withOpacity(0.5),
      currentIndex: _selectedNavIndex,
      onTap: (index) {
        setState(() {
          _selectedNavIndex = index;
        });

        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FavoriteScreen()),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}

class _GenreChip extends StatelessWidget {
  final String title;
  final String genre;
  final bool isSelected;
  final Function(String) onSelected;

  const _GenreChip({
    Key? key,
    required this.title,
    required this.genre,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(genre),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1A4D2E) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFF1A4D2E),
            width: 1,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color:
                isSelected ? const Color(0xFFF5EFE6) : const Color(0xFF1A4D2E),
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class _MovieCard extends StatelessWidget {
  final String title;
  final String rating;
  final String reviews;
  final String imageUrl;
  final String genre;
  final String duration;
  final String videoUrl;

  const _MovieCard({
    Key? key,
    required this.title,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
    required this.genre,
    required this.duration,
    required this.videoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        // Pass details including videoUrl to the MovieDetailsScreen.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(
              title: title,
              genre: genre,
              duration: duration,
              rating: rating,
              description: 'This is a detailed description of the movie $title.',
              imageUrl: imageUrl,
              videoUrl: videoUrl,
            ),
          ),
        );
      },
      child: Container(
        width: 160, // Set a fixed width for consistency
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isDarkMode ? Colors.black : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover, // Ensures the image scales proportionally
                  ),
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2, // Prevents text overflow
                    overflow: TextOverflow.ellipsis, // Adds "..." for overflowing text
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : const Color(0xFF1A4D2E),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: isDarkMode ? Colors.amber : const Color(0xFFF3C63F),
                        size: 14,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        rating,
                        style: TextStyle(
                          color: isDarkMode ? Colors.amber : const Color(0xFFF3C63F),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded( // Prevents the reviews text from exceeding the width
                        child: Text(
                          '($reviews reviews)',
                          maxLines: 1, // Ensures the text stays on one line
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: isDarkMode
                                ? Colors.white.withOpacity(0.7)
                                : const Color(0xFF1A4D2E).withOpacity(0.5),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

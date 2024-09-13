import 'package:flutter/material.dart';
import 'package:myquizapp/QuizScreen.dart';
import 'package:myquizapp/difficultyScreen.dart';



class mainmenu extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<mainmenu> {
  final List<Map<String, String>> categories = [
    {'name': 'Science', 'image': 'assets/science.jpg'},
  {'name': 'Math', 'image': 'assets/maths.jpg'},
  {'name': 'Entertainment', 'image': 'assets/cinema.jpg'},
  {'name': 'Computer', 'image': 'assets/computer.jpg'},
  {'name': 'E-gaming', 'image': 'assets/gaming.jpg'},];

  void _navigateToCategoryDetail(String categoryName) {
    Widget screen;
    screen=difficultyScreen(category: categoryName);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:Colors.black87,
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: ()=>_navigateToCategoryDetail(categories[index]['name']!),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 15,
                    shadowColor: Colors.black.withOpacity(0.9),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        categories[index]['image']!,
                        height: 200, // Set a fixed height for the image
                        width: double.infinity, // Make the image fill the card width
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // Space between the card and the text
                  Text(
                    categories[index]['name']!,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Set text color to white for better visibility
                    ),
                  ),
                  SizedBox(height: 10), // Space between text and the next card
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CategoryDetailPage extends StatelessWidget {
  final String categoryName;

  CategoryDetailPage({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Center(
        child: Text('Welcome to $categoryName category'),
      ),
    );
  }
}

// Placeholder screens for each category
class ScienceQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Science Quiz'),
      ),
      body: Center(
        child: Text('Science Quiz Screen'),
      ),
    );
  }
}

class MathQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Math Quiz'),
      ),
      body: Center(
        child: Text('Math Quiz Screen'),
      ),
    );
  }
}

class EntertainmentQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entertainment Quiz'),
      ),
      body: Center(
        child: Text('Entertainment Quiz Screen'),
      ),
    );
  }
}

class ComputerQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Computer Quiz'),
      ),
      body: Center(
        child: Text('Computer Quiz Screen'),
      ),
    );
  }
}

class GamingQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gaming Quiz'),
      ),
      body: Center(
        child: Text('Gaming Quiz Screen'),
      ),
    );
  }
}

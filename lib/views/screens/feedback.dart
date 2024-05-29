import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create a Scaffold as the base structure
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Feedback Matters'), // Set the app bar title
      ),
      body: SingleChildScrollView(
        // Allow scrolling for long feedback
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Add padding around content
          child: Column(
            children: [
              // Text field for feedback
              TextField(
                decoration: InputDecoration(
                  labelText: 'Tell us what you think...', // Set label text
                ),
                maxLines: 5, // Allow multiple lines of input
              ),
              SizedBox(height: 20.0), // Add spacing between elements
              // Rating bar for user satisfaction
              RatingBar(), // Call RatingBar widget (explained later)
              SizedBox(height: 20.0),
              // Button to submit feedback
              ElevatedButton(
                onPressed: () {
                  // Handle form submission (explained later)
                  print('Feedback submitted!');
                },
                child: Text('Submit Feedback'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// This widget represents the star rating bar
class RatingBar extends StatefulWidget {
  @override
  _RatingBarState createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Center the stars
      children: List.generate(5, (index) {
        // Generate 5 star icons
        return IconButton(
          icon: Icon(
            Icons.star,
            color: (rating >= index + 1) ? Colors.amber : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              rating = index + 1.0; // Update rating on tap
            });
          },
        );
      }),
    );
  }
}



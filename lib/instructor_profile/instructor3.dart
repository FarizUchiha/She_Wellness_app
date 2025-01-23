import 'package:flutter/material.dart';

class Instructor3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom AppBar (Header)
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(250),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back,  color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
          flexibleSpace: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/nutrition.jpg"),  // Change image accordingly
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(color: Colors.black.withOpacity(0.5)),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Sophia Lim",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),

      // Body Content
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile button at the top left
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                  decoration: BoxDecoration(
                    color: Color(0xFFF85C70),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Instructor Image and Name
              Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage("assets/instructor3.jpg"),  // Change image accordingly
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  "Sophia Lim",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16),

              // Profile Details Container
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 6, spreadRadius: 2),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title: Role
                    Text("Role: ", 
                      style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.bold, 
                        color: Color(0xFFF85C70),
                      )
                    ),
                    SizedBox(height: 8),
                    // Information: Role
                    Text("Nutrionist", 
                      style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.normal, 
                        color: Colors.black,
                      )
                    ),
                    SizedBox(height: 8),

                    // Title: Experience
                    Text("Experience:", 
                      style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.bold, 
                        color: Color(0xFFF85C70),
                      )
                    ),
                    SizedBox(height: 8),
                    // Information: Experience
                    Text("4 years", 
                      style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.normal, 
                        color: Colors.black,
                      )
                    ),
                    SizedBox(height: 8),

                    // Title: Specialty
                    Text("Specialty: ", 
                      style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.bold, 
                        color: Color(0xFFF85C70),
                      )
                    ),
                    SizedBox(height: 8),
                    // Information: Specialty
                    Text("Weight management, healthy eating habits, and mindful food choices", 
                      style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.normal, 
                        color: Colors.black,
                      )
                    ),
                    SizedBox(height: 8),

                    // Title: About
                    Text("About:", 
                      style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.bold, 
                        color: Color(0xFFF85C70),
                      )
                    ),
                    SizedBox(height: 8),
                    // Information: About
                    Text(
                      "Sophia Lim is passionate about empowering individuals to make informed, sustainable food choices. "
                      "With 4 years of experience in nutrition counseling, she educates clients on the importance of a balanced diet, mindful eating, and the connection between food and overall well-being. "
                      "Sophia believes that food is fuel for the body and mind, and she works to provide clients with the knowledge and tools they need to lead healthier lives.",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
                    ),
                    SizedBox(height: 16),

                    // Title: Objective
                    Text("Objective:", 
                      style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.bold, 
                        color: Color(0xFFF85C70),
                      )
                    ),
                    SizedBox(height: 8),
                    // Information: Objective
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("- Personalized nutrition plans for long-term health", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black)),
                        Text("- Education on food choices that support mental clarity and energy", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black)),
                        Text("- Strategies to build healthy, sustainable eating habits", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Motivational Quote Container
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 6, spreadRadius: 2),
                  ],
                ),
                child: Center(
                  child: Text(
                    "\"Good nutrition is the key to a long, healthy life.\"",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFFF85C70),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      
    );
  }
}

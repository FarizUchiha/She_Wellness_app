import 'package:flutter/material.dart';

class Instructor4Page extends StatelessWidget {
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
                    image: AssetImage("assets/mentalheal.jpg"),  // Change image accordingly
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
                    "Karina Yu",
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
                  backgroundImage: AssetImage("assets/instructor4.jpg"),  // Change image accordingly
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  "Karina Yu",
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
                    Text("Mental Health Advisor", 
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
                    Text("5+ years", 
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
                    Text("Emotional well-being, stress management, and resilience building", 
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
                      "Karina Yu is a dedicated Mental Health Advisor who works to support individuals in managing stress, overcoming mental health challenges, and developing healthy coping mechanisms. With over five years of experience in the mental health field, she provides compassionate guidance to those facing emotional difficulties, offering evidence-based strategies to enhance well-being and foster resilience. Karina focuses on creating a safe space for clients to explore their emotions and work toward achieving a balanced, fulfilling life.",
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
                        Text("- Expert advice on stress reduction and emotional well-being", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black)),
                        Text("- Personalized strategies to build resilience and cope with life’s challenges", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black)),
                        Text("- Support with creating a sustainable mental health routine", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black)),
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
                    "\"Mental health is just as important as physical health; take care of both to live a balanced life.\"",
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

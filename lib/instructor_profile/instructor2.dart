import 'package:flutter/material.dart';

class Instructor2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom AppBar (Header)
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(250),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
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
                    image: AssetImage("assets/yoga.jpg"),  // Change image accordingly
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
                    "Layla Lee",
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
                  backgroundImage: AssetImage("assets/instructor1.jpg"),  // Change image accordingly
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  "Layla Lee",
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
                    Text("Yoga Instructor", 
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
                    Text("Mindfulness, flexibility, and stress reduction", 
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
                      "Layla is a dedicated Yoga instructor who believes in the transformative power of breath and movement. "
                      "With over five years of experience, she helps clients cultivate inner peace, improve flexibility, and connect deeply with their bodies. "
                      "Layla's approach to yoga is holistic, guiding students to not only strengthen their bodies but also calm their minds and nurture their spirits.",
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
                        Text("- Personalized yoga practices to promote mindfulness and balance", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black)),
                        Text("- Strategies for increasing flexibility and reducing stress", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black)),
                        Text("- Guidance on breathing techniques to improve mental clarity and relaxation", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black)),
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
                    "\"Breathe deeply, move freely, live fully.\"",
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

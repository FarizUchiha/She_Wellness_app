import 'package:flutter/material.dart';

class Instructor1Page extends StatelessWidget {
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
                     image: AssetImage("assets/pilates.jpg"),
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
                    "Anne Johnson",
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
                  backgroundImage: AssetImage("assets/instructor2.jpg"),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  "Anne Johnson",
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
                    Text("Pilates Instructor", 
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
                    Text("8+ years", 
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
                    Text("Core strength, flexibility, and injury recovery", 
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
                      "Anne is passionate about helping individuals build strength, improve posture, and enhance overall wellness through Pilates. "
                      "With her extensive experience, she designs personalized sessions tailored to each client’s goals and fitness levels. "
                      "Anne's supportive and motivational approach empowers clients to feel confident and strong in their bodies.",
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
                        Text("- Tailored Pilates programs for all skill levels", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black)),
                        Text("- Expert guidance on improving posture and flexibility", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black)),
                        Text("- Strategies for long-term physical health and injury prevention", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black)),
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
                    "\"Every stretch, every breath, is a step toward a stronger you.\"",
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

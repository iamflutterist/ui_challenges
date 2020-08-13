import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/services.dart';
import 'helpers/colors.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: "Poppins",
    ),
    title: "Planner",
    home: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: transparent));
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: amber,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
          color: black,
          iconSize: 30,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            color: black,
            iconSize: 30,
          ),
        ],
      ),
      body: Home(),
    );
  }
}

class Home extends StatelessWidget {
  var projects = [
    {
      "color": green,
      "subColor": lightGreen,
      "title": "Medical App",
      "content": "9 hours progress",
      "percent": .25
    },
    {
      "color": red,
      "subColor": lightRed,
      "title": "Sport App",
      "content": "40 hours progress",
      "percent": .75
    },
    {
      "color": yellow,
      "subColor": lightYellow,
      "title": "Messenger App",
      "content": "8 hours progress",
      "percent": .55
    },
    {
      "color": blue,
      "subColor": lightBlue,
      "title": "Planner App",
      "content": "0 hours progress",
      "percent": .0
    }
  ];

  _task({icon, color, title, content}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: color,
            ),
            child: Icon(
              icon,
              color: white,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: black,
                ),
              ),
              Text(
                content,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _project({color, subColor, title, content, percent}) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Center(
              child: CircularPercentIndicator(
                radius: 70,
                percent: percent,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: white,
                backgroundColor: subColor,
                center: Center(
                  child: Text(
                    (percent * 100).toStringAsFixed(0) + "%",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: white,
                ),
              ),
              Text(
                content,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          height: 200,
          decoration: BoxDecoration(
            color: amber,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Row(
            children: <Widget>[
              CircularPercentIndicator(
                radius: 120,
                lineWidth: 8,
                percent: .8,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: red,
                backgroundColor: transparent,
                center: Center(
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: transparent,
                    backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Philip Mccoy",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: black,
                    ),
                  ),
                  Text(
                    "Project Manager",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "My tasks",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: black,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: green,
                    height: 70,
                    shape: CircleBorder(),
                    child: Icon(
                      Icons.today,
                      size: 32,
                      color: white,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  _task(
                    icon: Icons.alarm,
                    color: red,
                    title: "To Do",
                    content: "5 Tasks now - 1 started",
                  ),
                  _task(
                    icon: Icons.flare,
                    color: yellow,
                    title: "In Progress",
                    content: "1 Task now - 1 started",
                  ),
                  _task(
                    icon: Icons.check,
                    color: blue,
                    title: "Done",
                    content: "18 Tasks now - 18 completed",
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Active Projects",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: projects.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: .7,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return _project(
                    color: projects[index]['color'],
                    subColor: projects[index]['subColor'],
                    title: projects[index]['title'],
                    content: projects[index]['content'],
                    percent: projects[index]['percent'],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

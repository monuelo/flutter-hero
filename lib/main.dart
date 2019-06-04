import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class PhotoHero extends StatelessWidget {
  const PhotoHero({Key key, this.photo, this.onTap, this.width})
      : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  Widget build(BuildContext context) {
    timeDilation = 2.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Hero Example', style: TextStyle(color: Color(0xFF5B0500)),),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.red,
      body: Center(
        child: PhotoHero(
          photo: 'images/pokeball.png',
          width: 300.0,
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (BuildContext context) {
              return Scaffold(
                body: Container(
                    // Set background to blue to emphasize that it's a new route.
                    color: Colors.yellowAccent,
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        PhotoHero(
                          width: 300.0,
                          photo: 'images/pikachu.png',
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    )),
              );
            }));
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: HeroAnimation()));
}

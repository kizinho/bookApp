
import 'package:flutter/material.dart';

class SocialAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.09),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          height: 200,
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/auth/auth.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Social Authentication Account',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Please wait --',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Center(
                        child: Container(
                          height: 200,
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/auth/wait.png'),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

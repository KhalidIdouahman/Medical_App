import 'package:flutter/material.dart';
import 'package:medical_app_final/constants/constants.dart';
import 'package:medical_app_final/models/item.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailsPage extends StatelessWidget {
  final Item item;

  const DetailsPage({super.key , required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppColor,
      appBar: AppBar(
        backgroundColor: kAppColor,
        elevation: 0,
        title: Text(item.title),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const DetailsBody(),
    );
  }
}

class DetailsBody extends StatefulWidget {
  // final Item item;
  const DetailsBody({
    super.key,
    // required this.item,
  });

  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  late YoutubePlayerController _youtubeController;
  String youtubeVideoId = 'naF7ezQnPXk';

  @override
  void initState() {
    // initialise the youtube player controller
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: youtubeVideoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 25 , left: kDefaultPadding , right: kDefaultPadding , bottom: 30),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: YoutubePlayer(
              controller: _youtubeController,
              showVideoProgressIndicator: true,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(25),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255,251,249,243),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(34),
                topRight: Radius.circular(34),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    kTitle,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 0, 0.7),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    // i want it to take the whole width but the padding i applied to the whole widgets don't let me
                    // do that .
                    // width: MediaQuery.of(context).size.width,
                    height: 1.5,
                    // it's the grey color for the divider
                    color: const Color.fromARGB(255, 201, 201, 201),
                  ),
                  // Divider(height: 30 , endIndent: 10 , thickness: 1 , indent: 0),
                  Text(
                    kParagraph,
                    style: TextStyle(
                      fontSize: 16,
                      height: 2,
                      color: Colors.grey.shade600,
                    ),
                    // this to make the text aligned like in books .
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

  }
}


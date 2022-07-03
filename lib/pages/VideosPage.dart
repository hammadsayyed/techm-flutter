import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techm/Constants.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import '../models/VideoModel.dart';
import '../widgets/VideoItems.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({Key? key}) : super(key: key);

  @override
  _VideosPageState createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  List<VideoModel> videos = [];
  List<Widget> videosWidget = [];
  List<VideoPlayerController> videoPlayerControllerList = [];
  bool isLoading = false;



  @override
  Widget build(BuildContext context) {
    return isLoading ? const Center(child: CircularProgressIndicator()) : ListView(
      children: videosWidget
    );
  }

  getVideos()async{
    setState(() {
      isLoading = true;
    });
    isLoading = true;
    var url = Uri.parse('${Constants.baseUrl}${Constants.videos}');
    var response = await http.get(url);
    videos = videoModelFromJson(response.body);
    if(videos.isNotEmpty) {
      for (var element in videos) {
        videosWidget.add(urlToVideoItems(element.url));
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  Widget urlToVideoItems(url){
    var videoPlayerController = VideoPlayerController.network(
      url,
    );
    videoPlayerControllerList.add(videoPlayerController);
    return VideoItems(
      videoPlayerController: videoPlayerController,
      looping: false,
      autoplay: false,
    );
  }

  @override
  void initState() {
    getVideos();
    super.initState();
  }

  @override
  void dispose() {
    for (var element in videoPlayerControllerList) {
      element.dispose();
    }
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({Key? key, required this.videoUrl}) : super(key: key);
  final String videoUrl;
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  late Duration videoLength;
  late Duration videoPosition;
  double volume = 0.5;

  @override
  void initState() {
    String url = widget.videoUrl;
    print(url);
    _controller = VideoPlayerController.network('$url');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.addListener(() {
      setState(() {
        videoPosition = _controller.value.position;
      });
    });
    _controller.setLooping(true);
    _controller.seekTo(_controller.value.position);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (_controller.value.isInitialized) ...[
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
            VideoProgressIndicator(
              _controller,
              allowScrubbing: true,
              padding: EdgeInsets.all(10),
            ),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                  ),
                  onPressed: () => setState(
                    () {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    },
                  ),
                ),
                Text(
                    '${convertToMinutesSeconds(videoPosition)} / ${convertToMinutesSeconds(videoLength)}'),
                SizedBox(width: 10),
                Icon(animatedVolumeIcon(volume)),
                Slider(
                    value: volume,
                    min: 0,
                    max: 1,
                    onChanged: (changedVolume) {
                      setState(() {
                        volume = changedVolume;
                        _controller.setVolume(changedVolume);
                      });
                    }),
                Spacer(),
                IconButton(
                    icon: Icon(Icons.loop,
                        color: _controller.value.isLooping
                            ? Colors.green
                            : Colors.black),
                    onPressed: () {
                      _controller.setLooping(!_controller.value.isLooping);
                    })
              ],
            )
          ]
        ],
      ),
    );
  }

  @override
  void dispose() {
    //  _initializeVideoPlayerFuture = "";
    _controller.pause().then((_) {
      _controller.dispose();
    });
    super.dispose();
  }
}

String convertToMinutesSeconds(Duration duration) {
  final parsedMinutes = duration.inMinutes % 60;

  final minutes =
      parsedMinutes < 10 ? '0$parsedMinutes' : parsedMinutes.toString();

  final parsedSeconds = duration.inSeconds % 60;

  final seconds =
      parsedSeconds < 10 ? '0$parsedSeconds' : parsedSeconds.toString();

  return '$minutes:$seconds';
}

IconData animatedVolumeIcon(double volume) {
  if (volume == 0)
    return Icons.volume_mute;
  else if (volume < 0.5)
    return Icons.volume_down;
  else
    return Icons.volume_up;
}

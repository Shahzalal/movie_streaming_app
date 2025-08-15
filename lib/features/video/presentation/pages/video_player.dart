import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/utils/ui_helper.dart';
import '../../../../core/theme/app_colors.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({super.key});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late FlickManager flickManager;
  bool _showControls = true;

  @override
  void initState() {
    super.initState();

    /// Force landscape
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    });

    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
        ),
      ),
      autoPlay: true,
    );
  }

  @override
  void dispose() {
    flickManager.dispose();

    /// Restore portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    super.dispose();
  }

  void _onUserInteraction() {
    setState(() => _showControls = true);
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => _showControls = false);
    });
  }

  void _skipForward() {
    final controller = flickManager.flickVideoManager!.videoPlayerController!;
    final position = controller.value.position + const Duration(seconds: 10);
    controller.seekTo(position);
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = duration.inHours > 0 ? "${twoDigits(duration.inHours)}:" : "";
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Stack(
        children: [
          FlickVideoPlayer(
            flickManager: flickManager,
            flickVideoWithControls: FlickVideoWithControls(
              controls: const SizedBox.shrink(), // remove default controls
            ),
          ),

          /// Custom overlay controls
          if (_showControls) ...[
            /// Top bar
            Positioned(
              top: SizeConfig.hs(10),
              left: SizeConfig.ws(12),
              right: SizeConfig.ws(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UiHelper.customText(
                    text: "Moviers",
                    fontsize: SizeConfig.ws(18),
                    fontweight: FontWeight.bold,
                    fontfamily: 'bold',
                    color: AppColors.mainTextColor,
                  ),
                  UiHelper.customText(
                    text: "PG",
                    fontsize: SizeConfig.ws(14),
                    color: AppColors.mainTextColor,
                  ),
                ],
              ),
            ),

            /// Bottom controls
            Positioned(
              bottom: SizeConfig.hs(20),
              left: SizeConfig.ws(10),
              right: SizeConfig.ws(10),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      flickManager.flickVideoManager!.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: AppColors.mainTextColor,
                      size: SizeConfig.ws(26),
                    ),
                    onPressed: () {
                      _onUserInteraction();
                      if (flickManager.flickVideoManager!.isPlaying) {
                        flickManager.flickControlManager?.pause();
                      } else {
                        flickManager.flickControlManager?.play();
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.skip_next,
                      color: AppColors.mainTextColor,
                      size: SizeConfig.ws(26),
                    ),
                    onPressed: () {
                      _onUserInteraction();
                      _skipForward();
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable: flickManager
                        .flickVideoManager!.videoPlayerController!,
                    builder: (context, VideoPlayerValue value, child) {
                      return UiHelper.customText(
                        text: _formatDuration(value.position),
                        fontsize: SizeConfig.ws(14),
                        color: AppColors.mainTextColor,
                      );
                    },
                  ),
                  Expanded(
                    child: VideoProgressIndicator(
                      flickManager
                          .flickVideoManager!.videoPlayerController!,
                      allowScrubbing: true,
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.ws(8),
                      ),
                      colors: VideoProgressColors(
                        playedColor: AppColors.primaryBlue,
                        bufferedColor: AppColors.versionTextColor,
                        backgroundColor:
                        AppColors.versionTextColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: flickManager
                        .flickVideoManager!.videoPlayerController!,
                    builder: (context, VideoPlayerValue value, child) {
                      final duration = value.duration - value.position;
                      return UiHelper.customText(
                        text: "-${_formatDuration(duration)}",
                        fontsize: SizeConfig.ws(14),
                        color: AppColors.mainTextColor,
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.volume_up,
                      color: AppColors.mainTextColor,
                      size: SizeConfig.ws(24),
                    ),
                    onPressed: () {
                      _onUserInteraction();
                      flickManager.flickControlManager?.toggleMute();
                    },
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

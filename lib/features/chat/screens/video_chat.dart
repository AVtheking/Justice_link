import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:justice_link/global.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
        appId: appId, channelName: "test", tempToken: token),
  );

// Initialize the Agora Engine
  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
            child: Stack(
          children: [
            AgoraVideoViewer(
              client: client,
              layoutType: Layout.floating,
              enableHostControls: true,
              showNumberOfUsers: true,
            ),
            AgoraVideoButtons(
              client: client,
              enabledButtons: const [
                BuiltInButtons.callEnd,
                BuiltInButtons.toggleCamera,
                BuiltInButtons.toggleMic,
                BuiltInButtons.switchCamera
              ],
            )
          ],
        )),
      ),
    );
  }
}

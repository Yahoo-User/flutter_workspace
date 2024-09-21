import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';

import '../shared/seq_01_library.dart';


class CamScreen extends StatefulWidget {

      const CamScreen({super.key});


      // Note: don't put any logic in 'createState'.
      @override
      State<StatefulWidget> createState() => _CamScreenState();

} // end class


class _CamScreenState extends State<CamScreen> {
    RtcEngine? agoraRtcEngine;
    int? uid;
    int? otherUid;


    /*
     * =============================================================
     * How To Get Started With Real-Time Interaction In The Flutter ?
     * =============================================================
     * Step1. RtcEngine agoraEngine = createAgoraRtcEngine();
     *
     * Step2. await agoraEngine.initialize(const RtcEngineContext(appId: "<Your app ID>"));
     *
     * Step3. ChannelMediaOptions options = const ChannelMediaOptions(
     *              clientRoleType: ClientRoleType.clientRoleBroadcaster,
     *              channelProfile: ChannelProfileType.channelProfileCommunication);
     *
     * Step4. <Use a Container here> = AgoraVideoView(controller: VideoViewController(rtcEngine: agoraEngine,canvas: VideoCanvas(uid: 0));
     *
     * Step5. await agoraEngine.enableVideo();
     * Step6. await agoraEngine.startPreview();
     * Step7. await agoraEngine.joinChannel(token: <"You token">,channelId: "You channel name", options: options, uid: 1);
     * =============================================================
     */
    Future<bool> initAgora() async {
        console('initAgora() invoked.');

        /**
         * ----------------------
         * Future<Map<Permission, PermissionStatus>> request():
         * ----------------------
         * Response: Map<Permission, PermissionStatus> response
         *  (1) Requests the user for access to these permissions, if they haven't already been granted before.
         *  (2) Returns a Map containing the status per requested Permission.
         * ----------------------
         * Permission.camera: Permission for accessing the device's camera.
         * Permission.microphone: Permission for accessing the device's microphone.
         * ----------------------
         */

        // ------------------
        // 1. Acquire access permissions for camera & microphone with `permission-handler` package.
        // ------------------

        final response = await [ Permission.camera, Permission.microphone ].request();
        console('\t1. response: $response');

        // PermissionStatus? camPermissionStatus
        final camPermissionStatus = response[ Permission.camera ];
        console('\t2. camPermissionStatus: $camPermissionStatus');

        // PermissionStatus? micPermissionStatus
        final micPermissionStatus  = response[ Permission.microphone ];
        console('\t3. micPermissionStatus: $micPermissionStatus');

        if(camPermissionStatus != PermissionStatus.granted || micPermissionStatus != PermissionStatus.granted) {
            throw 'No camera and microphone permissions';
        } // if


        // ------------------
        // 2. Enable Agora WebRTC Engine
        // ------------------

        if(agoraRtcEngine == null) {

            // Step.1 - Creates one RtcEngine object.
            // Currently, the Agora RTC SDK v6.x supports creating only one RtcEngine object for each app.
            agoraRtcEngine = createAgoraRtcEngine();
            console('\t+ Step.1 - agoraRtcEngine: $agoraRtcEngine}');

            // Step.2 - Initializes RtcEngine.
            await agoraRtcEngine!.initialize(const RtcEngineContext(
                appId: appID,
                // 1: Live streaming. Live streaming. Use this profile when there are more than two users in the channel.
                channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
            ));  // .initialize

            // Step.3 - Adds event handlers
            // The SDK uses the RtcEngineEventHandler class to send callbacks to the app.
            agoraRtcEngine!.registerEventHandler(
                RtcEngineEventHandler(

                    /**
                     * ----------------------------------------------------------------
                     * void Function(RtcConnection, int)? onJoinChannelSuccess
                     * ----------------------------------------------------------------
                     * Occurs when a user joins a channel.
                     * This callback notifies the application that a user joins a specified channel.
                     * ----------------------------------------------------------------
                    */
                    onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
                        console('1. RtcEngineEventHandler::onJoinChannelSuccess($connection, $elapsed) invoked.');

                        // Update State -> Dirty State -> Re-rendered by build(context) -> Clean state.
                        setState(() => uid = connection.localUid);
                    },

                    /**
                     * ----------------------------------------------------------------
                     * void Function(RtcConnection, RtcStats)? onLeaveChannel
                     * ----------------------------------------------------------------
                     * Occurs when a user leaves a channel.
                     * This callback notifies the app that the user leaves the channel by calling leaveChannel.
                     * From this callback, the app can get information such as the call duration and statistics.
                     * ----------------------------------------------------------------
                     */
                    onLeaveChannel: (RtcConnection connection, RtcStats stats) {
                        console('2. RtcEngineEventHandler::onLeaveChannel($connection, $stats) invoked.');

                        // Update State -> Dirty State -> Re-rendered by build(context) -> Clean state.
                        setState(() => uid = null);
                    },

                    /**
                     * ----------------------------------------------------------------
                     * void Function(RtcConnection, int, int)? onUserJoined
                     * ----------------------------------------------------------------
                     * Occurs when a remote user (in the communication profile)/ host (in the live streaming profile) joins the channel.
                     * ----------------------------------------------------------------
                     */
                    onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
                        console('3. RtcEngineEventHandler::onUserJoined($connection, $remoteUid, $elapsed) invoked.');

                        // Update State -> Dirty State -> Re-rendered by build(context) -> Clean state.
                        setState(() => otherUid = remoteUid);
                    },

                    /**
                     * ----------------------------------------------------------------
                     * void Function(RtcConnection, int, UserOfflineReasonType)? onUserOffline
                     * ----------------------------------------------------------------
                     * Occurs when a remote user (in the communication profile)/ host (in the live streaming profile) leaves the channel.
                     * ----------------------------------------------------------------
                     */
                    onUserOffline: (RtcConnection connection, int remoteUid, UserOfflineReasonType reason) {
                        console('4. RtcEngineEventHandler::onUserOffline($connection, $remoteUid, $reason) invoked.');

                        // Update State -> Dirty State -> Re-rendered by build(context) -> Clean state.
                        setState(() => otherUid = null);
                    },  // onUserOffline
                )
            );  // .registerEventHandler

            // Step4 - Sets the user role and level in an interactive live streaming channel.
            await agoraRtcEngine!.setClientRole(role: ClientRoleType.clientRoleBroadcaster);

            // Step5 - Enables the video module.
            await agoraRtcEngine!.enableVideo();

            // Step6 - Enables the local video preview and specifies the video source for the preview.
            // This method is used to start local video preview and specify the video source that appears in the preview screen.
            await agoraRtcEngine!.startPreview();

            // Step7 - Joins a channel with media options.
            // This method enables users to join a channel.
            await agoraRtcEngine!.joinChannel(
                token: tempToken,
                channelId: channelName,
                uid: 1,
                options: const ChannelMediaOptions(),
            );  // .joinChannel

        } // if

        return true;    // All Granted Camera & Microphone Permissions.
    } // init


    @override
    Widget build(BuildContext context) {
        console('build($context) invoked.');

        return Scaffold(
                appBar: AppBar(title: const Text('LIVE')),

                body: FutureBuilder(        // Refs : https://chatgpt.com/share/2a7defa5-4581-4295-99e2-ab610bb0da22
                    future: initAgora(),        // **Acquire all permissions of camera & microphone and Enable Agora WebRTC Engine,

                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                        console('build($context, $snapshot) invoked.');

                        // ------------
                        // (1) When *occurs an error after executing the future,
                        // ------------
                        if(snapshot.hasError) {
                            return Center( child: Text(snapshot.error.toString()) );
                        } // if

                        // ------------
                        // (2) When *no data after executing the future,
                        // ------------
                        if(!snapshot.hasData) {
                            return const Center( child: CircularProgressIndicator() );
                        } // if

                        // ------------
                        // (3) When *granted all required permissions after executing the future,
                        // ------------
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,

                            children: <Widget>[
                                Expanded(
                                    child: Stack(
                                        children: <Widget>[
                                            renderMainView(),

                                            Align(
                                                alignment: Alignment.topLeft,

                                                child: Container(
                                                    color: Colors.grey,
                                                    height: 170.0,
                                                    width: 170.0,

                                                    child: renderSubView(),
                                                ),
                                            ),
                                        ],
                                    ),
                                ),

                                Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),

                                    child: ElevatedButton(
                                        onPressed: () async {
                                            if(agoraRtcEngine != null) {
                                                await agoraRtcEngine!.leaveChannel();
                                            } // if

                                            if(mounted) {
                                                // Navigator.of(context).pop();         // 1
                                                Navigator.pop(context);               // 2
                                            } // if
                                        },

                                        child: const Text("Exit Channel."),
                                    ),
                                ),
                            ],
                        );
                    },
                ),
            );
    } // build


    @override
    void dispose() {
        console('dispose() invoked.');

        agoraRtcEngine?.release();

        super.dispose();
    } // dispose


    Widget renderSubView() {    // Show *my camera view.
        console('renderSubView() invoked.');

        if(uid != null) {   // Using *AgoraVideoView widget, show screen with my camera.
            return AgoraVideoView(controller: VideoViewController(
                    rtcEngine: agoraRtcEngine!,
                    canvas: const VideoCanvas(uid: 0)
                )
            );
        } else {            // Until now, I do Not connect to a channel, show progress indicator.
            return const CircularProgressIndicator();
        } // if-else
    } // renderSubView


    Widget renderMainView() {   // Show the opposite *other camera view.
        console('renderMainView() invoked.');

        if(otherUid != null) {   // Using *AgoraVideoView widget, show screen with opposite user camera.
            return AgoraVideoView(controller: VideoViewController.remote(
                rtcEngine: agoraRtcEngine!,
                canvas: VideoCanvas(uid: otherUid),
                connection: const RtcConnection(channelId: channelName)
            ));
        } else {            // Until now, Other user do Not join to a channel, show progress indicator.
            return const Center(
                child: Text(
                    "Please wait a moment,\nUntil other join our WebRTC channel ...",

                    textAlign: TextAlign.center,

                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.0,
                        fontFamily: 'D2Coding',
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                    ),
                ),
            );
        }   // if-else
    } // renderMainView

} // end class



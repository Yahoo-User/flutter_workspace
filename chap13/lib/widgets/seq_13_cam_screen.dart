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
        // 1. Acquire Devices Permissions with permission-handler package
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
            console('\t5. agoraRtcEngine: $agoraRtcEngine}');

            // Step.2 - Initializes RtcEngine.
            await agoraRtcEngine!.initialize(
                const RtcEngineContext(
                    appId: appID,
                    channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
                ),
            );  // .initialize

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
                        console('RtcEngineEventHandler::onJoinChannelSuccess($connection, $elapsed) invoked.');

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
                        console('RtcEngineEventHandler::onLeaveChannel($connection, $stats) invoked.');

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
                        console('RtcEngineEventHandler::onUserJoined($connection, $remoteUid, $elapsed) invoked.');

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
                        console('RtcEngineEventHandler::onUserOffline($connection, $remoteUid, $reason) invoked.');

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
                uid: 0,
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
                        return const Center(
                            child: Text('All permissions granted...', style: TextStyle( fontSize: 24.0, fontFamily: 'D2Coding' )),
                        );
                    },
                ),
            );
    } // build

} // end class



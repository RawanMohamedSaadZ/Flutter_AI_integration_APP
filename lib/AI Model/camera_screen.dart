import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'ModelClass.dart'; // Import the ModelClass

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {

  CameraController? _cameraController;
  bool _isCameraInitialized = false;
  String _answer = "Detecting...";

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    ModelClass.closeModel(); // Ensure TFLite resources are released
    super.dispose();
  }


  Future<void> initialize() async {
    await ModelClass.loadModel();
    final cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.ultraHigh);
    _cameraController!.initialize().then((_) {
      if (!mounted) return;

      setState(() {
        _isCameraInitialized = true;
      });
      _startImageStream();
    }).catchError((error) {
      print("Camera initialization error: $error");
    });
  }

  void _startImageStream() {
    if (!ModelClass.isModelLoaded) {
      print("Model not loaded, skipping frame.");
      return;
    } // Ensure model is loaded before starting stream

    _cameraController!.startImageStream((cameraImage) async {
      var predictions = await ModelClass.classifyStream(cameraImage);

      if (predictions != null && predictions.isNotEmpty) {
        // Assuming the confidence is given as a value between 0 and 1.
        // Convert the confidence to a percentage and format it with two decimal places.
        String label = predictions.first['label'];
        double confidence = predictions.first['confidence'];
        String percentage = (confidence * 100).toStringAsFixed(2);

        setState(() {
          _answer = "$label - $percentage%";
        });
      }
    });
  }




  bool flg = true;

  @override
  Widget build(BuildContext context) {

    if (!ModelClass.isModelLoaded || !_isCameraInitialized) {
      return const Center(
              child:  CircularProgressIndicator(color: Color(0xFFA7BAE0)),
            );
    } else {

      return SafeArea(
        child: Scaffold(

            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color(0xFFA7BAE0),
              onPressed: () {
                setState(() {
                  flg = !flg;
                });

                if (flg) {
                  _cameraController!.resumePreview();
                } else {
                  _cameraController!.pausePreview();
                }
              },
              child: Icon(
                flg ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
              ),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.deepPurple,
              child: Stack(
                children: [
                  Positioned(
                    child: Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: AspectRatio(
                          aspectRatio: _cameraController!.value.aspectRatio,
                          child: CameraPreview(
                            _cameraController!,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        color: Colors.black87,
                        child: Center(
                          child: Text(
                            "Classify animal:\n$_answer",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      );
    }
  }
}

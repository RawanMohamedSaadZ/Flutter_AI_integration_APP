import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'ModelClass.dart';

class DetectorPage extends StatefulWidget {
  const DetectorPage({super.key});
  @override
  DetectorPageState createState() => DetectorPageState();
}

class DetectorPageState extends State<DetectorPage> {
  CameraController?_cameraController;
  bool _isCameraInitialized = false;

  List<dynamic>? _recognitions;

  @override
  void initState() {
    super.initState();
    initialize();
  }



  Future<void> initialize() async {
    await ModelClass.loadYOLOModel();
    final cameras = await availableCameras();
   _cameraController = CameraController(cameras[0], ResolutionPreset.max);
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

      var predictions = await ModelClass.ImageDetection(cameraImage);

      if (predictions != null && predictions.isNotEmpty) {
        setState(() {
          _recognitions = predictions;
        });
      }

    });
  }


  @override
  void dispose() {
   _cameraController?.stopImageStream().then((_) {
     _cameraController?.dispose();
    });
    ModelClass.closeModel();
    super.dispose();
  }

  bool flg = true;
  @override
  Widget build(BuildContext context) {


    if (!ModelClass.isModelLoaded || !_isCameraInitialized) {
      return const Center(
        child:  CircularProgressIndicator(color:  Color(0xFFA7BAE0)),);
    }else
    {
      return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor:  const Color(0xFFA7BAE0),
            onPressed: (){
              setState(() {
                flg = !flg;
              });
              if (flg){
                _cameraController!.resumePreview();
              }else{
                _cameraController!.pausePreview();
              }
            },
            child: Icon(flg ? Icons.pause : Icons.play_arrow,color: Colors.white,),

          ),
          body: Stack(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: AspectRatio(
                  aspectRatio: _cameraController!.value.aspectRatio,
                  child: CameraPreview(
                    _cameraController!,
                  ),
                ),
              ),
              BoundingBoxes(
                recognitions: _recognitions,
              ),
            ],
          ),
        ),
      );
    }
  }

}






class BoundingBoxes extends StatelessWidget {
  final List<dynamic>? recognitions;

  const BoundingBoxes({
    super.key,
    required this.recognitions,
  });

  @override
  Widget build(BuildContext context) {

    var screenH = MediaQuery.of(context).size.height;
    var screenW = MediaQuery.of(context).size.width;

    List<Widget> boxes = [];

    if (recognitions != null) {
      for (var re in recognitions!) {
        var rect = re['rect'];
        double x = rect['x'] * screenW;
        double w = rect['w'] * screenW;
        double y = rect['y'] * screenH;
        double h = rect['h'] * screenH;
        String detectedClass = re['detectedClass'];
        double confidence = re['confidenceInClass'] * 100;

        // Formatting the label with class and confidence level
        String label = '$detectedClass ${(confidence.toStringAsFixed(2))}%';

        boxes.add(
            Positioned(
              left: x,
              top: y,
              child: Stack(
                clipBehavior: Clip.none,  // Allows child widgets to be positioned outside the parent stack
                children: [
                  // The bounding box
                  Container(
                    width: w,
                    height: h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                        width: 3,
                      ),
                    ),
                  ),
                  // Text label positioned above the box
                  Positioned(
                    top: -25,  // Position above the box; adjust value as needed
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      color: Colors.black54, // Background color for better readability
                      child: Text(
                        label,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
        );
      }
    }

    return Stack(children: boxes);
  }
}


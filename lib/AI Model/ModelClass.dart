import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:tflite_v2/tflite_v2.dart';
class ModelClass {

  static bool _isModelLoaded = false;
  static int _lastProcessedTime = DateTime.now().millisecondsSinceEpoch;
  static bool get isModelLoaded => _isModelLoaded;

  static Future<void> loadModel() async {
    try {
      await Tflite.loadModel(
        model: 'Assets/ML_modle/model.tflite',
        labels: 'Assets/ML_modle/labels.txt',
      );
      _isModelLoaded = true;
      print("Model loaded successfully");
    } catch (e) {
      print("Failed to load model: $e *******************************");
    }
  }

  static Future<String> classifyImage(String imagePath) async {
    await loadModel();

    var output = await Tflite.runModelOnImage(
      path: imagePath,
      numResults: 2, // Assuming you want the top 2 results
      threshold: 0.7, // Minimum confidence threshold for including a result
      imageMean: 127.5, // These values depend on your model
      imageStd: 127.5, // These values depend on your model
    );
    if (output != null && output.isNotEmpty) {
      // Assuming the output is a list of recognitions
      final recognition = output.first;
      final label = recognition['label'];
      final confidence = recognition['confidence'];
      return '$label - ${(confidence * 100).toStringAsFixed(0)}%';
    } else {
      return 'Classification failed';
    }
  }

  static Future<List?> classifyStream(CameraImage cameraImage) async {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    if (currentTime - _lastProcessedTime < 1000) { // 1000 ms = 1 second
      return null;
    }
    _lastProcessedTime = currentTime;
    try {
      var result = await Tflite.runModelOnFrame(
        bytesList: cameraImage.planes.map((plane) => plane.bytes).toList(),
        imageHeight: cameraImage.height,
        imageWidth: cameraImage.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 3,
        threshold: 0.1,
        asynch: true,
      );
      print("result  : $result");
      return result;
    } catch (e) {
      print("Error during model inference: $e");
      return null;
    }
  }

  static Future<void> closeModel() async {

    await Tflite.close();

    _isModelLoaded = false;
  }

  ///////////////////// YOLO

  static Future<void> loadYOLOModel() async {
    try {
      await Tflite.loadModel(
        model: "Assets/ML_modle/yolov2_tiny.tflite",
        labels: "Assets/ML_modle/yolov2_tiny.txt",
      );
      _isModelLoaded = true;
      print("YOLO Model loaded successfully");
    } catch (e) {
      print("Failed to load YOLO model: $e *******************************");
    }
  }

  static Future<List?> ImageDetection(CameraImage image) async {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    if (currentTime - _lastProcessedTime < 1000) { // 1000 ms = 1 second
      return null;
    }
    _lastProcessedTime = currentTime;

    try {
      var recognitions = await Tflite.detectObjectOnFrame(
        bytesList: image.planes.map((plane) => plane.bytes).toList(),
        model: "YOLO",
        imageHeight: image.height,
        imageWidth: image.width,
        imageMean: 0,
        imageStd: 255.0,
        threshold: 0.2,
        numResultsPerClass: 1,
      );
      print("Detection results: $recognitions");
      return recognitions;
    } catch (e) {
      print("Error during model inference: $e");
      return null;
    }
  }

}





/*

The code snippet shows a call to the TensorFlow Lite (TFLite) method runModelOnImage, which is used to run image classification or detection models. This method takes an image as input (specified by its file path) and runs the loaded TFLite model on this image to generate predictions. Here's a breakdown of the parameters and their meanings:

path: The file path to the image you want to classify or detect objects within. This should be a valid path to an image file accessible by your application.

numResults: This parameter specifies the maximum number of results (predictions) you want the model to return. Setting this to 2 means you are interested in the top 2 predictions the model makes, ranked by confidence. This is useful when your model can classify images into many categories, but you're only interested in the most likely categories.

threshold: This is the minimum confidence threshold for including a result. The confidence score, typically between 0 and 1, indicates the model's certainty that the prediction is correct. By setting this to 0.5, you're filtering out all predictions where the model is less than 50% confident, thus only receiving results for which the model has a moderate to high level of confidence.

imageMean and imageStd: These parameters are used for image normalization, which is a common preprocessing step in many machine learning and deep learning pipelines. Image normalization typically involves adjusting pixel values in the image based on a mean (imageMean) and standard deviation (imageStd). This process helps in bringing different images to a similar scale and distribution, which can be crucial for the performance of many models. The values of 127.5 for both mean and standard deviation suggest that the pixel values are being scaled to a [-1, 1] range, assuming the original pixel values are in the [0, 255] range. The specific values to use here depend on how the model was trained. If the model was trained with images preprocessed in a certain way, you should preprocess input images in the same way when making predictions.

The output of runModelOnImage would typically be a list of predictions made by the model, where each prediction includes details such as the predicted label (category) and the confidence score. Since numResults is set to 2, you'll get at most two of the highest confidence predictions (if any predictions meet the threshold criterion).
*/

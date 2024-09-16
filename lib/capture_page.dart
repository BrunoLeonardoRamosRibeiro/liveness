import 'package:flutter/material.dart';
import 'package:livelyness_detection/index.dart';
import 'package:livelyness_detection/livelyness_detection.dart';

class CapturePage extends StatefulWidget {
  const CapturePage({super.key});

  @override
  State<CapturePage> createState() => _CapturePageState();
}

class _CapturePageState extends State<CapturePage> {
  final List<LivelynessStepItem> _verificationSteps = [];
  int _timeOutDuration = 30;

  void _initValues() {
    _verificationSteps.addAll(
      [
        LivelynessStepItem(
          step: LivelynessStep.blink,
          title: "Blink",
          isCompleted: false,
          detectionColor: Colors.amber,
        ),
        LivelynessStepItem(
          step: LivelynessStep.smile,
          title: "Smile",
          isCompleted: false,
          detectionColor: Colors.green.shade800,
        ),
      ],
    );
    LivelynessDetection.instance.configure(
      lineColor: Colors.white,
      dotColor: Colors.purple.shade800,
      dotSize: 2.0,
      lineWidth: 2,
      dashValues: [2.0, 5.0],
      displayDots: false,
      displayLines: true,
      thresholds: [
        SmileDetectionThreshold(
          probability: 0.8,
        ),
        BlinkDetectionThreshold(
          leftEyeProbability: 0.25,
          rightEyeProbability: 0.25,
        ),
      ],
    );
  }

  @override
  void initState() {
    _initValues();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prova de Vida'),
      ),
    );
  }
}

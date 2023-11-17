import 'package:capstone_wms/main.dart';
import 'package:capstone_wms/screens/main/chatbot/Widgets/fields.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  final VoidCallback _sendTextMessage;
  final InputMode _inputMode;
  final bool _isReplying;
  final bool _isListening;
  const ToggleButton({
    super.key,
    required InputMode inputMode,
    required VoidCallback sendTextMessage,
    required bool isReplying,
    required bool isListening,
  })  : _inputMode = inputMode,
        _sendTextMessage = sendTextMessage,
        _isReplying = isReplying,
        _isListening = isListening;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorApp.mainColor,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(1),
        minimumSize: const Size(50, 50),
        maximumSize: const Size(50, 50),
      ),
      onPressed: widget._isReplying
          ? null
          : widget._inputMode == InputMode.text
              ? widget._sendTextMessage
              : widget._sendTextMessage,
      child: Icon(
        widget._inputMode == InputMode.text
            ? Icons.send
            : widget._isListening
                ? Icons.send
                : Icons.send,
      ),
    );
  }
}

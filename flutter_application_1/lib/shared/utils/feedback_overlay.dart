import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/palette.dart';

class FeedbackOverlay {
  static void show(BuildContext context, FeedbackTypesEnum type,
      {String message = ""}) {
    final OverlayState overlayState = Overlay.of(context);
    const Duration duration = Duration(seconds: 3);

    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.85,
        left: 10.0,
        right: 10.0,
        child: FeedbackComponent(
          type: type,
          showDuration: duration,
          onDismiss: () => overlayEntry.remove(),
          message: message,
        ),
      ),
    );

    overlayState.insert(overlayEntry);

    Future.delayed(duration).then((_) {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }
}

enum FeedbackTypesEnum { success, error, warning, loading }

class FeedbackComponent extends StatefulWidget {
  final FeedbackTypesEnum type;
  final Duration showDuration;
  final VoidCallback onDismiss;
  final String message;

  const FeedbackComponent({
    super.key,
    required this.type,
    required this.onDismiss,
    required this.showDuration,
    required this.message,
  });

  @override
  _FeedbackComponentState createState() => _FeedbackComponentState();
}

class _FeedbackComponentState extends State<FeedbackComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();

    Future.delayed(widget.showDuration).then((_) {
      if (mounted) {
        _controller.reverse().then((value) => widget.onDismiss());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color iconColor;
    Color textColor;
    IconData iconData;
    String defaultMessage;

    switch (widget.type) {
      case FeedbackTypesEnum.success:
        iconData = Icons.check_circle;
        defaultMessage = "Ação realizada com sucesso!";
        backgroundColor = successBC_700;
        iconColor = Colors.white;
        textColor = Colors.white;
        break;
      case FeedbackTypesEnum.error:
        iconData = Icons.error;
        defaultMessage = "Ocorreu um problema!";
        backgroundColor = dangerBC_400;
        iconColor = Colors.white;
        textColor = Colors.white;
        break;
      case FeedbackTypesEnum.warning:
        iconData = Icons.warning;
        defaultMessage = "Você deve preencher todos campos!";
        backgroundColor = warningBC_800;
        iconColor = surfaceBC_50;
        textColor = surfaceBC_50;
        break;
      case FeedbackTypesEnum.loading:
        iconData = Icons.refresh;
        defaultMessage = "Carregando...";
        backgroundColor = surfaceBC_50;
        iconColor = surface_800;
        textColor = surface_800;
        break;
    }

    return SlideTransition(
      position: _offsetAnimation,
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                iconData,
                color: iconColor,
                size: 25,
              ),
              Flexible(
                child: Text(
                  widget.message.isNotEmpty ? widget.message : defaultMessage,
                  style: TextStyle(color: textColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                splashRadius: 1,
                onPressed: widget.onDismiss,
                icon: Icon(Icons.close, color: iconColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

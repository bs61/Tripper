import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:trip/useful/data.dart';

class ActivityDetails extends StatefulWidget {
  Acts activity1;
  ActivityDetails({@required this.activity1});

  @override
  _ActivityDetailsState createState() => _ActivityDetailsState();
}

class _ActivityDetailsState extends State<ActivityDetails> {
  SheetController controller = SheetController();

  bool tapped = false;
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          // Image(image:AssetImage('assets/images/LOGO.png')),
          GestureDetector(
            onTap: () => setState(() => tapped = !tapped),
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: tapped ? 200 : 0,
              color: Colors.red,
            ),
          ),
          Expanded(
            child: buildSheet(widget.activity1),
          ),
        ],
      ),
    );
  }

  Widget buildSheet(Acts activity) {
    return SlidingSheet(
      duration: const Duration(milliseconds: 900),
      controller: controller,
      color: Colors.white,
      shadowColor: Colors.black26,
      elevation: 12,
      maxWidth: 500,
      cornerRadius: 16,
      cornerRadiusOnFullscreen: 0.0,
      closeOnBackdropTap: true,
      closeOnBackButtonPressed: true,
      addTopViewPaddingOnFullscreen: true,
      isBackdropInteractable: true,
      border: Border.all(
        color: Colors.grey.shade300,
        width: 3,
      ),
      snapSpec: SnapSpec(
        snap: true,
        positioning: SnapPositioning.relativeToAvailableSpace,
        snappings: const [
          SnapSpec.headerFooterSnap,
          0.6,
          SnapSpec.expanded,
        ],
        onSnap: (state, snap) {
          print('Snapped to $snap');
        },
      ),
      parallaxSpec: const ParallaxSpec(
        enabled: true,
        amount: 0.35,
        endExtent: 0.6,
      ),
      liftOnScrollHeaderElevation: 12.0,
      liftOnScrollFooterElevation: 12.0,
      body: _buildBody(activity),
      headerBuilder: buildHeader,
      footerBuilder: buildFooter,
      builder: buildChild,
    );
  }

  Widget buildHeader(BuildContext context, SheetState state) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 2),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 16,
              height: 4,
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 8),
          const SizedBox(height: 8),
          Text(
            'Fastest route now due to traffic conditions.',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget buildFooter(BuildContext context, SheetState state) {
    Widget button(
      Icon icon,
      Text text,
      VoidCallback onTap, {
      BorderSide border,
      Color color,
    }) {
      final child = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          icon,
          const SizedBox(width: 8),
          text,
        ],
      );

      const shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(18)),
      );

      return border == null
          ? RaisedButton(
              color: color,
              onPressed: onTap,
              elevation: 2,
              shape: shape,
              child: child,
            )
          : OutlineButton(
              color: color,
              onPressed: onTap,
              borderSide: border,
              shape: shape,
              child: child,
            );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          button(
            const Icon(
              Icons.navigation,
              color: Colors.white,
            ),
            Text(
              'Start',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            () async {
              // Inherit from context...
              await SheetController.of(context).hide();
              Future.delayed(const Duration(milliseconds: 1500), () {
                // or use the controller
                controller.show();
              });
            },
            color: Colors.blue,
          ),
          const SizedBox(width: 8),
          SheetListenerBuilder(
            buildWhen: (oldState, newState) =>
                oldState.isExpanded != newState.isExpanded,
            builder: (context, state) {
              final isExpanded = state.isExpanded;

              return button(
                Icon(
                  !isExpanded ? Icons.list : Icons.map,
                  color: Colors.blue,
                ),
                Text(
                  !isExpanded ? 'Steps & more' : 'Show map',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                !isExpanded
                    ? () => controller.scrollTo(state.maxScrollExtent)
                    : controller.collapse,
                color: Colors.white,
                border: BorderSide(
                  color: Colors.grey.shade400,
                  width: 2,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildChild(BuildContext context, SheetState state) {
    final divider = Container(
      height: 1,
      color: Colors.grey.shade300,
    );

    final titleStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

    const padding = EdgeInsets.symmetric(horizontal: 16);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        divider,
        const SizedBox(height: 32),
        InkWell(
          onTap: () => setState(() => show = !show),
          child: Padding(
            padding: padding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Traffic',
                  style: titleStyle,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        const SizedBox(height: 32),
        divider,
        const SizedBox(height: 32),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: padding,
              child: Text(
                'Steps',
                style: titleStyle,
              ),
            ),
            const SizedBox(height: 8),
            buildSteps(context),
          ],
        ),
        const SizedBox(height: 32),
        divider,
        const SizedBox(height: 32),
        Icon(
          Icons.flip_camera_android,
          color: Colors.grey.shade900,
          size: 48,
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Pull request are welcome!',
            style: TextStyle(
              color: Colors.grey.shade700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.center,
          child: Text(
            '(Stars too)',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget buildSteps(BuildContext context) {
    final steps = [
      Step('Go to your pubspec.yaml file.', '2 seconds'),
      Step("Add the newest version of 'sliding_sheet' to your dependencies.",
          '5 seconds'),
      Step("Run 'flutter packages get' in the terminal.", '4 seconds'),
      Step("Happy coding!", 'Forever'),
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: steps.length,
      itemBuilder: (context, i) {
        final step = steps[i];

        return Padding(
          padding: const EdgeInsets.fromLTRB(56, 16, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                step.instruction,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: <Widget>[
                  Text(
                    '${step.time}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  Future<void> showBottomSheetDialog(BuildContext context) async {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final controller = SheetController();
    bool isDismissable = false;

    await showSlidingBottomSheet(
      context,
      // The parentBuilder can be used to wrap the sheet inside a parent.
      // This can be for example a Theme or an AnnotatedRegion.
      parentBuilder: (context, sheet) {
        return Theme(
          data: ThemeData.dark(),
          child: sheet,
        );
      },
      // The builder to build the dialog. Calling rebuilder on the dialogController
      // will call the builder, allowing react to state changes while the sheet is shown.
      builder: (context) {
        return SlidingSheetDialog(
          controller: controller,
          duration: const Duration(milliseconds: 500),
          snapSpec: const SnapSpec(
            snap: true,
            initialSnap: 0.7,
            snappings: [
              0.3,
              0.7,
            ],
          ),
          scrollSpec: const ScrollSpec(
            showScrollbar: true,
          ),
          color: Colors.teal,
          maxWidth: 500,
          minHeight: 700,
          isDismissable: isDismissable,
          dismissOnBackdropTap: true,
          isBackdropInteractable: true,
          onDismissPrevented: (backButton, backDrop) async {
            if (backButton || backDrop) {
              const duration = Duration(milliseconds: 300);
              await controller.snapToExtent(0.2,
                  duration: duration, clamp: false);
              await controller.snapToExtent(0.4, duration: duration);
              // or Navigator.pop(context);
            }

            // Or pop the route
            // if (backButton) {
            //   Navigator.pop(context);
            // }

            print('Dismiss prevented');
          },
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Confirm purchase',
                    style: textTheme.headline4.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sagittis tellus lacus, et pulvinar orci eleifend in.',
                          style: textTheme.subtitle1.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Icon(
                        isDismissable ? Icons.check : Icons.error,
                        color: Colors.white,
                        size: 56,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          footerBuilder: (context, state) {
            return Container(
              color: Colors.teal.shade700,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
                      style: textTheme.subtitle1.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  FlatButton(
                    onPressed: () {
                      if (!isDismissable) {
                        isDismissable = true;
                        SheetController.of(context).rebuild();
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      'Approve',
                      style: textTheme.subtitle1.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildBody(Acts activity1) {
    return Stack(
      children: <Widget>[
        buildMap(activity1),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                0, MediaQuery.of(context).padding.top + 16, 16, 0),
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildMap(Acts activity2) {
    return GestureDetector(
      onTap: () => setState(() => tapped = !tapped),
      child: Column(
        children: <Widget>[
          Expanded(
              child: GestureDetector(
                onTap: (){
                  print(Images(activity2).toString());
                },
                child: Carousel(
            images: Images(activity2),
          ),
              )),
          //   Image.asset(
          //     'assets/images/LOGO.png',
          //     width: double.infinity,
          //     height: double.infinity,
          //     alignment: Alignment.center,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          const SizedBox(height: 56),
        ],
      ),
    );
  }
}

List<Widget> Images(Acts activ) {
  List<Widget> img = [];
  for (var i in activ.imageUrl) {
    img.add(Image.asset(
      i,
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.cover,
    ));

  }
  return img ;
}

class Step {
  final String instruction;
  final String time;
  Step(
    this.instruction,
    this.time,
  );
}

class Traffic {
  final double intesity;
  final String time;
  Traffic(
    this.intesity,
    this.time,
  );
}

import 'package:flutter/material.dart';

class ActivitiesContainer extends StatefulWidget {
  final String image, title, desc, count;
  final double currentSliderValue, min, max;
  final Color sliderColor;

  ActivitiesContainer({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.count,
    required this.currentSliderValue,
    required this.min,
    required this.max, // Corrected 'mix' to 'max'
    required this.sliderColor,
  });

  @override
  State<ActivitiesContainer> createState() => _ActivitiesContainerState();
}

class _ActivitiesContainerState extends State<ActivitiesContainer> {
  late double _currentSliderValue;

  @override
  void initState() {
    super.initState();
    _currentSliderValue = widget.currentSliderValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.46,
        decoration: BoxDecoration(
            color: Color(0xff061321), borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Image(image: AssetImage(widget.image), width: 50, height: 50),
                SizedBox(width: 10),
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            Text(
              widget.desc,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              _currentSliderValue.toStringAsFixed(0),
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                    width: 130, // Decreased width of the slider
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 20.0, // Increased height of the slider
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 10.0), // Custom thumb size
                        overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 20.0), // Custom overlay size
                      ),
                      child: Slider(
                        activeColor: widget.sliderColor,
                        min: widget.min,
                        max: widget.max,
                        value: _currentSliderValue,
                        onChanged: (value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                    )),
                Text(
                  widget.count,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

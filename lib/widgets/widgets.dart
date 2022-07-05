import 'package:flutter/material.dart';
import 'package:ashrafulaid/widgets/colors.dart';

class PostTile extends StatelessWidget {
  final Color tileColor;
  final String postTitle;
  final String category;
  final void Function() onTileTap;
  final String imagename;
  final void Function() buttonDonate;
  final void Function() buttonView;

  const PostTile({
    Key? key,
    required this.tileColor,
    required this.postTitle,
    required this.category,
    required this.onTileTap,
    required this.imagename,
    required this.buttonDonate,
    required this.buttonView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTileTap,
      child: LayoutBuilder(
        builder: (context, orientation) =>
            orientation.maxWidth < 600 ? buildPortrait() : buildLandScape(),
      ),
    );
  }

  Widget buildPortrait() => Card(
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Ink.image(
              image: AssetImage(imagename),
              height: 180,
              fit: BoxFit.cover,
            ),
            ListTile(
              leading: const Icon(
                Icons.arrow_drop_down_circle,
                color: Colors.green,
              ),
              title: Text(postTitle),
              subtitle: Text(
                category,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: buttonView,
                  child: const Text("Read More"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    minimumSize: const Size(90, 20),
                    alignment: Alignment.center,
                    animationDuration: const Duration(microseconds: 200),
                    shadowColor: Colors.grey,
                  ),
                ),
                ElevatedButton(
                  onPressed: buttonDonate,
                  child: const Text("Donate Now"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    primary: AppColor.mainColor,
                    onPrimary: Colors.white,
                    minimumSize: const Size(90, 20),
                    alignment: Alignment.center,
                    animationDuration: const Duration(microseconds: 200),
                    shadowColor: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      );

  Widget buildLandScape() => Card(
        margin: const EdgeInsets.only(bottom: 10),
        color: tileColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 150,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(
                      width: 1,
                      color: Colors.green,
                    ),
                    // ignore: prefer_const_constructors
                    image: DecorationImage(
                      image: AssetImage(imagename),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 60,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      postTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                      ),
                    ),
                    Text(
                      category,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      ElevatedButton(
                        onPressed: buttonView,
                        child: const Text(
                          "View More",
                          style: TextStyle(fontSize: 24),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20),
                          primary: Colors.green,
                          onPrimary: Colors.white,
                          minimumSize: const Size(90, 25),
                          alignment: Alignment.center,
                          animationDuration: const Duration(microseconds: 200),
                          shadowColor: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: buttonDonate,
                        child: const Text(
                          "Donate Now",
                          style: TextStyle(fontSize: 24),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20),
                          primary: AppColor.mainColor,
                          onPrimary: Colors.white,
                          minimumSize: const Size(90, 25),
                          alignment: Alignment.center,
                          animationDuration: const Duration(microseconds: 200),
                          shadowColor: Colors.grey,
                        ),
                      ),
                    ])
                  ],
                ),
              ],
            ),
          ],
        ),
      );
}

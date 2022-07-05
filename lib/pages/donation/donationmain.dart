import 'package:ashrafulaid/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DonationsMainPage extends StatefulWidget {
  const DonationsMainPage({Key? key}) : super(key: key);

  @override
  DonationsMainPageState createState() {
    return DonationsMainPageState();
  }
}

class DonationsMainPageState extends State<DonationsMainPage> {
  late WebViewController controller;
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await controller.canGoBack()) {
          controller.goBack();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.kPrimaryColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              if (await controller.canGoBack()) {
                controller.goBack();
              }
            },
          ),
          actions: [
            IconButton(
              onPressed: () async {
                controller.clearCache();
                CookieManager().clearCookies();
              },
              icon: const Icon(Icons.clear),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 25,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .08,
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Image.asset('assets/images/logo.png'),
                ),
                const Spacer(),
                const SizedBox(
                  width: 15,
                  height: 15,
                )
              ],
            ),
          ),
          flexibleSpace: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(160),
              bottomRight: Radius.circular(160),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, AppColor.kPrimaryColor],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        ),
        body: Column(
          children: [
            //
            Expanded(
              child: WebView(
                initialUrl: 'https://ashrafaid.org/donations/',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (controller) {
                  this.controller = controller;
                },
                onProgress: (progress) =>
                    setState(() => this.progress = progress / 100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

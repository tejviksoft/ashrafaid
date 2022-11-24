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
  bool isLoading = true;
  final _key = UniqueKey();
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
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: AppColor.kPrimaryColor,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 25,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .08,
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Image.asset('assets/images/logo.png'),
                ),
                const Spacer(),
                const SizedBox(
                  width: 15,
                  height: 15,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.contact_phone,
                    color: Color.fromARGB(223, 124, 12, 169),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const ListTile(
                                leading: Icon(Icons.phone_android,
                                    color: Color.fromARGB(223, 124, 12, 169)),
                                title: Text(
                                  '+27 11 809 8181',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: const Icon(Icons.email,
                                    color: Color.fromARGB(223, 124, 12, 169)),
                                title: const Text(
                                  'info@ashrafulaid.org',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                    color: Colors.black,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.location_city,
                                    color: Color.fromARGB(223, 124, 12, 169)),
                                title: const Text(
                                  '14 Zinnia Drive, Marlboro Gardens, South Africa',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                    color: Colors.black,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                            ],
                          );
                        });
                  },
                )
              ],
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            WebView(
              key: _key,
              initialUrl: 'https://ashrafaid.org/donations/',
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (finish) {
                setState(() {
                  isLoading = false;
                });
              },
              onWebViewCreated: (controller) {
                this.controller = controller;
              },
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(),
          ],
        ),
      ),
    );
  }
}

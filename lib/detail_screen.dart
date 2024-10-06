import 'package:flutter/material.dart';
import '/daftar_hewan.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
      color: Colors.red,
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}

class DetailScreen extends StatelessWidget {
  final DaftarHewan hewan;
  const DetailScreen({super.key, required this.hewan});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth <= 600) {
        return DetailScreenMobile(hewan: hewan);
      } else {
        return DetailScreenBrowser(hewan: hewan);
      }
    });
  }
}

class DetailScreenBrowser extends StatefulWidget {
  final DaftarHewan hewan;
  const DetailScreenBrowser({super.key, required this.hewan});

  @override
  State<DetailScreenBrowser> createState() => _DetailScreenBrowserState();
}

class _DetailScreenBrowserState extends State<DetailScreenBrowser> {
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.amber,
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.9,
        child: LayoutBuilder(builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: constraints.maxWidth * 0.5,
                height: constraints.maxHeight,
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * 0.5,
                        color: const Color.fromARGB(188, 233, 231, 231),
                        child: Image.asset(widget.hewan.imgAsset),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 180,
                      width: constraints.maxWidth,
                      child: Scrollbar(
                        controller: scrollController,
                        child: ListView.builder(
                          controller: scrollController,
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.hewan.imageUrls.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    width: 200,
                                    color: const Color.fromARGB(
                                        180, 212, 212, 212),
                                    child: Image.asset(
                                      widget.hewan.imageUrls[index],
                                    ),
                                  )),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: constraints.maxWidth * 0.48,
                  padding: EdgeInsets.all(30),
                  color: Color.fromARGB(252, 10, 104, 71),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          widget.hewan.namaHewan,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 219, 223, 227),
                              fontFamily: "Ubuntu",
                              fontSize: 32,
                              decoration: TextDecoration.none),
                        ),
                      ),
                      Container(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * 0.2,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    const Icon(Icons.pets_rounded),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      widget.hewan.kelompokHewan,
                                      style: const TextStyle(
                                        decoration: TextDecoration.none,
                                        color:
                                            Color.fromARGB(255, 219, 223, 227),
                                        fontFamily: "Ubuntu",
                                        fontSize: 18,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: <Widget>[
                                    const Icon(Icons.alarm),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      widget.hewan.umurHewan,
                                      style: const TextStyle(
                                        decoration: TextDecoration.none,
                                        color:
                                            Color.fromARGB(255, 219, 223, 227),
                                        fontFamily: "Ubuntu",
                                        fontSize: 18,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: <Widget>[
                                    const Icon(Icons.balance),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      widget.hewan.statusHewan,
                                      style: const TextStyle(
                                        decoration: TextDecoration.none,
                                        color:
                                            Color.fromARGB(255, 219, 223, 227),
                                        fontFamily: "Ubuntu",
                                        fontSize: 18,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(),
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          width: constraints.maxWidth,
                          height: constraints.maxHeight * 0.3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.hewan.deskripsiHewan,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Color.fromARGB(255, 219, 223, 227),
                                  fontFamily: "Ubuntu",
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

class DetailScreenMobile extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final DaftarHewan hewan;
  const DetailScreenMobile({super.key, required this.hewan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset(hewan.imgAsset),
                  SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: IconButton(
                            icon: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(127, 65, 62, 63),
                              ),
                              padding: const EdgeInsets.all(5),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Color.fromARGB(200, 230, 228, 227),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const LikeButton(),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  hewan.namaHewan,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamilyFallback: ['Lexend', 'Roboto'],
                    fontSize: 28,
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: hewan.imageUrls.map((url) {
                    return Padding(
                      // Add 'return' here
                      padding: const EdgeInsets.all(4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(url),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                child: Text(
                  hewan.namaHewan,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      fontSize: 18, fontFamilyFallback: ['Ubuntu', 'Roboto']),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          const Icon(Icons.calendar_today),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(hewan.kelompokHewan)
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          const Icon(Icons.attach_money_rounded),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(hewan.statusHewan)
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          const Icon(Icons.alarm),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(hewan.umurHewan)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

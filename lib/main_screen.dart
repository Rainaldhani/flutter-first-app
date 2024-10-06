import 'package:flutter/material.dart';
import '/detail_screen.dart';
import '/daftar_hewan.dart';

class MainScreenGridView extends StatelessWidget {
  const MainScreenGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.8,
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: daftarHewanList.map((listHewan) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return DetailScreen(
                      hewan: listHewan,
                    );
                  }),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Stack(
                  children: <Widget>[
                    Container(
                      color: const Color.fromARGB(15, 46, 46, 46),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            listHewan.imgAsset,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: Color.fromARGB(170, 230, 228, 227),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            listHewan.namaHewan,
                            style: const TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class MainScreenListView extends StatelessWidget {
  const MainScreenListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final DaftarHewan listHewan = daftarHewanList[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return DetailScreen(
                  hewan: listHewan,
                );
              }),
            );
          },
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    listHewan.imgAsset,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listHewan.namaHewan,
                          style: const TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          listHewan.namaHewan,
                          style: const TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 24,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: daftarHewanList.length,
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Galeri Kita",
          style: TextStyle(
            fontFamily: 'Lexend',
            fontSize: 18,
          ),
        ),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return const MainScreenListView();
        } else {
          return const MainScreenGridView();
        }
      }),
    );
  }
}

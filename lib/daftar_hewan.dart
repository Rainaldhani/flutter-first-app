class DaftarHewan {
  String namaHewan;
  String kelompokHewan;
  String statusHewan;
  String umurHewan;
  String deskripsiHewan;
  String imgAsset;
  List<String> imageUrls;

  DaftarHewan({
    required this.namaHewan,
    required this.kelompokHewan,
    required this.statusHewan,
    required this.umurHewan,
    required this.deskripsiHewan,
    required this.imgAsset,
    required this.imageUrls,
  });
}

var daftarHewanList = [
  DaftarHewan(
      namaHewan: 'Flamingo',
      kelompokHewan: "Unggas",
      statusHewan: "Rentan",
      umurHewan: "20 tahun - 30 tahun",
      deskripsiHewan:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      imgAsset: "assets/images/flamingo.png",
      imageUrls: [
        "assets/images/flamingo.png",
        "assets/images/flamingo.png",
        "assets/images/flamingo.png",
      ]),
  DaftarHewan(
      namaHewan: "Brown Fox",
      kelompokHewan: "Mamalia",
      statusHewan: "Resiko Rendah",
      umurHewan: "1 tahun - 3 tahun",
      deskripsiHewan:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      imgAsset: "assets/images/regular_fox.png",
      imageUrls: [
        "assets/images/regular_fox.png",
        "assets/images/regular_fox.png",
        "assets/images/regular_fox.png",
      ]),
  DaftarHewan(
      namaHewan: "Rubah Arktik",
      kelompokHewan: "Mamalia",
      statusHewan: "Baik - Terancam",
      umurHewan: "1 tahun - 3 tahun",
      deskripsiHewan:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      imgAsset: "assets/images/white_fox.png",
      imageUrls: [
        "assets/images/white_fox.png",
        "assets/images/white_fox.png",
        "assets/images/white_fox.png",
      ])
];

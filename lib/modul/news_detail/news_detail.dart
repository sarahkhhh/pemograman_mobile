import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: NewsListScreen(),
    );
  }
}

class NewsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita Terbaru'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          final newsId = (index + 1).toString();
          return ListTile(
            title: Text('Berita $newsId'),
            subtitle: Text('Deskripsi Berita $newsId'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailScreen(
                    newsId: newsId,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({Key? key, required this.newsId}) : super(key: key);
  final String newsId;

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resep Lengkap'),
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            child: Image.network(
              "assets/resep2.png",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Text(
                  'Reser ke ${widget.newsId}. Bahan-bahan: 250 gram daging sapi, iris sesuai selera, 4 siung bawang putih (haluskan), Bubuk merica (secukupnya), Garam (secukupnya), Gula (secukupnya), Bubuk kaldu daging sapi (sesuai selera), Kecap manis (secukupnya), Minyak goreng (secukupnya), 1 buah jeruk nipis, peras airnya, Air. Cara Membuat Steak Daging Sapi:Lumuri daging sapi dengan jeruk nipis dan diamkan kira-kira selama 5 menit, Siapkan wajan, Lumuri daging sapi dengan bumbu halus, garam, merica bubuk, kaldu daging bubuk, kecap manis dan sedikit gula, Olesi daging dengan minyak sesuai selera lalu panggang di atas wajan datar, Bolak-balik daging hingga matang secara merata, Biarkan bumbu meresap dengan baik di dalam daging, tambahkan pula sedikit air dan biarkan bumbu mengental, Jika sudah matang, angkat steak lalu sajikan di piring saji, Sajikan steak dengan bahan pelengkap sesuai dengan selera, Tambahkan juga saus tomat atau sambal atau saus BBQ sesuai dengan selera.',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}

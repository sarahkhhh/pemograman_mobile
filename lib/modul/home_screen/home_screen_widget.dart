import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pertemuan_lima/configs/app_routes.dart';
import 'package:pertemuan_lima/models/user.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Haloo...",
            ),
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Expanded(
          child: SizedBox(),
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(
            user.profileImage ??
                "https://www.msahq.org/wp-content/uploads/2016/12/default-avatar.png",
          ),
        ),
      ],
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
  });

  @override
  //ini ikon diluhur
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        menuItem(
          iconData: Icons.home_rounded,
          label: "Home",
        ),
        menuItem(
          iconData: Icons.fireplace_rounded,
          label: "Hot News",
        ),
        menuItem(
          iconData: Icons.landscape_rounded,
          label: "Land",
        ),
        menuItem(
          iconData: Icons.location_city_rounded,
          label: "Townhouse",
        ),
      ],
    );
  }

  Widget menuItem({
    required IconData iconData,
    required String label,
  }) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 72,
        maxWidth: 72,
        minHeight: 72,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 236, 151, 184),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              iconData,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class SearchBoxWidget extends StatelessWidget {
  const SearchBoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 14,
      ),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        isDense: true,
        hintText: "Silahkan Cari Resep Disini",
        filled: true,
        fillColor: Color.fromARGB(255, 248, 177, 201),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
          gapPadding: 0,
        ),
        suffixIcon: const Icon(
          Icons.search,
          size: 20,
        ),
      ),
    );
  }
}

class ExpandedSectionWidget extends StatelessWidget {
  const ExpandedSectionWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          label: "Selamat Datang Di Cooking Mama",
        ),
        const SizedBox(
          height: 8,
        ),
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: (size.width - 32) * 0.55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 255, 161, 205),
                image: const DecorationImage(
                  image: NetworkImage(
                    "assets/gambar.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: Text(
                  "",
                ),
              ),
            ),
            const Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Lets Cook",
                    style: TextStyle(
                      color: Color.fromARGB(255, 148, 16, 16),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const Icon(
          Icons.chevron_right_rounded,
          color: Color.fromARGB(255, 226, 143, 161),
        ),
      ],
    );
  }
}

class ConstrainedBoxWidget extends StatelessWidget {
  const ConstrainedBoxWidget({
    super.key,
    required this.size,
    required this.categories,
  });

  final Size size;
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          label: "Buku Resep",
        ),
        const SizedBox(
          height: 8,
        ),
        ConstrainedBox(
          constraints: BoxConstraints.expand(
            width: size.width,
            height: (size.width * 0.2) * 2 + 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < 2; i++)
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).goNamed(
                          AppRoutes.newsDetail,
                          params: {
                            "id": "$i",
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 1,
                              spreadRadius: 0,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: size.width * 0.2,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 248, 147, 189),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "assets/resep2.png",
                                  ),
                                ),
                              ),
                              child: const AspectRatio(
                                aspectRatio: 1 / 1,
                              ),
                            ),
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Bahan dan cara Pembuatan",
                                  maxLines: 3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class AspectRatioWidget extends StatelessWidget {
  const AspectRatioWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Aspect Ratio",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.red,
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://picsum.photos/400",
                    ),
                  ),
                ),
                child: const AspectRatio(
                  aspectRatio: 1 / 1,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              width: size.width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.red,
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://picsum.photos/1080/607",
                  ),
                ),
              ),
              child: const AspectRatio(
                aspectRatio: 16 / 9,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PopularSectionWidget extends StatelessWidget {
  const PopularSectionWidget({
    super.key,
    required this.categories,
  });

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Most Popular",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: categories.map((e) => wrapItem(e)).toList(),
        ),
      ],
    );
  }

  Widget wrapItem(String label) {
    return Chip(
      label: Text(
        label,
      ),
    );
  }
}

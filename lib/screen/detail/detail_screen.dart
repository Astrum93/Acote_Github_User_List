import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String userRepoUrl;
  final String userName;

  const DetailScreen({
    super.key,
    required this.userRepoUrl,
    required this.userName,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  _DetailScreenState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.userName,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                '리포지토리',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: ListView.separated(
          itemCount: 30,
          separatorBuilder: (context, index) => const Divider(
            color: Colors.grey,
            height: 0.1,
          ),
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            height: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'repository name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  'repository intro',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '0',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      size: 14,
                      Icons.circle_rounded,
                      color: Colors.amber,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'dart',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 17,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

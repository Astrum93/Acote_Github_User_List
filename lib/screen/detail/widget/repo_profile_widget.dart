import 'package:flutter/material.dart';

class RepoProfile extends StatelessWidget {
  const RepoProfile({
    super.key,
    required this.name,
    required this.description,
    required this.stargazersCount,
    required this.language,
    required this.private,
  });

  final String name;
  final String description;
  final int stargazersCount;
  final String language;
  final bool private;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      width: MediaQuery.of(context).size.width,
      // height: 110,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Repo Name
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),

          /// Repo Description
          description.isEmpty
              ? const SizedBox()
              : Text(
                  description,
                  maxLines: 3,
                  style: const TextStyle(fontSize: 17),
                ),
          const SizedBox(height: 20),
          Row(
            children: [
              /// Repo StargazersCount
              const Icon(
                Icons.star_rounded,
                color: Colors.amber,
              ),
              const SizedBox(width: 5),
              Text(
                stargazersCount.toString(),
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 17,
                ),
              ),
              const SizedBox(width: 10),

              /// Repo Used Language
              language.isEmpty
                  ? const SizedBox()
                  : const Icon(
                      size: 14,
                      Icons.circle_rounded,
                      color: Colors.greenAccent,
                    ),
              language.isEmpty ? const SizedBox() : const SizedBox(width: 5),
              language.isEmpty
                  ? const SizedBox()
                  : Text(
                      language,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 17,
                      ),
                    )
            ],
          )
        ],
      ),
    );
  }
}

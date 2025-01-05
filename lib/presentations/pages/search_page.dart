import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_notes/presentations/widgets/custom/custom_container2.dart';
import 'package:pretty_notes/src/setting/custom_colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            onChanged: (value) => setState(() => _searchText = value),
            decoration: const InputDecoration(
              hintText: 'Search...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 20),
          Flexible(
            child: CustomContainer2(
              color: CustomColors.primary,
              maxHeight: MediaQuery.sizeOf(context).height * 0.6,
              child: _searchText.isEmpty
                  ? Center(
                      child: Text(
                        'Enter search query',
                        style: GoogleFonts.poppins(fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: 10, // Replace with actual result count
                      itemBuilder: (context, index) {
                        // Replace with actual result data
                        return ListTile(
                          title: Text('Result ${index + 1}'),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

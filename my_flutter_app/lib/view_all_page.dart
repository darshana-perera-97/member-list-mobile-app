import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ViewAllPage extends StatefulWidget {
  @override
  _ViewAllPageState createState() => _ViewAllPageState();
}

class _ViewAllPageState extends State<ViewAllPage> {
  List<dynamic> data = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = Uri.parse('http://69.197.187.24:5001/data');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          data = json.decode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View All Page'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : data.isEmpty
              ? Center(child: Text('No data available'))
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('NIC')),
                      DataColumn(label: Text('Mobile')),
                      DataColumn(label: Text('WhatsApp')),
                      DataColumn(label: Text('Address')),
                      DataColumn(label: Text('DOB')),
                      DataColumn(label: Text('Region')),
                      DataColumn(label: Text('RegID')),
                    ],
                    rows: data.map((item) {
                      return DataRow(cells: [
                        DataCell(Text(item['name'] ?? '')),
                        DataCell(Text(item['nic'] ?? '')),
                        DataCell(Text(item['mobile1'] ?? '')),
                        DataCell(Text(item['whatsapp'] ?? '')),
                        DataCell(Text(item['address'] ?? '')),
                        DataCell(Text(item['dob'] ?? '')),
                        DataCell(Text(item['region']['label'] ?? '')),
                        DataCell(Text(item['RegID'] ?? '')),
                      ]);
                    }).toList(),
                  ),
                ),
    );
  }
}


import 'package:flutter/material.dart';

    class SearchInput extends StatefulWidget {
      @override
      State<SearchInput> createState() => _SearchInputState();
    }
    
    class _SearchInputState extends State<SearchInput> {
      @override
      Widget build(BuildContext context) {
        return Container(
          margin: EdgeInsets.only(top: 25, left: 25, right: 25),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: TextField(
                      cursorColor: const Color.fromARGB(255, 120, 120, 120),
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        filled: true,
                        
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: const Color.fromARGB(255, 120, 120, 120), width: 1)
                        ),
                        hintText: 'Tìm Kiếm',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18
                        ),
                        prefixIcon: Container(
                          padding: EdgeInsets.all(15),
                          child: Icon(  Icons.search, color: Colors.grey),),
                        )
                      ),
                    ),
                  



                ],
              )
            ],
          ),
        
        );
      }
    }

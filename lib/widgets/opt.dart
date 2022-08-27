import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Opt extends StatefulWidget {
  const Opt({Key? key,}) : super(key: key);

  @override
  State<Opt> createState() => _OptState();
}

class _OptState extends State<Opt> {

    
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,

        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: (value){
          if(value.length == 1 ) {
            FocusScope.of(context).nextFocus();
          }
          if(value.isEmpty){
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: const InputDecoration(
          hintText: "0",
         border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green,) 
         )
        ),
      ),
    );
  }
}
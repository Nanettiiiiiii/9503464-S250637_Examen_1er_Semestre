import 'package:nanao/student.details.dart';
import 'package:nanao/models/student.dart';
import 'package:flutter/material.dart';

class Studentlist extends StatefulWidget {
  const Studentlist({super.key});

  @override
  State<Studentlist> createState() => _StudentlistState();
}

class _StudentlistState extends State<Studentlist> {
  List<Student> students =[ 
      Student("S502026","KONE","Aicha","3II","Note finale:"),
      Student("S503240","DIAGNE","Fatima","5FM","Note finale:"),
      Student("S501848","SY","Zahara","2IG","Note finale:"),
      Student("S502214","CISSE","Amadou","CPB","Note finale:"),
      Student("S507206","HAÏDARA","Coumba","3II","Note finale:"),
      Student("S502214","SKY","Davis","CPB","Note finale:"),
    
   ];

   var variable= false;
   TextEditingController number= TextEditingController();
   TextEditingController nom= TextEditingController();
   TextEditingController prenom= TextEditingController();
   TextEditingController classe= TextEditingController();
   TextEditingController noteFinale= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des étudiants"),
        actions: [
          InkWell(
            onTap: (){
              variable= !variable;
              setState(() {
                
              });
              print("affichage de la liste $variable");
            },
            child: Icon(Icons.add, ))
        ],
      ),
      body:variable? showlistview():Column(
        children: [
       Text("Enregistrement d'un étudiant"),

         TextField(
          controller:number,
          decoration: InputDecoration(
            labelText:"Numero d'étudiant",
            hintText: "entrez votre numero d'identification",
          )
          ),

        SizedBox(height:10,),
         TextField(
          controller:nom,
          decoration: InputDecoration(
            labelText:"nom",
            hintText: "entrer votre nom",
          )
          ),

        SizedBox(height:10,),
        TextField(
          controller:prenom,
          decoration: InputDecoration(
            labelText:"prenom",
            hintText: "entrer votre prenom",
          )
          ),

        SizedBox(height:10,),
        TextField(
          controller:classe,
          decoration: InputDecoration(
            labelText:"votre classe",
            hintText: "entrez votre classe",
          )
          ),
          SizedBox(height:10,),
          TextField(
            controller:noteFinale,
          decoration: InputDecoration(
            labelText:" votre note finale",
            hintText: "saissir la note finale"
          )
          ),
          ElevatedButton(onPressed:(){
            print("Enregistrement en cours......");
            variable=true;
            print("nom:${nom.text}");
            if( number.text.isEmpty  ||nom.text.isEmpty  || prenom.text.isEmpty  || classe.text.isEmpty || noteFinale.text.isEmpty ){
               ScaffoldMessenger.of(context).showSnackBar(
                               SnackBar(content: Text("veuillez remplir tous les champs"),));
                               print("veuillez remplir tous les champs");
            }else{
              Student c= Student(number.text,nom.text, prenom.text, classe.text, noteFinale.text);
              students.add(c);
               number.text="";
               nom.text="";
               prenom.text="";
               classe.text="";
               noteFinale.text="";
              variable=true;
               ScaffoldMessenger.of(context).showSnackBar(
                               SnackBar(content: Text("Enregistrer"),));
            }
            setState(() {
              
            });
            
          }, child: Text("Enregistrer"))
          ],
      )
    );
  }
  Widget showlistview(){
     return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index){
        return InkWell(
          onDoubleTap: (){
            students.remove(students[index]);
            setState(() {
              
            });
          },

          onTap: () {
             Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => 
                Studentdetails(student: students[index],)
                ),
                
            );
          },
          child: Card(
            elevation: 10,
            child: ListTile(
            title: Text(students[index].nom),
            subtitle: Text(students[index].number),
                  ),
          ),
        );
      });
    }
}
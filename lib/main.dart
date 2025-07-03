import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;//API module9
import 'dart:convert' as convert;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // MaterialApp=>c'est un template de Root sous un theme material design(ce n'est pas de la page)
    return MaterialApp(
      title: 'Flutter Demo',//onglet
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),//vest un attribut pour la page default de l'appli
      //initialRoute: "/",
      //routes: MyRoute.getRoutes(context),//liste des pages connue par l'appli avec son l'URL pour navigeur
    );
  }
}
/*module8 Routes
class MyRoute {
  Map<String, WidgetBuilder> getRoutes(BuildContext context){
    return {
      "/" : (context)=> MyHomePage(),
      "/page-two" :(context)=>PageTwo()
    };
  }

}
 */
//Demo Layout Widget
/*
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(//une Scaffold = une page de material design
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Ma page"),
      ),
      body: SingleChildScrollView(
        child: Container(

          color: Colors.pink,
          child: Row(
            children: [
              Column(
                children: [
                  Expanded(child: Text("Row->Child->colum->children->expanded-text1")),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Text("Row->Colonne->Padding->child Text 2"),
                  ),
                  Text("text3"),
                ],
              ),
              Text("Text 4"),
              Flex(direction: Axis.vertical,
                children: [
                  Text("Flex 1 "),
                  Text("Flex 2 ")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
*/

//Demo Widget 2
/*
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(//une Scaffold = une page de material design
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Ma page"),
      ),
     body: Center(child: Column(
      children: [
        Text("Mon texte", style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 32 ),),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: (){}, child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Mon bouton"),
          )),
        ),
        OutlinedButton(onPressed:(){} , child: Text("Mon Bouton outloned")),
        Image.network("https://tech.pelmorex.com/wp-content/uploads/2020/10/flutter.png"),
        Image.asset("/assets/62649.jpg")//il faut definier pubspec.yaml et redemmarer
      ],
    ),
    ),
    );
  }
}
*/

//Demo_formulaire_module7 1==========================================
/*
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( //une Scaffold = une page de material design
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text("Ma page"),
      ),
      body: Center(child: DemoForm(),
      ),
    );
  }
}

//これと
class DemoForm extends StatefulWidget{
  @override
  State<DemoForm> createState() => _DemoFormState();
}
//これはセットね,メイン側で呼び出す
class _DemoFormState extends State<DemoForm>{
  bool mySwitchValue = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      Switch(value: mySwitchValue, onChanged: (value){
        setState(() {
          mySwitchValue = value;
        });

      })
    ],);
  }
}
 */
//===================================================================

//Demo_formulaire_module7 2 ajouter la validation==========================================
/*
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( //une Scaffold = une page de material design
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text("Ma page"),
      ),
      body: Center(child: DemoForm(),
      ),
    );
  }
}

//これと
class DemoForm extends StatefulWidget{
  @override
  State<DemoForm> createState() => _DemoFormState();
}
//これはセットね,メイン側で呼び出す
class _DemoFormState extends State<DemoForm>{
  var _formkey = GlobalKey<FormState>();

  //pour validation
  String? validateEmail(String? value){
    //erreur :1
    if(value!.isEmpty){
      return "Le champs est obligatoire";
    }

    //erreur:2
    if(value!.length < 3) {
      return "Veillez saisir au moins 3 caracteres";
    }
    return null;
  }

  String? validatePassword(String? value){
    //erreur :1
    if(value!.isEmpty){
      return "Le champs est obligatoire";
    }
  }

  void onSubmit(){
    //pour enclencher la validation du formulaire
    //quand la formulaire est valide
    if(_formkey.currentState!.validate()) {
     //faire du traitement
     //Ex: appel web service
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        key: _formkey,
        child: Column(
          children: [
            TextFormField(
              //champs email
              decoration: InputDecoration(
                  labelText: "Email", hintText: "Veuillez saisir un email"),
              validator: validateEmail,//上で定義している
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Mot de passe", hintText: "Veuillez saisir votre mot de passe"),
              obscureText: true,
                validator: validatePassword,//上で定義している
              ),
            ElevatedButton(onPressed: onSubmit, child: Text("Submit!!"))
    ],));
  }
}
 */
//============================================================================
//Module8 Routes
/*
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(//une Scaffold = une page de material design
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Ma page"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("hiroe"),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, "/page-two");
            }, child: Text("Ouvitrir page 2"))
          ],
        ),
      )
    );
  }
}

//page pile
class PageTwo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page two"),
      ),
      body: Center(
        child: Text("To do page two"),)
      );
    }
}

 */
//==========================================================================
//Module9 API web service
class Movie{
  int id;
  String title;
  String description;
//

  Movie(this.id, this.title, this.description);
//retrouve une instance de film depuis des données en Json
  static Movie fromJson(Map<String, dynamic> json){
    return Movie(json['id'], json['title'], json['description']);
  }
}


class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Movie? movie;//il est nullable

  void callApi() async{
  //1.Appeler un point d'entree sur un serveur
  var response = await http.get(Uri.parse("https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/movie.json"));
  //2.Transformer, convertir la reponse du serveur en json
  if(response.statusCode == 200){
    var json = convert.jsonDecode(response.body);
    //3.Transformer le json en objet = en Movie
    setState(() {
      movie = Movie.fromJson(json);
      print(movie!.title);
    });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(//une Scaffold = une page de material design
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Ma page"),
      ),
      body:Center(
        child: Column(
          children: [
            Text("Le film est : ${movie?.title}"),
            ElevatedButton(onPressed: callApi, child: Text("appele Api"))
          ],
        )
      ),
    );
  }
}




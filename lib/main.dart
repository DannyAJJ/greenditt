
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


Color color1 =const Color(0xff3C3633);
Color color2 =const Color(0xff747264);
Color color3 =const Color(0xffE0CCBE);
Color color4 =const Color(0xffEEEDEB);
Color color5 =const Color(0xffD9D9D9);
int _usuario = 5;
String _usuarion = 'Anónimo';
bool _creacion = false;
Future<void> main()  async{

  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://uzxbhbruenszumsvwckg.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV6eGJoYnJ1ZW5zenVtc3Z3Y2tnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE1NzM2OTUsImV4cCI6MjAyNzE0OTY5NX0.AppdJuK0K5awKFZne9D9YT195rYbYaVvXRq2c6I0iWc");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grenditt',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: color4),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'GREENDITT'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _stream = Supabase.instance.client
      .from('Hilos')
      .stream(primaryKey: ['id'])
      .order('created_at', ascending: false)
      ;
    @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final controller2 = TextEditingController();
    return Scaffold(
      backgroundColor: color4,
      appBar:  AppBar(
        actionsIconTheme: IconThemeData(color: color3),
        toolbarHeight: 70,
        centerTitle: true,
        backgroundColor: color2,
        shape: BeveledRectangleBorder(side: BorderSide(color: color3,strokeAlign: 1, width: 1.5)),
        title: Text(widget.title,style: TextStyle(color: color3, fontFamily: 'Roboto',fontWeight: FontWeight.w700, fontSize: 26),),
      ),
      endDrawer: Drawer(
        backgroundColor: color4,
        child: Container(
          decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('images/logo2.png'))
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Image.asset('images/logo.png'),
              if(_usuario!=5) Column(
                children: [
                  Text('Sesión Iniciada Como:',style: TextStyle(color: color2,fontSize: 20,fontFamily: 'Roboto',fontWeight: FontWeight.w700)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(_usuarion,style: TextStyle(color: color3,fontSize: 26,fontFamily: 'Roboto',fontWeight: FontWeight.w700)),
                  ),
                  OutlinedButton(
                    onPressed: () {
                    setState(() {
                     _usuario=5;
                     _usuarion = 'Anónimo';
                    });
                    Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                              content:
                                Text('Sesión Cerrada') 
                              ));
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color2),shadowColor: MaterialStateColor.resolveWith((states) => color5),elevation: MaterialStateProperty.all(5),shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder( borderRadius: BorderRadius.circular(20),),),),
                    child: Container(
                      height: MediaQuery.sizeOf(context).height/18,
                      width: MediaQuery.sizeOf(context).width/2,
                      alignment: Alignment.center,
                      child: Text('Cerrar Sesión',style: TextStyle(color: color3, fontFamily: 'Roboto',fontWeight: FontWeight.w700, fontSize: 20))
                      )
                    )
                ],
              ),
              if(_usuario==5) Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text('Está Usando Greendit en Modo Anonimo',style: TextStyle(color: color2,fontSize: 15,fontFamily: 'Roboto',fontWeight: FontWeight.w700),),
                  ),
                  OutlinedButton(
                    onPressed: () {
                    setState(() {
                     if(_creacion){_creacion=false;}else{_creacion=true;}
                    });
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color2),shadowColor: MaterialStateColor.resolveWith((states) => color5),elevation: MaterialStateProperty.all(5),shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder( borderRadius: BorderRadius.circular(20),),),),
                    child: Container(
                      height: MediaQuery.sizeOf(context).height/18,
                      width: MediaQuery.sizeOf(context).width/2,
                      alignment: Alignment.center,
                      child: Builder(builder: (context) {
                        if (_creacion){return Text('Creando Usuario',style: TextStyle(color: color3, fontFamily: 'Roboto',fontWeight: FontWeight.w700, fontSize: 20));}
                        else{return Text('Iniciando Sesión',style: TextStyle(color: color3, fontFamily: 'Roboto',fontWeight: FontWeight.w700, fontSize: 20));}
                      },)
                      
                    )
                    ),
                    Padding(
            padding: const EdgeInsets.fromLTRB(6, 10, 6, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: color2,width: 3,),borderRadius: const BorderRadius.all(Radius.circular(15))),
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 25),
                    child: Column(
                      children: [
                        TextField(
                          maxLines: 1,
                          decoration: const InputDecoration(
                            hintText: 'Nombre de Usuario',
                          ),
                          controller: controller2,
                        ),
                        TextField(
                          maxLines: 1,
                          decoration: const InputDecoration(
                            hintText: 'Contraseña',
                          ),
                          controller: controller,
                        ),
                      ],
                    )
                  ),
                ),
                OutlinedButton(
                      onPressed: () async {
                          final us = controller2.text;
                          final co = controller.text;
                          if(_creacion){
                            await Supabase.instance.client.from('Usuarios').upsert([{'Usuario':us,'Contrasena': co}]);
                            final hiloag = await Supabase.instance.client.from('Usuarios').select('''id,Usuario,Contrasena''').eq('Usuario', us).eq('Contrasena', co);
                            setState(() {
                              _usuario=hiloag[0]['id'];
                              _usuarion= hiloag[0]['Usuario'];
                            });
                            Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                              content:
                                Text('Sesión Iniciada como $_usuarion') 
                              ));
                          }else{
                            final hiloag = await Supabase.instance.client.from('Usuarios').select('''id,Usuario,Contrasena''').eq('Usuario', us).eq('Contrasena', co);
                            if(hiloag.isNotEmpty){
                            setState(() {
                              _usuario=hiloag[0]['id'];
                              _usuarion= hiloag[0]['Usuario'];
                            });
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                              content:
                                Text('Sesión Iniciada como $_usuarion') 
                              ));
                            }else{
                            controller.clear();
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                              content:
                                Text('Contraseña o Usuario Incorrectos') 
                              ));
                            }
                          }
                          
                        },
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color2),shadowColor: MaterialStateColor.resolveWith((states) => color5),elevation: MaterialStateProperty.all(5),shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder( borderRadius: BorderRadius.circular(20),),),),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height/18,
                        width: MediaQuery.sizeOf(context).width/3,
                        alignment: Alignment.center,
                        child: 
                        Builder(builder: (context) {
                          if(_creacion){return Text('CREAR',style: TextStyle(color: color3, fontFamily: 'Roboto',fontWeight: FontWeight.w700, fontSize: 20));}
                          else{return Text('INICIAR',style: TextStyle(color: color3, fontFamily: 'Roboto',fontWeight: FontWeight.w700, fontSize: 20));}
                        },)
                        
                        ),
                    ),
                ])
          )
                ],
              ),
          
            ]
          ),
        ) 
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('images/logo.png'))
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(6, 10, 6, 0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text('Bienvenido',style: TextStyle(color: color2,fontFamily: 'Roboto',fontWeight: FontWeight.w700),),
                  Text(' $_usuarion',style: TextStyle(color: color3,fontFamily: 'Roboto',fontWeight: FontWeight.w700)),
                  Text('.',style: TextStyle(color: color2.withOpacity(0.75),fontFamily: 'Roboto',fontWeight: FontWeight.w700))
                ],
              ),
              Align(alignment: Alignment.topLeft,child: Text('Selecciona un hilo o discusión de tu interés..',style: TextStyle(color: color2,fontFamily: 'Roboto',fontWeight: FontWeight.w700),),),

              Expanded(
                child: Stack(
                  children: [Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width-12,
                      child: StreamBuilder(
                        stream: _stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder:(context, index) {
                              //debugPrint(snapshot.data![index].toString());
                              var fecha = DateTime.parse(snapshot.data![index]['created_at']).toLocal();
                              final nombre = Supabase.instance.client.from('Mensajes').select('''Hilo,Usuarios(Usuario),Texto''').eq('Hilo', snapshot.data![index]['id']).order('id', ascending: true).range(0, 0);
                              //debugPrint(_nombre.runtimeType.toString());
                              Supabase.instance.client
                                .channel('Mensajes')
                                .onPostgresChanges(
                                  event: PostgresChangeEvent.all,
                                  schema: 'public',
                                  table: 'Mensajes',
                                  callback: (payload) {
                                    setState(() {
                                      
                                    });
                                    //debugPrint('cambio en hilos');
                                    })
                                .subscribe();
                            return GestureDetector(
                              onTap: () {
                                //debugPrint(snapshot.data![index]['id'].toString());
                                Navigator.push(
                                  context,
                                    MaterialPageRoute(builder: (context) => Mensajes(hiloid: snapshot.data![index]['id'],usuarioid: _usuario,)));
                                  },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: color5,width: 1,),
                                    borderRadius: const BorderRadiusDirectional.vertical(bottom: Radius.circular(15)),
                                    color: color4.withOpacity(0.6)),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 32,
                                        alignment: Alignment.centerLeft,
                                        decoration: BoxDecoration(
                                        color: color5),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5),
                                          child: Text(snapshot.data![index]['Nombre'],style: TextStyle(color: color2,fontFamily: 'Roboto',fontWeight: FontWeight.w700 ),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                        ),
                                      ),
                                      FutureBuilder(future: nombre, builder: (context, snapshot3) {
                                                    if(snapshot3.hasData){
                                                      return
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 8),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: (MediaQuery.sizeOf(context).width-14)/2,
                                                  child: 
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 10),
                                                      child: Text(snapshot3.data![0]['Usuarios']['Usuario'],style: TextStyle(color: color3,fontFamily: 'Roboto',fontWeight: FontWeight.w700 ),),
                                                    )
                                                    ),
                                                SizedBox(
                                                  width: (MediaQuery.sizeOf(context).width-14)/2,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(right: 5),
                                                    child: Text('${fecha.day}/${fecha.month}/${fecha.year}',textAlign: TextAlign.right,style: TextStyle(color: color1.withOpacity(0.6),fontFamily: 'Roboto',fontWeight: FontWeight.w700 )),
                                                  )),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
                                            child: Text(snapshot3.data![0]['Texto'],textAlign: TextAlign.left,style: TextStyle(color: color1.withOpacity(0.6),fontFamily: 'Roboto',fontWeight: FontWeight.w700 )),
                                          )
                                        ],
                                      );
                                      } return const CircularProgressIndicator();})
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          );
                        }
                    ),
                  ),
                  ),
                  Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 8, 30),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Segunda()));
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color2),shadowColor: MaterialStateColor.resolveWith((states) => color5),elevation: MaterialStateProperty.all(5),shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder( borderRadius: BorderRadius.circular(20),),),),
                    child: Container(
                      height: MediaQuery.sizeOf(context).height/18,
                      width: MediaQuery.sizeOf(context).width/3,
                      alignment: Alignment.center,
                      child: Text('AGREGAR',style: TextStyle(color: color3, fontFamily: 'Roboto',fontWeight: FontWeight.w700, fontSize: 20))),
                  ),
                ),
              ),
                  ]
                ),
              ),
               
            ]
          ),
        ),
      )
        );
  }
}




class Segunda extends StatelessWidget {
  Segunda({super.key});
   final _controller = TextEditingController();
   final _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color4,
      appBar:  AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        backgroundColor: color2,
        shape: BeveledRectangleBorder(side: BorderSide(color: color3,strokeAlign: 1, width: 1.5)),
        title: Text('Grenditt',style: TextStyle(color: color3, fontFamily: 'Roboto',fontWeight: FontWeight.w700, fontSize: 26),),
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('images/logo.png'))
        ),
        child:  Padding(
          padding: const EdgeInsets.fromLTRB(6, 10, 6, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    TextField(
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: 'Nombre de Tu Hilo',
                      ),
                      controller: _controller2,
                    ),
                    TextField(
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: 'Escribe un mensaje',
                      ),
                      controller: _controller,
                    ),
                  ],
                )
              ),
                      IconButton(
                      alignment: Alignment.bottomCenter,
                      iconSize: 60,
                      icon: const Icon(Icons.send),
                      onPressed: () async {
                        //submit text
                        final hilocont = _controller2.text;
                        final content = _controller.text;
                        await Supabase.instance.client.from('Hilos').upsert([
                          {'Nombre': hilocont}
                        ]);
                        final hiloag = await Supabase.instance.client.from('Hilos').select('id').order('id', ascending: false).range(0, 0);
                        //debugPrint(hiloag[0]['id'].toString());
                        await Supabase.instance.client.from('Mensajes').upsert([
                          {'Texto': content, 'Usuario':_usuario,'Hilo':hiloag[0]['id']}
                        ]);
                        _controller.clear();
                        _controller2.clear();
                        //sleep(const Duration(milliseconds: 100));
                        Navigator.pop(context);
                      },
                    )
      ])
        ))
      );
  }
}


class Mensajes extends StatefulWidget {
  const Mensajes({
    super.key,
    required this.hiloid,
    required this.usuarioid,
  });
  final int hiloid;
  final int usuarioid;

  @override
  State<Mensajes> createState() => _MensajesState();
}

class _MensajesState extends State<Mensajes> {
   final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final fmensajes = Supabase.instance.client.from('Mensajes').select('''Hilo,Usuario,Usuarios(Usuario),Texto,created_at,Hilos(Nombre)''').eq('Hilo', widget.hiloid.toString()).order('created_at', ascending: true);
    return Scaffold(
      backgroundColor: color4,
      appBar:  AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        backgroundColor: color2,
        shape: BeveledRectangleBorder(side: BorderSide(color: color3,strokeAlign: 1, width: 1.5)),
        title: Text('Grenditt',style: TextStyle(color: color3, fontFamily: 'Roboto',fontWeight: FontWeight.w700, fontSize: 26),),
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('images/logo.png'))
        ),
        child:  Padding(
          padding: const EdgeInsets.fromLTRB(6, 10, 6, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              FutureBuilder(future: fmensajes, builder: (context, snapshot) {
                if(snapshot.hasData){
                  Supabase.instance.client
                    .channel('Mensajes')
                    .onPostgresChanges(
                      event: PostgresChangeEvent.all,
                      schema: 'public',
                      table: 'Mensajes',
                      callback: (payload) {
                        setState(() {});
                      }
                    )
                    .subscribe();
                    String minutohilo;
                    String horahilo;
                    String segundohilo;
                    var fechahilo = DateTime.parse(snapshot.data![0]['created_at']).toLocal();
                              if(fechahilo.minute.toString().length<2){minutohilo = '0${fechahilo.minute}';}else{minutohilo = fechahilo.minute.toString();}
                              if(fechahilo.hour.toString().length<2){horahilo = '0${fechahilo.hour}';}else{horahilo = fechahilo.hour.toString();}
                              if(fechahilo.second.toString().length<2){segundohilo = '0${fechahilo.second}';}else{segundohilo = fechahilo.second.toString();}
                  return Expanded(
                    child: Column(
                      children: [
                        
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(alignment: Alignment.topLeft,child: Text('Hilo Seleccionado:',style: TextStyle(color: color2,fontFamily: 'Roboto',fontWeight: FontWeight.w700),),),
                        ),
                        
                        Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: color5,width: 1,),
                                  borderRadius: const BorderRadiusDirectional.vertical(bottom: Radius.circular(15)),
                                  color: color4.withOpacity(0.6)),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: MediaQuery.sizeOf(context).width,
                                          height: 32,
                                          alignment: Alignment.centerLeft,
                                          decoration: BoxDecoration(
                                          color: color5),
                                          child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5),
                                          child: Text(snapshot.data![0]['Hilos']['Nombre'],style: TextStyle(color: color2,fontFamily: 'Roboto',fontWeight: FontWeight.w700 ),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 8),
                                          child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: (MediaQuery.sizeOf(context).width-14)/2,
                                                            child: 
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 10),
                                                                child: Text(snapshot.data![0]['Usuarios']['Usuario'],style: TextStyle(color: color3,fontFamily: 'Roboto',fontWeight: FontWeight.w700 ),),
                                                              )
                                                              ),
                                                          SizedBox(
                                                            width: (MediaQuery.sizeOf(context).width-14)/2,
                                                            child: Padding(
                                                              padding: const EdgeInsets.only(right: 5),
                                                              child: Text('${fechahilo.day}/${fechahilo.month}/${fechahilo.year}',textAlign: TextAlign.right,style: TextStyle(color: color1.withOpacity(0.6),fontFamily: 'Roboto',fontWeight: FontWeight.w700 )),
                                                            )),
                                                        ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.sizeOf(context).width,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(8, 0, 5, 5),
                                            child: Text(snapshot.data![0]['Texto'],textAlign: TextAlign.left,style: TextStyle(color: color1.withOpacity(0.6),fontFamily: 'Roboto',fontWeight: FontWeight.w700 )),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.sizeOf(context).width,
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 5),
                                            child: Text('$horahilo:$minutohilo:$segundohilo',textAlign: TextAlign.right,style: TextStyle(color: color1.withOpacity(0.6),fontFamily: 'Roboto',fontWeight: FontWeight.w700 )),
                                          ),
                                        )
                                      ],
                                    ),
                              ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(alignment: Alignment.topLeft,child: Text('Respuestas:',style: TextStyle(color: color2,fontFamily: 'Roboto',fontWeight: FontWeight.w700),),),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data!.length-1,
                            itemBuilder: (context, index) {
                              String hora;
                              String minuto;
                              String segundo;
                              var fecha = DateTime.parse(snapshot.data![index+1]['created_at']).toLocal();
                              if(fecha.minute.toString().length<2){minuto = '0${fecha.minute}';}else{minuto = fecha.minute.toString();}
                              if(fecha.hour.toString().length<2){hora = '0${fecha.hour}';}else{hora = fecha.hour.toString();}
                              if(fecha.second.toString().length<2){segundo = '0${fecha.second}';}else{segundo = fecha.second.toString();}
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 7),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: color5,width: 1,),
                                  borderRadius: const BorderRadiusDirectional.vertical(bottom: Radius.circular(15)),
                                  color: color4.withOpacity(0.6)),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 8),
                                          child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: (MediaQuery.sizeOf(context).width-28)/2,
                                                            child: 
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 10),
                                                                child: Text(snapshot.data![index+1]['Usuarios']['Usuario'],style: TextStyle(color: color3,fontFamily: 'Roboto',fontWeight: FontWeight.w700 ),),
                                                              )
                                                              ),
                                                          SizedBox(
                                                            width: (MediaQuery.sizeOf(context).width-28)/2,
                                                            child: Padding(
                                                              padding: const EdgeInsets.only(right: 5),
                                                              child: Text('${fecha.day}/${fecha.month}/${fecha.year}',textAlign: TextAlign.right,style: TextStyle(color: color1.withOpacity(0.6),fontFamily: 'Roboto',fontWeight: FontWeight.w700 )),
                                                            )),
                                                        ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.sizeOf(context).width,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(8, 0, 5, 5),
                                            child: Text(snapshot.data![index+1]['Texto'],textAlign: TextAlign.left,style: TextStyle(color: color1.withOpacity(0.6),fontFamily: 'Roboto',fontWeight: FontWeight.w700 )),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.sizeOf(context).width,
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 5),
                                            child: Text('$hora:$minuto:$segundo',textAlign: TextAlign.right,style: TextStyle(color: color1.withOpacity(0.6),fontFamily: 'Roboto',fontWeight: FontWeight.w700 )),
                                          ),
                                        )
                                      ],
                                    ),
                              )
                            );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const CircularProgressIndicator();
              }),
              
              
              
              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Escribe un mensaje',
                        ),
                        controller: _controller,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () async {
                        //submit text
                        final content = _controller.text;
                        await Supabase.instance.client.from('Mensajes').upsert([
                          {'Texto': content,'Usuario':widget.usuarioid,'Hilo': widget.hiloid}
                        ]);
                        _controller.clear();
                      },
                    )
                  ],
                ))
          ],
        ))
      )
      );
  }
}
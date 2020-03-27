import 'package:flutter/material.dart';




  //Color cafe claro
  final LinearGradient gradient0 = new LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff967557), Color(0xffc29b78)]);
  
  final LinearGradient gradient1 = new LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xffdbaf88), Color(0xffb3845b)]);
  
  final LinearGradient gradient2 = new LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff967557), Color(0xffdbaf88)]);



  //COLOR AZUL OCURO
  final LinearGradient gradient3 = new LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff253d49), Color(0xff5a7c88)]);
  
  final LinearGradient gradient4 = new LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff2d4552), Color(0xff2e4c5c)]);


  final LinearGradient gradient5 = new LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff243c47), Color(0xff2a4754)]);


//fondo rojo para entrada de registro para facebook
class Entrada3 extends StatelessWidget {


 


  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      backgroundColor: Color(0xFF2d4c5e),
      body: Stack(
        children: <Widget>[
          

          ClipPath(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  clipper: ClipFondo(),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.65,
                    decoration: BoxDecoration(
                      color: Color(0xFFfbe3c9),
                    ),  
                    child: Text('')
                ),
              ),
          
          CustomPaint(
            child: Container(
              height: 300.0,
            ),
            painter: ClipCubo(ll:100,px:10,py:250,altura: 50, gr1: gradient3, gr2: gradient4, gr3: gradient5, colorBottom: Color(0xFF243c48)),
          ),

          CustomPaint(
            child: Container(
              height: 300.0,
            ),
            painter: ClipCubo(ll:60,px:270,py:400,altura: 30, gr1: gradient0, gr2: gradient1, gr3: gradient2, colorBottom: Color(0xFFab876d)),
          ),
           CustomPaint(
            child: Container(
              height: 300.0,
            ),
            painter: ClipCubo(ll:130,px:220,py:50,altura: 75.5, gr1: gradient2, gr2: gradient1, gr3: gradient0, colorBottom: Color(0xFFab876d)),
          ),


          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 0, bottom: 20.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                SizedBox(height:450.0),
               
                SizedBox(height:30.0),
                Text('Estas listo \n  para hacer cubos', textAlign: TextAlign.center, style: TextStyle(fontSize: 30.0, color: Color(0xffedd6c2), fontWeight: FontWeight.w900,),),
                SizedBox(height:20.0),
                Text('Transforma tu espacio en algo innovador\n  y haz mejores ambientes de trabajo para ser feliz', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0, color: Color(0xffedd6c2),),),
                SizedBox(height:30.0),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    color: Color(0xFFbf895a),
                    textColor: Colors.white,
                    child: Text("Registrarse", style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                    ),),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 32.0
                    ),
                    onPressed: (){}
                    ),

                ),
                SizedBox(height:10.0),
                Text('Crear Nueva Cuenta', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0, color: Color(0xffcea381), fontWeight: FontWeight.w900),),

                ],
              ),
            )
          )
       
       
       
       
        ],
      ),
    );
  }


}


class ClipFondo extends CustomClipper<Path>{
  
  @override
  Path getClip(Size size){
    var path = Path();
    path.lineTo(0, 100);
    path.lineTo(100, 180);
    path.lineTo(100, 300);
    path.lineTo(size.width/2, 400);
    path.lineTo(size.width-80, 340);
    path.lineTo(size.width, 390);
    path.lineTo(size.width, 0);
    path.close();
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}



class ClipCubo extends CustomPainter{
  
  final double ll; //largo de linea
  final double px; //inicio en x
  final double py; //inicio en y
  final double altura; // altura.. deberia ser la mitad de la linea
  final LinearGradient gr1; // gradiente 1
  final LinearGradient gr2; // gradiente 2
  final LinearGradient gr3; // gradiente 2
  final Color colorBottom; // Color de abajo casi no lleva gradient por lo oscuro
  
  const ClipCubo({Key key, this.ll, this.px, this.py, this.altura, this.gr1, this.gr2, this.gr3, this.colorBottom});



 @override
  void paint(Canvas canvas, Size size) {
  
  Rect myRect = new Rect.fromLTRB( 0.0, 0.0, 100, 0 );

    //cara izquierda
    Paint paint1 = Paint();
    Path path = Path();
    path.lineTo(px, py);
    path.lineTo(px, py+ll);
    path.lineTo(px+ll, (py+ll)-altura);
    path.lineTo(px+ll, py-altura);
    path.lineTo(px,py);
    path.close();
    // paint1.color = colorBottom;
    paint1.shader = gr1.createShader(myRect);
    canvas.drawPath(path, paint1);

    //cara derecha
    Paint paint2 = Paint();
    path = Path();
    path.lineTo(px+ll, (py+ll)-altura);
    path.lineTo(px+ll, py-altura);
    path.lineTo(px+ll+ll, py);
    path.lineTo(px+ll+ll, py+ll);
    path.lineTo(px+ll, (py+ll)-altura);
    path.close();
    // paint2.color = colorBottom;
    paint2.shader = gr2.createShader(myRect);
    canvas.drawPath(path, paint2);

    //cara derecha
    Paint paint3 = Paint();
    path = Path();
    path.lineTo(px, py+ll);
    path.lineTo(px+ll, ll+altura+py);
    
    path.lineTo(px+ll+ll, py+ll);
    path.lineTo(px+ll, ll-altura+py);
    
    path.lineTo(px, py+ll);
    path.close();
    paint3.color = colorBottom;
    paint3.shader = gr3.createShader(myRect);
    canvas.drawPath(path, paint3);



  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

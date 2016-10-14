//Receptor de datos via serial de una pulsera Polar T31 //Con Arduino //Bajo una Licencia Creative Commons 4.0 //Andres Sabas 2014
import processing.serial.*;
import controlP5.*;
import googlemapper.*;

PImage map;
GoogleMapper gMapper;

float mapCenterLat=21.8857347;
 float mapCenterLon=-102.2912996;
 int zoomLevel = 10;
 String mapType = GoogleMapper.MAPTYPE_HYBRID;
 int mapWidth=900;
 int mapHeight=600;

ControlP5 cp5;

int zoomSlider=7;
Slider abc;
Knob myKnobA;
Knob myKnobB;
Knob myKnobC;
Knob myKnobD;

Serial mySerial;

String value;

float latitud, longitud;

void setup() {
 size(1080, 600);
 
 mySerial = new Serial( this, Serial.list()[1], 9600 );
 
 cp5 = new ControlP5(this);
 
 cp5.addSlider("zoomSlider")
    .setPosition(850, 50)
    .setSize(40,200)
    .setRange(3, 21)
    .setNumberOfTickMarks(7);
  
  myKnobA = cp5.addKnob("Temperatura")
               .setRange(-50,80)
               .setValue(0)
               .setPosition(950,30)
               .setRadius(50)
               .setDragDirection(Knob.VERTICAL)
               ;
               
  myKnobB = cp5.addKnob("Humedad")
               .setRange(0,100)
               .setValue(0)
               .setPosition(950,150)
               .setRadius(50)
               .setDragDirection(Knob.VERTICAL)
               ;

  myKnobC = cp5.addKnob("Presion")
               .setRange(0,500)
               .setValue(0)
               .setPosition(950,270)
               .setRadius(50)
               .setDragDirection(Knob.VERTICAL)
               ;
              
}

void draw() {
  
  gMapper = new GoogleMapper(mapCenterLat, mapCenterLon, zoomLevel, mapType, mapWidth, mapHeight);
  map = gMapper.getMap();
  image(map, 0, 0);
 
 zoomLevel=zoomSlider;
 
 if ( value != null ) {
 String[] list = split(value, ',');
      
      printArray(list);
     
     int temperatura =int(list[1]);
     myKnobA.setValue(temperatura);

     float humedad =float(list[2]);
     myKnobB.setValue(humedad);
     
     int presion =int(list[3]);
     myKnobC.setValue(presion);
     
     int temperatura2  =int(list[4]);
     
     int mx =int(list[5]);
     
     int  my =int(list[6]);
     
     int mz =int(list[7]);
     
     int  ax =int(list[8]);
     
     int ay =int(list[9]);
     
     int az  =int(list[10]);
     
     int gx =int(list[11]);
     
     int  gy =int(list[12]);
     
     int  gz =int(list[13]);
     
     latitud = float(list[14]);
     
     longitud = float(list[15]);
 
    mapCenterLat = latitud;
    mapCenterLon=longitud;
 
 }
}

void serialEvent(Serial port) {
 // Data from the Serial port is read in serialEvent() using the read() function and assigned to the global variable: val
 value = mySerial.readStringUntil('\n');
 // For debugging
 //println( "Raw Input:" + value);

}

void keyPressed() {
 exit(); // Stops the program
}
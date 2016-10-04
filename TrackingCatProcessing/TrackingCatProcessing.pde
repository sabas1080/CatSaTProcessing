//Receptor de datos via serial de una pulsera Polar T31 //Con Arduino //Bajo una Licencia Creative Commons 4.0 //Andres Sabas 2014
import processing.serial.*;
import controlP5.*;


ControlP5 cp5;

Serial mySerial;

String value;

Knob myKnobA;
Knob myKnobB;
Knob myKnobC;
Knob myKnobD;


void setup() {
 size(1080, 600);
 mySerial = new Serial( this, Serial.list()[1], 9600 );
 mySerial.buffer(3);

 
 cp5 = new ControlP5(this);
  
  myKnobA = cp5.addKnob("Temperatura")
               .setRange(-50,80)
               .setValue(0)
               .setPosition(10,30)
               .setRadius(50)
               .setDragDirection(Knob.VERTICAL)
               ;
               
  myKnobB = cp5.addKnob("Humedad")
               .setRange(0,100)
               .setValue(0)
               .setPosition(10,150)
               .setRadius(50)
               .setDragDirection(Knob.VERTICAL)
               ;

  myKnobC = cp5.addKnob("Presion")
               .setRange(0,500)
               .setValue(0)
               .setPosition(10,270)
               .setRadius(50)
               .setDragDirection(Knob.VERTICAL)
               ;
              
}

void draw() {
 // The serial data is used to color the background. 
 
 if ( value != null ) {
 String[] list = split(value, ',');

 int temperatura =int(list[1]);
 myKnobA.setValue(temperatura);
 
 float humedad =float(list[2]);
 myKnobB.setValue(humedad);
 
 int presion =int(list[3]);
 myKnobC.setValue(presion);
 
 }
}

void serialEvent(Serial port) {
 // Data from the Serial port is read in serialEvent() using the read() function and assigned to the global variable: val
 value = mySerial.readStringUntil('\n');
 // For debugging
 println( "Raw Input:" + value);

}

void keyPressed() {
 exit(); // Stops the program
}
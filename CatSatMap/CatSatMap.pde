/**
 * Aplicacion para rastrear el CatSat del buen Xhabas y  sus electronic cats.
 
 /Alexander Hofflich 10/07/16
 */

import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.providers.AbstractMapProvider;
import de.fhpotsdam.unfolding.providers.Google;
import de.fhpotsdam.unfolding.utils.MapUtils;



UnfoldingMap map;
float latitud = 21.883;
float longitud = -102.282;
Location locationCatSat = new Location(latitud,longitud); //Esta seria la ubucacion inicial del catsat
Location aguascalientes = new Location(21.883f,-102.282f); // Esta es para el mapa
ScreenPosition ubicacion;

FloatList coordenadasX;
FloatList coordenadasY;

PImage marker;
PImage mapaAgs;

void setup() {
  size(1000, 600);

    AbstractMapProvider p1 = new Google.GoogleTerrainProvider(); 
    settings();
    map = new UnfoldingMap(this, p1);
    map.zoomAndPanTo(aguascalientes, 9);
    MapUtils.createDefaultEventDispatcher(this, map);  
    marker = loadImage("cats.png");
    mapaAgs = loadImage("mapaAgs.PNG");
    coordenadasX = new FloatList();
    coordenadasY= new FloatList();
}

void draw() {
  //map.draw();
  background(0);
  image(mapaAgs,0,0,width,height);

 locationCatSat = new Location(latitud,longitud);
 ubicacion = map.getScreenPosition (locationCatSat); 
 coordenadasX.append(ubicacion.x);
 coordenadasY.append(ubicacion.y);

  image(marker,coordenadasX.get(coordenadasX.size()-1)-10,coordenadasY.get(coordenadasY.size()-1)-10,20,20);
   
  for(int i = 0; i< coordenadasX.size() ; i++) {
  if(i>0){
  line(coordenadasX.get(i), coordenadasY.get(i),coordenadasX.get(i-1),coordenadasY.get(i-1));
  }
 }


}

void keyPressed(){
  
 if(key == 'u'){
   latitud = latitud +0.01;
 }
 
 if(key == 'd') {
   latitud = latitud -0.01;
 }
  
 if(key == 'i'){
  longitud = longitud -0.01; 
 }
 
 if(key == 'r'){
   longitud = longitud +0.01;
 }
}